`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2025 02:06:14 AM
// Design Name: 
// Module Name: Misc_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies:
//  DAA.v 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//Performs some miscellaneous functions on the accumulator and flags.
module Misc_ALU(
    input [7:0] i_A, // The accumulator
    input [3:0] i_F, //The current flags
    input [1:0] i_Opcode, // Bits [5:4] of the opcode
    output [7:0] o_A, //New value for the accumulator
    output [3:0] o_F //New flags
    );
    
    // Operations:
    // 0 - DAA, Decimal Accumulator Adjust
    // 1 - CPL, Complement A. Z and C flags preserved, N and H flags set
    // 2 - SCF, Set Carry Flag. Z flag preserved, N and H reset, C is set
    // 3 - CCF, Complement Carry Flag. Z is preserved, N and H reset, C inverted
    
    //Flags
    // | 7 6 5 4 | 3 2 1 0 |
    // | Z N H C | - - - - |
    
    wire [7:0] daa_result;
    wire [3:0] daa_flags;
    DAA daa
    (.i_A(i_A),
    .i_F(i_F),
    .o_A(daa_result),
    .o_F(daa_flags)
    );
    
    
    assign o_A = i_Opcode[1] ? i_A : (i_Opcode[0] ? ~i_A : daa_result);
    assign o_F = ({4{i_Opcode == 2'b00}} & daa_flags) |
                 ({4{i_Opcode == 2'b01}} & {i_F[3], 2'b11, i_F[0]}) |
                 ({4{i_Opcode == 2'b10}} & {i_F[3], 3'b001}) |
                 ({4{i_Opcode == 2'b11}} & {i_F[3], 2'b00, ~i_F[0]});
    
endmodule
