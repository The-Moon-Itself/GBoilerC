`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 10:13:30 PM
// Design Name: 
// Module Name: LDca8A_Microcode
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


module LDca8A_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [1:0] i_P,
    input i_C,
    output o_IR_Fetch,
    
    output [7:0] o_Read8,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Move_Reg,
    
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    
    output [1:0] o_Increment16,
    output o_Bus8_To_Bus16
    );
    
    wire immediate_access = ~i_C & i_Cycle_Count[0] & i_Cycle_Step[0] & i_Active;
    wire increment_pc = ~i_C & i_Cycle_Count[0] & i_Cycle_Step[1] & i_Active;
    wire immediate_data = ~i_C & i_Cycle_Count[1] & i_Cycle_Step[0] & i_Active;
    wire address_target = (i_C ? i_Cycle_Count[0] : i_Cycle_Count[1]) & i_Cycle_Step[0] & i_Active;
    wire [1:0] data_access = i_P & {2{(i_C ? i_Cycle_Count[1] : i_Cycle_Count[2]) & i_Cycle_Step[0] & i_Active}};
    
    assign o_IR_Fetch = (i_C ? i_Cycle_Count[1] : i_Cycle_Count[2]) & i_Active;
    
    assign o_Read8 = {4'h0, address_target & i_C, 2'b00, address_target & ~i_C};
    assign o_Write8 = {7'b0000000, immediate_data};
    assign o_Read16 = {immediate_access, 5'b00000};
    assign o_Write16 = {increment_pc, 5'b00000};
    assign o_ReadALU8 = {1'b0, data_access[0]};
    assign o_WriteALU8 = {1'b0, data_access[1]};
    assign o_Move_Reg = data_access[0];
    
    assign o_Bus_In = data_access[1] | immediate_data;
    assign o_Bus_Out = data_access[0];
    assign o_Address_Out = immediate_access | address_target;
    
    assign o_Increment16 = {1'b0, increment_pc};
    assign o_Bus8_To_Bus16 = address_target;
    
endmodule
