`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 12:00:27 AM
// Design Name: 
// Module Name: GBC
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


module GBC(
    input i_Clk,
    input i_Enable,
    input i_nRst
    );
    
    wire [7:0] cpu_data_in;
    wire [7:0] cpu_data_out;
    wire [15:0] cpu_address;
    wire cpu_write;
    wire cpu_read;
    wire cpu_address_out;
    wire [4:0] interrupts;
    wire handle_interrupt;
    CPU cpu
    (.i_Enable(i_Enable),
    .i_nRst(i_nRst),
    
    .i_Bus(cpu_data_in),
    .o_Bus(cpu_data_out),
    .o_Address(cpu_address),
    
    .o_Bus_Out(cpu_write),
    .o_Bus_In(cpu_read),
    .o_Address_Out(cpu_address_out),
    
    .i_Interrupts(interrupts),
    .o_Handle_Interrupt(handle_interrupt)
    );
    
    wire [6:0] high_ram_address;
    wire high_ram_bus_enable;
    wire [7:0] high_ram_bus_out; 
    High_Ram high_ram
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Address(high_ram_address),
    .i_Bus_Enable(high_ram_bus_enable),
    .i_ReadWrite(cpu_data_out),
    .i_Bus(cpu_data_out),
    .o_Bus(high_ram_bus_out)
    );
    
    
    wire [4:0] interrupt_signals;
    wire [7:0] interrupt_controller_bus_out;
    wire interrupt_controller_bus_enable;
    wire interrupt_controller_reg_select;
    Interrupt_Controller interrupt_controller
    (.i_Enable(i_Enable),
    .i_nRst(i_nRst),
    
    .i_Interrupt_Request(interrupt_signals),
    
    .i_Interrupt_Handled(handle_interrupt),
    .o_Interrupts(interrupts),
    
    .i_Bus_Enable(interrupt_controller_bus_enable),
    .i_ReadWrite(cpu_data_out),
    .i_Register_Select(interrupt_controller_reg_select),
    .i_Bus(cpu_data_out[4:0]),
    .o_Bus(interrupt_controller_bus_out[4:0])
    );
    assign interrupt_controller_bus_out[7:5] = {3{interrupt_controller_bus_enable & ~cpu_data_out}};
    
    OAM_LastPage_Controller oam_reg_control
    (.i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Address(cpu_address),
    .i_Address_Out(cpu_address_out),
    
    .o_Miss(),
    
    .o_Interrupt_Controller_Address(interrupt_controller_reg_select),
    .o_Interrupt_Controller_Enable(interrupt_controller_bus_enable),
    
    .o_High_Ram_Address(high_ram_address),
    .o_High_Ram_Enable(high_ram_bus_enable)
    );
    
    assign cpu_data_in =  high_ram_bus_out | interrupt_controller_bus_out;
    
endmodule
