//Program is modified from the demo in class
`include "cpu_types_pkg.vh"
`include "control_unit_if.vh"

module control_unit(
  control_unit_if.cu cuif
);

import cpu_types_pkg::*;
opcode_t opcode;
funct_t func;

assign opcode = opcode_t'(cuif.inst[31:26]);
assign func = funct_t'(cuif.inst[5:0]);

always_comb begin
	cuif.PCSrc = 0;
	cuif.MemtoReg = 0;
	cuif.RegWEN = 0; 
	cuif.JAL = 0; 
	cuif.JR = 0;
	cuif.halt = 0;
	cuif.dWEN = 0; 
	cuif.dREN = 0; 
	cuif.LUI = 0; 
	cuif.BNE = 0;
	cuif.ALUSrc = 0; 
	cuif.RegDest = 0; 
	cuif.JumpSel = 0; 
	cuif.aluop = ALU_SLL; 
	cuif.rs = 0;
	cuif.rt = 0; 
	cuif.rd = 0; 
	cuif.imm = 0; 
	cuif.shamt = 0;
	cuif.BEQ = 0;
	cuif.atomic = 0;

    //RTYPE
	if (opcode == RTYPE) begin
		cuif.rs = cuif.inst[25:21];
		cuif.rt = cuif.inst[20:16];
		cuif.rd = cuif.inst[15:11];
		cuif.RegDest = 0;
		casez(cuif.inst[5:0])
			SLLV: begin
				cuif.aluop = ALU_SLL;
				cuif.ALUSrc = 0;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SRLV: begin
				cuif.aluop = ALU_SRL;
				cuif.ALUSrc = 0;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			JR: begin
				cuif.JR = 1;
				cuif.JumpSel = 2;
			end
			ADD: begin
				cuif.aluop = ALU_ADD;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;

			end
			ADDU: begin
				cuif.aluop = ALU_ADD;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SUB: begin
				cuif.aluop = ALU_SUB;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SUBU: begin
				cuif.aluop = ALU_SUB;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			AND: begin
				cuif.aluop = ALU_AND;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			OR: begin
				cuif.aluop = ALU_OR;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			XOR: begin
				cuif.aluop = ALU_XOR;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;

			end
			NOR: begin
				cuif.aluop = ALU_NOR;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SLT: begin 
				cuif.aluop = ALU_SLT;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SLTU: begin
				cuif.aluop = ALU_SLTU;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
		endcase
	end 
    else if (opcode == J) begin
		cuif.JumpSel = 1;	
	end 
    else if (opcode == JAL) begin
		cuif.JAL = 1;
		cuif.RegDest = 2;
		cuif.JumpSel = 1;
		if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
    //ITYPE
	end 
    else begin
		cuif.RegDest = 1;
		cuif.rs = cuif.inst[25:21];
		cuif.rt = cuif.inst[20:16];
		cuif.imm = cuif.inst[15:0];
		casez(cuif.inst[31:26])
			BEQ: begin
				cuif.aluop = ALU_SUB;
				cuif.PCSrc = 1;
				cuif.JumpSel = 3;
				cuif.BEQ = 1;
			end
			BNE: begin
				cuif.aluop = ALU_SUB;
				cuif.BNE = 1;
				cuif.PCSrc = 1;
				cuif.JumpSel = 3;
			end
			ADDI: begin
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			ADDIU: begin
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SLTI: begin
				cuif.aluop = ALU_SLT;
				cuif.ALUSrc = 1;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			SLTIU: begin
				cuif.aluop = ALU_SLT;
				cuif.ALUSrc = 1;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;

			end
			ANDI: begin
				cuif.aluop = ALU_AND;
				cuif.ALUSrc = 2;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			ORI: begin
				cuif.aluop = ALU_OR;
				cuif.ALUSrc = 2;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			XORI: begin
				cuif.aluop = ALU_XOR;
				cuif.ALUSrc = 2;
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			LUI: begin
				cuif.LUI = 1;
				cuif.shamt = {cuif.imm,16'b0};
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			LW: begin
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
				cuif.MemtoReg = 1;
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
				cuif.dREN = 1;
			end
			SW: begin
				cuif.dWEN = 1;
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
			end
			LL: begin
		        if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
				cuif.MemtoReg = 1;
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
				cuif.dREN = 1;
				cuif.atomic = 1;
			end
			SC: begin
				cuif.dWEN = 1;
				cuif.aluop = ALU_ADD;
				cuif.ALUSrc = 1;
				cuif.atomic = 1;
				if(cuif.dhit | cuif.ihit) cuif.RegWEN = 1;
			end
			HALT: begin
				cuif.halt = 1;
			end
		endcase
	end
end

endmodule