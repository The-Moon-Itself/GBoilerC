`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 10:16:33 PM
// Design Name: 
// Module Name: X1
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


module X1(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Y,
    input [7:0] i_Z,
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
    output o_Halt
    );
    
    wire halt = i_Y[6] & i_Z[6] & i_Active;
    wire not_halt = (~i_Y[6] | ~i_Z[6]) & i_Active;
    
    wire hl_mov = i_Y[6] | i_Z[6];
    wire move_cycle = hl_mov ? i_Cycle_Count[1] : i_Cycle_Count[0];
    wire move_param = move_cycle & i_Cycle_Step[1] & not_halt;
    wire move_step = move_cycle & (hl_mov ? i_Cycle_Step[0] : i_Cycle_Step[2]) & not_halt;
    wire hl_address = hl_mov & i_Cycle_Step[0] & i_Cycle_Count[0] & not_halt;
    
    assign o_IR_Fetch = move_cycle & not_halt;
    assign o_Read8 = {i_Z[5:0] & {6{move_param}}, 2'b00};
    assign o_Write8 = {i_Y[5:0] & {6{move_step}}, 2'b00};
    assign o_Read16 = {i_Cycle_Step[1] & halt, 1'b0, hl_address , 3'b000};
    assign o_ReadALU8 = {1'b0, i_Z[7] & move_param};
    assign o_WriteALU8 = {1'b0, i_Y[7] & move_step};
    assign o_Move_Reg = ~hl_mov & not_halt;
    assign o_Bus_In = i_Z[6] & move_step;
    assign o_Bus_Out = i_Y[6] & move_step;
    assign o_Address_Out = hl_address | (i_Cycle_Step[1] & halt);
    assign o_Halt = i_Cycle_Step[3] & halt;
endmodule
