/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/

`ifndef CONTROL_IF_VH
`define CONTROL_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_if;
  // import types
  import cpu_types_pkg::*;

  word_t     instruction;
  logic      jal_flag, RegDst, jr_flag, j_jal_flag, branch, lui_flag, ALUSrc, MemRead;
  logic      MemWrite, MemtoReg, extend_immi, RegWrite, halt, bne_flag, ihit, dhit;
  aluop_t    ALUop;

  // register file ports
  modport con(
    input   instruction, dhit, ihit , 
    output  bne_flag, jal_flag, RegDst, jr_flag, j_jal_flag, branch, lui_flag, ALUSrc, MemRead, MemWrite, MemtoReg, ALUop, extend_immi, RegWrite, halt
  );
  
  // register file tb
  modport tb (
    input   jal_flag, RegDst, branch, lui_flag, ALUSrc, MemRead, MemWrite, MemtoReg, ALUop, extend_immi, RegWrite,
    output  instruction
  );
endinterface

//testing commit stuff

`endif //REGISTER_FILE_IF_VH
