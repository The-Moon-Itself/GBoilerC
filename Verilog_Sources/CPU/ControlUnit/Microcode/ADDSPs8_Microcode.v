`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:44:30 AM
// Design Name: 
// Module Name: ADDSPs8_Microcode
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


module ADDSPs8_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [1:0] i_P,
    output o_IR_Fetch,
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_In,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output [1:0] o_Add_r8_Control
    );
    
    wire immediate_address = i_Cycle_Step[0] & i_Cycle_Count[0] & i_Active;
    wire increment_pc = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire immediate_data_in = i_Cycle_Step[0] & i_Cycle_Count[1] & i_Active;
    wire prep_params = i_Cycle_Step[1] & i_Cycle_Count[1] & i_Active;
    wire add_r8  = i_Cycle_Step[2] & i_Cycle_Count[1] & i_Active;
    
    assign o_IR_Fetch = ((i_P[0] & i_Cycle_Count[3]) | (i_P[1] & i_Cycle_Count[2])) & i_Active;
    assign o_Read8 = {7'b0000000, prep_params};
    assign o_Write8 = {7'b0000000, immediate_data_in};
    assign o_Read16 = {immediate_address, prep_params, 4'h0};
    assign o_Write16 = {increment_pc, {i_P[0], i_P[1]} & {2{add_r8}}, 3'b000};
    assign o_Bus_In = immediate_data_in;
    assign o_Address_Out = immediate_address;
    assign o_Increment16 = {1'b0, increment_pc};
    assign o_Add_r8_Control = {2{add_r8}};
endmodule
