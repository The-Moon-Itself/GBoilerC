`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 04:50:41 PM
// Design Name: 
// Module Name: Pipeline_Register
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


module Pipeline_Register #(SIZE = 8, INITIAL = 0)(
    input i_Clk,
    input i_Enable,
    input i_nRst,
    input [SIZE-1:0] i_Data, //New data to use
    output reg [SIZE-1:0] o_Data = INITIAL //Current saved data
    );
    
    always @(posedge i_Clk, negedge i_nRst) begin
        if(!i_nRst) begin
            o_Data <= INITIAL;
        end
        else if (i_Enable == 1) begin
            o_Data <= i_Data;
        end
    end
endmodule
