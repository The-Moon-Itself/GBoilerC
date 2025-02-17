`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 05:01:29 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  Main_ALU.v
//  Incrementer_8Bit.v
//  Logic_Unit.v
//  Misc_ALU.v
//  ../
//      Register.v
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input i_Clk, //The system clock
    input i_Enable, //Clock enable
    
    //Register IO
    // Read/Write indexing:
    //      bit 0 - A
    //      bit 1 - B
    input [1:0] i_Read, //Which register we are placing on the Register Data Bus
    input [1:0] i_Write, //Which register we are writing to
    input [7:0] i_Data, //New data for the registers
    output [7:0] o_Reg_Data, //Register output
    
    //Function IO
    input [7:0] i_Opcode, //The current opcode
    input [7:0] i_Parameter, //Non-accumulator parameter for functions
    //Function Control:
    // bit 0 - Enable Main ALU
    // bits 2:1 - Increment Unit
    //      bit 1: Enable Increment Unit
    //      bit 2: Decrement
    // bit 4:3 - Logic Unit
    //      bit 3: Enable Logic Unit
    //      bit 4: Disable Z Flag
    // bit 5 - Enable Misc ALU
    // Enabling a unit will set o_Result and flag_bus to that unit's output.
    input [5:0] i_Function_Control, //Control bits to select function
    input i_Save_Flags, //Saves new flags from a function to the flags register
    output [7:0] o_Result //Function output
    );
    
    
    //Registers
    
    wire A_write;
    wire [7:0] A_data;
    Register Reg_A
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write[0]),
    .i_Data(i_Data),
    .o_Data(A_data)
    );
    
    //FLAGS
    // | 7 6 5 4 | 3 2 1 0 |
    // | Z N H C | - - - - |
    // Unused values are treated as on.
    wire [3:0] flag_bus;
    wire [3:0] F_new_data = i_Write[1] ? i_Data[7:4] : flag_bus;
    wire F_write;
    wire [3:0] flags;
    Register #(.SIZE(4)) Reg_F
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(F_write | i_Write[1]),
    .i_Data(F_new_data),
    .o_Data(flags)
    );
    
    assign o_Reg_Data = ({8{i_Read[0]}} & A_data) |
                        ({8{i_Read[1]}} & {flags, 4'hf});
    
    //Functions
    
    //Main
    wire [7:0] main_res;
    wire [3:0] main_flags;
    Main_ALU main
    (.i_A(A_data),
    .i_B(i_Parameter),
    .i_Opcode(i_Opcode[5:3]),
    .i_F(flags),
    .o_A(main_res),
    .o_F(main_flags)
    );
    
    //Incrementer
    wire [7:0] inc_res;
    wire [3:0] inc_flags;
    Incrementer_8Bit inc
    (.i_A(i_Parameter),
    .i_F(flags),
    .i_Decrement(i_Function_Control[2]),
    .o_A(inc_res),
    .o_F(inc_flags)
    );
    
    //Logic Unit
    wire [7:0] logic_res;
    wire [3:0] logic_flags;
    Logic_Unit logic
    (.i_A(i_Parameter),
    .i_F(flags),
    .i_Opcode(i_Opcode[7:3]),
    .i_Disable_Z(i_Function_Control[4]),
    .o_A(logic_res),
    .o_F(logic_flags)
    );
    
    //Misc
    wire [7:0] misc_res;
    wire [3:0] misc_flags;
    Misc_ALU misc
    (.i_A(A_data),
    .i_F(flags),
    .i_Opcode(i_Opcode[5:4]),
    .o_A(misc_res),
    .o_F(misc_flags)
    );
    
    assign o_Result = ({8{i_Function_Control[0]}} & main_res) |
                      ({8{i_Function_Control[1]}} & inc_res) |
                      ({8{i_Function_Control[3]}} & logic_res) |
                      ({8{i_Function_Control[5]}} & misc_res);
    assign flag_bus = ({4{i_Function_Control[0]}} & main_flags) |
                      ({4{i_Function_Control[1]}} & inc_flags) |
                      ({4{i_Function_Control[3]}} & logic_flags) |
                      ({4{i_Function_Control[5]}} & misc_flags);
    
endmodule
