`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 09:27:01 PM
// Design Name: 
// Module Name: Register
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


module Register #(SIZE = 8, INITIAL = 0) (
    input i_Clk, //Our system clock
    input i_Enable, //Used to disable the component when the system is not being ticked
    input i_nRst, //Reset on low
    input i_Write, //Write to output on next clock cycle
    input [SIZE-1:0] i_Data, //New data to use
    output reg [SIZE-1:0] o_Data //Current saved data
    );
    
    initial begin
        o_Data = INITIAL;
    end
    
    always @(posedge i_Clk, negedge i_nRst) begin
        if(!i_nRst) begin
            o_Data <= INITIAL;
        end
        else if (i_Enable == 1 && i_Write == 1) begin
            o_Data <= i_Data;
        end
    end
endmodule
