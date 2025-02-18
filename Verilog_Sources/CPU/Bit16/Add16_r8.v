`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2025 12:07:37 AM
// Design Name: 
// Module Name: Add16_r8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  ../
//      ALUs/
//          Adder8.v
//          Incrementer_8Bit.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Add16_r8(
    input [15:0] i_In16,
    input [7:0] i_r8,
    output [15:0] o_Out,
    output [3:0] o_Flags
    );
    
    wire [7:0] low_byte;
    wire H;
    wire C;
    Adder8 adder
    (.i_A(i_In16[7:0]),
    .i_B(i_r8),
    .i_Carry(1'b0),
    .o_Sum(low_byte),
    .o_Carry(C),
    .o_HalfCarry(H)
    );
    
    wire [7:0] high_byte;
    Incrementer_8Bit increment
    (.i_A(i_In16[15:8]),
    .i_F(4'b0000),
    .i_Active(C ^ i_r8[7]),
    .i_Decrement(i_r8[7]),
    .o_A(high_byte),
    .o_F()
    );
    
    assign o_Out = {high_byte, low_byte};
    assign o_Flags = {2'b00, H, C};
    
endmodule
