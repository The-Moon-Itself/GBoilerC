`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 04:56:48 PM
// Design Name: 
// Module Name: Interrupt_Controller
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


module Interrupt_Controller(
    input i_Clk,
    input i_Enable,
    input i_nRst,
    input [4:0] i_Interrupt_Request,
    input i_Interrupt_Handled,
    output [4:0] o_Interrupts,
    
    input i_Bus_Enable,
    // 0: Read
    // 1: Write
    input i_ReadWrite,
    input i_Register_Select,
    input [4:0] i_Bus,
    output [4:0] o_Bus
    );
    
    reg [4:0] IE = 5'b00000;
    reg [4:0] IF = 5'b00000;
    
    assign o_Interrupts = IE & IF;
    
    wire [4:0] priority_interrupt;
    LowestSetBit #(.SIZE(5)) priority_interrupt_bit
    (.i_Input(o_Interrupts & {5{i_Interrupt_Handled}}),
    .o_Output(priority_interrupt)
    );
    
    assign o_Bus = (i_Register_Select ? IE : IF) & {5{~i_ReadWrite & i_Bus_Enable}};
    
    always @(posedge i_Clk) begin
        if(~i_nRst) begin
            IF <= 5'b00000;
        end
        else if(i_Enable & i_Bus_Enable & i_ReadWrite & ~i_Register_Select) begin
            IF <= i_Bus;
        end
        else if(i_Enable) begin
            IF <= (IF & ~priority_interrupt) | i_Interrupt_Request;
        end
        
        if(~i_nRst) begin
            IE <= 5'b00000;
        end
        else if(i_Enable & i_Bus_Enable & i_ReadWrite & i_Register_Select) begin
            IE <= i_Bus;
        end
    end
endmodule
