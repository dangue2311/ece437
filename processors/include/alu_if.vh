/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/

`ifndef ALU_IF_VH
`define ALU_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  logic     zero, overflow, negative;
  aluop_t   aluop;
  word_t    portA, portB, outport;

  // alu file ports
  modport  alu(
    input   portA, portB, aluop,
    output  zero, overflow, negative, outport
  );
  
  // alu file tb
  modport tb (
    input   zero, overflow, negative, outport,
    output  portA, portB, aluop
  );
endinterface

//testing commit stuff

`endif //REGISTER_FILE_IF_VH
