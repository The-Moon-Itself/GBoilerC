`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2025 12:50:06 PM
// Design Name: 
// Module Name: decoder
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


module Decoder #(parameter SIZE = 8) (
    input [$clog2(SIZE)-1:0] i_In,
    input i_Disable,
    output [SIZE-1:0] o_Out
    );
    
    assign o_Out = i_Disable ? {SIZE{1'b0}} : 1 << i_In;
endmodule
