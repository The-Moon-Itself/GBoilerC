`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2025 12:40:25 PM
// Design Name: 
// Module Name: CartMBC0Top
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


module Top(

    );
    
    wire cart_Clk;
    wire cart_nWrite;
    wire cart_nRst;
    wire [15:0] cart_Address;
    wire cart_Chip_Select;
    wire [7:0] cart_Data;
    wire cart_nRead;
    CartMBC0 #(.ROMFILE("default.list")) cart(
    .i_Clk(cart_Clk),
    .i_nWrite(cart_nWrite),
    .i_nRst(cart_nRst),
    .i_Address(cart_Address),
    .i_Chip_Select(cart_Chip_Select),
    .io_Data(cart_Data),
    .i_nRead(cart_nRea)
    );
    
    
endmodule