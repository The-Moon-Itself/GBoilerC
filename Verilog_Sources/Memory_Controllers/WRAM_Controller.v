`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2025 02:08:28 PM
// Design Name: 
// Module Name: WRAM_Controller
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


module WRAM_Controller(
    input i_Clk,
    input i_Enable,
    input i_nRst,
    
    input [12:0] i_WRAM_Address,
    output [14:0] o_WRAM_Address,
    input [7:0] i_WRAM_Data_Raw,
    output [7:0] o_WRAM_Data_In,
    input [7:0] i_WRAM_Data_Out,
    output [7:0] o_WRAM_Data_To_Chip,
    output o_WRAM_Write,
    input i_WRAM_Access,
    output o_WRAM_Access,
    
    input [2:0] i_Bus,
    output [7:0] o_Bus,
    input i_Register_Access,
    input i_Write
    );
    
    reg [2:0] bank = 3'b000;
    wire target_bank = (bank == 3'b000) ? 3'b001 : bank;
    
    assign o_WRAM_Data_In = {8{~i_Write & i_WRAM_Access}} & i_WRAM_Data_Raw;
    assign o_WRAM_Data_To_Chip = i_WRAM_Data_Out;
    assign o_WRAM_Write = i_Write & i_WRAM_Access;
    assign o_WRAM_Access = i_WRAM_Access;
    
    assign o_Bus = {8{i_Register_Access & ~i_Write}} & {5'b11111, bank};
    
    assign o_WRAM_Address = {i_WRAM_Address[12] ? target_bank : 3'b000, i_WRAM_Address[11:0]};
    
    always @(posedge i_Clk, negedge i_nRst) begin
        if(~i_nRst) begin
            bank <= 3'b000;
        end
        else if(i_Enable & i_Register_Access & i_Write) begin
            bank <= i_Bus;
        end
    end
endmodule
