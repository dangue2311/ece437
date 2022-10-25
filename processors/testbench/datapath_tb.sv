/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// interface include
`include "datapath_if.vh"

// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module datapath_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  datapath dpif();

`ifndef MAPPED
  datapath   DUT(dpif);
`else   
  datapath   DUT (
		.\dpif.ihit(dpif.ihit),
		.\dpif.imemload(dpif.imemload),
		.\dpif.ihit(dpif.dhit),
		.\dpif.dmemload(dpif.dmemload),
		.\dpif.halt(dpif.halt),
		.\dpif.imemREN(dpif.imemREN),
		.\dpif.imemaddr(dpif.imemaddr),
		.\dpif.dmemaddr(dpif.dmemaddr),
		.\dpif.dmemREN(dpif.dmemREN),
		.\dpif.dmemWEN(dpif.dmemWEN),
		.\dpif.datomic(dpif.datomic),
		.\dpif.dmemstore(dpif.dmemstore),
		.\dpif.dmemaddr(dpif.dmemaddr)
);
`endif
	
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

		$finish;
	end

endmodule
