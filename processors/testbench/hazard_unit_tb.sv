/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// interface include
`include "hazard_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module hazard_unit_tb;
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 1, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  hazard_unit_if huif();

`ifndef MAPPED
  hazard_unit   DUT(CLK, nRST, huif);
`else   
  hazard_unit   DUT (
    .\huif.dec_instruction(huif.dec_instruction),
    .\huif.exec_instruction(huif.exec_instruction),
    .\huif.fetch_instruction(huif.fetch_instruction),
    .\huif.load_use(huif.load_use),
    .\huif.jump_use(huif.jump_use),
    .\huif.flag_lu(huif.flag_lu),
    .\huif.flag_ju(huif.flag_ju),
    .\huif.flag_lu_done(huif.flag_lu_done),
    .\huif.flag_ju_done(huif.flag_ju_done),
`endif
	
initial begin
  nRST = 1'b0;
  huif.flag_lu_done = 1'b0;
  huif.flag_ju_done = 1'b0;
  huif.dec_instruction = 32'hff000000;
  huif.exec_instruction = 32'hff000000;
  huif.fetch_instruction = 32'hff000000;
  repeat (2) @(posedge CLK);
  //rs = 26:21
  //rt = 21:16
  //rd = 15:11
  nRST = 1'b1;
  @(posedge CLK);
  huif.fetch_instruction[31:26] = 6'b101011;
  huif.dec_instruction[21:16] = 5'd7;
  huif.fetch_instruction[21:16] = 5'd7; 
  repeat (3) @(posedge CLK);
  huif.flag_lu_done = 1'b1;
  @(posedge CLK);
  huif.dec_instruction = 32'hff000000;
  huif.exec_instruction = 32'hff000000;
  huif.fetch_instruction = 32'hff000000;
  @(posedge CLK);
  huif.flag_lu_done = 1'b0;
  repeat (2) @(posedge CLK);
  huif.fetch_instruction[31:26] = 6'b000100;
  @(posedge CLK);
  huif.fetch_instruction = 32'hff000000;
  @(posedge CLK);
  huif.flag_ju_done = 1'b1;
  repeat (2) @(posedge CLK);
  
  $stop;
end

endmodule
