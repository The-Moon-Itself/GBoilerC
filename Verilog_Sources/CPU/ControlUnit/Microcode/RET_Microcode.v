`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:49:38 PM
// Design Name: 
// Module Name: RET_Microcode
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


module RET_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_Y,
    input [3:0] i_Conditions,
    input i_Always,
    input i_RETI,
    
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    
    output o_Bus_In,
    output o_Address_Out,
    
    output [1:0] o_Increment16,
    
    output o_EI
    );
    
    
    wire [3:0] offsetted_cycles = i_Always ? i_Cycle_Count[3:0] : i_Cycle_Count[4:1]; //Conditional RETs take an extra cycle for some reason
    wire conditions_met = (|{i_Y & i_Conditions} | i_Always) & i_Active;
    
    wire pop_address = conditions_met & i_Cycle_Step[1] & |offsetted_cycles[1:0];
    wire pop_data_in = conditions_met & i_Cycle_Step[0];
    wire set_pc = i_Cycle_Step[3] & offsetted_cycles[2] & i_Active;
    
    assign o_IR_Fetch = (conditions_met ? offsetted_cycles[3] : offsetted_cycles[0]) & i_Active;
    
    assign o_Write8 = {6'b000000, {offsetted_cycles[1], offsetted_cycles[2]} & {2{pop_data_in}}};
    assign o_Read16 = {1'b0, pop_address, 3'b000, set_pc};
    assign o_Write16 = {set_pc, pop_address, 4'b0000};
    
    assign o_Bus_In = pop_data_in & |offsetted_cycles[2:1];
    assign o_Address_Out = pop_address;
    
    assign o_Increment16 = {1'b0, pop_address};
    
    assign o_EI = i_RETI & i_Active;
endmodule
