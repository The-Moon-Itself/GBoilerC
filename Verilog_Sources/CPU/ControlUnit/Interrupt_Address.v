`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 02:13:54 PM
// Design Name: 
// Module Name: Interrupt_Address
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  ../../Generics/
//      LowestSetBit.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Interrupt_Address(
    input [4:0] i_Interrupts,
    output [2:0] o_Interrupt_Address
    );
    wire [4:0] active_interrupt;
    LowestSetBit #(.SIZE(5)) interrupt_filter
    (.i_Input(i_Interrupts),
    .o_Output(active_interrupt)
    );
    
    assign o_Interrupt_Address = {active_interrupt[4],|active_interrupt[3:2],active_interrupt[3] | active_interrupt[1]};
endmodule
