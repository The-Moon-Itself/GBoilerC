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
//      LDca8A_Microcode.v
//      ADDSPs8_Microcode.v
//      POP_Microcode.v
//      LDPCSP_HL_Microcode.v
//      JP_a16_Microcode.v
//      LDa16A_Microcode.v
//      CALL_Microcode.v
//      PUSH_Microcode.v
//      ALU_d8_Microcode.v
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
    input [7:0] i_Opcode,
    input [7:0] i_Y,
    input [7:0] i_Z,
    input [3:0] i_P,
    input [1:0] i_Q,
    input [3:0] i_Conditions,
    output o_Fetch,
    output o_Reset_Cycle,
    
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
    output [1:0] o_Bus16_Byte_To_Bus,
    output o_Bus8_To_Bus16,
    
    output [7:0] o_Bus_Value,
    output o_Bus_Value_Active,
    
    output o_EI,
    output o_DI,
    output o_CB_Prefix
    );
    
    wire RETI = i_Z[1] & i_Y[3];
    wire RET_Always = (i_Z[1] & i_Y[1]) | RETI;
    wire RET_Active = ((i_Z[0] & |i_P[1:0]) | RET_Always | RETI) & i_Active;
    
    wire LDca8A_C = i_Z[2] & |i_P[3:2] & i_Q[0] & i_Active;
    wire LDca8A_Active = ((i_Z[0] & |i_P[3:2] & i_Q[0]) | LDca8A_C) & i_Active;
    
    wire ADDSPs8_Active = i_Z[0] & i_Q[1] & |i_P[3:2] & i_Active;
    
    wire POP_Active = i_Z[1] & i_Q[0] & i_Active;
    
    wire LDPCSP_HL_Active = i_Z[1] & |i_P[3:2] & i_Q[1] & i_Active;
    
    wire JP_a16_Always = i_Z[3] & i_Y[0];
    wire JP_a16_Active = ((i_Z[2] & |i_P[1:0]) | JP_a16_Always) & i_Active;
    
    wire LDa16A_Active = i_Z[2] & |i_P[3:2] & i_Q[1] & i_Active;
    
    wire CB_Active = i_Z[3] & i_Y[1] & i_Active;
    
    wire EI_Active = i_Z[3] & i_Y[7] & i_Active;
    wire DI_Active = i_Z[3] & i_Y[6] & i_Active;
    
    wire CALL_Always = i_Z[5] & i_Y[1] & i_Active;
    wire CALL_Active = ((i_Z[4] & |i_Y[3:0]) | CALL_Always) & i_Active;
    
    wire PUSH_Active = i_Z[5] & i_Q[0] & i_Active;
    
    wire ALU_d8_Active = i_Z[6] & i_Active;
    
    wire RST_Active = i_Z[7] & i_Active;
    
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
    
    wire LDca8A_IR_Fetch;
    wire [7:0] LDca8A_Read8;
    wire [7:0] LDca8A_Write8;
    wire [5:0] LDca8A_Read16;
    wire [5:0] LDca8A_Write16;
    wire [1:0] LDca8A_ReadALU8;
    wire [1:0] LDca8A_WriteALU8;
    wire LDca8A_Move_Reg;
    wire LDca8A_Bus_In;
    wire LDca8A_Bus_Out;
    wire LDca8A_Address_Out;
    wire [1:0] LDca8A_Increment16;
    wire LDca8A_Bus8_To_Bus16;
    LDca8A_Microcode LDca8A
    (.i_Active(LDca8A_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P[3:2]),
    .i_C(LDca8A_C),
    .o_IR_Fetch(LDca8A_IR_Fetch),
    .o_Read8(LDca8A_Read8),
    .o_Write8(LDca8A_Write8),
    .o_Read16(LDca8A_Read16),
    .o_Write16(LDca8A_Write16),
    .o_ReadALU8(LDca8A_ReadALU8),
    .o_WriteALU8(LDca8A_WriteALU8),
    .o_Move_Reg(LDca8A_Move_Reg),
    .o_Bus_In(LDca8A_Bus_In),
    .o_Bus_Out(LDca8A_Bus_Out),
    .o_Address_Out(LDca8A_Address_Out),
    .o_Increment16(LDca8A_Increment16),
    .o_Bus8_To_Bus16(LDca8A_Bus8_To_Bus16)
    );
    
    wire ADDSPs8_IR_Fetch;
    wire [7:0] ADDSPs8_Read8;
    wire [7:0] ADDSPs8_Write8;
    wire [5:0] ADDSPs8_Read16;
    wire [5:0] ADDSPs8_Write16;
    wire ADDSPs8_Bus_In;
    wire ADDSPs8_Address_Out;
    wire [1:0] ADDSPs8_Add_Increment16;
    wire [1:0] ADDSPs8_Add_r8_Control;
    ADDSPs8_Microcode ADDSPs8
    (.i_Active(ADDSPs8_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P[3:2]),
    .o_IR_Fetch(ADDSPs8_IR_Fetch),
    .o_Read8(ADDSPs8_Read8),
    .o_Write8(ADDSPs8_Write8),
    .o_Read16(ADDSPs8_Read16),
    .o_Write16(ADDSPs8_Write16),
    .o_Bus_In(ADDSPs8_Bus_In),
    .o_Address_Out(ADDSPs8_Address_Out),
    .o_Increment16(ADDSPs8_Add_Increment16),
    .o_Add_r8_Control(ADDSPs8_Add_r8_Control)
    );
    
    wire POP_IR_Fetch;
    wire [7:0] POP_Write8;
    wire [5:0] POP_Read16;
    wire [5:0] POP_Write16;
    wire [1:0] POP_WriteALU8;
    wire POP_Bus_In;
    wire POP_Address_Out;
    wire [1:0] POP_Increment16;
    POP_Microcode POP
    (.i_Active(POP_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P),
    .o_IR_Fetch(POP_IR_Fetch),
    .o_Write8(POP_Write8),
    .o_Read16(POP_Read16),
    .o_Write16(POP_Write16),
    .o_WriteALU8(POP_WriteALU8),
    .o_Bus_In(POP_Bus_In),
    .o_Address_Out(POP_Address_Out),
    .o_Increment16(POP_Increment16)
    );
    
    wire LDPCSP_HL_IR_Fetch;
    wire LDPCSP_HL_Reset_Cycle;
    wire [5:0] LDPCSP_HL_Read16;
    wire [5:0] LDPCSP_HL_Write16;
    wire LDPCSP_HL_Address_Out;
    wire [1:0] LDPCSP_HL_Increment16;
    LDPCSP_HL_Microcode LDPCSP_HL
    (.i_Active(LDPCSP_HL_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P[3:2]),
    .o_IR_Fetch(LDPCSP_HL_IR_Fetch),
    .o_Reset_Cycle(LDPCSP_HL_Reset_Cycle),
    .o_Read16(LDPCSP_HL_Read16),
    .o_Write16(LDPCSP_HL_Write16),
    .o_Address_Out(LDPCSP_HL_Address_Out),
    .o_Increment16(LDPCSP_HL_Increment16)
    );
    
    wire JP_a16_IR_Fetch;
    wire [7:0] JP_a16_Write8;
    wire [5:0] JP_a16_Read16;
    wire [5:0] JP_a16_Write16;
    wire JP_a16_Bus_In;
    wire JP_a16_Address_Out;
    wire [1:0] JP_a16_Increment16;
    JP_a16_Microcode JP_a16
    (.i_Active(JP_a16_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Y(i_Y[3:0]),
    .i_Conditions(i_Conditions),
    .i_Always(JP_a16_Always),
    .o_IR_Fetch(JP_a16_IR_Fetch),
    .o_Write8(JP_a16_Write8),
    .o_Read16(JP_a16_Read16),
    .o_Write16(JP_a16_Write16),
    .o_Bus_In(JP_a16_Bus_In),
    .o_Address_Out(JP_a16_Address_Out),
    .o_Increment16(JP_a16_Increment16)
    );
    
    wire LDa16A_IR_Fetch;
    wire [7:0] LDa16A_Write8;
    wire [5:0] LDa16A_Read16;
    wire [5:0] LDa16A_Write16;
    wire [1:0] LDa16A_ReadALU8;
    wire [1:0] LDa16A_WriteALU8;
    wire LDa16A_Move_Reg;
    wire LDa16A_Bus_In;
    wire LDa16A_Bus_Out;
    wire LDa16A_Address_Out;
    wire [1:0] LDa16A_Increment16;
    LDa16A_Microcode LDa16A
    (.i_Active(LDa16A_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P[3:2]),
    .o_IR_Fetch(LDa16A_IR_Fetch),
    .o_Write8(LDa16A_Write8),
    .o_Read16(LDa16A_Read16),
    .o_Write16(LDa16A_Write16),
    .o_ReadALU8(LDa16A_ReadALU8),
    .o_WriteALU8(LDa16A_WriteALU8),
    .o_Move_Reg(LDa16A_Move_Reg),
    .o_Bus_In(LDa16A_Bus_In),
    .o_Bus_Out(LDa16A_Bus_Out),
    .o_Address_Out(LDa16A_Address_Out),
    .o_Increment16(LDa16A_Increment16)
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
    
    wire PUSH_IR_Fetch;
    wire [7:0] PUSH_Read8;
    wire [5:0] PUSH_Read16;
    wire [5:0] PUSH_Write16;
    wire [1:0] PUSH_ReadALU8;
    wire PUSH_Move_Reg;
    wire PUSH_Bus_Out;
    wire PUSH_Address_Out;
    wire [1:0] PUSH_Increment16;
    PUSH_Microcode PUSH
    (.i_Active(PUSH_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_P(i_P),
    .o_IR_Fetch(PUSH_IR_Fetch),
    .o_Read8(PUSH_Read8),
    .o_Read16(PUSH_Read16),
    .o_Write16(PUSH_Write16),
    .o_ReadALU8(PUSH_ReadALU8),
    .o_Move_Reg(PUSH_Move_Reg),
    .o_Bus_Out(PUSH_Bus_Out),
    .o_Address_Out(PUSH_Address_Out),
    .o_Increment16(PUSH_Increment16)
    );
    
    wire ALU_d8_IR_Fetch;
    wire [7:0] ALU_d8_Read8;
    wire [7:0] ALU_d8_Write8;
    wire [5:0] ALU_d8_Read16;
    wire [5:0] ALU_d8_Write16;
    wire [1:0] ALU_d8_WriteALU8;
    wire ALU_d8_Bus_In;
    wire ALU_d8_Address_Out;
    wire [6:0] ALU_d8_ALU_Control;
    wire [1:0] ALU_d8_Increment16;
    ALU_d8_Microcode ALU_d8
    (.i_Active(ALU_d8_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .o_IR_Fetch(ALU_d8_IR_Fetch),
    .o_Read8(ALU_d8_Read8),
    .o_Write8(ALU_d8_Write8),
    .o_Read16(ALU_d8_Read16),
    .o_Write16(ALU_d8_Write16),
    .o_WriteALU8(ALU_d8_WriteALU8),
    .o_Bus_In(ALU_d8_Bus_In),
    .o_Address_Out(ALU_d8_Address_Out),
    .o_ALU_Control(ALU_d8_ALU_Control),
    .o_Increment16(ALU_d8_Increment16)
    );
    
    wire RST_Reset_Cycle;
    wire [7:0] RST_Write8;
    wire [5:0] RST_Read16;
    wire [5:0] RST_Write16;
    wire RST_Bus_Out;
    wire RST_Address_Out;
    wire [1:0] RST_Increment16;
    wire [1:0] RST_Bus16_Byte_To_Bus;
    wire [7:0] RST_Bus_Value;
    wire RST_Bus_Value_Active;
    RST_Microcode RST
    (.i_Active(RST_Active),
    .i_Cycle_Step(i_Cycle_Step),
    .i_Cycle_Count(i_Cycle_Count),
    .i_Opcode(i_Opcode[5:3]),
    .o_Reset_Cycle(RST_Reset_Cycle),
    .o_Write8(RST_Write8),
    .o_Read16(RST_Read16),
    .o_Write16(RST_Write16),
    .o_Bus_Out(RST_Bus_Out),
    .o_Address_Out(RST_Address_Out),
    .o_Increment16(RST_Increment16),
    .o_Bus16_Byte_To_Bus(RST_Bus16_Byte_To_Bus),
    .o_Bus_Value(RST_Bus_Value),
    .o_Bus_Value_Active(RST_Bus_Value_Active)
    );
    
    assign o_Fetch = RET_IR_Fetch | CALL_IR_Fetch | LDca8A_IR_Fetch | ADDSPs8_IR_Fetch | POP_IR_Fetch | LDPCSP_HL_IR_Fetch | JP_a16_IR_Fetch | LDa16A_IR_Fetch | CB_Active | EI_Active | DI_Active | PUSH_IR_Fetch | ALU_d8_IR_Fetch;
    assign o_Reset_Cycle = LDPCSP_HL_Reset_Cycle | RST_Reset_Cycle;
    
    assign o_Read8 = LDca8A_Read8 | ADDSPs8_Read8 | PUSH_Read8 | ALU_d8_Read8;
    assign o_Write8 = RET_Write8 | CALL_Write8 | LDca8A_Write8 | ADDSPs8_Write8 | POP_Write8 | JP_a16_Write8 | LDa16A_Write8 | ALU_d8_Write8 | RST_Write8;
    assign o_Read16 = RET_Read16 | CALL_Read16 | LDca8A_Read16 | ADDSPs8_Read16 | POP_Read16 | LDPCSP_HL_Read16 | JP_a16_Read16 | LDa16A_Read16 | PUSH_Read16 | ALU_d8_Read16 | RST_Read16;
    assign o_Write16 = RET_Write16 | CALL_Write16 | LDca8A_Write16 | ADDSPs8_Write16 | POP_Write16 | LDPCSP_HL_Write16 | JP_a16_Write16 | LDa16A_Write16 | PUSH_Write16 | ALU_d8_Write16 | RST_Write16;
    assign o_ReadALU8 = LDca8A_ReadALU8 | LDa16A_ReadALU8 | PUSH_ReadALU8;
    assign o_WriteALU8 = LDca8A_WriteALU8 | POP_WriteALU8 | LDa16A_WriteALU8 | ALU_d8_WriteALU8;
    assign o_Move_Reg = LDca8A_Move_Reg | LDa16A_Move_Reg | PUSH_Move_Reg;
    
    assign o_Bus_In = RET_Bus_In | CALL_Bus_In | LDca8A_Bus_In | ADDSPs8_Bus_In | POP_Bus_In | JP_a16_Bus_In | LDa16A_Bus_In | ALU_d8_Bus_In;
    assign o_Bus_Out = CALL_Bus_Out | LDca8A_Bus_Out | LDa16A_Bus_Out | PUSH_Bus_Out | RST_Bus_Out;
    assign o_Address_Out = RET_Address_Out | CALL_Address_Out | LDca8A_Address_Out | ADDSPs8_Address_Out | POP_Address_Out | LDPCSP_HL_Address_Out | JP_a16_Address_Out | LDa16A_Address_Out | PUSH_Address_Out | ALU_d8_Address_Out | RST_Address_Out;
    
    assign o_ALU_Control = ALU_d8_ALU_Control;
    assign o_Increment16 = RET_Increment16 | CALL_Increment16 | LDca8A_Increment16 | ADDSPs8_Add_Increment16 | POP_Increment16 | LDPCSP_HL_Increment16 | JP_a16_Increment16 | LDa16A_Increment16 | PUSH_Increment16 | ALU_d8_Increment16 | RST_Increment16;
    assign o_Add_r8_Control = ADDSPs8_Add_r8_Control;
    assign o_Bus16_Byte_To_Bus = CALL_Bus16_Byte_To_Bus | RST_Bus16_Byte_To_Bus;
    assign o_Bus8_To_Bus16 = LDca8A_Bus8_To_Bus16;
    
    assign o_Bus_Value = RST_Bus_Value;
    assign o_Bus_Value_Active = RST_Bus_Value_Active;
    
    assign o_EI = RET_EI | (EI_Active & i_Cycle_Step[3]);
    assign o_DI = (DI_Active & i_Cycle_Step[3]);
    assign o_CB_Prefix = CB_Active & i_Cycle_Step[3];
endmodule
