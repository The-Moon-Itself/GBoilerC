`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2025 02:21:25 PM
// Design Name: 
// Module Name: CART_Controller
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


module CART_Controller(
    
    input i_Clk,
    input i_nRst,
    
    input [15:0] i_Address,
    input i_Chip_Select,
    input i_CART_Access,
    input i_CART_Write,
    input [7:0] i_Data,
    output [7:0] o_Data,
    
    output o_Clk,
    output o_nWrite,
    output o_nRead,
    output o_Chip_Select,
    output [15:0] o_Address,
    inout [7:0] io_Data,
    output o_nRst
    );
    
    assign o_Clk = i_Clk;
    assign o_nRst = i_nRst;
    
    wire write = i_CART_Access & i_CART_Write;
    wire read = i_CART_Access & ~i_CART_Write;
    assign o_nWrite = ~write;
    assign o_nRead = ~read;
    
    assign o_Address = i_Address;
    assign o_Chip_Select = i_Chip_Select;
    
    wire [7:0] read_data;
    
    assign o_Data = {8{read}} & read_data;
    
    genvar i;
    generate
        for (i=0; i < 8; i = i + 1) begin
            IOBUF io_buf
            (.I(i_Data[i]),
            .O(read_data[i]),
            .IO(io_Data[i]),
            .T(write)
            );
        end
    endgenerate
    
endmodule
