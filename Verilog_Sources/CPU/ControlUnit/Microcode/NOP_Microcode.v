`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 03:27:13 PM
// Design Name: 
// Module Name: NOP_Microcode
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


module NOP_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output o_Reset_Cycle
    );
    
    wire step_2 = i_Cycle_Step[1] & i_Active;
    assign o_Read16 = {step_2, 5'b00000};
    assign o_Write16 = {step_2, 5'b00000};
    assign o_Address_Out = step_2;
    assign o_Increment16 = {1'b0, step_2};
    wire step_4 = i_Cycle_Step[3] & i_Active;
    assign o_Reset_Cycle = step_4;
endmodule
