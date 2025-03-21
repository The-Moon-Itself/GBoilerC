`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 02:21:50 PM
// Design Name: 
// Module Name: X2
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


module X2(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Z,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Bus_In,
    output o_Address_Out,
    output [6:0] o_ALU_Control
    );
    
    wire alu_step = (i_Z[6] ? (i_Cycle_Step[2] & i_Cycle_Count[1]) : (i_Cycle_Step[2] & i_Cycle_Count[0])) & i_Active;
    wire hl_address = i_Z[6] & i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire hl_data = i_Z[6] & i_Cycle_Step[0] & i_Cycle_Count[1] & i_Active;
    
    assign o_IR_Fetch = (i_Z[6] ? i_Cycle_Count[1] : i_Cycle_Count[0]) & i_Active;
    assign o_Read8 = {i_Z[5:0] & {6{alu_step}}, 1'b0, i_Z[6] & alu_step};
    assign o_Write8 = {7'b0000000, hl_data};
    assign o_Read16 = {2'b00, hl_address, 3'b000};
    assign o_ReadALU8 = {1'b0, i_Z[7] & alu_step};
    assign o_WriteALU8 = {1'b0, alu_step};
    assign o_Bus_In = hl_data;
    assign o_Address_Out = hl_address;
    assign o_ALU_Control = {alu_step, 5'b00000, alu_step};
endmodule
