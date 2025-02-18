`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 04:07:07 PM
// Design Name: 
// Module Name: Incrementer_16bit
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


module Incrementer_16bit(
    input [15:0] i_In,
    input i_Active,
    input i_Decrement,
    output [15:0] o_Out,
    output o_Carry
    );
    
    //I'm hoping that this is optimized in synthesis, because doing this for a simple increment pained me.
    wire [16:0] result = i_In + {{15{i_Active & i_Decrement}}, i_Active};
    assign o_Out = result[15:0];
    assign o_Carry = result[16];
    
endmodule
