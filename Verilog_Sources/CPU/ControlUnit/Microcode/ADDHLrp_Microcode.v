`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 02:20:44 PM
// Design Name: 
// Module Name: ADDHLrp_Microcode
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


module ADDHLrp_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    output o_IR_Fetch,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_Add16_Control
    );
    
    wire add_param = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire add_save = i_Cycle_Step[2] & i_Cycle_Count[0] & i_Active;
    assign o_Read16 = {1'b0, i_P & {4{add_param}}, 1'b0};
    assign o_Write16 = {2'b00, add_save, 3'b000};
    assign o_Add16_Control = {2{add_save}};
    assign o_IR_Fetch = {2{i_Cycle_Count[1] & i_Active}};
endmodule
