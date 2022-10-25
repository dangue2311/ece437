/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/
`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic halt, ihit, dhit, iREN, dREN, dWEN, MemWrite, MemRead;

  // register file ports
  modport ru (
    input   halt, ihit, dhit, MemWrite, MemRead,
    output  iREN, dREN, dWEN
  ); //dhit is an internal signal
  // register file tb
  modport tb (
    input   iREN, dREN, dWEN,
    output  halt, ihit, dhit, MemWrite, MemRead
  );
endinterface

`endif //REQUEST_UNIT_IF_VH

