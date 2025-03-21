`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 02:15:48 PM
// Design Name: 
// Module Name: INCDECrpp_Microcode
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


module INCDECrpp_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    input [1:0] i_Q,
    output o_IR_Fetch,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_Increment16
    );
    
    wire inc_step = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    
    assign o_IR_Fetch = i_Cycle_Count[1] & i_Active;
    assign o_Read16 = {1'b0, i_P & {4{inc_step}}, 1'b0};
    assign o_Write16 = o_Read16;
    assign o_Increment16 = {i_Q[1] & inc_step, inc_step};
endmodule
