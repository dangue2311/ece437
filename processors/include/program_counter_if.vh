/*
  Program Counter Interface
*/
`ifndef PROGRAM_COUNTER_IF_VH
`define PROGRAM_COUNTER_IF_VH

// typedefs
`include "cpu_types_pkg.vh"

interface program_counter_if;
  // import types
  import cpu_types_pkg::*;

  // signals
  logic [1:0]         jump_sig;
  logic               ihit, dhit, jump_use, load_use;
  word_t              PC, new_PC, jump_add, jump_jr;

  // port
  modport pc (
    input   ihit, dhit, new_PC, jump_use, load_use, jump_sig, jump_add, jump_jr,
    output  PC
  );

  modport tb (
    input PC,
    output ihit, dhit, new_PC, jump_use, load_use, jump_sig, jump_add, jump_jr
  );
endinterface

`endif //PROGRAM_COUNTER_IF_VH
