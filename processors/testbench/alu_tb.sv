/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "alu_if.vh"

// memory types
`include "cpu_types_pkg.vh"
  import cpu_types_pkg::*;

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module alu_tb;

  parameter PERIOD = 10;

  logic CLK = 1;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if alurf();

`ifndef MAPPED
  alu DUT(alurf);
`else
  alu DUT(
    .\alurf.portA (alurf.portA),
    .\alurf.portB (alurf.portB),
    .\alurf.aluop (alurf.aluop),
    .\alurf.outport (alurf.outport),
    .\alurf.zero (alurf.zero),
    .\alurf.overflow (alurf.overflow),
    .\alurf.negative (alurf.negative)
  );
`endif

	initial begin		
		alurf.portA = 32'b0;
		alurf.portB = 32'b0;
		alurf.aluop = ALU_SLL;
		@(posedge CLK);
		alurf.portA = 32'd4;
		alurf.portB = 32'd2;
		repeat (2) @(posedge CLK);
		$finish;
	end


endmodule






