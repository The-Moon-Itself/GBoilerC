`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:42:16 PM
// Design Name: 
// Module Name: LDrp3pA_Microcode
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


module LDrp3pA_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [3:0] i_P,
    input [1:0] i_Q,
    output o_IR_Fetch,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output o_Move_Reg,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16
    );
    
    wire send_address = i_Cycle_Step[0] & i_Cycle_Count[0] & i_Active;
    wire increment_hl = i_Cycle_Step[1] & i_Cycle_Count[0] & i_Active;
    wire bus_access = i_Cycle_Step[0] & i_Cycle_Count[1] & i_Active;
    wire readA = bus_access & i_Q[0];
    wire writeA = bus_access & i_Q[1];
    
    assign o_IR_Fetch = i_Cycle_Count[1] & i_Active;
    assign o_Read16 = {2'b00, |i_P[3:2], i_P[1:0], 1'b0} & {6{send_address}};
    assign o_Write16 = {2'b00, |i_P[3:2] & increment_hl, 3'b000};
    assign o_Increment16 = {i_P[3], |i_P[3:2]} & {2{increment_hl}};
    assign o_Address_Out = send_address;
    
    assign o_ReadALU8 ={1'b0, readA};
    assign o_WriteALU8 = {1'b0, writeA};
    assign o_Move_Reg = readA;
    assign o_Bus_In = writeA;
    assign o_Bus_Out = readA;
endmodule
