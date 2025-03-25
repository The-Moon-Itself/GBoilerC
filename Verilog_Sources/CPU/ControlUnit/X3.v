`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 11:34:24 PM
// Design Name: 
// Module Name: X3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  Microcode/
//      RET_Microcode.v
//      CALL_Microcode.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module X3(
    input i_Active,
    input [3:0] i_Cycle_Step,
    input [7:0] i_Cycle_Count,
    input [7:0] i_Y,
    input [7:0] i_Z,
    input [3:0] i_P,
    input [1:0] i_Q,
    input [3:0] i_Conditions,
    output o_Fetch,
    
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
    output [1:0] o_Bus16_Byte_To_Bus,
    
    output o_EI
    );
    
    wire RETI = i_Z[1] & i_Y[3];
    wire RET_Always = i_Z[1] & i_Y[1];
    wire RET_Active = ((i_Z[0] & |i_P[1:0]) | RET_Always | RETI) & i_Active;
    
    wire CALL_Always = i_Z[5] & i_Y[1] & i_Active;
    wire CALL_Active = ((i_Z[4] & |i_Y[3:0]) | CALL_Always) & i_Active;
    
    wire RET_IR_Fetch;
    wire [7:0] RET_Write8;
    wire [5:0] RET_Read16;
    wire [5:0] RET_Write16;
    wire RET_Bus_In;
    wire RET_Address_Out;
    wire [1:0] RET_Increment16;
    wire RET_EI;
    RET_Microcode RET
    (.i_Active(RET_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y[3:0]),
    .i_Conditions(i_Conditions),
    .i_Always(RET_Always),
    .i_RETI(RETI),
    .o_IR_Fetch(RET_IR_Fetch),
    .o_Write8(RET_Write8),
    .o_Read16(RET_Read16),
    .o_Write16(RET_Write16),
    .o_Bus_In(RET_Bus_In),
    .o_Address_Out(RET_Address_Out),
    .o_Increment16(RET_Increment16),
    .o_EI(RET_EI)
    );
    
    wire CALL_IR_Fetch;
    wire [7:0] CALL_Write8;
    wire [5:0] CALL_Read16;
    wire [5:0] CALL_Write16;
    wire CALL_Bus_In;
    wire CALL_Bus_Out;
    wire CALL_Address_Out;
    wire [1:0] CALL_Increment16;
    wire [1:0] CALL_Bus16_Byte_To_Bus;
    CALL_Microcode CALL
    (.i_Active(CALL_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y[3:0]),
    .i_Conditions(i_Conditions),
    .i_Always(CALL_Always),
    .o_IR_Fetch(CALL_IR_Fetch),
    .o_Write8(CALL_Write8),
    .o_Read16(CALL_Read16),
    .o_Write16(CALL_Write16),
    .o_Bus_In(CALL_Bus_In),
    .o_Bus_Out(CALL_Bus_Out),
    .o_Address_Out(CALL_Address_Out),
    .o_Increment16(CALL_Increment16),
    .o_Bus16_Byte_To_Bus(CALL_Bus16_Byte_To_Bus)
    );
    
    assign o_Fetch = RET_IR_Fetch | CALL_IR_Fetch;
    
    assign o_Write8 = RET_Write8 | CALL_Write8;
    assign o_Read16 = RET_Read16 | CALL_Read16;
    assign o_Write16 = RET_Write16 | CALL_Write16;
    
    assign o_Bus_In = RET_Bus_In | CALL_Bus_In;
    assign o_Bus_Out = CALL_Bus_Out;
    assign o_Address_Out = RET_Address_Out | CALL_Address_Out;
    
    assign o_Increment16 = RET_Increment16 | CALL_Increment16;
    assign o_Bus16_Byte_To_Bus = CALL_Bus16_Byte_To_Bus;
    
    assign o_EI = RET_EI;
endmodule
