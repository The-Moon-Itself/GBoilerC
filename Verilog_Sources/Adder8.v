`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 11:27:08 PM
// Design Name: 
// Module Name: Adder8
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


module Adder8(
    input [7:0] i_A, //The accumulator
    input [7:0] i_B, //The second parameter
    input i_Carry, //Carry in
    output [7:0] o_Sum, //The sum
    output o_Carry, //Carry out
    output o_HalfCarry //Carry out bit of the lower nybbles
    );
    
    wire [4:0] low_nybble_sum = i_A[3:0] + i_B[3:0] + i_Carry;
    wire [4:0] high_nybble_sum = i_A[7:4] + i_B[7:4] + low_nybble_sum[4];
    
    assign o_Sum = {high_nybble_sum[3:0], low_nybble_sum[3:0]};
    assign o_Carry = high_nybble_sum[4];
    assign o_HalfCarry = low_nybble_sum[4];
    
endmodule
