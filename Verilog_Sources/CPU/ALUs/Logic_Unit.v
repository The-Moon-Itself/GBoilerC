`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 06:59:25 PM
// Design Name: 
// Module Name: Logic_Unit
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


module Logic_Unit(
    input [7:0] i_A, //The parameter
    input [3:0] i_F, //Old flags
    input [4:0] i_Opcode, //[7:3] of the opcode
    input i_Disable_Z, //Used by non CB-Prefixed opcodes. A holdover from the Z80, which did this for compatibility with the Intel 8080
    output [7:0] o_A, //Result
    output [3:0] o_F //New Flags
    );
    
    //Operations:
    //  bit 4 = 0:
    //      bit 3 = 0
    //          bit 2:0 = 0: Rotate Left (RLC)
    //          bit 2:0 = 1: Rotate Right (RRC)
    //          bit 2:0 = 2: Rotate Left w/ Carry (RL)
    //          bit 2:0 = 3: Rotate Right w/ Carry (RR)
    //          bit 2:0 = 4: Shift Left Arithmetic (SLA)
    //          bit 2:0 = 5: Shift Right Arithermetic (SRA)
    //          bit 2:0 = 6: Swap nybbles (SWAP)
    //          bit 2:0 = 7: Shift Right Logical (SRL)
    //
    //      bit 3 = 1: Check bit opcode[2:0] of parameter
    //
    //  bit 4 = 1: Set bit opcode[2:0] of parameter to opcode[3]
    
    
    wire right_shift = i_Opcode[0]; //We are performing a right shift/rot
    
    wire [7:0] pre_shift = right_shift ? i_A : 
                            {i_A[0], //Absolutely disgusting byte reversal
                             i_A[1],
                             i_A[2],
                             i_A[3],
                             i_A[4],
                             i_A[5],
                             i_A[6],
                             i_A[7]}; 
    wire shift_carry = pre_shift[0];
    wire shift_in = ((i_Opcode[2:1] == 0) & shift_carry) | //Rotate
                    ((i_Opcode[2:1] == 1) & i_F[0]) | //Rotate w/ Carry
                    ((i_Opcode[2:1] == 2) & (right_shift & pre_shift[7])); //Arithmetic
                    //We shift in 0 on logical shift, which is i_Opcode[2:1] == 3.
                    //Due to how OR gates work, this behaviour is implicit.
    wire [7:0] shift_right = {shift_in, pre_shift[7:1]};
    wire [7:0] shift_result = right_shift ? shift_right : 
                            {shift_right[0], //Absolutely disgusting byte reversal
                             shift_right[1],
                             shift_right[2],
                             shift_right[3],
                             shift_right[4],
                             shift_right[5],
                             shift_right[6],
                             shift_right[7]};
    wire [3:0] shift_flags = {(shift_result == 0) & ~i_Disable_Z, 2'b00, shift_carry};
    
    wire [7:0] swap_result = {i_A[3:0], i_A[7:4]};
    wire [3:0] swap_flags = {swap_result == 0, 3'b000};
    
    wire [3:0] bit_check_flags = {~i_A[i_Opcode[2:0]], 2'b01, i_F[0]};
    
    wire [7:0] bit_mask = ~(8'h01 << i_Opcode[2:0]);
    wire [7:0] bit_set_reset_result = {8{i_Opcode[3]}} ^ (bit_mask & ({8{i_Opcode[3]}} ^ i_A));
    
    assign o_A = i_Opcode[4] ? bit_set_reset_result : (
                 i_Opcode[3] ? i_A : (
                 i_Opcode[2:0] == 3'b110 ? swap_result :
                 shift_result));
    assign o_F = i_Opcode[4] ? i_F : (
                 i_Opcode[3] ? bit_check_flags : (
                 i_Opcode[2:0] == 3'b110 ? swap_flags :
                 shift_flags));
    
endmodule
