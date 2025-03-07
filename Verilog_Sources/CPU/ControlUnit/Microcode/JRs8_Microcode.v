`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 05:06:34 PM
// Design Name: 
// Module Name: JRs8_Microcode
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


module JRs8_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_Y,
    input i_Always,
    input [3:0] i_Conditions,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_In,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output [1:0] o_Add_r8_Control
    );
    
    wire address_immediate = i_Cycle_Count[0] & i_Cycle_Step[1] & i_Active;
    wire read_immediate = i_Cycle_Count[1] & i_Cycle_Step[0] & i_Active;
    
    wire condition_met = (i_Y & i_Conditions != 0) | i_Always;
    wire jump = i_Cycle_Count[1] & i_Cycle_Step[1] & condition_met & i_Active;
    
    assign o_Read8 = {7'b0000000, jump};
    assign o_Write8 = {7'b0000000, read_immediate};
    assign o_Read16 = {address_immediate | jump, 5'b00000};
    assign o_Write16 = o_Read16;
    assign o_Increment16 = {1'b0, address_immediate};
    assign o_Add_r8_Control = {1'b0, jump};
    assign o_Bus_In = read_immediate;
    assign o_Address_Out = address_immediate;
    assign o_IR_Fetch = (condition_met ? i_Cycle_Count[2] : i_Cycle_Count[1]) & i_Active;
    
endmodule
