/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// interface include
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "cpu_ram_if.vh"

// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  caches_if cif0();
  caches_if cif1();
  cpu_ram_if crif();
  cache_control_if ccif(cif0,cif1);
  
  ram   RAM(CLK,nRST,crif);

`ifndef MAPPED
  memory_control   DUT(CLK, nRST, ccif);
`else   
  memory_control   DUT (
		.\ccif.iREN(ccif.iREN),
		.\ccif.dREN(ccif.dREN),
		.\ccif.dWEN(ccif.dWEN),
		.\ccif.dstore(ccif.dstore),
		.\ccif.iaddr(ccif.iaddr),
		.\ccif.daddr(ccif.daddr),
		
		.\ccif.ramload(ccif.ramload),
		.\ccif.ramstate(ccif.ramstate),
		
		.\ccif.ccwrite(ccif.ccwrite),
		.\ccif.cctrans(ccif.cctrans),
		
		.\ccif.iwait(ccif.iwait),
		.\ccif.dwait(ccif.dwait),
		.\ccif.iload(ccif.iload),
		.\ccif.dload(ccif.dload),
		
		.\ccif.ramstore(ccif.ramstore),
		.\ccif.ramaddr(ccif.ramaddr),
		.\ccif.ramWEN(ccif.ramWEN),
		.\ccif.ramREN(ccif.ramREN),
		
		.\ccif.ccwait(ccif.ccwait),
		.\ccif.ccinv(ccif.ccinv),
		.\ccif.ccscoopaddr(ccif.ccscoopaddr)
)
`endif

  always_comb begin
  	crif.ramaddr = ccif.ramaddr;
  	crif.ramstore = ccif.ramstore;
  	crif.ramREN = ccif.ramREN;
  	crif.ramWEN = ccif.ramWEN;
  	ccif.ramstate = crif.ramstate;
  	ccif.ramload = crif.ramload;   
	end
	
	task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;

    cif0.daddr = 0;
    cif0.dWEN = 0;
    cif0.dREN = 0;

    memfd = $fopen(filename,"w");
    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      cif0.daddr = i << 2;
      cif0.dREN = 1;
      repeat (4) @(posedge CLK);
      if (cif0.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cif0.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cif0.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      cif0.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask

	initial begin
		//set everything to 0
		nRST = 1'b0;
		cif0.iREN = 1'b0;
		cif0.dREN = 1'b0;
		cif0.dWEN = 1'b0;
		cif0.dstore = 32'b0;
		cif0.iaddr = 32'b0;
		cif0.daddr = 32'b0;		
		@(posedge CLK);
		nRST = 1'b1; //reset
		$display("Test Number 1 - Data write"); 
		repeat (4) @(posedge CLK);
		cif0.dWEN = 1'b1;
		cif0.dstore = 32'hDAD1DAD1;
		cif0.daddr = 32'h000000f0;
		repeat (4) @(posedge CLK);
		$display("Test Number 2 - Data Read");
		cif0.iREN = 1'b0;
		cif0.dREN = 1'b0;
		cif0.dWEN = 1'b0;
		cif0.dstore = 32'b0;
		cif0.iaddr = 32'b0;
		cif0.daddr = 32'b0;
		repeat (2) @(posedge CLK);
		cif0.dREN = 1'b1;
		cif0.daddr = 32'h000000f0;
		repeat (4) @(posedge CLK);
		$display("Test Number 3 - Instruction Read");
		cif0.iREN = 1'b0;
		cif0.dREN = 1'b0;
		cif0.dWEN = 1'b0;
		cif0.dstore = 32'b0;
		cif0.iaddr = 32'b0;
		cif0.daddr = 32'b0;
		repeat (2) @(posedge CLK);
		cif0.iREN = 1'b1;
		cif0.daddr = 32'h00000088;
		repeat (4) @(posedge CLK);
		$display("Test Number 4 - Both Data and Instruction");	
		cif0.iREN = 1'b0;
		cif0.dREN = 1'b0;
		cif0.dWEN = 1'b0;
		cif0.dstore = 32'b0;
		cif0.iaddr = 32'b0;
		cif0.daddr = 32'b0;
		repeat (2) @(posedge CLK);
		cif0.iREN = 1'b1;
		cif0.dREN = 1'b1;
		cif0.daddr = 32'h00000044;
		repeat (4) @(posedge CLK);
		
		//dump_memory();
		
		$finish;
	end

endmodule
