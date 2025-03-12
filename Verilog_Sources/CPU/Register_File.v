`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2025 09:40:31 PM
// Design Name: 
// Module Name: LSharp_Reg_File
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//  Register.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_File(
    input i_Clk, //Our system clock
    input i_Enable, //Used to disable the component when the system is not being ticked
    //8 Bit Register Codes:
    // W = 0, Z = 1
    // B = 2, C = 3
    // D = 4, E = 5
    // H = 6, L = 7
    input [7:0] i_Read8, //Read an 8bit register SHOULD ONLY EVER BE ONE HOT
    input [7:0] i_Write8, //Write the value in i_Bus8_In to an 8bit register
    input [7:0] i_Bus8, //The value to be written to an 8bit register
    output [7:0] o_Bus8, //The value being read from an 8bit register
    //16 Bit Register Codes:
    // WZ = 0
    // BC = 1
    // DE = 2
    // HL = 3
    // SP = 4
    // PC = 5
    input [5:0] i_Read16, //Read a 16bit register SHOULD ONLY EVER BE ONE HOT
    input [5:0] i_Write16, //Write the value in i_Bus16_In to an 16bit register
    input [15:0] i_Bus16, //The value to be written to an 16bit register
    output [15:0] o_Bus16, //The value being read from an 16bit register
    
    output [15:0] o_HL //For easy access to the 16bit adder
    );
    
    //8Bit Registers
    
    //These will be useful later for the 16bit writes
    wire [7:0] data_high8bits;
    wire [7:0] data_low8bits;
    
    //WZ are only used within opcodes to transfer data. They're essentially temporary values.
    wire [7:0] w_data;
    Register Reg_W
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[0] | i_Write16[0]),
    .i_Data(data_high8bits),
    .o_Data(w_data)
    );
    
    wire [7:0] z_data;
    Register Reg_Z
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[1] | i_Write16[0]),
    .i_Data(data_low8bits),
    .o_Data(z_data)
    );
    
    wire [7:0] b_data;
    Register Reg_B
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[2] | i_Write16[1]),
    .i_Data(data_high8bits),
    .o_Data(b_data)
    );
    
    wire [7:0] c_data;
    Register Reg_C
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[3] | i_Write16[1]),
    .i_Data(data_low8bits),
    .o_Data(c_data)
    );
    
    wire [7:0] d_data;
    Register Reg_D
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[4] | i_Write16[2]),
    .i_Data(data_high8bits),
    .o_Data(d_data)
    );
    
    wire [7:0] e_data;
    Register Reg_E
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[5] | i_Write16[2]),
    .i_Data(data_low8bits),
    .o_Data(e_data)
    );
    
    wire [7:0] h_data;
    Register Reg_H
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[6] | i_Write16[3]),
    .i_Data(data_high8bits),
    .o_Data(h_data)
    );
    
    wire [7:0] l_data;
    Register Reg_L
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write8[7] | i_Write16[3]),
    .i_Data(data_low8bits),
    .o_Data(l_data)
    );
    assign o_HL = {h_data, l_data};
    
    
    assign o_Bus8 = ({8{i_Read8[0]}} & w_data) |
                    ({8{i_Read8[1]}} & z_data) |
                    ({8{i_Read8[2]}} & b_data) |
                    ({8{i_Read8[3]}} & c_data) |
                    ({8{i_Read8[4]}} & d_data) |
                    ({8{i_Read8[5]}} & e_data) |
                    ({8{i_Read8[6]}} & h_data) |
                    ({8{i_Read8[7]}} & l_data);
    
    //16Bit Registers
    
    wire [15:0] wz_data = {w_data, z_data};
    wire [15:0] bc_data = {b_data, c_data};
    wire [15:0] de_data = {d_data, e_data};
    wire [15:0] hl_data = {h_data, l_data};
    
    wire [15:0] sp_data;
    Register #(.SIZE(16)) Reg_SP
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write16[4]),
    .i_Data(i_Bus16),
    .o_Data(sp_data)
    );
    
    
    wire [15:0] pc_data;
    Register #(.SIZE(16)) Reg_PC
    (.i_Clk(i_Clk),
    .i_Enable(i_Enable),
    .i_Write(i_Write16[5]),
    .i_Data(i_Bus16),
    .o_Data(pc_data)
    );
    
    assign o_Bus16 = ({16{i_Read16[0]}} & wz_data) |
                     ({16{i_Read16[1]}} & bc_data) |
                     ({16{i_Read16[2]}} & de_data) |
                     ({16{i_Read16[3]}} & hl_data) |
                     ({16{i_Read16[4]}} & sp_data) |
                     ({16{i_Read16[5]}} & pc_data);
    
    //Need some logic to know when to inject our 16bit values into the 8bit registers 
    wire write_16_to_8 = i_Write16[0] | i_Write16[1] | i_Write16[2] | i_Write16[3];
    //Here's these guys again
    assign data_high8bits = write_16_to_8 ? i_Bus16[15:8] : i_Bus8;
    assign data_low8bits  = write_16_to_8 ? i_Bus16[7:0] : i_Bus8;
    
endmodule
