`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2025 02:43:37 AM
// Design Name: 
// Module Name: LDa16SP_Microcode
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


module LDa16SP_Microcode(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    output o_IR_Fetch,
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    output [1:0] o_Increment16,
    output [1:0] o_Bus16_Byte_To_Bus
    );
    
    wire set_address = i_Active & i_Cycle_Step[1];
    wire address_immediate = i_Cycle_Count[0] | i_Cycle_Count[1];
    wire address_store = i_Cycle_Count[2] | i_Cycle_Count[3];
    wire read_memory = i_Active & i_Cycle_Step[0] & (i_Cycle_Count[1] | i_Cycle_Count[2]);
    wire write_memory = i_Active & i_Cycle_Step[0] & (i_Cycle_Count[3] | i_Cycle_Count[4]);
    assign o_Write8 = {8{read_memory}} & {6'b000000, i_Cycle_Count[2], i_Cycle_Count[1]}; //Little Endian
    assign o_Read16 = {set_address, write_memory, 3'b000, set_address} & {address_immediate, 4'h8, address_store};
    assign o_Write16 = o_Read16 & 6'b100001;
    assign o_Increment16 = {1'b0, set_address & (address_immediate | address_store)};
    assign o_Address_Out = o_Increment16[0];
    assign o_Bus_In = read_memory;
    assign o_Bus_Out = write_memory;
    assign o_Bus16_Byte_To_Bus = {2{write_memory}} & {i_Cycle_Count[4], i_Cycle_Count[3]};
    assign o_IR_Fetch = i_Active & i_Cycle_Count[4];
endmodule
