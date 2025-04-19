`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 05:11:52 PM
// Design Name: 
// Module Name: LDPCSP_HL_Microcode
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


module LDPCSP_HL_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [1:0] i_P,
    output o_IR_Fetch,
    output o_Reset_Cycle,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire move_param = |(i_P & i_Cycle_Step[1:0]) & i_Active;
    wire mov_step = |(i_P & i_Cycle_Step[2:1]) & i_Active;
    
    assign o_IR_Fetch = i_Cycle_Count[1] & i_Active;
    assign o_Reset_Cycle = i_Active & i_Cycle_Step[3] & i_P[0];
    assign o_Read16 = {2'b00, move_param, 3'b000};
    assign o_Write16 = {{i_P[0], i_P[1]} & {2{mov_step}}, 4'h0};
    assign o_Address_Out = i_P[0] & move_param;
    assign o_Increment16 = {1'b0, i_P[0] & mov_step};
    
endmodule
