`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 06:43:24 PM
// Design Name: 
// Module Name: Incrementer_8Bit
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


module Incrementer_8Bit(
    input [7:0] i_A, //Value to be incremented
    input [3:0] i_F, //Old Flags
    input i_Active, //Enables the increment, output mirrors input if off.
    input i_Decrement, //Switch to decrement
    output [7:0] o_A, //Output
    output [3:0] o_F //New Flags
    );
    
    //Flags
    // | 7 6 5 4 | 3 2 1 0 |
    // | Z N H C | - - - - |
    // C is unchanged for increments, since overflows can be checked using the Z flag.
    // H Should be set if the lower nybble carries over to the high nybble
    // during increment, or borrows from the high nybble during decrement.
    // N is set on decrement, reset on increment
    // Z is set if the result is zero.
    
    wire [4:0] first_nybble = i_A[3:0] + {{3{i_Decrement & i_Active}}, i_Active};
    wire [4:0] second_nybble = i_A[7:4] + first_nybble[4] + {4{i_Decrement & i_Active}};
    wire [7:0] result = {second_nybble[3:0], first_nybble[3:0]};
    assign o_A = result;
    assign o_F = {result == 0,
                  i_Decrement,
                  first_nybble[4] ^ i_Decrement,
                  i_F[0]};
    
endmodule
