/*
  Eric Villasenor
  dgue@gmail.com

  execution interface
*/

`ifndef MEMORY_IF_VH
`define MEMORY_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface memory_if;
  // import types
  import cpu_types_pkg::*; 

  logic lui_flag, jal_flag, memtoreg, regwrite, load_use, load_use_out;
  logic jr_flag, j_jal_flag ,stall;
  word_t read_mem, read_mem_next, j_jal_addr_next;
  word_t lower_zero_next, branch_addr;
  logic regWEN_next, regWEN, jump_use, jump_use_out;
  logic [4:0] write_reg_next, write_reg;
  word_t memory_in, memory_out;

  logic lui_flag_next, jal_flag_next, memtoreg_next;
  logic regwrite_next; 
  word_t addr_next;
  logic memwrite_out, memread_out;
  word_t out_out, read_dat2_out;
  logic dhit, ihit, flushed, zout;
  word_t j_jal_addr, lower_zero;
  word_t read_dat1, out_next, instruction, instruction_next;
  logic memwrite, memread, halt, halt_next;
  logic[2:0] jump;
  logic bne_eq, bne_flag, use_load, enable;
  //word_t reg_data, reg_data_next;

  // alu file ports
  modport  memory(
    input   enable, lui_flag, jal_flag, memtoreg, regwrite, load_use,
            jr_flag, j_jal_flag, branch_addr, use_load,
            read_mem, dhit, ihit, flushed, jump_use,
            j_jal_addr, lower_zero, regWEN,
            write_reg, zout, halt, bne_eq, bne_flag,
            read_dat1, instruction, memory_in, jump,
    output  
            lui_flag_next, jal_flag_next, memtoreg_next, load_use_out,
            regwrite_next, addr_next, jump_use_out,
            memwrite_out, memread_out,
            out_out, read_dat2_out, halt_next,
            read_mem_next, j_jal_addr_next,
            lower_zero_next, regWEN_next, write_reg_next,
            out_next, instruction_next, memory_out
  );
  
  // alu file tb
  modport tb (
    input   lui_flag_next, jal_flag_next, memtoreg_next,
            regwrite_next, addr_next,
            memwrite_out, memread_out, memory_out,
            out_out, read_dat2_out, instruction_next,
    output  lui_flag, jal_flag, memtoreg, regwrite, bne_flag,
            jr_flag, j_jal_flag, branch_addr, bne_eq,
            read_mem, dhit, ihit, flushed, instruction, memory_in
  );
endinterface

//testing commit stuff

`endif //MEMORY_IF_VH
