`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 06:07:03 PM
// Design Name: 
// Module Name: LDryd8_Microcode
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


module LDryd8_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Y,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_WriteALU8,
    output o_Move_Reg,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire address_immediate = i_Cycle_Step[0] & i_Cycle_Count[0] & i_Active;
    wire increment_pc = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire read_immediate = i_Cycle_Step[0] & i_Cycle_Count[1] & i_Active;
    wire address_hl = i_Cycle_Step[0] & i_Cycle_Count[1] & i_Y[6] & i_Active;
    wire write_hl = i_Cycle_Step[0] & i_Cycle_Count[2] & i_Active;
    wire fetch = ((!i_Y[6] & i_Cycle_Count[1]) | i_Cycle_Count[2]) & i_Active;
    
    assign o_IR_Fetch = fetch;
    assign o_Read8 = {7'b0000000, write_hl};
    assign o_Write8 = {i_Y[5:0] & {6{read_immediate}}, 1'b0, i_Y[6] & read_immediate};
    assign o_Read16 = {address_immediate, 1'b0, address_hl, 3'b000};
    assign o_Write16 = {increment_pc, 5'b00000};
    assign o_WriteALU8 = {1'b0, i_Y[7] & read_immediate};
    assign o_Move_Reg = write_hl;
    assign o_Bus_In = read_immediate;
    assign o_Bus_Out = write_hl;
    assign o_Address_Out = address_immediate | address_hl;
    assign o_Increment16 = {1'b0, increment_pc};
    
endmodule
