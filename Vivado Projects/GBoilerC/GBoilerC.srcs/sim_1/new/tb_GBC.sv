`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 01:32:09 PM
// Design Name: 
// Module Name: tb_GBC
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


module tb_GBC(

    );

    // Clock, enable, and interrupt signals.
    reg         clk;
    reg         enable;
  	reg			nRst;
    reg [4:0]   i_Interrupts;

    // Testbench-driven bus: this connects to the CPU's i_Bus.
    reg [7:0]   tb_Bus;  

    // Wires to observe CPU outputs.
    wire [15:0] o_Address;
    wire [7:0]  o_Bus;
    wire        o_Bus_Out;
    wire        o_Bus_In;
    wire        o_Address_Out;
    wire        o_Handle_Interrupt;
    
    // Instantiate the CPU.
    CPU uut (
       .i_Clk(clk),
       .i_Enable(enable),
       .i_nRst(nRst),
       .i_Bus(tb_Bus),
       .i_Interrupts(i_Interrupts),
       .o_Address(o_Address),
       .o_Bus(o_Bus),
       .o_Bus_Out(o_Bus_Out),
       .o_Bus_In(o_Bus_In),
       .o_Address_Out(o_Address_Out),
       .o_Handle_Interrupt(o_Handle_Interrupt)
    );
    
    // Simple memory model: 256 bytes.
    reg [7:0] memory [0:255];
    integer i;
    
    // Register to hold the target memory address.
    // (o_Address does not drive the external bus during memory read/write,
    // so we capture it when o_Address_Out is active.)
  reg [15:0] mem_address_reg = 16'h0000;
    
    // Capture target address on the rising edge when o_Address_Out is active.
    always @(posedge clk) begin
      if (o_Address_Out == 1'b1)
            mem_address_reg <= o_Address;
    end
    
    // Memory initialization:
    // - At address 0: opcode 8'h31 for "LD rp[p], d16" (with p = 3 => SP),
    //   followed by two immediate bytes: low (8'h34) then high (8'h12)
    // - At address 3: opcode 8'h08 for "LD a16, SP",
    //   followed by immediate address bytes low (8'h00) and high (8'h80)
    // - At address 6: opcode 8'h00 for NOP.
    initial begin
      
        // Initialize the rest of memory to 0.
      	for (i = 0; i < 256; i = i + 1) begin
            memory[i] = 8'h00;
        end
      
      	// Instruction 1: LD rp[p], d16 (p = 3, so SP = 16'hfffd)
        memory[0] = 8'h31;  // opcode: LD rp[p], d16 (p = 3)
      	memory[1] = 8'hfd;  // immediate low byte
      	memory[2] = 8'hff;  // immediate high byte
        
        // Instruction 2: LD a16, SP 
        memory[3] = 8'h08;  // opcode: LD a16, SP
        memory[4] = 8'h00;  // immediate low byte for destination (e.g., 0x8000)
        memory[5] = 8'h80;  // immediate high byte for destination
        
        // Instruction 3: NOP
        memory[6] = 8'h00;  // opcode: NOP
      	
      	// Instruction 4: LD BC, 16'abcd
        memory[7] = 8'h01;
        memory[8] = 8'hcd;
        memory[9] = 8'hab;
      
      	// Instruction 5: LD HL, 16'5433
        memory[10] = 8'h21;
      	memory[11] = 8'h33;
      	memory[12] = 8'h54;
      
     	// Instruction 6: ADD HL, rp[p] (p = 0 -> rp[p] = BC)
      	memory[13] = 8'h09;
      
      	// Instruction 7: JR C, -3 (Jump to Instruction 6 if carry)
      	memory[14] = 8'h38;
      	memory[15] = 8'hfd;

		// Instruction 8: LD DE, d16 (p = 1) -> DE = 16'h0050 (target address 0x50)
        // Opcode for LD rp[p], d16 with p=1: 0x11 (0b00_01_0001)
        memory[16] = 8'h11;   // opcode for LD DE, d16 (p=1)
        memory[17] = 8'h50;   // immediate low byte (0x50)
        memory[18] = 8'h00;   // immediate high byte (0x00)

		// Instruction 9: LD A, (DE) (p = 1, q = 1) opcode: 0x1A (0b00_01_1_010)
        memory[19] = 8'h1A;
        
        // Instruction 10: LD (BC), A (p = 0, q = 0) opcode: 0x02 (0b00_00_0_010)
        memory[20] = 8'h02;
        
        // Instruction 11: LD (HL+), A (p = 2, q = 0) opcode: 0x22 (0b00_10_0_010)
        memory[21] = 8'h22;
        
        // Instruction 12: LD A, (HL-) (p = 3, q = 1) opcode: 0x3A (0b00_11_1_010)
        memory[22] = 8'h3A;
      
        // Instruction 13: INC DE opcode: 0x13 (0b00_11_1_010)
      	memory[23] = 8'h13;
      
        // Instruction 14: DEC BC opcode: 0x0b (0b00_11_1_010)
      	memory[24] = 8'h0b;
      
        // Instruction 15: DEC A opcode: 0x3d (0b00_11_1_010)
      	memory[25] = 8'h3d;
      
        // Instruction 16: LD BC, 0x0f00
      	memory[26] = 8'h01;
      	memory[27] = 8'h00;
      	memory[28] = 8'h0f;
      	
      	// Instructions 17-20: DEC C, INC C, INC C, DEC C
      	memory[29] = 8'h0d;
      	memory[30] = 8'h0c;
      	memory[31] = 8'h0c;
      	memory[32] = 8'h0d;
      
      	// Instruction 21: INC (HL)
      	memory[33] = 8'h34;
      
      	// Instruction 22: LD A, 0xf1
      	memory[34] = 8'h3e;
      	memory[35] = 8'hf1;
      
      	// Instruction 23: RLA
      	memory[36] = 8'h17;
      
      	// Instruction 24: RLCA
      	memory[37] = 8'h07;
      
      	// Instruction 25: CPL
      	memory[38] = 8'h2f;
      
      	// Instruction 26: CCF
      	memory[39] = 8'h3f;
      
      	// Instruction 27: LD (HL), 0x2b
      	memory[40] = 8'h36;
      	memory[41] = 8'h2b;
      
      	// Instruction 28: LD C, E
      	memory[42] = 8'h4b;
      
      	// Instruction 29: LD A, (HL)
      	memory[43] = 8'h7e;
      
      	// Instruction 30: CALL 0x0080
      	memory[44] = 8'hcd;
      	memory[45] = 8'h80;
      	memory[46] = 8'h00;

      	// Instruction 31: LD (C), A
     	memory[47] = 8'he2;
      
      	// Instruction 32: LD (0xd0e1), A
      	memory[48] = 8'hea;
      	memory[49] = 8'he1;
      	memory[50] = 8'hd0;
      
      	// Instruction 33: XOR A, 0xcc
      	memory[51] = 8'hee;
      	memory[52] = 8'hcc;
      
      	// Instruction 34: LD A, (0xd0e1)
      	memory[53] = 8'hfa;
      	memory[54] = 8'he1;
      	memory[55] = 8'hd0;
      
      	// Instruction 35: DI
      	memory[56] = 8'hf3;

        // Instruction 36: EI
      	memory[57] = 8'hfb;
      
      	// Instruction 37: ADD SP 0xf0
      	memory[58] = 8'he8;
      	memory[59] = 8'he2;
      
      	// Instruction 38: LD HL, SP+0x10
      	memory[60] = 8'hf8;
      	memory[61] = 8'h1e;
      
      	// Instruction 39: LD SP, HL
      	memory[62] = 8'hf9;
      	// Instruction 40: JP HL
      	memory[63] = 8'he9;
      	
      
      	// Function 1:
      	// RET Z
      	memory[8'h80] = 8'hc8;
      	// Function 2: PUSH BC
      	memory[8'h81] = 8'hc5;
      	// Function 3: PUSH AF
      	memory[8'h82] = 8'hf5;
      	// Function 4: LD BC, 0x10d0
      	memory[8'h83] = 8'h01;
      	memory[8'h84] = 8'hd0;
      	memory[8'h85] = 8'h10;
      	// Function 5: LD A, (C)
      	memory[8'h86] = 8'hf2;
      	// Function 6: LD A, (0xd0)
      	memory[8'h87] = 8'hf0;
      	memory[8'h88] = 8'hd0;
      	// Function 7: SWAP A
      	memory[8'h89] = 8'hcb;
      	memory[8'h8a] = 8'h37;
      	// Function 8: POP AF
      	memory[8'h8b] = 8'hf1;
      	// Function 9: POP BC
      	memory[8'h8c] = 8'hc1;
      	// Function 10: RETI
      	memory[8'h8d] = 8'hd9;
      
      	//Test memory
        memory[8'h50] = 8'hAA;
      	memory[8'hcd] = 8'h1f;
        memory[8'hce] = 8'h99;
      	memory[8'hd0] = 8'hdf;
      	memory[8'hdf] = 8'h19;
      
        
        // Initialize control signals.
        enable = 1;
      	nRst = 1;
        i_Interrupts = 5'b0;
        
    end
    
    // Clock generation: 10 ns period.
    initial clk = 0;
    always #5 clk = ~clk;
  	
    
    // Memory read simulation:
    // When the CPU asserts o_Bus_In (i.e. requests a memory read),
    // use the stored mem_address_reg to drive the data onto tb_Bus.
  initial tb_Bus = memory[mem_address_reg[7:0]];
  always @(posedge clk) begin
    tb_Bus <= memory[mem_address_reg[7:0]];
    if(o_Bus_Out) begin
      memory[mem_address_reg[7:0]] <= o_Bus;
    end
  end
    // Monitoring:
    // We print the saved address, the internal o_Address and o_Bus, and control signals.
    // When o_Address_Out and o_Bus_Out are inactive, you can see the internal bus values.
    initial begin
      $monitor("Time=%0t | Saved Address=%h | Address_Out=%h | test_bus=%h | Bus_Out=%h | reading data=%b | writing data=%b | sending address=%b", 
               $time, mem_address_reg, o_Address, tb_Bus, o_Bus, o_Bus_In, o_Bus_Out, o_Address_Out);
      
        // Run simulation long enough for all instructions to complete.
        #6000;
        $finish;
    end

endmodule
