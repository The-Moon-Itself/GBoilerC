`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 03:14:21 PM
// Design Name: 
// Module Name: CU_Clock
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


module CU_Clock(
    input i_Clk, //The system clock
    input i_Enable, //Enables the clock
    input i_Reset, //Reset to step 0
    output reg [4:0] o_Step = 5'b00000 //The current step
    );
    always @(posedge i_Clk) begin
        if(i_Enable) begin
            o_Step <= i_Reset ? 5'b0 : o_Step + 1;
        end
    end
endmodule
