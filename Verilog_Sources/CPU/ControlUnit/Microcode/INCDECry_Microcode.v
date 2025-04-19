`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 04:02:53 PM
// Design Name: 
// Module Name: INCDECry_Microcode
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


module INCDECry_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Y,
    input i_Decrement,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Move_Reg,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [6:0] o_ALU_Control
    );
    
    wire prep_parameter = i_Cycle_Step[1] & (i_Y[6] ? i_Cycle_Count[1] : i_Cycle_Count[0]) & i_Active;
    wire alu_step = i_Cycle_Step[2] & (i_Y[6] ? i_Cycle_Count[1] : i_Cycle_Count[0]) & i_Active;
    wire send_address = i_Y[6] & i_Cycle_Step[0] & |i_Cycle_Count[1:0] & i_Active;
    wire memory_access = i_Y[6] & i_Cycle_Step[0] & i_Active;
    
    assign o_IR_Fetch = (i_Y[6] ? i_Cycle_Count[2] : i_Cycle_Count[0]) & i_Active;
    assign o_Read8 = {i_Y[5:0] & {6{prep_parameter}}, memory_access & i_Cycle_Count[2], i_Y[6] & prep_parameter};
    assign o_Write8 = {i_Y[5:0] & {6{alu_step}}, i_Y[6] & alu_step, memory_access & i_Cycle_Count[1]};
    assign o_Read16 = {2'b00, send_address, 3'b000};
    assign o_ReadALU8 = {1'b0, i_Y[7] & prep_parameter};
    assign o_WriteALU8 = {1'b0, i_Y[7] & alu_step};
  	assign o_Move_Reg = memory_access & i_Cycle_Count[2];
    assign o_Bus_In = memory_access & i_Cycle_Count[1];
    assign o_Bus_Out = memory_access & i_Cycle_Count[2];
    assign o_Address_Out = send_address;
    assign o_ALU_Control = {alu_step, 3'b000, i_Decrement & alu_step, alu_step, 1'b0};
    
endmodule
