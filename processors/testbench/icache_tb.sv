// mapped needs this
`include "datapath_cache_if.vh"
`include "caches_if.vh"

// memory types
`include "cpu_types_pkg.vh"
  import cpu_types_pkg::*;

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module icache_tb;

  // signals
  logic CLK = 1, nRST;

  parameter PERIOD = 10;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  datapath_cache_if dpcif();
  caches_if memcif();

`ifndef MAPPED
  icache DUT(CLK, nRST, dpcif, memcif);
`else
  icache DUT(
    .\dpcif.imemREN (dpcif.imemREN),
    .\dpcif.imemaddr (dpcif.imemaddr),
    .\dpcif.ihit (dpcif.ihit),
    .\dpcif.imemload (dpcif.imemload),
    .\memcif.iwait (memcif.iwait),
    .\memcif.iload (memcif.iload),
    .\memcif.iREN (memcif.iREN),
    .\memcif.iaddr (memcif.iaddr),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

initial begin
  nRST = 1'b0;
  dpcif.imemREN = '0;
  dpcif.imemaddr = '0;
  memcif.iwait = 1'b1;
  memcif.iload = '0;
  repeat (2) @(posedge CLK);
  nRST = 1'b1;
  repeat (2) @(posedge CLK);
  dpcif.imemaddr = 32'h0000ff00;
  dpcif.imemREN = 1'b1;
  @(posedge CLK);
  memcif.iwait = 1'b0;
  memcif.iload = 32'hffbeefff;
  repeat (4) @(posedge CLK);
  dpcif.imemaddr = 32'h0000ff44;
  dpcif.imemREN = 1'b1;
  @(posedge CLK);
  memcif.iwait = 1'b0;
  memcif.iload = 32'h00112233;
  repeat (4) @(posedge CLK);
  memcif.iwait = 1'b1;
  dpcif.imemaddr = 32'h0000ff00;
  dpcif.imemREN = 1'b1; 
  repeat (4) @(posedge CLK);
  $stop;
end

endmodule