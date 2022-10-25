/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// memory types
`include "cpu_types_pkg.vh"

//not used ccinv, ccwit, cctrans, ccwrite, ccsnoopaddr

module memory_control (
  input logic CLK, nRST, 
	cache_control_if.cc ccif
);

  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

	always_comb begin //dwait & iwait 
		ccif.dwait = 1'b1;
		ccif.iwait = 1'b1;
		if (ccif.ramstate != ACCESS) begin
			ccif.dwait = 1'b1;
			ccif.iwait = 1'b1;
		end
		else begin 
			if (ccif.dREN == 1'b1 || ccif.dWEN == 1'b1) begin
				ccif.dwait = 1'b0;
			end
			else if (ccif.iREN == 1'b1) begin
				ccif.iwait = 1'b0;
			end
		end
	end

	always_comb begin //iload and dload
		ccif.iload = 32'b0;
		ccif.dload = 32'b0;
		if (ccif.ramstate == ACCESS) begin
			if (ccif.dREN == 1) begin
				ccif.dload = ccif.ramload;
			end
			else if (ccif.iREN == 1) begin
				ccif.iload = ccif.ramload;
			end
		end
	end

	always_comb begin //ramstore
		ccif.ramstore = ccif.dstore;
	end

	always_comb begin //ramaddr
		ccif.ramaddr = 32'b0;
		if (ccif.dREN == 1'b1 || ccif.dWEN == 1'b1) begin
			ccif.ramaddr = ccif.daddr;
		end
		else if (ccif.iREN == 1'b1) begin
			ccif.ramaddr = ccif.iaddr;
		end
	end
	
	always_comb begin //ramWEN
		ccif.ramWEN = 1'b0;
		if (ccif.dWEN == 1'b1) begin
			ccif.ramWEN = 1'b1;
		end
	end
	
	always_comb begin //ramREN
		ccif.ramREN = 1'b0;
		if (ccif.iREN == 1 || ccif.dREN == 1) begin
			ccif.ramREN = 1'b1;
		end
	end

endmodule







