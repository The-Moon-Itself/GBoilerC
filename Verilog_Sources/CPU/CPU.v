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
//  Register_File.v
//  ALUs/
//      ALU.v
//  Bit16/
//      Incrementer_16Bit.V
//      Add16_r8.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CPU(
    input i_Clk, //The system clock
    input i_Enable, //Clock enable
    input [7:0] i_Bus, //Data read from memory
    input [4:0] i_Interrupts, //Bitflags for pending interrupts, lower bits have priority
    input [15:0] o_Address, //Address for accessing memory
    output [7:0] o_Bus, //Data written to memory
    output o_Bus_Out, //On if we are currently writing memory
    output o_Bus_In, //On if we are currently reading memory
    output o_Address_Out, //On if we are setting a target memory address
    output o_Handle_Interrupt //On if we are handling an interupt
    );
    
    
    //Instruction Register
    wire [7:0] opcode;
    Register instruction_register
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(), //CONTROL LINE. TO DO!!
    .i_Data(i_Bus),
    .o_Data(opcode)
    );
    
    //Buses
    
    wire [7:0] bus_8bit_src; //A bus to get parameters to functions
    wire [7:0] bus_8bit_dst; //A bus to get function outputs to destinations
    
    wire [15:0] bus_16bit_src; //A bus to get paramters to functions
    wire [15:0] bus_16bit_dst; //A bus to get function outputs to destinations
    
    //Register File
    wire [7:0] registers_out;
    Register_File registers
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Read8(), //CONTROL LINE. TODO!!
    .i_Write8(), //CONTROL LINE. TODO!!
    .i_Bus8(bus_8bit_dst),
    .o_Bus8(registers_out),
    .i_Read16(), //CONTROL LINE. TODO!!
    .i_Write16(), //CONTROL LINE. TODO!!
    .i_Bus16(bus_16bit_src),
    .o_Bus16(bus_16bit_dst)
    );
    
    
    //8Bit Stuff
    wire [3:0] add_r8_flags;
    wire [7:0] alu_reg_data;
    wire [7:0] alu_result;
    ALU alu
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Read(), //CONTROL LINE. TODO!!
    .i_Write(), //CONTROL LINE. TODO!!
    .i_Data(bus_8bit_dst),
    .o_Reg_Data(alu_reg_data),
    
    .i_Opcode(opcode),
    .i_Parameter(bus_8bit_src),
    .i_Function_Control(), //CONTROL LINE. TODO!!
    .i_Save_Flags(), //CONTROL LINE. TODO!!
    .o_Result(alu_result)
    );
    
    
    assign o_Bus = bus_8bit_src;
    
    wire read_data_bus; //Puts data from memory onto the data bus. //CONTROL LINE. TODO!!
    assign o_Bus_In = read_data_bus;
    wire write_data_bus; //Tells system to write data bus data to memory //CONTROL LINE. TODO!!
    assign o_Bus_Out = write_data_bus;
    
    wire high_byte_to_bus; //Puts the high byte of the 16bit bus onto the 8bit bus //CONTROL LINE. TODO!!
    wire low_byte_to_bus; //Puts the low byte of the 16bit bus onto the 8bit bus //CONTROL LINE. TODO!!
    assign bus_8bit_src = registers_out |
                          alu_result |
                          ({8{read_data_bus}} & i_Bus) |
                          ({8{high_byte_to_bus}} & bus_16bit_src[15:8]) |
                          ({8{low_byte_to_bus}} & bus_16bit_src[7:0]);
    
    //16Bit Stuff
    wire add_r8_enable; //CONTROL LINE. TODO!!
    wire [15:0] add_r8_result;
    Add16_r8 add_r8
    (.i_In16(bus_16bit_src),
    .i_r8(bus_8bit_src & {8{add_r8_enable}}),
    .o_Out(add_r8_result),
    .o_Flags(add_r8_flags)
    );
    
    wire increment_16_active; //CONTROL LINE. TODO!!
    wire increment_16_decrement; //CONTROL LINE. TODO!!
    Incrementer_16bit
    (.i_In(add_r8_result),
    .i_Active(increment_16_active),
    .i_Decrement(increment_16_decrement),
    .o_Out(bus_16bit_dst),
    .o_Carry()
    );
    
    assign o_Address = add_r8_result;
    wire write_address; //Tells system to start loading the address on the 16bit data line.
    assign o_Address_Out = o_Address;
    
endmodule
