/*
  Control Unit Interface
*/
`ifndef FORWARDING_UNIT_IF_VH
`define FORWARDING_UNIT_IF_VH

// typedefs
`include "cpu_types_pkg.vh"

interface forwarding_unit_if;
  // import types
  import cpu_types_pkg::*;

  // signals
  logic               exec_RegWrite, mem_RegWrite;
  logic [1:0]         forward_a, forward_b;
  word_t              dec_instruction, exec_instruction, mem_instruction;

  // port
  modport fu (
    input   dec_instruction, exec_instruction, mem_instruction, exec_RegWrite, mem_RegWrite,
    output  forward_a, forward_b
  );

  modport tb (
    input     forward_a, forward_b,
    output    dec_instruction, exec_instruction, mem_instruction, exec_RegWrite, mem_RegWrite
  );
endinterface

`endif //FORWARDING_UNIT_IF_VH