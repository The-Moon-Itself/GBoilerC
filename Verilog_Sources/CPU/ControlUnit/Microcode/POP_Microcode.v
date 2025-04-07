`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 01:46:15 PM
// Design Name: 
// Module Name: POP_Microcode
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


module POP_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_WriteALU8,
    output o_Bus_In,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire SP_address = i_Cycle_Step[1] & |i_Cycle_Count[1:0] & i_Active;
    wire [1:0] pop_data = {2{i_Cycle_Step[0] & i_Active}} & {i_Cycle_Count[1], i_Cycle_Count[2]};
    
    assign o_IR_Fetch = i_Active & i_Cycle_Count[2];
    assign o_Write8 = {{{2{i_P[2]}},{2{i_P[1]}},{2{i_P[0]}}} & {3{pop_data}}, 2'b00};
    assign o_Read16 = {1'b0, SP_address, 4'h0};
    assign o_Write16 = {1'b0, SP_address, 4'h0};
    assign o_WriteALU8 = {2{i_P[3]}} & pop_data;
    assign o_Bus_In = |pop_data;
    assign o_Address_Out = SP_address;
    assign o_Increment16 = {1'b0, SP_address};
    
endmodule
