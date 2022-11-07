//INSTRUCTION FETCH BLOCK

`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"
`include "decode_if.vh"

module decode (
    input logic CLK, nRST,
    decode_if.de deif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  //interfaces
  control_unit_if cuif();
  register_file_if rfif();

  //DUTs
  control_unit CTRL(cuif);
  register_file REGF(CLK, nRST, rfif);

  //New Signals
  word_t next_SignExt, next_ZeroExt, next_JumpAddr, next_LowerZero, next_init_write_reg, pp4_out_clk;
  logic next_out_WEN;
  logic [27:0] next_shift_inst;

  //Assign variables (assuming we want just input values) 
  assign next_SignExt = (deif.instruction[15] == 1) ? {16'hffff,deif.instruction[15:0]} : {16'h0000,deif.instruction[15:0]};
  assign next_ZeroExt = {16'h0000, deif.instruction[15:0]};
  assign next_JumpAddr = pp4_out_clk;
  //assign next_JumpAddr = {deif.pp4_in[31:28],deif.instruction[25:0],2'b00};
  assign next_LowerZero = {deif.instruction[15:0], 16'h0000};
  assign next_shift_inst = deif.instruction[25:0] << 2;
  
  //Assign CUIF Signals
  assign cuif.ihit = deif.ihit;
  assign cuif.dhit = deif.dhit;
  assign cuif.inst = deif.instruction;

  //Assign RFIF Signals
  assign rfif.WEN = deif.in_WEN;
  assign rfif.wsel = deif.final_write_reg;
  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  assign rfif.wdat = deif.write_data;

  //Assign DEIF Signal
  assign next_init_write_reg = (cuif.RegDest == 0) ? (cuif.rd) : (cuif.RegDest == 1) ? cuif.rt : (cuif.RegDest == 2) ? 5'd31 : 5'd0;
  //assign next_out_WEN = cuif.RegWEN;// & (deif.ihit | deif.dhit);

  //need signals instantly
  assign deif.JumpSel_inst = cuif.JumpSel;
  assign deif.JumpAddr_inst = {deif.pp4_in[31:28],deif.instruction[25:0],2'b00};
  assign deif.JumpJr_inst = rfif.register31;

  //LATCH
  always_ff @(posedge CLK, negedge nRST) begin
    if(~nRST) begin //||deif.load_use
      pp4_out_clk <= 0;
      deif.PCSrc <= 0;
	    deif.MemtoReg <= 0;
      deif.RegWEN <= 0; 
      deif.JAL <= 0;
      deif.JR <= 0;
      deif.halt <= 0;
      deif.dWEN <= 0; 
      deif.dREN <= 0; 
      deif.LUI <= 0; 
      deif.BNE <= 0;
      deif.BEQ <= 0;
      deif.ALUSrc <= 0; 
      deif.RegDest <= 0; 
      deif.JumpSel <= 0; 
      deif.aluop <= ALU_SLL; 
      deif.imm <= 0; 
      deif.shamt <= 0;
      deif.SignExt <= 0;
      deif.ZeroExt <= 0;
      deif.JumpAddr <= 0;
      deif.LowerZero <= 0;
      deif.rs <= 0;
      deif.rt <= 0;
      deif.rd <= 0;
      deif.rdat1 <= 0;
      deif.rdat2 <= 0;
      deif.init_write_reg <= 0;
      deif.out_WEN <= 0;
      deif.pp4_out <= 0;
      deif.inst_out <= 0;
      deif.jump_use_out <= 0;
      deif.shift_inst <= 0;
    end
/*
    else if(deif.load_use) begin
      deif.PCSrc <= 0;
	    deif.MemtoReg <= 0;
      deif.RegWEN <= 0; 
      deif.JAL <= 0;
      deif.JR <= 0;
      deif.halt <= 0;
      deif.dWEN <= 0; 
      deif.dREN <= 0; 
      deif.LUI <= 0; 
      deif.BNE <= 0;
      deif.BEQ <= 0;
      deif.ALUSrc <= 0; 
      deif.RegDest <= 0; 
      deif.JumpSel <= 0; 
      deif.aluop <= ALU_SLL; 
      deif.imm <= 0; 
      deif.shamt <= 0;
      deif.SignExt <= 0;
      deif.ZeroExt <= 0;
      deif.JumpAddr <= 0;
      deif.LowerZero <= 0;
      deif.rs <= 0;
      deif.rt <= 0;
      deif.rd <= 0;
      deif.rdat1 <= 0;
      deif.rdat2 <= 0;
      deif.init_write_reg <= 0;
      deif.out_WEN <= 0;
      deif.pp4_out <= 0;
      deif.inst_out <= 0;
      deif.jump_use_out <= 0;
    end
*/
    else if ((deif.ihit || (deif.dhit || ~deif.enable) || deif.bne_eq) && (deif.load_use == 1'b0)) begin //If ihit or dhit, latch PC values
      //if(~deif.load_use) begin //||~deif.load_use

        pp4_out_clk <= deif.pp4_out;
        deif.PCSrc <= cuif.PCSrc;
        deif.MemtoReg <= cuif.MemtoReg;
        deif.RegWEN <= cuif.RegWEN; 
        deif.JAL <= cuif.JAL; 
        deif.JR <= cuif.JR;
        deif.halt <= cuif.halt;
        deif.dWEN <= cuif.dWEN; 
        deif.dREN <= cuif.dREN; 
        deif.LUI <= cuif.LUI; 
        deif.BNE <= cuif.BNE;
        deif.BEQ <= cuif.BEQ;
        deif.ALUSrc <= cuif.ALUSrc; 
        deif.RegDest <= cuif.RegDest; 
        deif.JumpSel <= cuif.JumpSel; 
        deif.aluop <= cuif.aluop; 
        deif.imm <= cuif.imm; 
        deif.shamt <= cuif.shamt;
        deif.SignExt <= next_SignExt;
        deif.ZeroExt <= next_ZeroExt;
        deif.JumpAddr <= deif.pp4_out + 4;
        deif.LowerZero <= next_LowerZero;
        deif.rdat1 <= rfif.rdat1;
        deif.rdat2 <= rfif.rdat2;
        deif.rs <= cuif.rs;
        deif.rt <= cuif.rt;
        deif.rd <= cuif.rd;
        deif.init_write_reg <= next_init_write_reg;
        deif.out_WEN <= next_out_WEN;
        deif.pp4_out <= deif.inst_addr + 4;
        deif.inst_out <= deif.instruction;
        deif.jump_use_out <= deif.jump_use;
        deif.shift_inst <= next_shift_inst;
      //end
      /*
      else begin
        deif.PCSrc <= deif.PCSrc;
        deif.MemtoReg <= deif.MemtoReg;
        deif.RegWEN <= deif.RegWEN; 
        deif.JAL <= deif.JAL; 
        deif.JR <= deif.JR;
        deif.halt <= deif.halt;
        deif.dWEN <= deif.dWEN; 
        deif.dREN <= deif.dREN; 
        deif.LUI <= deif.LUI;
        deif.BNE <= deif.BNE;
        deif.BEQ <= deif.BEQ;
        deif.ALUSrc <= deif.ALUSrc; 
        deif.RegDest <= deif.RegDest; 
        deif.JumpSel <= deif.JumpSel; 
        deif.aluop <= deif.aluop; 
        deif.imm <= deif.imm; 
        deif.shamt <= deif.shamt;
        deif.SignExt <= next_SignExt;
        deif.ZeroExt <= next_ZeroExt;
        deif.JumpAddr <= next_JumpAddr;
        deif.LowerZero <= next_LowerZero;
        deif.rs <= deif.rs;
        deif.rt <= deif.rt;
        deif.rd <= deif.rd;
        deif.rdat1 <= rfif.rdat1;
        deif.rdat2 <= rfif.rdat2;
        deif.init_write_reg <= next_init_write_reg;
        deif.out_WEN <= next_out_WEN;
        deif.pp4_out <= deif.pp4_out; 
        deif.inst_out <= deif.inst_out;
        deif.jump_use_out <= deif.jump_use_out;
      end
      */
    end
  end
endmodule