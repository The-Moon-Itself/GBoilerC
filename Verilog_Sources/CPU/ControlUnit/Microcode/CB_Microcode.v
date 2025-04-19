`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2025 01:46:53 PM
// Design Name: 
// Module Name: CB_Microcode
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


module CB_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Z,
    output o_IR_Fetch,
    output o_Disable_CB,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [6:0] o_ALU_Control
    );
    
    wire alu_param = (i_Z[6] ? (i_Cycle_Count[1]) : (i_Cycle_Count[0])) & i_Cycle_Step[1] & i_Active;
    wire alu_step = (i_Z[6] ? (i_Cycle_Count[1]) : (i_Cycle_Count[0])) & i_Cycle_Step[2] & i_Active;
    wire hl_address = i_Z[6] & i_Cycle_Step[0] & |i_Cycle_Count[1:0] & i_Active;
    wire [1:0] hl_data = {2{i_Z[6] & i_Cycle_Step[0] & i_Active}} & i_Cycle_Count[2:1];
    
    assign o_IR_Fetch = (i_Z[6] ? i_Cycle_Count[2] : i_Cycle_Count[0]) & i_Active;
    assign o_Disable_CB = o_IR_Fetch & i_Cycle_Step[3];
    assign o_Read8 = {i_Z[5:0] & {6{alu_param}}, 1'b0, (i_Z[6] & alu_param) | hl_data[1]};
    assign o_Write8 = {i_Z[5:0] & {6{alu_step}}, 1'b0, (i_Z[6] & alu_step) | hl_data[0]};
    assign o_Read16 = {2'b00, hl_address, 3'b000};
    assign o_ReadALU8 = {1'b0, i_Z[7] & alu_param};
    assign o_WriteALU8 = {1'b0, i_Z[7] & alu_step};
    assign o_Bus_In = hl_data[0];
    assign o_Bus_Out = hl_data[1];
    assign o_Address_Out = hl_address;
    assign o_ALU_Control = {alu_step, 2'b00, alu_step, 3'b000};
endmodule
