/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// interface include
`include "request_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
	request_unit_if ruif();

`ifndef MAPPED
  request_unit   DUT(CLK, nRST, ruif);
`else   
  memory_control   DUT (
  	.\ruif.halt (ruif.halt),
  	.\ruif.ihit (ruif.ihit),
  	.\ruif.dhit (ruif.dhit),
  	.\ruif.MemWrite (ruif.MemWrite),
  	.\ruif.MemRead (ruif.MemRead),
  	.\ruif.iREN (ruif.iREN),
  	.\ruif.dREN (ruif.dREN),
   	.\ruif.dWEN (ruif.dWEN),
    .\nRST (nRST),
    .\CLK (CLK)
);
`endif

	initial begin
		nRST = 1'b0;
		ruif.halt = 1'b0;
		ruif.ihit = 1'b0;
		ruif.dhit = 1'b0;
		ruif.MemWrite = 1'b0;
		ruif.MemRead = 1'b0;
		@(posedge CLK);
		nRST = 1'b1;
		repeat(2) @(posedge CLK);
		ruif.MemWrite = 1'b1;
		repeat(2) @(posedge CLK);
		ruif.dhit = 1'b1;
		@(posedge CLK);
		ruif.dhit = 1'b0;
		repeat(3) @(posedge CLK);
		ruif.MemWrite = 1'b0;
		ruif.ihit = 1'b1;
		@(posedge CLK);
		ruif.ihit = 1'b0;
		repeat(2) @(posedge CLK);
		ruif.halt = 1'b1;
		repeat(4) @(posedge CLK);
		ruif.MemRead = 1'b1;
		repeat(4) @(posedge CLK);
		nRST = 1'b0;
		ruif.halt = 1'b0;
		ruif.ihit = 1'b0;
		ruif.dhit = 1'b0;
		ruif.MemWrite = 1'b0;
		ruif.MemRead = 1'b0;	
		repeat(2) @(posedge CLK);
		nRST = 1'b1;
		repeat(2) @(posedge CLK);	
		ruif.MemRead = 1'b1;
		repeat(2) @(posedge CLK);
		ruif.dhit = 1'b0;
		@(posedge CLK);
		ruif.dhit = 1'b1;
		@(posedge CLK);
		ruif.dhit = 1'b0;
		repeat(2) @(posedge CLK);
		ruif.MemWrite = 1'b1;
		repeat(2) @(posedge CLK);			
		$finish;
	end

endmodule









