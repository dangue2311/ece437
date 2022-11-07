// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "memory_if.vh"

module memory (
    input logic CLK, nRST,
    memory_if.memory memif
);

  // import types
  import cpu_types_pkg::*;

always_ff @ (posedge CLK, negedge nRST) begin   
    if (~nRST) begin   
        memif.lui_flag_next <= 1'b0;
        memif.jal_flag_next <= 1'b0;
        memif.memtoreg_next <= 1'b0;
        memif.regwrite_next <= 1'b0;
        memif.read_mem_next <= 32'b0;
        memif.j_jal_addr_next <= 32'b0;
        memif.lower_zero_next <= 32'b0;
        memif.regWEN_next <= 1'b0;
        memif.write_reg_next <= 5'b0;
        memif.halt_next <= 1'b0;
        memif.out_next <= 32'b0;
        memif.instruction_next <= 32'b0;
        memif.load_use_out <= 0;
        memif.memory_out <= '0;
        memif.jump_use_out <= '0;
    end
    else if ((memif.dhit || ~memif.enable) || memif.ihit || (memif.bne_eq == 1'd1)) begin //else if (memif.dhit || memif.ihit) begin
        memif.lui_flag_next <= memif.lui_flag;
        memif.jal_flag_next <= memif.jal_flag;
        memif.memtoreg_next <= memif.memtoreg;
        memif.regwrite_next <= memif.regwrite;
        memif.read_mem_next <= memif.read_mem;
        memif.j_jal_addr_next <= memif.j_jal_addr;
        memif.lower_zero_next <= memif.lower_zero;
        memif.regWEN_next <= memif.regWEN;
        memif.write_reg_next <= memif.write_reg;
        memif.halt_next <= memif.halt;
        memif.out_next <= memif.read_dat1;
        memif.instruction_next <= memif.instruction;
        memif.load_use_out <= memif.load_use;
        memif.memory_out <= memif.memory_in;
        memif.jump_use_out <= memif.jump_use;
    end
end

always_comb begin
    memif.addr_next = 32'b0;
    /*if (memif.jr_flag)
        memif.addr_next = memif.read_dat1;
    else if (memif.j_jal_flag)
        memif.addr_next = memif.j_jal_addr;*/
    if (~memif.zout && (memif.jump == 3) && memif.bne_flag)
        memif.addr_next = memif.branch_addr;
    else if (memif.zout && (memif.jump == 3) && ~memif.bne_flag)
        memif.addr_next = memif.branch_addr;
/*
    memif.memwrite_out = memif.memwrite;
    memif.memread_out = memif.memread;
    memif.out_out = memif.out;
    memif.read_dat2_out = memif.read_dat2;
*/
end

endmodule