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
//      LDrpd16_Microcode.v
//      JRs8_Microcode.v
//      ADDHLrp_Microcode.v
//      LDRp3pA_Microcode.v
//      INCDECrpp_Microcode.v
//      LDryd8_Microcode.v
//      MiscALU_Microcode.v
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
    
    output [6:0] o_ALU_Control,
    output [1:0] o_Increment16,
    output [1:0] o_Add_r8_Control,
    output [1:0] o_Add16_Control,
    output [1:0] o_Bus16_Byte_To_Bus
    );
    
    
    wire NOP_Active = i_Z[0] & i_Y[0] & i_Active;
    wire LDa16SP_Active = i_Z[0] & i_Y[1] & i_Active;
    wire STOP_Active = i_Z[0] & i_Y[2] & i_Active;
    wire JRs8_Active = i_Z[0] & |i_Y[7:3] & i_Active;
    
    wire LDrpd16_Active = i_Z[1] & i_Q[0] & i_Active;
    wire ADDHLrp_Active = i_Z[1] & i_Q[1] & i_Active;
    
    wire LDrp3pA_Active = i_Z[2] & i_Active;
    
    wire INCDECrpp_Active = i_Z[3] & i_Active;
    
    wire INCDECry_Active = |i_Z[5:4] & i_Active;
    wire INCDECry_Decrement = i_Z[5] & i_Active;
    
    wire LDryd8_Active = i_Z[6] & i_Active;
    
    wire MiscALU_Active = i_Z[7] & i_Active;
    
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
    .i_P(i_P),
    .o_IR_Fetch(LDrpd16_IR_Fetch),
    .o_Write8(LDrpd16_Write8),
    .o_Read16(LDrpd16_Read16),
    .o_Write16(LDrpd16_Write16),
    .o_Bus_In(LDrpd16_Bus_In),
    .o_Address_Out(LDrpd16_Address_Out),
    .o_Increment16(LDrpd16_Increment16)
    );
    
    wire JRs8_IR_Fetch;
    wire [7:0] JRs8_Read8;
    wire [7:0] JRs8_Write8;
    wire [5:0] JRs8_Read16;
    wire [5:0] JRs8_Write16;
    wire JRs8_Bus_In;
    wire JRs8_Address_Out;
    wire [1:0] JRs8_Increment16;
    wire [1:0] JRs8_Add_r8_Control;
    JRs8_Microcode JRs8
    (.i_Active(JRs8_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y[7:4]),
    .i_Always(i_Y[3]),
    .i_Conditions(i_Conditions),
    .o_IR_Fetch(JRs8_IR_Fetch),
    .o_Read8(JRs8_Read8),
    .o_Write8(JRs8_Write8),
    .o_Read16(JRs8_Read16),
    .o_Write16(JRs8_Write16),
    .o_Bus_In(JRs8_Bus_In),
    .o_Address_Out(JRs8_Address_Out),
    .o_Increment16(JRs8_Increment16),
    .o_Add_r8_Control(JRs8_Add_r8_Control)
    );
    
    wire ADDHLrp_IR_Fetch;
    wire [5:0] ADDHLrp_Read16;
    wire [5:0] ADDHLrp_Write16;
    wire [1:0] ADDHLrp_Add16_Control;
    ADDHLrp_Microcode ADDHLrp
    (.i_Active(ADDHLrp_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P),
    .o_IR_Fetch(ADDHLrp_IR_Fetch),
    .o_Read16(ADDHLrp_Read16),
    .o_Write16(ADDHLrp_Write16),
    .o_Add16_Control(ADDHLrp_Add16_Control)
    );
    
    wire LDrp3pA_IR_Fetch;
    wire [5:0] LDrp3pA_Read16;
    wire [5:0] LDrp3pA_Write16;
    wire [1:0] LDrp3pA_ReadALU8;
    wire [1:0] LDrp3pA_WriteALU8;
    wire LDrp3pA_Move_Reg;
    wire LDrp3pA_Bus_In;
    wire LDrp3pA_Bus_Out;
    wire LDrp3pA_Address_Out;
    wire [1:0] LDrp3pA_Increment16;
    LDrp3pA_Microcode LDrp3pA
    (.i_Active(LDrp3pA_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P),
    .i_Q(i_Q),
    .o_IR_Fetch(LDrp3pA_IR_Fetch),
    .o_Read16(LDrp3pA_Read16),
    .o_Write16(LDrp3pA_Write16),
    .o_ReadALU8(LDrp3pA_ReadALU8),
    .o_WriteALU8(LDrp3pA_WriteALU8),
    .o_Move_Reg(LDrp3pA_Move_Reg),
    .o_Bus_In(LDrp3pA_Bus_In),
    .o_Bus_Out(LDrp3pA_Bus_Out),
    .o_Address_Out(LDrp3pA_Address_Out),
    .o_Increment16(LDrp3pA_Increment16)
    );
    
    wire INCDECrpp_IR_Fetch;
    wire [5:0] INCDECrpp_Read16;
    wire [5:0] INCDECrpp_Write16;
    wire [1:0] INCDECrpp_Increment16;
    INCDECrpp_Microcode INCDECrpp
    (.i_Active(INCDECrpp_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P),
    .i_Q(i_Q),
    .o_IR_Fetch(INCDECrpp_IR_Fetch),
    .o_Read16(INCDECrpp_Read16),
    .o_Write16(INCDECrpp_Write16),
    .o_Increment16(INCDECrpp_Increment16)
    );
    
    wire INCDECry_IR_Fetch;
    wire [7:0] INCDECry_Read8;
    wire [7:0] INCDECry_Write8;
    wire [5:0] INCDECry_Read16;
    wire [1:0] INCDECry_ReadALU8;
    wire [1:0] INCDECry_WriteALU8;
    wire INCDECry_Move_Reg;
    wire INCDECry_Bus_In;
    wire INCDECry_Bus_Out;
    wire INCDECry_Address_Out;
    wire [6:0] INCDECry_ALU_Control;
    INCDECry_Microcode INCDECry
    (.i_Active(INCDECry_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y),
    .i_Decrement(INCDECry_Decrement),
    .o_IR_Fetch(INCDECry_IR_Fetch),
    .o_Read8(INCDECry_Read8),
    .o_Write8(INCDECry_Write8),
    .o_Read16(INCDECry_Read16),
    .o_ReadALU8(INCDECry_ReadALU8),
    .o_WriteALU8(INCDECry_WriteALU8),
    .o_Move_Reg(INCDECry_Move_Reg),
    .o_Bus_In(INCDECry_Bus_In),
    .o_Bus_Out(INCDECry_Bus_Out),
    .o_Address_Out(INCDECry_Address_Out),
    .o_ALU_Control(INCDECry_ALU_Control)
    );
    
    wire LDryd8_IR_Fetch;
    wire [7:0] LDryd8_Read8;
    wire [7:0] LDryd8_Write8;
    wire [5:0] LDryd8_Read16;
    wire [5:0] LDryd8_Write16;
    wire [1:0] LDryd8_WriteALU8;
    wire LDryd8_Move_Reg;
    wire LDryd8_Bus_In;
    wire LDryd8_Bus_Out;
    wire LDryd8_Address_Out;
    wire [1:0] LDryd8_Increment16;
    LDryd8_Microcode LDryd8
    (.i_Active(LDryd8_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y),
    .o_IR_Fetch(LDryd8_IR_Fetch),
    .o_Read8(LDryd8_Read8),
    .o_Write8(LDryd8_Write8),
    .o_Read16(LDryd8_Read16),
    .o_Write16(LDryd8_Write16),
    .o_WriteALU8(LDryd8_WriteALU8),
    .o_Move_Reg(LDryd8_Move_Reg),
    .o_Bus_In(LDryd8_Bus_In),
    .o_Bus_Out(LDryd8_Bus_Out),
    .o_Address_Out(LDryd8_Address_Out),
    .o_Increment16(LDryd8_Increment16)
    );
    
    wire MiscALU_IR_Fetch;
    wire [1:0] MiscALU_ReadALU8;
    wire [1:0] MiscALU_WriteALU8;
    wire [6:0] MiscALU_ALU_Control;
    MiscALU_Microcode MiscALU
    (.i_Active(MiscALU_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Opcode6(|i_P[3:2]),
    .o_IR_Fetch(MiscALU_IR_Fetch),
    .o_ReadALU8(MiscALU_ReadALU8),
    .o_WriteALU8(MiscALU_WriteALU8),
    .o_ALU_Control(MiscALU_ALU_Control)
    );
    
    
    assign o_Fetch = NOP_Active | LDa16SP_IR_Fetch | LDrpd16_IR_Fetch | JRs8_IR_Fetch | ADDHLrp_IR_Fetch | LDrp3pA_IR_Fetch | INCDECrpp_IR_Fetch | INCDECry_IR_Fetch | LDryd8_IR_Fetch | MiscALU_IR_Fetch;
    assign o_Read8 = JRs8_Read8 | INCDECry_Read8 | LDryd8_Read8;
    assign o_Write8 = LDa16SP_Write8 | LDrpd16_Write8 | JRs8_Write8 | INCDECry_Write8 | LDryd8_Write8;
    assign o_Read16 = LDa16SP_Read16 | LDrpd16_Read16 | JRs8_Read16 | ADDHLrp_Read16 | LDrp3pA_Read16 | INCDECrpp_Read16 | INCDECry_Read16 | LDryd8_Read16;
    assign o_Write16 = LDa16SP_Write16 | LDrpd16_Write16 | JRs8_Write16 | ADDHLrp_Write16 | LDrp3pA_Write16 | INCDECrpp_Write16 | LDryd8_Write16;
    assign o_ReadALU8 = LDrp3pA_ReadALU8 | INCDECry_ReadALU8 | MiscALU_ReadALU8;
    assign o_WriteALU8 = LDrp3pA_WriteALU8 | INCDECry_WriteALU8 | LDryd8_WriteALU8 | MiscALU_WriteALU8;
    assign o_Move_Reg = LDrp3pA_Move_Reg | INCDECry_Move_Reg | LDryd8_Move_Reg;
    assign o_Bus_In = LDa16SP_Bus_In | LDrpd16_Bus_In | JRs8_Bus_In | LDrp3pA_Bus_In | INCDECry_Bus_In | LDryd8_Bus_In;
    assign o_Bus_Out = LDa16SP_Bus_Out | LDrp3pA_Bus_Out | INCDECry_Bus_Out | LDryd8_Bus_Out;
    assign o_Address_Out = LDa16SP_Address_Out | LDrpd16_Address_Out | JRs8_Address_Out | LDrp3pA_Address_Out | INCDECry_Address_Out | LDryd8_Address_Out;
    assign o_ALU_Control = INCDECry_ALU_Control | MiscALU_ALU_Control;
    assign o_Increment16 = LDa16SP_Increment16 | LDrpd16_Increment16 | JRs8_Increment16 | LDrp3pA_Increment16 | INCDECrpp_Increment16 | LDryd8_Increment16;
    assign o_Add_r8_Control = JRs8_Add_r8_Control;
    assign o_Add16_Control = ADDHLrp_Add16_Control;
    assign o_Bus16_Byte_To_Bus = LDa16SP_Bus16_Byte_To_Bus;
endmodule
