/*
  Eric Villasenor
  dgue@gmail.com

  execution interface
*/

`ifndef EXECUTION_IF_VH
`define EXECUTION_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface execution_if;
  // import types
  import cpu_types_pkg::*;

  logic     ihit, dhit, flushed, load_use, load_use_out, jump_use, jump_use_out;
  logic     bne_flag, extend_immi, z_out;
  logic     jr_flag, j_jal_flag, mem_write, mem_read;
  logic     lui_flag, jal_flag, memtoreg, bne_flag_out;
  aluop_t   aluop;
  regbits_t write_reg, write_reg_next;
  word_t    addr_curr4, read_dat1, read_dat2, sign_extend, zero_extend, lower_zero, branch_addr, out;
  word_t    read_dat1_next, read_dat2_next, lower_zero_next;
  word_t    j_jal_addr, j_jal_addr_next, read_mem_next;
  logic     jr_flag_next, j_jal_flag_next, mem_write_next, mem_read_next;
  logic     lui_flag_next, jal_flag_next, memtoreg_next;
  logic     enable, regWEN_next, halt_next, halt, regWEN, bne_eq, use_load;
  word_t    read_mem, instruction, instruction_next;
  logic[1:0] forward_a, forward_b;
  word_t    forward_alu, forward_mem;
  logic[1:0] jump, jump_out, ALUSrc;
  logic[27:0] shift_inst;

  // alu file ports
  modport  execution(
    input   enable, ihit, dhit, halt, load_use, jump_use, use_load,
            bne_flag, ALUSrc, extend_immi,
            shift_inst, jr_flag, j_jal_flag, mem_write, mem_read,
            lui_flag, jal_flag, memtoreg, 
            aluop, j_jal_addr, bne_eq,
            addr_curr4, read_dat1, read_dat2, 
            sign_extend, zero_extend, lower_zero, 
            write_reg, flushed, read_mem, regWEN, instruction,
            forward_a, forward_b, forward_alu, forward_mem, jump,

    output  out, branch_addr, z_out, regWEN_next, read_mem_next, load_use_out, jump_use_out,
            read_dat1_next, read_dat2_next, jump_out, bne_flag_out,
            write_reg_next, j_jal_addr_next, halt_next,
            jr_flag_next, j_jal_flag_next, mem_write_next, mem_read_next,
            lui_flag_next, jal_flag_next, memtoreg_next, lower_zero_next, instruction_next
  );
  
  // alu file tb
  modport tb (
    input   out, branch_addr, z_out, bne_eq,
            read_dat1_next, read_dat2_next, 
            write_reg_next, j_jal_addr_next,
            jr_flag_next, j_jal_flag_next, mem_write_next, mem_read_next,
            lui_flag_next, jal_flag_next, memtoreg_next, lower_zero_next,
            
    output  ihit, dhit,
            bne_flag, ALUSrc, extend_immi,
            jr_flag, j_jal_flag, mem_write, mem_read,
            lui_flag, jal_flag, memtoreg, 
            aluop, j_jal_addr,
            addr_curr4, read_dat1, read_dat2, 
            sign_extend, zero_extend, lower_zero, 
            write_reg, flushed,
            forward_a, forward_b, forward_alu, forward_mem
  );
endinterface

//testing commit stuff

`endif //EXECUTION_IF_VH
