`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 01:34:01 AM
// Design Name: 
// Module Name: PUSH_Microcode
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


module PUSH_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_ReadALU8,
    output o_Move_Reg,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    
    wire prep_param = i_Cycle_Step[2] & i_Cycle_Count[0] & i_Active;
    wire predecrement_sp = i_Cycle_Step[3] & i_Cycle_Count[0] & i_Active;
    wire [1:0] push_address = i_Cycle_Step[0] & i_Active & |i_Cycle_Count[2:1];
    wire dec_sp = i_Cycle_Step[1] & i_Active & i_Cycle_Count[1];
    wire [1:0] push_data_out = {2{i_Cycle_Step[0] & i_Active}} & i_Cycle_Count[3:2];
    
    assign o_IR_Fetch = i_Cycle_Count[3] & i_Active;
    
    assign o_Read8 = {{{2{i_P[2]}}, {2{i_P[1]}}, {2{i_P[0]}}} & {3{push_data_out}}, 2'b00};
    assign o_Read16 = {1'b0, prep_param | push_address, 4'h0};
    assign o_Write16 = {1'b0, predecrement_sp | dec_sp, 4'b0};
    assign o_ReadALU8 = {2{i_P[3]}} & push_data_out;
    
    assign o_Move_Reg = |push_data_out;
    assign o_Bus_Out = |push_data_out;
    assign o_Address_Out = |push_address;
    
    assign o_Increment16 = {2{predecrement_sp | dec_sp}};
endmodule
