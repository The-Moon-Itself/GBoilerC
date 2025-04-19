`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 01:40:30 PM
// Design Name: 
// Module Name: High_Ram
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


module High_Ram(
    input i_Clk,
    input i_Enable,
    input [6:0] i_Address,
    input i_Bus_Enable,
    // 0: Read
    // 1: Write
    input i_ReadWrite,
    input [7:0] i_Bus,
    output [7:0] o_Bus
    );
    
    reg [6:0] high_ram[7:0];
    
    assign o_Bus = high_ram[i_Address] & {8{~i_ReadWrite & i_Bus_Enable}};
    
    // No i_nRst because we do not care about the initial values
    always @(posedge i_Clk) begin
        if(i_Enable & i_Bus_Enable & i_ReadWrite) begin
            high_ram[i_Address] <= i_Bus;
        end
    end
endmodule
