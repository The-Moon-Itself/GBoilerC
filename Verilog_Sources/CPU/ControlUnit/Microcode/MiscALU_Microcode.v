`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 12:37:00 AM
// Design Name: 
// Module Name: MiscALU_Microcode
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


module MiscALU_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input i_Opcode6,
    output o_IR_Fetch,
    output [1:0] o_ReadALU8,
    output [1:0] o_WriteALU8,
    output [6:0] o_ALU_Control
    );
    
    wire alu_step = i_Cycle_Step[2] & i_Active;
    
    assign o_IR_Fetch = i_Active;
    assign o_ReadALU8 = {1'b0, alu_step};
    assign o_WriteALU8 = o_ReadALU8;
    assign o_ALU_Control = {alu_step, i_Opcode6 & alu_step, {2{!i_Opcode6 & alu_step}}, 3'b000};
    
endmodule
