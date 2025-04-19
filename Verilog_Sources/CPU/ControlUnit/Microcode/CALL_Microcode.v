`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 07:23:02 PM
// Design Name: 
// Module Name: CALL_Microcode
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


module CALL_Microcode(
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
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output [1:0] o_Bus16_Byte_To_Bus
    );
    
    wire conditions_met = (|(i_Y & i_Conditions) | i_Active) & i_Active;
    
    wire immediate_address = i_Cycle_Step[0] & |i_Cycle_Count[1:0] & i_Active;
    wire increment_pc = i_Cycle_Step[1] & |i_Cycle_Count[1:0] & i_Active;
    wire [1:0] immediate_data_in = {2{i_Cycle_Step[0] & i_Active}} & i_Cycle_Count[2:1];
    
    wire prep_sp_param = i_Cycle_Step[2] & i_Cycle_Count[1] & conditions_met;
    wire predecrement_sp = i_Cycle_Step[3] & i_Cycle_Count[1] & conditions_met;
    wire prep_pc_param = i_Cycle_Step[3] & |i_Cycle_Count[3:2] & conditions_met;
    wire [1:0] push_address = {2{i_Cycle_Step[0] & conditions_met}} & i_Cycle_Count[3:2];
    wire dec_sp = i_Cycle_Step[1] & conditions_met & i_Cycle_Count[2];
    wire [1:0] push_data_out = {2{i_Cycle_Step[0] & conditions_met}} & i_Cycle_Count[4:3];
    
    wire prep_wz_param = i_Cycle_Step[1] & i_Cycle_Count[4] & conditions_met;
    wire set_pc = i_Cycle_Step[2] & i_Cycle_Count[4] & conditions_met;
    
    assign o_IR_Fetch = (conditions_met ? i_Cycle_Count[5] : i_Cycle_Count[2]) & i_Active;
    
    assign o_Write8 = {6'b000000, immediate_data_in[0], immediate_data_in[1]};
    assign o_Read16 = {immediate_address | prep_pc_param, prep_sp_param | (|push_address), 3'b000, prep_wz_param};
    assign o_Write16 = {increment_pc | set_pc, predecrement_sp | dec_sp, 4'h0};
    
    assign o_Bus_In = |immediate_data_in;
    assign o_Bus_Out = |push_data_out;
    assign o_Address_Out = immediate_address | (|push_address);
    
    assign o_Increment16 = {predecrement_sp | dec_sp, predecrement_sp | dec_sp | increment_pc};
    assign o_Bus16_Byte_To_Bus = {push_data_out[0], push_data_out[1]};
endmodule
