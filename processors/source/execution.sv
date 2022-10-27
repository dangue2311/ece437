// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "alu_if.vh"

module execution (
    input logic CLK, nRST,
    execution_if.execution exeif
);
    // import types
    import cpu_types_pkg::*;

    alu_if aluif();
    alu Addstuffshere(aluif);

    logic [31:0] branch_addr_calc;
    logic zero_check, delay, delay1, delay2;
    logic [17:0] sign_extend_lefttwo;
    logic [31:0] read_data_choose;
    logic [31:0] alu_in_1;

always_ff @ (posedge CLK, negedge nRST) begin
    if (~nRST) begin
        exeif.out <= 32'b0;
        exeif.branch_addr <= 32'b0;
        exeif.z_out <= 1'b0;
        exeif.read_dat1_next <= 32'b0;
        exeif.read_dat2_next <= 32'b0;
        exeif.write_reg_next <= 5'b0;
        exeif.jr_flag_next <= 1'b0;
        exeif.j_jal_flag_next <= 1'b0;
        exeif.mem_write_next <= 1'b0;
        exeif.mem_read_next <= 1'b0;
        exeif.lui_flag_next <= 1'b0;
        exeif.jal_flag_next <= 1'b0;
        exeif.memtoreg_next <= 1'b0;
        exeif.j_jal_addr_next <= 32'b0;
        exeif.lower_zero_next <= 32'b0;
        exeif.regWEN_next <= 1'b0;
        exeif.read_mem_next <= 32'b0;
        exeif.halt_next <= 1'b0;
        exeif.instruction_next <= 32'b0;
        exeif.load_use_out <= 0;
        exeif.jump_use_out <= 0;
        exeif.jump_out <= 2'b0;
        exeif.bne_flag_out <= 1'b0;
        delay <= 1'b0;
        delay1 <= 1'b0;
    end
    else begin
        if (exeif.ihit || exeif.dhit || (exeif.bne_eq == 1'd1 && (~exeif.mem_read_next && ~exeif.mem_write_next))) begin
            exeif.out <= aluif.outport;
            exeif.branch_addr <= (exeif.sign_extend << 2) + exeif.addr_curr4;
            //exeif.z_out <= (exeif.bne_flag == 1'b0) ? aluif.zero : ~aluif.zero;
            //exeif.z_out <= zero_check;
            exeif.z_out <= aluif.zero;
            exeif.read_dat1_next <= exeif.read_dat1;
            exeif.read_dat2_next <= exeif.read_dat2;
            exeif.write_reg_next <= exeif.write_reg;
            exeif.jr_flag_next <= exeif.jr_flag;
            exeif.j_jal_flag_next <= exeif.j_jal_flag;
            exeif.mem_write_next <= exeif.mem_write;
            exeif.mem_read_next <= exeif.mem_read;
            exeif.lui_flag_next <= exeif.lui_flag;
            exeif.jal_flag_next <= exeif.jal_flag;
            exeif.memtoreg_next <= exeif.memtoreg;
            exeif.j_jal_addr_next <= exeif.j_jal_addr;
            exeif.lower_zero_next <= exeif.lower_zero;
            exeif.regWEN_next <= exeif.regWEN;
            exeif.read_mem_next <= exeif.read_mem;
            exeif.halt_next <= exeif.halt;
            exeif.instruction_next <= exeif.instruction;
            //exeif.load_use_out <= exeif.load_use;
            delay <= exeif.load_use;
            delay1 <= delay;
            exeif.load_use_out <= delay1;
            
            exeif.jump_use_out <= exeif.jump_use;
            exeif.jump_out <= exeif.jump;
            exeif.bne_flag_out <= exeif.bne_flag;
        end
    end
end

always_comb begin

//    sign_extend_lefttwo = exeif.sign_extend << 2;
    branch_addr_calc = (exeif.sign_extend << 2) + exeif.addr_curr4;

    if (exeif.bne_flag == 1'b0)
        zero_check = aluif.zero;
    else   
        zero_check = ~aluif.zero;

    read_data_choose = exeif.read_dat2;
    if (exeif.ALUSrc == 2'b1)
        read_data_choose = exeif.sign_extend;
    else if (exeif.ALUSrc == 2'd2)
        read_data_choose = exeif.zero_extend;
    /*
    else if (exeif.forward_b == 2'd1)
        read_data_choose = exeif.forward_alu;
    else if (exeif.forward_b == 2'd2)
        read_data_choose = exeif.forward_mem; */

    alu_in_1 = exeif.read_dat1;
    /*if (exeif.forward_a == 2'd1)   
        alu_in_1 = exeif.forward_alu;
    else if (exeif.forward_a == 2'd2)
        alu_in_1 = exeif.forward_mem; */

    aluif.portA = alu_in_1;
	aluif.portB = read_data_choose;
	aluif.aluop = exeif.aluop;
end

endmodule