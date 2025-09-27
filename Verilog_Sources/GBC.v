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
    input i_nRst,
    
    output o_CART_Clk,
    output o_CART_nWrite,
    output o_CART_nRead,
    //0: ROM
    //1: SRAM
    output o_CART_Chip_Select,
    output [15:0] o_CART_Address,
    inout [7:0] io_CART_Bus,
    output o_CART_nRst,
    
    input [7:0] i_WRAM_bus,
    output [7:0] o_WRAM_bus,
    output [14:0] o_WRAM_Address,
    output o_WRAM_Enable,
    output o_WRAM_Write
    
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
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
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
    .i_ReadWrite(cpu_write),
    .i_Bus(cpu_data_out),
    .o_Bus(high_ram_bus_out)
    );
    
    
    wire [4:0] interrupt_signals;
    wire [7:0] interrupt_controller_bus_out;
    wire interrupt_controller_bus_enable;
    wire interrupt_controller_reg_select;
    Interrupt_Controller interrupt_controller
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    
    .i_Interrupt_Request(interrupt_signals),
    
    .i_Interrupt_Handled(handle_interrupt),
    .o_Interrupts(interrupts),
    
    .i_Bus_Enable(interrupt_controller_bus_enable),
    .i_ReadWrite(cpu_write),
    .i_Register_Select(interrupt_controller_reg_select),
    .i_Bus(cpu_data_out[4:0]),
    .o_Bus(interrupt_controller_bus_out[4:0])
    );
    assign interrupt_controller_bus_out[7:5] = {3{interrupt_controller_bus_enable & ~cpu_data_out}};
    
    
    wire [15:0] CART_address;
    assign CART_address[15] = 1'b0;
    wire [7:0] CART_data_in;
    wire CART_chip_select;
    wire CART_access;
    CART_Controller cart_controller
    (.i_Clk(i_Clk),
    .i_nRst(i_nRst),
    
    .i_Address(CART_address),
    .i_Chip_Select(CART_chip_select),
    .i_CART_Access(CART_access),
    .i_CART_Write(cpu_write),
    .i_Data(cpu_data_out),
    .o_Data(),
    
    .o_Clk(o_CART_Clk),
    .o_nWrite(o_CART_nWrite),
    .o_nRead(o_CART_nRead),
    .o_Chip_Select(o_CART_Chip_Select),
    .o_Address(o_CART_Address),
    .io_Data(io_CART_Bus),
    .o_nRst(o_CART_nRst)
    );
    
    wire [12:0] WRAM_Address;
    wire [7:0] WRAM_data;
    wire [7:0] WRAM_register_data;
    wire WRAM_access;
    wire WRAM_register_access;
    WRAM_Controller wram_controller
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    
    .i_WRAM_Address(WRAM_Address),
    .o_WRAM_Address(o_WRAM_Address),
    .i_WRAM_Data_Raw(i_WRAM_bus),
    .o_WRAM_Data_In(WRAM_data),
    .i_WRAM_Data_Out(cpu_data_out),
    .o_WRAM_Data_To_Chip(o_WRAM_bus),
    .o_WRAM_Write(o_WRAM_Write),
    .i_WRAM_Access(WRAM_access),
    .o_WRAM_Access(o_WRAM_Enable),
    
    .i_Bus(cpu_data_out[2:0]),
    .o_Bus(WRAM_register_data),
    .i_Register_Access(WRAM_register_access),
    .i_Write(cpu_write)
    );
    
    wire internal_map_address_miss;
    wire internal_map_data_miss;
    OAM_LastPage_Controller internal_bus_map
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Address(cpu_address),
    .i_Address_Out(cpu_address_out),
    .i_data_access(cpu_write),
    
    .o_Address_Miss(internal_map_address_miss),
    .o_Data_Miss(internal_map_data_miss),
    
    .o_WRAM_Bank_Enable(WRAM_register_access),
    
    .o_Interrupt_Controller_Address(interrupt_controller_reg_select),
    .o_Interrupt_Controller_Enable(interrupt_controller_bus_enable),
    
    .o_High_Ram_Address(high_ram_address),
    .o_High_Ram_Enable(high_ram_bus_enable)
    );
    
    Memory_Map external_bus_map
    (
    .i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_nRst(i_nRst),
    .i_Address(cpu_address),
    .i_Address_Out(internal_map_address_miss),
    .i_data_access(internal_map_data_miss),
    
    .o_CART_Address(CART_address[14:0]),
    .o_CART_Enable(CART_access),
    //0: ROM
    //1: SRAM
    .o_CART_Chip_Select(CART_chip_select),
    
    .o_VRAM_Address(),
    .o_VRAM_Enable(),
    
    .o_WRAM_Address(WRAM_Address),
    .o_WRAM_Enable(WRAM_access)
    );
    
    assign cpu_data_in =  CART_data_in | WRAM_data | high_ram_bus_out | interrupt_controller_bus_out | WRAM_register_access;
    
endmodule
