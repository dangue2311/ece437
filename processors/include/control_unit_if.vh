/*
  Control Unit Interface
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// typedefs
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  // signals
  logic               PCSrc, MemtoReg, RegWEN, BNE, BEQ, LUI, JAL, JR, halt, dWEN, dREN, imemREN, ihit, dhit;
  logic [1:0]         ALUSrc, RegDest, JumpSel;
  word_t              inst;
  aluop_t             aluop;
  regbits_t           rs, rt, rd, init_write_reg, final_write_reg;
  logic [15:0]        imm;
  word_t              shamt;

  // port
  modport cu (
    input   inst, final_write_reg, ihit, dhit,
    output  aluop, rs, rt, rd, imm, shamt, PCSrc, MemtoReg, RegWEN, BNE, BEQ, LUI, JAL, JR, halt, dWEN, dREN, imemREN, ALUSrc, JumpSel, RegDest, init_write_reg
  );

  modport tb (
    input  aluop, rs, rt, rd, imm, shamt, PCSrc, MemtoReg, RegWEN, BNE, BEQ, LUI, JAL, JR, halt, dWEN, dREN, imemREN, ALUSrc, JumpSel, RegDest, init_write_reg,
    output inst, final_write_reg, ihit, dhit
  );
endinterface

`endif //CONTROL_UNIT_IF_VH