`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 11:37:26 PM
// Design Name: 
// Module Name: Main_ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Adder8.v
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Main_ALU(
    input [7:0] i_A, //The Accumulator
    input [7:0] i_B, //The Second Parameter
    input [2:0] i_Opcode, //Specifically bits [5:3] of the full 8bit opcode
    input [3:0] i_F, //Old flags (bits 7:4)
    output [7:0] o_A, //Result
    output [3:0] o_F //New flags (bits 7:4)
    );
    
    //FLAGS:
    // | 7 6 5 4 3 2 1 0 |
    // | Z N H C - - - - |
    // Z: Zero Flag, 1 if result is zero.
    // N: Subtraction Flag, set if the operation is a subtraction
    // H: Half-Carry Flag, set if the sum of the lower two nybbles is greater than 0xF in an addition, or if their difference is less than 0x0 in a subtraction.
    // C: Carry Flag, set if an additon is greater than 0xFF or a subtraction is less than 0x00
    // The lower nybble of the flags register is unused.
    
    // Operations:
    // 0: ADD, adds the two inputs.
    // 1: ADC, adds the two inputs and add the carry flag.
    // 2: SUB, subtracts the two inputs.
    // 3: SBC, subtracts the two inputs and subtracts the carry flag.
    // 4: AND, Bitwise and the two inputs, H and N are reset, H is set
    // 5: XOR, Bitwise XOR the two inputs, H, N, C are reset
    // 6: OR,  Bitwise OR the two inputs, H, N, C are reset
    // 7: CP,  Compare, effectively just SUB, but the output is set to A. 
    
    //Operations 4:7 results
    
    wire [7:0] result_and = i_A & i_B;
    wire [7:0] result_xor = i_A ^ i_B;
    wire [7:0] result_or = i_A | i_B;
    
    wire [7:0] result_logic = ({8{(i_Opcode[1:0] == 2'b00)}} & result_and) |
                               ({8{(i_Opcode[1:0] == 2'b01)}} & result_xor) |
                               ({8{(i_Opcode[1:0] == 2'b10)}} & result_or) |
                               ({8{(i_Opcode[1:0] == 2'b11)}} & i_A);
    
    //Carry in is inverted for a subtraction, but inverted again if C is set and the operation is ADC or SBC.
    wire invert_carry = ((i_Opcode[0] & i_F[0]) & ~i_Opcode[2]) ^ i_Opcode[1];
    wire [7:0] result_arithmetic;
    wire [1:0] adder_flags; //0: Carry, 1: Half Carry
    Adder8 adder
    (.i_A(i_A),
    .i_B(i_B ^ {8{i_Opcode[1]}}), //Invert for subtraction
    .i_Carry(invert_carry),
    .o_Sum(result_arithmetic),
    .o_Carry(adder_flags[0]),
    .o_HalfCarry(adder_flags[1])
    );
    
    //ALU result. We're making a wire here instead of just assigning the output so we can use it to find the Z flag later.
    wire [7:0] result = i_Opcode[2] ? result_logic : result_arithmetic;
    
    //Calculating flags
    wire bitwise_op = i_Opcode[2] & ~(i_Opcode[1] & i_Opcode[0]);
    wire N_flag = i_Opcode[2] ? i_Opcode[1:0] == 2'b11 : i_Opcode[1];
    //Need to invert these carry flags on a subtraction
    wire H_flag = (~bitwise_op & (N_flag ^ adder_flags[1])) | (i_Opcode == 3'b100);
    wire C_flag = (~bitwise_op & (N_flag ^ adder_flags[0]));
    
    assign o_A = result;
    assign o_F = {result == 0, N_flag, H_flag, C_flag};
    
endmodule