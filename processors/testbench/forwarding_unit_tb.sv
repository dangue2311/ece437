/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "forwarding_unit_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module forwarding_unit_tb;
  import cpu_types_pkg::*;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  forwarding_unit_if fuif ();
  // test program
  test PROG ();
  // DUT
  forwarding_unit forw(fuif);

endmodule

program test;
  initial begin
  import cpu_types_pkg::*;

    //Test 1: Reset Test

    $display("Test 1: Reset Test");

    forwarding_unit_tb.fuif.dec_instruction = '0;
    forwarding_unit_tb.fuif.exec_instruction = '0;
    forwarding_unit_tb.fuif.mem_instruction = '0;
    forwarding_unit_tb.fuif.exec_RegWrite = '0;
    forwarding_unit_tb.fuif.mem_RegWrite = '0;

    #(forwarding_unit_tb.PERIOD * 5);

    //Test 2: Forward A
    forwarding_unit_tb.fuif.dec_instruction = 32'b00000000010000010010100000100101;
    forwarding_unit_tb.fuif.exec_instruction = 32'b00000000101001000011000000100101;
    forwarding_unit_tb.fuif.mem_instruction = 32'b00000000101001000011000000100101;
    forwarding_unit_tb.fuif.mem_RegWrite = 1'b1;
    forwarding_unit_tb.fuif.exec_RegWrite = 1'b0;

    #(forwarding_unit_tb.PERIOD * 2);

    if(forwarding_unit_tb.fuif.forward_a == 1'b1) $display("Test 1: PASSED");
    else $display("Test 1: FAILED");

  $stop;
  end
endprogram