`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2025 12:21:14 AM
// Design Name: 
// Module Name: Memory_Map
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


module Memory_Map(
    input i_Clk,
    input i_Enable,
    input i_nRst,
    input [15:0] i_Address,
    input i_Address_Out,
    input i_data_access,
    
    output [14:0] o_ROM_Address,
    output o_ROM_Enable,
    
    output [12:0] o_VRAM_Address,
    output o_VRAM_Enable,
    
    output [12:0] o_ExRAM_Address,
    output o_ExRAM_Enable,
    
    output [12:0] o_WRAM_Address,
    output o_WRAM_Enable
    );
    
    reg [15:0] saved_address = 16'h0000;
    wire [15:0] active_address = i_Address_Out ? i_Address : saved_address;
    
    assign o_ROM_Address = active_address[14:0];
    assign o_ROM_Enable = ~active_address[15] & i_data_access;
    
    assign o_VRAM_Address = active_address[12:0];
    assign o_VRAM_Enable = (active_address[15:13] == 3'b100) & i_data_access;
    
    assign o_ExRAM_Address = active_address[12:0];
    assign o_ExRAM_Enable = (active_address[15:13] == 3'b101) & i_data_access;
    
    assign o_WRAM_Address = active_address[12:0];
    assign o_WRAM_Enable = (active_address[15:13] == 3'b11) & i_data_access;
    
    always @(posedge i_Clk) begin
        if(~i_nRst) begin
            saved_address = 16'h0000;
        end
        else if(i_Enable & i_Address_Out) begin
            saved_address <= i_Address;
        end
    end
endmodule
