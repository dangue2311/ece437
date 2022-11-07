/*
 Instruction Fetch Interface
*/
`ifndef INSTRUCTION_FETCH_IF_VH
`define INSTRUCTION_FETCH_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface instruction_fetch_if;
  // import types
  import cpu_types_pkg::*;

  logic [1:0]  jump_sig;
  logic     enable, ihit, dhit, jump_use, load_use;
  word_t    PC, pp4, new_PC, cache_in, instruction, jump_add, jump_jr, addr_curr;

  // register file ports

  //pcEN from ruif
  //ihit and dhit from cache?
  //new_PC from jump/branch select logic
  modport iftch (
    input   enable, ihit, dhit, new_PC, cache_in, jump_use, load_use, jump_sig, jump_add, jump_jr,
    output  PC, pp4, instruction, addr_curr
  );
  // register file tb
  modport tb (
    input PC, pp4, instruction,
    output ihit, dhit, new_PC, cache_in, jump_use, load_use, jump_sig, jump_add, jump_jr
  );
endinterface

`endif //INSTRUCTION_FETCH_IF_VH