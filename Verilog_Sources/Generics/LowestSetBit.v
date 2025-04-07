`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 01:58:50 PM
// Design Name: 
// Module Name: LowestSetBit
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


module LowestSetBit #(parameter SIZE = 8)(
    input [SIZE-1:0] i_Input,
    output [SIZE-1:0] o_Output
    );
    
    assign o_Output = ((i_Input-1)^i_Input)&i_Input;
endmodule
