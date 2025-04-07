`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 01:13:49 AM
// Design Name: 
// Module Name: LDa16A_Microcode
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


module LDa16A_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [1:0] i_P,
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Move_Reg,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire immediate_access = |i_Cycle_Count[1:0] & i_Cycle_Step[1] & i_Active;
    wire [1:0] immediate_data = {i_Cycle_Count[1], i_Cycle_Count[2]} & {2{i_Cycle_Step[0] & i_Active}};
    wire address_target = i_Cycle_Count[2] & i_Cycle_Step[1] & i_Active;
    wire [1:0] data_access = i_P & {2{i_Cycle_Count[3] & i_Cycle_Step[0] & i_Active}};
    
    assign o_IR_Fetch = i_Cycle_Count[3] & i_Active;
    
    assign o_Write8 = {6'b000000, immediate_data};
    assign o_Read16 = {|immediate_access, 4'h0, address_target};
    assign o_Write16 = {|immediate_access, 5'b00000};
    assign o_ReadALU8 = {1'b0, data_access[0]};
    assign o_WriteALU8 = {1'b0, data_access[1]};
    assign o_Move_Reg = data_access[0];
    
    assign o_Bus_In = data_access[1] | |immediate_data;
    assign o_Bus_Out = data_access[0];
    assign o_Address_Out = immediate_access | address_target;
    
    assign o_Increment16 = {1'b0, immediate_access};
endmodule
