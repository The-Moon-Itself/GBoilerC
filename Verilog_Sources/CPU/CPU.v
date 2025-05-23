`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 01:15:36 PM
// Design Name: 
// Module Name: CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  Bypass_Register.v
//  Register_File.v
//  ALUs/
//      ALU.v
//  Bit16/
//      Incrementer_16Bit.V
//      Add16_r8.v
//      Adder16.v
//  ControlUnit/
//      ControlUnit.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input i_Clk, //The system clock
    input i_Enable, //Clock enable
    input i_nRst, //Reset on low
    input [7:0] i_Bus, //Data read from memory
    input [4:0] i_Interrupts, //Bitflags for pending interrupts, lower bits have priority
    output [15:0] o_Address, //Address for accessing memory
    output [7:0] o_Bus, //Data written to memory
    output o_Bus_Out, //On if we are currently writing memory
    output o_Bus_In, //On if we are currently reading memory
    output o_Address_Out, //On if we are setting a target memory address
    output o_Handle_Interrupt //On if we are handling an interupt
    );
    
    
    //Instruction Register
    wire [7:0] opcode;
    wire writeIR;
    Bypass_Register instruction_register
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Write(writeIR),
    .i_Data(i_Bus),
    .o_Data(opcode)
    );
    
    //Buses
    
    wire [7:0] bus_8bit_src; //A bus to get parameters to functions
    
    wire [7:0] bus8_parameter;
    Pipeline_Register parameter_8bit
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Data(bus_8bit_src),
    .o_Data(bus8_parameter)
    );
    wire [7:0] bus_8bit_dst; //A bus to get function outputs to destinations
    
    wire [15:0] bus_16bit_src; //A bus to get paramters to functions
    wire [15:0] bus16_parameter;
    Pipeline_Register #(.SIZE(16)) parameter_16bit
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Data(bus_16bit_src),
    .o_Data(bus16_parameter)
    );
    wire [15:0] bus_16bit_dst; //A bus to get function outputs to destinations
    
    wire [15:0] HL;
    
    //Register File
    wire [7:0] registers_out;
    wire [7:0] read8;
    wire [7:0] write8;
    wire [5:0] read16;
    wire [5:0] write16;
    Register_File registers
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Read8(read8),
    .i_Write8(write8),
    .i_nRst(i_nRst),
    .i_Bus8(bus_8bit_dst),
    .o_Bus8(registers_out),
    .i_Read16(read16),
    .i_Write16(write16),
    .i_Bus16(bus_16bit_dst),
    .o_Bus16(bus_16bit_src),
    .o_HL(HL)
    );
    
    //8Bit Stuff
    wire [1:0] alu_read8;
    wire [1:0] alu_write8;
    wire [6:0] alu_control;
    wire [3:0] alu_flags_in;
    wire alu_save_flags;
    wire [7:0] alu_reg_data;
    wire [7:0] alu_result;
    wire [3:0] flags;
    ALU alu
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Read(alu_read8),
    .i_Write(alu_write8),
    .i_nRst(i_nRst),
    .i_Data(bus_8bit_dst),
    .o_Reg_Data(alu_reg_data),
    
    .i_Opcode(opcode),
    .i_Parameter(bus8_parameter),
    .i_Function_Control(alu_control),
    .i_External_Flags(alu_flags_in),
    .i_Save_Flags(alu_save_flags),
    .o_Result(alu_result),
    .o_Flags(flags)
    );
    
    
    assign o_Bus = bus_8bit_src;
    
   //Puts a byte of the 16bit bus onto the 8bit bus
   //   Bit 0: Low Byte
   //   Bit 1: High Byte
    wire [1:0] bus16_byte_to_bus;
    wire move_reg; //Set bus_8bit_dst to bus_8bit_src
    wire [7:0] cu_bus; //A value set directly by the Control Unit
    wire cu_bus_active; //Sets the bus to cu_bus
    assign bus_8bit_src = registers_out |
                          alu_reg_data |
                          ({8{bus16_byte_to_bus[1]}} & bus16_parameter[15:8]) |
                          ({8{bus16_byte_to_bus[0]}} & bus16_parameter[7:0]);
                      
    assign bus_8bit_dst = alu_result |
                          ({8{o_Bus_In}} & i_Bus) |
                          ({8{move_reg}} & bus8_parameter) |
                          ({8{cu_bus_active}} & cu_bus);
    
    //16Bit Stuff
    
    // Bit 0: Enable Add r8
    // Bit 1: Save Add r8 Flags
    wire [1:0] add_r8_control;
    wire [15:0] add_r8_result;
    wire [3:0] add_r8_flags;
    Add16_r8 add_r8
    (.i_In16(bus16_parameter),
    .i_r8(bus8_parameter),
    .o_Out(add_r8_result),
    .o_Flags(add_r8_flags)
    );
    
    wire bus8_to_bus16;
  	assign o_Address = bus_16bit_src |
  	                   {{8{bus8_to_bus16}}, ({8{bus8_to_bus16}} & bus_8bit_src)};
    
    wire [1:0] increment16;
    wire [15:0] increment16_result;
    Incrementer_16bit inc16
    (.i_In(bus16_parameter),
    .i_Active(increment16[0]),
    .i_Decrement(increment16[1]),
    .o_Out(increment16_result),
    .o_Carry()
    );
    
    // Bit 0: Enable Add r8
    // Bit 1: Save Add r8 Flags
    wire [1:0] add16_control;
    wire [15:0] add16_result;
    wire [3:0] add16_flags;
    wire [15:0] add16_HL;
    Pipeline_Register #(.SIZE(16)) add16_hl_pipeline
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Data(HL),
    .o_Data(add16_HL)
    );
    Adder16 add16
    (.i_A(add16_HL),
    .i_B(bus16_parameter),
    .i_F(flags),
    .o_Result(add16_result),
    .o_F(add16_flags)
    );
    
    assign bus_16bit_dst = add_r8_control[0] ? add_r8_result : (
                           add16_control[0] ? add16_result :
                           increment16_result);
    
    assign alu_flags_in = ({3{add_r8_control[1]}} & add_r8_flags) |
                          ({3{add16_control[1]}} & add16_flags);
    
    assign alu_save_flags = add_r8_control[1] | add16_control[1];
    
    ControlUnit cu
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Opcode(opcode),
    .i_Flags(flags),
    .i_Interrupts(i_Interrupts),
    .o_Handle_Interrupt(o_Handle_Interrupt),
    
    .o_WriteIR(writeIR),
    .o_Read8(read8),
    .o_Write8(write8),
    .o_Read16(read16),
    .o_Write16(write16),
    .o_ReadALU8(alu_read8),
    .o_WriteALU8(alu_write8),
    .o_Move_Reg(move_reg),
    
    .o_Bus_Out(o_Bus_Out),
    .o_Bus_In(o_Bus_In),
    .o_Address_Out(o_Address_Out),
    
    .o_ALU_Control(alu_control),
    .o_Increment16(increment16),
    .o_Add_r8_Control(add_r8_control),
    .o_Add16_Control(add16_control),
    .o_Bus16_Byte_To_Bus(bus16_byte_to_bus),
    .o_Bus8_To_Bus16(bus8_to_bus16),
    .o_Bus_Value(cu_bus),
    .o_Bus_Value_Active(cu_bus_active)
    );
    
endmodule
