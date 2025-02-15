`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2025 12:07:55 AM
// Design Name: 
// Module Name: DAA
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

//Decimal Adjust Accumulator
module DAA(
    input [7:0] i_A,
    input [3:0] i_F,
    output [7:0] o_A,
    output [3:0] o_F
    );
    
    // This thing REALLY confused me when I first took a look at it
    // We look at each nybble individually, as they're considered decimal digits here,
    // The main principle we use is that 16 is 6 more than 10, that means that when we add two nybbles and
    // except an overflow, we're actually 6 less than the decimal digit we want.
    // or we subtract two nybbles and we expect a negative result, we're 6 higher than the decimal digit we want.
    // We can tell if the operation was a subtraction from the N flag, which will be 1 for subtract, and 0 for add
    // 
    // Telling if we need to offset 6 after a subtraction is very straight forward. If the nybble's carry flag is set,
    // which is H for the low nybble and C for the high nybble, the that nybble has borrowed and needs the offset.
    //
    // Addition is a bit more complex, for both nybbles, we can tell if it needs an offset if either its value is
    // greater than 9, or if its respective carry flag is set. However, the high nybble also has a special case.
    // If the high nybble is equal to 9 and the lower nybble needs to be offset, then that would make the high
    // nybble be equal to A, so we need to offset it too. However, note that anything greater than 9 already means we need
    // to offset the nybble, so we if we treat this condition as greater than 8 and lower nybble is offset, then nothing changes,
    // this makes the logic slightly easier.
    //
    // For our new flags, Z is set if our new value is zero, N remains unchanged, H is reset, and C is more complicated
    // C is used to signify that we've overflowed over 99 or underflowed less than 00, similar to how it's set for hexidecimal operations.
    // We can actually just use our logic for detecting if the high nybble needs an offset for this purpose, as it'll be on during these times as well.
    
    //FLAGS
    // | 7 6 5 4 | 3 2 1 0 |
    // | Z N H C | - - - - |
    
    wire low_greater_9 = i_A[3] & (i_A[1] | i_A[2]);
    wire high_greater_9 = i_A[7] & (i_A[5] | i_A[6]);
    wire high_greater_8 = i_A[7] & (i_A[4] | i_A[5] | i_A[6]);
    wire low_offset = i_F[1] | (~i_F[2] & low_greater_9);
    wire high_offset = i_F[0] | (~i_F[2] & (high_greater_9 | (high_greater_8 & low_offset))); 
    
    wire [7:0] offset = {1'b0, {2{high_offset}}, 1'b0,
                         1'b0, {2{low_offset}}, 1'b0 } ^ {8{i_F[2]}};
    wire [7:0] result = i_A + offset + i_F[2];
    assign o_A = result;
    assign o_F = {result == 0, i_F[2], 0, high_offset};
endmodule
