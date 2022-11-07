/*
 Instruction Fetch Interface
*/
`ifndef DECODE_IF_VH
`define DECODE_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface decode_if;
  // import types
  import cpu_types_pkg::*;

  logic               enable, PCSrc, bne_eq, MemtoReg, RegWEN, in_WEN, out_WEN, BNE, BEQ, LUI, JAL, JR, halt, dWEN, dREN, ihit, dhit, load_use, jump_use_out, jump_use, flushed, load_use_out;
  logic [1:0]         ALUSrc, RegDest, JumpSel, JumpSel_inst;
  word_t              inst_addr, instruction, pp4_in, pp4_out, write_data, SignExt, ZeroExt, JumpAddr, LowerZero, shamt;
  regbits_t           rs, rt, rd, init_write_reg, final_write_reg;
  aluop_t             aluop;
  logic [15:0]        imm;
  word_t              rdat1, rdat2, inst_out, JumpAddr_inst, JumpJr_inst;
  logic [27:0]        shift_inst;


  //Modports
  modport de (
    input   enable, inst_addr, bne_eq, ihit, dhit, instruction, final_write_reg, pp4_in, write_data, in_WEN, load_use, flushed, jump_use,
    output  shift_inst, pp4_out, inst_out, rs, rt, rd, rdat1, rdat2, aluop, JumpSel_inst, JumpAddr_inst, JumpJr_inst, imm, shamt, PCSrc, out_WEN, MemtoReg, RegWEN, jump_use_out, BNE, BEQ, LUI, JAL, JR, halt, dWEN, dREN, ALUSrc, JumpSel, RegDest, SignExt, ZeroExt, JumpAddr, LowerZero, load_use_out, init_write_reg
  );

endinterface

`endif //DECODE_IF_VH