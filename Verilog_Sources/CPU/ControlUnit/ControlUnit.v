`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 02:43:44 PM
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  CU_Clock.v
//  Microcode/
//      NOP_Microcode.v
//  ../../Generics/
//      Decoder.v
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    //Clock inputs
    input i_Clk,
    input i_Enable,
    //Opcode Data
    input [7:0] i_Opcode,
    input [3:0] i_Flags,
    //Interrupts
    input [4:0] i_Interrupts,
    output o_Handle_Interrupt,
    
    //Control lines
    output o_WriteIR, //Write data from memory to the instruction register
    //8 Bit Register Codes:
    // W = 0, Z = 1
    // B = 2, C = 3
    // D = 4, E = 5
    // H = 6, L = 7
    output [7:0] o_Read8, //Puts the specified 8bit register's data on the data bus
    output [7:0] o_Write8, //Writes the data bus to the specified 8bit register
    //16 Bit Register Codes:
    // WZ = 0
    // BC = 1
    // DE = 2
    // HL = 3
    // SP = 4
    // PC = 5
    output [5:0] o_Read16, //Puts the specified 16bit register's data on the data bus
    output [5:0] o_Write16, //Writes the data bus to the specified 16bit register
    
    output o_Bus_Out, //On if we are currently writing memory
    output o_Bus_In, //On if we are currently reading memory
    output o_Address_Out, //On if we are setting a target memory address
    
    //Incrementer Control:
    // Bit 0; Active
    // Bit 1: Decrement
    output [1:0] o_Increment16, //Increments the 16bit address line
    //16Bus Selector:
    //  Bit 0: Low Byte
    //  Bit 1: High Byte
    output [1:0] o_16bus_To_8bus //Puts one of the bytes of the 16bit bus onto the 8bit bus. Good for SP and PC stuff
    );
    
    wire reset_cycle;
    wire [4:0] step;
    CU_Clock
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Reset(reset_cycle),
    .o_Step(step)
    );
    
    wire IR_read_step = step == 5'b00000; //When on this step, we read in the next opcode from memory.
    
    wire [3:0] cycle_step; //Which T-Cycle we're in with in the M-Cycle (4 T in 1 M) 
    Decoder #(.SIZE(4)) step_decoder
    (.i_In(step[1:0]),
    .i_Disable(IR_read_step),
    .o_Out(cycle_step)
    );
    wire [8:0] cycle_count; //How many M-Cycles since the start of the Opcode
    Decoder #(.SIZE(8)) cycle_decoder
    (.i_In(step[4:2]),
    .i_Disable(IR_read_step),
    .o_Out(cycle_count)
    );
    
    reg initialize_fetch = 1'b1;
    wire end_opcode_fetch; //Microcodes should set this to true when it is the last M Cycle in their operation (the HALT opcode is an exception)
    
    wire [5:0] fetch_read16;
    wire [5:0] fetch_write16;
    wire fetch_address_out;
    wire [1:0] fetch_increment16;
    wire fetch_reset_cycle;
    NOP_Microcode fetch
    (.i_Active(initialize_fetch & end_opcode_fetch),
    .i_Cycle_Step(cycle_step),
    .o_Read16(fetch_read16),
    .o_Write16(fetch_write16),
    .o_Address_Out(fetch_address_out),
    .o_Increment16(fetch_increment16),
    .o_Reset_Cycle(fetch_reset_cycle)
    );
    
    //Opcode decoding
    
    //When we need to switch to other processes such as interrupts or setting the IR.
    wire disable_opcode_processing = IR_read_step | initialize_fetch;
    
    //Condition codes:
    // Bit 0: NZ (Not Zero)
    // Bit 1: Z (Zero)
    // Bit 2: NC (Not Carry)
    // Bit 3: C (Carry)
    wire [3:0] conditions = {i_Flags[0], ~i_Flags[0], i_Flags[3], ~i_Flags[3]};
    
    wire [3:0] X;
    Decoder #(.SIZE(4)) X_decoder
    (.i_In(i_Opcode[7:6]),
    .i_Disable(disable_opcode_processing),
    .o_Out(X)
    );
    wire [7:0] Y;
    Decoder #(.SIZE(8)) Y_decoder
    (.i_In(i_Opcode[5:3]),
    .i_Disable(disable_opcode_processing),
    .o_Out(Y)
    );
    wire [7:0] Z;
    Decoder #(.SIZE(8)) Z_decoder
    (.i_In(i_Opcode[2:0]),
    .i_Disable(disable_opcode_processing),
    .o_Out(Z)
    );
    wire [3:0] P;
    Decoder #(.SIZE(4)) P_decoder
    (.i_In(i_Opcode[5:4]),
    .i_Disable(disable_opcode_processing),
    .o_Out(P)
    );
    wire [1:0] Q;
    Decoder #(.SIZE(2)) Q_decoder
    (.i_In(i_Opcode[3]),
    .i_Disable(disable_opcode_processing),
    .o_Out(Q)
    );
    
    
    wire x0_fetch;
    wire [7:0] x0_write8;
    wire [5:0] x0_read16;
    wire [5:0] x0_write16;
    wire x0_Bus_In;
    wire x0_Bus_Out;
    wire x0_Address_Out;
    wire [1:0] x0_Increment16;
    wire [1:0] x0_Bus16_Byte_To_Bus;
    X0 x0
    (.i_Active(X[0]),
    .i_Y(Y),
    .i_Z(Z),
    .i_P(P),
    .i_Q(Q),
    .i_Conditions(conditions),
    .o_Fetch(x0_fetch),
    .o_Write8(x0_write8),
    .o_Read16(x0_read16),
    .o_Write16(x0_write16),
    .o_Bus_In(x0_Bus_In),
    .o_Bus_Out(x0_Bus_Out),
    .o_Address_Out(x0_Address_Out),
    .o_Increment16(o_Increment16),
    .o_Bus16_Byte_To_Bus(o_Bus16_Byte_To_Bus)
    );
    
    
    assign o_WriteIR = IR_read_step;
    
    assign o_Write8 = x0_write8;
    assign o_Read16 = fetch_read16 | x0_read16;
    assign o_Write16 = fetch_write16 | x0_write16;
    
    assign o_Bus_In = IR_read_step | x0_Bus_In;
    assign o_Bus_Out = x0_Bus_Out;
    assign o_Address_Out = fetch_address_out | x0_Address_Out;
    
    assign o_Increment16 = fetch_increment16 | x0_Increment16;
    assign o_Bus16_Byte_To_Bus = x0_Bus16_Byte_To_Bus;
    
    assign end_opcode_fetch = x0_fetch;
    assign reset_cycle = fetch_reset_cycle;
    
    always @(posedge(i_Clk)) begin
        if(fetch_reset_cycle & i_Enable) begin
            initialize_fetch = 0;
        end
    end 
endmodule
