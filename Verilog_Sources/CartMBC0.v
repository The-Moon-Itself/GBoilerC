`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/03/2025 12:40:25 PM
// Design Name: 
// Module Name: CartMBC0
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


module CartMBC0 #(ROMFILE = "default.list")(
    input i_Clk,
    input i_nWrite,
    input i_nRst,
    input [15:0] i_Address,
    input i_Chip_Select,
    inout [7:0] io_Data,
    input i_nRead
    );
    
    reg[7:0] ROM[0:14'h7fff];
    reg[7:0] current_val;
    
    initial begin
        $readmemh(ROMFILE, ROM);
        current_val = ROM[0];
    end
    
    wire[7:0] data_in;
    genvar i;
    generate
        for (i=0; i < 8; i = i + 1) begin
            IOBUF io_buf
            (.I(current_val[i]),
            .O(data_in[i]),
            .IO(io_Data[i]),
            .T(~i_nRead)
            );
        end
    endgenerate
    
    always @(posedge i_Clk, negedge i_nRst) begin
        if (~i_nRst) begin
            current_val <= ROM[0];
        end
        else begin
            current_val <= ROM[i_Address[14:0]];
        end
    end
    
endmodule
