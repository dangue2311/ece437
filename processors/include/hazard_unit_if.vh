/*
  Control Unit Interface
*/
`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

// typedefs
`include "cpu_types_pkg.vh"

interface hazard_unit_if;
  // import types
  import cpu_types_pkg::*;

  // signals
  logic          load_use, jump_use;
  word_t         fetch_instruction, dec_instruction, exec_instruction, mem_instruction;
  logic          flag_lu, flag_ju, flag_lu_done, flag_ju_done;     

  // port
  modport hu (
    input   fetch_instruction, dec_instruction, exec_instruction, flag_lu_done, flag_ju_done, mem_instruction,
    output  load_use, jump_use, flag_lu, flag_ju
  );

  modport tb (
    input   load_use, jump_use, flag_lu, flag_ju,
    output  fetch_instruction, dec_instruction, exec_instruction, flag_lu_done, flag_ju_done
  );
endinterface

`endif //HAZARD_UNIT_IF