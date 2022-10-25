/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "control_if.vh"

// memory types
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_tb;
	//clock period
  parameter PERIOD = 10;

	//signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_if conif();

`ifndef MAPPED
  control   DUT(conif);
`else
  control   DUT(
    .\conif.instrution (conif.instrution),
    .\conif.jal_flag (conif.jal_flag),
    .\conif.regdst (conif.regdst),
    .\conif.jr_flag (conif.jr_flag),
    .\conif.j_jal_flag (conif.j_jal_flag),
    .\conif.branch (conif.branch),
    .\conif.lui_flag (conif.lui_flag),
    .\conif.ALUSrc (conif.ALUSrc),
    .\conif.MemRead (conif.MemRead),
    .\conif.MemWrite (conif.MemWrite),
    .\conif.MemtoReg (conif.MemtoReg),
    .\conif.ALUop (conif.ALUop),
    .\conif.extend_immi (conif.extend_immi),
    .\conif.RegWrite (conif.RegWrite),
		.\conif.ihit (conif.ihit),
		.\conif.dhit (conif.dhit)
);
`endif

	initial begin
		//set everything to 0
		nRST = 1'b0;
		conif.instruction = 32'd0;
		@(posedge CLK);
		nRST = 1'b1;
		conif.instruction[31:26] = J;
		@(posedge CLK);
		conif.instruction[31:26] = JAL;
		@(posedge CLK);
		conif.instruction[31:26] = BEQ;
		@(posedge CLK);
		conif.instruction[31:26] = BNE;
		@(posedge CLK);
		conif.instruction[31:26] = ADDI;
		@(posedge CLK);
		conif.instruction[31:26] = ADDIU;
		@(posedge CLK);
		conif.instruction[31:26] = SLTI;
		@(posedge CLK);
		conif.instruction[31:26] = SLTIU;
		@(posedge CLK);
		conif.instruction[31:26] = ANDI;
		@(posedge CLK);
		conif.instruction[31:26] = ORI;
		@(posedge CLK);
		conif.instruction[31:26] = XORI;
		@(posedge CLK);
		conif.instruction[31:26] = LUI;
		@(posedge CLK);
		conif.instruction[31:26] = LW;
		@(posedge CLK);
		conif.instruction[31:26] = SW;
		@(posedge CLK);
		conif.instruction[31:26] = HALT;
		@(posedge CLK);
		conif.instruction[31:26] = RTYPE;
		conif.instruction[5:0] = SLLV;
		@(posedge CLK);
		conif.instruction[5:0] = SRLV;
		@(posedge CLK);
		conif.instruction[5:0] = JR;
		@(posedge CLK);
		conif.instruction[5:0] = ADD;
		@(posedge CLK);
		conif.instruction[5:0] = ADDU;
		@(posedge CLK);
		conif.instruction[5:0] = SUB;
		@(posedge CLK);
		conif.instruction[5:0] = SUBU;
		@(posedge CLK);
		conif.instruction[5:0] = AND;
		@(posedge CLK);
		conif.instruction[5:0] = OR;
		@(posedge CLK);
		conif.instruction[5:0] = XOR;
		@(posedge CLK);
		conif.instruction[5:0] = NOR;
		@(posedge CLK);
		conif.instruction[5:0] = SLT;
		@(posedge CLK);
		conif.instruction[5:0] = SLTU;
		repeat (2) @(posedge CLK);
		$finish;
	end

endmodule











