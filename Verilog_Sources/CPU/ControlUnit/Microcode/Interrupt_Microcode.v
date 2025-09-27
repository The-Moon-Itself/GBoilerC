`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 05:27:32 PM
// Design Name: 
// Module Name: Interrupt_Microcode
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


module Interrupt_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [2:0] i_Interrupt_Address,
    output o_Reset_Cycle,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output [1:0] o_Bus16_Byte_To_Bus,
    output [7:0] o_Bus_Value,
    output o_Bus_Value_Active,
    output o_DI,
    output o_Handle_Interrupt
    );
    
    wire [1:0] set_target_address = {2{i_Cycle_Step[2] & i_Active}} & i_Cycle_Count[1:0];
    
    wire predecrement_sp = i_Cycle_Step[0] & i_Cycle_Count[0] & i_Active;
    wire [1:0] push_address = {2{i_Cycle_Step[0] & i_Active}} & i_Cycle_Count[2:1];
    wire decrement_sp = i_Cycle_Step[1] & i_Active & |i_Cycle_Count[1:0];
    wire prep_pc_param = i_Cycle_Step[3] & |i_Cycle_Count[2:1] & i_Active;
    wire [1:0] push_data_out = {2{i_Cycle_Step[0] & i_Active}} & i_Cycle_Count[3:2];
    
    wire prep_wz_param = i_Cycle_Step[0] & i_Cycle_Count[3] & i_Active;
    wire increment_pc = i_Cycle_Step[1] & i_Cycle_Count[3] & i_Active;
    
    assign o_Reset_Cycle = i_Cycle_Count[3] & i_Cycle_Step[3] & i_Active;
    
    assign o_Write8 = {6'b000000, set_target_address};
    assign o_Read16 = {prep_pc_param, predecrement_sp | |push_address, 3'b000, prep_wz_param};
    assign o_Write16 = {increment_pc, decrement_sp, 4'h0};
    
    assign o_Bus_Out = |push_data_out;
    assign o_Address_Out = |push_address;
    
    assign o_Increment16 = {decrement_sp, increment_pc | decrement_sp};
    assign o_Bus16_Byte_To_Bus = {push_data_out[0], push_data_out[1]};
    
    assign o_Bus_Value = {1'b0, set_target_address[1], i_Interrupt_Address & {3{set_target_address[1]}}, 3'b000};
    assign o_Bus_Value_Active = |set_target_address;
    
    assign o_DI = i_Active;
    assign o_Handle_Interrupt = set_target_address[1];
endmodule
