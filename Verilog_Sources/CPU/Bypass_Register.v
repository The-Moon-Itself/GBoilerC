`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 11:53:56 AM
// Design Name: 
// Module Name: Bypass_Register
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


module Bypass_Register #(SIZE = 8, INITIAL = 0) (
    input i_Clk, //Our system clock
    input i_Enable, //Used to disable the component when the system is not being ticked
    input i_nRst, //Reset on low
    input i_Write, //Write to output on next clock cycle
    input [SIZE-1:0] i_Data, //New data to use
    output [SIZE-1:0] o_Data //Current saved data
    );
    
    wire [SIZE-1:0] register_data;
    Register #(.SIZE(SIZE), .INITIAL(INITIAL)) register
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Write(i_Write),
    .i_Data(i_Data),
    .o_Data(register_data)
    );
    
    assign o_Data = i_Write ? i_Data : register_data;
endmodule
