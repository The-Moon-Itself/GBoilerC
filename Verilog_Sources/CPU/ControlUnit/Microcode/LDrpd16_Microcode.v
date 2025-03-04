`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 02:00:23 PM
// Design Name: 
// Module Name: LDrpd16_Microcode
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


module LDrpd16_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_In,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire set_address = i_Active & i_Cycle_Step[1] & (i_Cycle_Count[0] | i_Cycle_Count[1]);
    wire read_memory = i_Active & i_Cycle_Step[0] & (i_Cycle_Count[1] | i_Cycle_Count[2]);
    wire move_value = i_Active & i_Cycle_Step[2] & i_Cycle_Count[2];
    assign o_Write8 = {8{read_memory}} & {6'b000000, i_Cycle_Count[1], i_Cycle_Count[2]}; //Little Endian
    assign o_Read16 = {set_address, 4'h0, move_value};
    assign o_Write16 = {set_address, i_P & {4{move_value}}, 1'b0};
    assign o_Increment16 = {1'b0, set_address};
    assign o_Address_Out = o_Increment16[0];
    assign o_Bus_In = read_memory;
    assign o_IR_Fetch = i_Active & i_Cycle_Count[2];
    
endmodule
