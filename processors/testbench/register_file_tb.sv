/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;
	//clock period
  parameter PERIOD = 10;

	//signals
  logic CLK = 1, nRST;

  // test vars
  int v1 = 26;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif();
	
`ifndef MAPPED
  register_file   DUT(CLK, nRST, rfif);
`else
  register_file   DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
);
`endif


	initial begin
		//set everything to 0
		nRST = 1'b1;
		rfif.WEN = 1'b0;
		rfif.wsel = 5'b0;
		rfif.rsel1 = 5'b0;
		rfif.rsel2 = 5'b0;
		rfif.wdat = 32'b0;
		@(posedge CLK);
		nRST = 1'b0; //reset
		@(posedge CLK);
		$display("Test Number 1 - Write register 1,2,3"); 
		rfif.wsel = 5'd1;
		rfif.wdat = v1;
		@(posedge CLK);
		rfif.WEN = 1'b1;	
		@(posedge CLK);
		rfif.WEN = 1'b0;
		rfif.rsel1 = 5'b1;
		repeat(2) @(posedge CLK);
		rfif.wsel = 5'd19;
		rfif.wdat = v2;
		@(posedge CLK);
		rfif.WEN = 1'b1;	
		repeat(2) @(posedge CLK);
		rfif.WEN = 1'b0;
		rfif.rsel2 = 5'd19;		
		repeat(2) @(posedge CLK);
		$finish;
	end

endmodule











