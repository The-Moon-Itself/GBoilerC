`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 12:08:36 AM
// Design Name: 
// Module Name: OAM_LastPage_Controller
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


module OAM_LastPage_Controller(
    input i_Clk,
    input i_Enable,
    input i_nRst,
    input [15:0] i_Address,
    input i_Address_Out,
    input i_data_access,
    
    output o_Miss,
    
    output [6:0] o_High_Ram_Address,
    output o_High_Ram_Enable,
    
    output o_Interrupt_Controller_Address,
    output o_Interrupt_Controller_Enable
    
    );
    
    reg [15:0] saved_address = 16'h0000;
    
    wire [15:0] active_address = i_Address_Out ? i_Address : saved_address;
    
    wire hit = &(active_address[15:9]) & i_data_access;
    wire registers = active_address[8];
    
    assign o_Miss = ~&(active_address[15:9]) & i_data_access;
    
    assign o_High_Ram_Address = active_address[6:0];
    assign o_High_Ram_Enable = &active_address[15:7] & ~&active_address[6:0] & hit;
    
    assign o_Interrupt_Controller_Address = active_address[7:4] == 4'h0;
    assign o_Interrupt_Controller_Enable = (hit & registers & &active_address[3:0] & ((active_address[7:4] == 4'h0) | (active_address[7:4] == 4'h0)));
    
    always @(posedge i_Clk) begin
        if(~i_nRst) begin
            saved_address = 16'h0000;
        end
        else if(i_Enable & i_Address_Out) begin
            saved_address <= i_Address;
        end
    end
endmodule
