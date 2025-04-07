`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 05:33:12 PM
// Design Name: 
// Module Name: JP_a16
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


module JP_a16_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_Y,
    input [3:0] i_Conditions,
    input i_Always,
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_In,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire address_immediate = i_Cycle_Step[1] & |i_Cycle_Count[1:0] & i_Active;
    wire immediate_data_in = {2{i_Cycle_Step[0] & i_Active}} & {i_Cycle_Count[0], i_Cycle_Step[1]};
    
    wire condition_met = (|(i_Y & i_Conditions) | i_Always) & i_Active;
    wire jump = i_Cycle_Step[1] & i_Cycle_Count[1] & condition_met;
    
    assign o_IR_Fetch = (condition_met ? i_Cycle_Count[3] : i_Cycle_Count[2]) & i_Active;
    assign o_Write8 = {6'b000000, immediate_data_in};
    assign o_Read16 = {address_immediate, 4'h0, jump};
    assign o_Write16 = {address_immediate | jump, 5'b00000};
    assign o_Bus_In = |immediate_data_in;
    assign o_Address_Out = address_immediate;
    assign o_Increment16 = {1'b0, address_immediate}; 
    
endmodule
