/*
  Writeback Interface
*/
`ifndef WRITEBACK_IF_VH
`define WRITEBACK_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface writeback_if;
  // import types
  import cpu_types_pkg::*;

  logic         ihit, dhit, LUI, JAL, MemtoReg, regWEN_in, regWEN_out;
  regbits_t     write_reg_in, write_reg_out;
  logic [15:0]  imm;
  word_t        alu_out, read_mem, LowerZero, jal_addr, final_write_data;

  // register file ports

  //pcEN from ruif
  //ihit and dhit from cache?
  //new_PC from jump/branch select logic
  modport wb (
    input   ihit, dhit, LUI, JAL, MemtoReg, jal_addr, read_mem, imm, LowerZero, regWEN_in, write_reg_in, alu_out,
    output  final_write_data, regWEN_out, write_reg_out
  );
 
endinterface

`endif //WRITEBACK_IF_VH