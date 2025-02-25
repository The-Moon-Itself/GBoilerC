`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 05:05:58 PM
// Design Name: 
// Module Name: X0
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  Microcode/
//      LDa16SP_Microcode.v
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module X0(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Y,
    input [7:0] i_Z,
    input [3:0] i_P,
    input [1:0] i_Q,
    input [3:0] i_Conditions,
    output o_Fetch,
    
    output [7:0] o_Write8,
    output [5:0] o_Read16,
    output [5:0] o_Write16,
    
    output o_Bus_In,
    output o_Bus_Out,
    output o_Address_Out,
    
    output [1:0] o_Increment16,
    output [1:0] o_Bus16_Byte_To_Bus
    );
    
    
    wire NOP_Active = i_Y[0] & i_Z[0] & i_Active;
    wire LDa16SP_Active = i_Y[0] & i_Z[1] & i_Active;
    
    wire LDrpd16_Active = i_Y[1] & i_Q[0] & i_Active;
    
    
    wire LDa16SP_IR_Fetch;
    wire [7:0] LDa16SP_Write8;
    wire [5:0] LDa16SP_Read16;
    wire [5:0] LDa16SP_Write16;
    wire LDa16SP_Bus_In;
    wire LDa16SP_Bus_Out;
    wire LDa16SP_Address_Out;
    wire [1:0] LDa16SP_Increment16;
    wire [1:0] LDa16SP_Bus16_Byte_To_Bus;
    LDa16SP_Microcode LDa16SP
    (.i_Active(LDa16SP_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .o_IR_Fetch(LDa16SP_IR_Fetch),
    .o_Write8(LDa16SP_Write8),
    .o_Read16(LDa16SP_Read16),
    .o_Write16(LDa16SP_Write16),
    .o_Bus_In(LDa16SP_Bus_In),
    .o_Bus_Out(LDa16SP_Bus_Out),
    .o_Address_Out(LDa16SP_Address_Out),
    .o_Increment16(LDa16SP_Increment16),
    .o_Bus16_Byte_To_Bus(LDa16SP_Bus16_Byte_To_Bus)
    );
    
    wire LDrpd16_IR_Fetch;
    wire [7:0] LDrpd16_Write8;
    wire [5:0] LDrpd16_Read16;
    wire [5:0] LDrpd16_Write16;
    wire LDrpd16_Bus_In;
    wire LDrpd16_Address_Out;
    wire [1:0] LDrpd16_Increment16;
    LDrpd16_Microcode LDrpd16
    (.i_Active(LDrpd16_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .o_IR_Fetch(LDrpd16_IR_Fetch),
    .o_Write8(LDrpd16_Write8),
    .o_Read16(LDrpd16_Read16),
    .o_Write16(LDrpd16_Write16),
    .o_Bus_In(LDrpd16_Bus_In),
    .o_Address_Out(LDrpd16_Address_Out),
    .o_Increment16(LDrpd16_Increment16)
    );
    
    
    assign o_Fetch = NOP_Active | LDa16SP_IR_Fetch | LDrpd16_IR_Fetch;
    assign o_Write8 = LDa16SP_Write8 | LDrpd16_Write8;
    assign o_Read16 = LDa16SP_Read16 | LDrpd16_Read16;
    assign o_Write16 = LDa16SP_Write16 | LDrpd16_Write16;
    assign o_Bus_In = LDa16SP_Bus_In | LDrpd16_Bus_In;
    assign o_Bus_Out = LDa16SP_Bus_Out;
    assign o_Address_Out = LDa16SP_Address_Out | LDrpd16_Address_Out;
    assign o_Increment16 = LDa16SP_Increment16 | LDrpd16_Increment16;
    assign o_Bus16_Byte_To_Bus = LDa16SP_Bus16_Byte_To_Bus;
endmodule
