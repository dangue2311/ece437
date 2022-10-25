/*
  Eric Villasenor
  evillase@gmail.com

  This is the block for the program counter, or PC
*/

// interface include
`include "program_counter_if.vh"
`include "cpu_types_pkg.vh"

module program_counter (
  input CLK, nRST,
  program_counter_if.pc pcif
);
  // type import
  import cpu_types_pkg::*;

  logic pcEN, pcEN2;
  word_t next_PC, new_pc_hold, new_pc_reg;

  always_comb begin
    if (pcif.new_PC == 32'b0) 
      new_pc_hold = new_pc_reg;
    else 
      new_pc_hold = pcif.new_PC;
  end

  assign pcEN = (pcif.ihit) & (~pcif.load_use) & (~pcif.jump_use);

  always_ff @(posedge CLK, negedge nRST) begin
    if(~nRST) begin
      pcif.PC <= '0;
      new_pc_reg <= '0;
    end
    else begin
      new_pc_reg <= new_pc_hold;
      if(pcEN2 && pcif.jump_sig == 2'd1)
        pcif.PC <= pcif.jump_add;
      else if (pcEN2 && pcif.jump_sig == 2'd2)
        pcif.PC <= pcif.jump_jr;
      else if ((pcif.load_use == 1'b0) && (pcif.jump_use == 1'b1) && (pcif.new_PC != 32'b0))
        pcif.PC <= pcif.new_PC;
      else if(pcEN) begin
        if (pcif.jump_sig == 2'd1 || pcif.jump_jr == 2'd2)
          pcif.PC <= pcif.PC +4;
        else
          pcif.PC <= next_PC;
      end
    end
  end

  always_ff @(posedge CLK, negedge nRST) begin
    if(~nRST) 
      pcEN2 <= 1'b0;
    else
      pcEN2 <= pcEN;
  end

  always_comb begin
    if (pcif.new_PC == '0)
      next_PC = pcif.PC + 4;
    else 
      next_PC = new_pc_hold;
  end

endmodule