`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 01:17:39 PM
// Design Name: 
// Module Name: GBC_TestBench
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


module GBC_TestBench(

    );
    
    reg i_Clk = 0;
    reg i_Enable = 0;
    reg i_nRst= 0;
    
    wire CART_Clk;
    wire CART_nRst;
    wire CART_nWrite;
    wire CART_nRead;
    //Chip Select
    //0: ROM
    //1: SRAM
    wire CART_Chip_Select;
    wire [15:0] CART_Address;
    wire [7:0] CART_Bus;
    CartMBC0 #(.ROMFILE("tetris.txt")) Tetris
    (.i_Clk(CART_Clk),
    .i_nRst(CART_nRst),
    .i_nWrite(CART_nWrite),
    .i_nRead(CART_nRead),
    .i_Chip_Select(CART_Chip_Select),
    .i_Address(CART_Address),
    .io_Data(CART_Bus)
    );
    
    GBC uut(
    .i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    
    //CART
    .o_CART_Clk(CART_Clk),
    .o_CART_nRst(CART_nRst),
    .o_CART_nWrite(CART_nWrite),
    .o_CART_nRead(CART_nRead),
    .o_CART_Chip_Select(CART_Chip_Select),
    .o_CART_Address(CART_Address),
    .io_CART_Bus(CART_Bus),
    
    //WRAM
    .i_WRAM_bus(8'h00)
    );
    
    initial begin
        i_Enable = 1'b1;
        i_nRst = 1'b1;
    end
    
    always #5 i_Clk <= ~i_Clk;
    
endmodule
