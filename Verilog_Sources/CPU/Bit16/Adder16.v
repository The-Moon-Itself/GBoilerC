`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:52:11 PM
// Design Name: 
// Module Name: adder16
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


module Adder16(
    input [15:0] i_A,
    input [15:0] i_B,
    input [3:0] i_F,
    output [15:0] o_Result,
    output [3:0] o_F
    );
    
    wire low_byte_carry;
    Adder8 low_byte_adder
    (.i_A(i_A[7:0]),
    .i_B(i_B[7:0]),
    .i_Carry(1'b0),
    .o_Sum(o_Result[7:0]),
    .o_Carry(low_byte_carry),
    .o_HalfCarry()
    );
    
    
    Adder8 high_byte_adder
    (.i_A(i_A[15:8]),
    .i_B(i_B[15:8]),
    .i_Carry(low_byte_carry),
    .o_Sum(o_Result[15:8]),
    .o_Carry(o_F[0]),
    .o_HalfCarry(o_F[1])
    );
    
    assign o_F[3:2] = {i_F[3], 1'b0};
endmodule
