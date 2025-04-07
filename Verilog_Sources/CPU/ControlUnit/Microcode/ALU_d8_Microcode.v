`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 01:07:58 PM
// Design Name: 
// Module Name: ALU_d8_Microcode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_d8_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_WriteALU8,
    output o_Bus_In,
    output o_Address_Out,
    output [6:0] o_ALU_Control,
    output [1:0] o_Increment16
    );
    
    wire immediate_address = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire immediate_data_in = i_Cycle_Step[0] & i_Cycle_Count[1] & i_Active;
    wire alu_step = i_Cycle_Step[2] & i_Cycle_Count[1] & i_Active;
    
    assign o_IR_Fetch = i_Cycle_Count[1] & i_Active;
    assign o_Read8 = {7'b0000000, alu_step};
    assign o_Write8 = {7'b0000000, immediate_data_in};
    assign o_Read16 = {immediate_address, 5'b00000};
    assign o_Write16 = {immediate_address, 5'b00000};
    assign o_WriteALU8 = {1'b0, alu_step};
    assign o_Bus_In = immediate_data_in;
    assign o_Address_Out = immediate_address;
    assign o_ALU_Control = {alu_step, 5'b00000, alu_step};
    assign o_Increment16 = {1'b0, immediate_address};
endmodule
