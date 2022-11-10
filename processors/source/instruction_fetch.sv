//INSTRUCTION FETCH BLOCK

`include "cpu_types_pkg.vh"
`include "program_counter_if.vh"

module instruction_fetch (
    input logic CLK, nRST,
    instruction_fetch_if.iftch ifif
);

//bobobobob

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PCV;

  //interfaces
  program_counter_if pcif();

  //DUTs
  program_counter PC(CLK, nRST, pcif);

  word_t next_pp4;
  logic  halt_reg, halt_hold;

  //Change ihit
  assign pcif.ihit = ifif.ihit;
  assign pcif.dhit = ifif.dhit;
  assign pcif.enable = ifif.enable;
  assign pcif.load_use = ifif.load_use;
  assign pcif.jump_use = ifif.jump_use;
  assign pcif.new_PC = ifif.new_PC;
  assign pcif.jump_jr = ifif.jump_jr;
  assign pcif.jump_sig = ifif.jump_sig;
  assign pcif.jump_add = ifif.jump_add;
  assign next_pp4 = ((ifif.load_use == 1'b0) && (ifif.jump_use == 1'b1)) ? (ifif.new_PC + 4) : (ifif.jump_sig == 2'd1) ? (ifif.jump_add + 4) : (ifif.jump_sig == 2'd2) ? (ifif.jump_jr + 4) : (pcif.PC + 4);

  always_comb begin
    halt_hold = halt_reg;
    if (ifif.cache_in[31:26] == 6'b111111) 
      halt_hold = 1'b1;
  end

  always_ff @(posedge CLK, negedge nRST) begin
    if(~nRST) begin
      ifif.PC <= PC_INIT;
      ifif.instruction <= PC_INIT;
      ifif.pp4 <= '0;
      halt_reg <= 1'b0;
      ifif.addr_curr <= 1'b0;
    end

    else begin //If ihit or dhit, latch PC values
      halt_reg <= halt_hold;
      if (halt_hold && ~ifif.load_use) begin
        ifif.instruction <= 32'hffffffff;
      end
      else begin
        if ((ifif.dhit) && ~ifif.load_use && ~ifif.jump_use) begin //~ifif.enable
          ifif.instruction <= 32'b0;
          ifif.addr_curr <= ifif.PC;
        end
        else if (ifif.ihit && ~ifif.load_use && ~ifif.jump_use) begin //ifif.dhit
          ifif.instruction <= ifif.cache_in;
          ifif.addr_curr <= ifif.PC;
        end
        else if (ifif.jump_use && ~ifif.load_use) begin
          ifif.instruction <= 32'b0;
          ifif.addr_curr <= ifif.PC;
        end
        if (ifif.cache_in[31:26] == 6'b000010) begin
          ifif.PC <= {next_pp4[31:28],ifif.cache_in[25:0],2'b0};
          ifif.pp4 <= next_pp4;
        end
        else if (ifif.jump_sig == 2'd1 && ~ifif.load_use && ~ifif.jump_use) begin
          ifif.PC <= ifif.jump_add;
          ifif.pp4 <= next_pp4;
        end
        else if (ifif.jump_sig == 2'd2) begin // && ~ifif.load_use && ~ifif.jump_use) begin
          ifif.PC <= ifif.jump_jr;
          ifif.pp4 <= next_pp4;
        end
        else if ((ifif.load_use == 1'b0) && (ifif.jump_use == 1'b1) && (ifif.new_PC != 32'b0)) begin
          ifif.PC <= ifif.new_PC;
          ifif.pp4 <= next_pp4;
        end
        else if ((ifif.ihit) && ~ifif.load_use && ~ifif.jump_use) begin
          ifif.PC <= pcif.PC;
          ifif.pp4 <= next_pp4;
        end
      end
    end
  end 

endmodule