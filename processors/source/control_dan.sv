/*
  Eric Villasenor
  evillase@gmail.com

  register file fpga wrapper
*/

// interface
`include "control_if.vh"

// memory types
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

module control (
	control_if.con conif
);
	
	opcode_t opcode;
	funct_t  rtype;

always_comb begin
	conif.jal_flag = 1'b0;
	conif.RegDst = 1'b0;
	conif.jr_flag = 1'b0;
	conif.j_jal_flag = 1'b0;
	conif.branch = 1'b0;
	conif.lui_flag = 1'b0;
	conif.ALUSrc = 1'b0;
	conif.MemRead = 1'b0;
	conif.MemWrite = 1'b0;
	conif.MemtoReg = 1'b0;
	conif.ALUop = ALU_SLL;
	conif.extend_immi = 1'b0;
	conif.RegWrite = 1'b0;
	conif.halt = 1'b0;
	conif.bne_flag = 1'b0;
	case(conif.instruction[31:26])
		J     : begin
			conif.j_jal_flag = 1'b1;
		end
		JAL   : begin
			conif.j_jal_flag = 1'b1;
			conif.jal_flag = 1'b1;
			conif.RegWrite = 1'b1;
		end
		BEQ   : begin
			conif.branch = 1'b1;
			conif.ALUop = ALU_XOR;
		end
		BNE   : begin 
			conif.branch = 1'b1;
			conif.ALUop = ALU_XOR;
			conif.bne_flag = 1'b1;
		end
		ADDI  : begin 
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_ADD;
			conif.MemtoReg = 1'b1;
			conif.RegWrite = 1'b1;
		end
		ADDIU : begin 
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_ADD;
			conif.MemtoReg = 1'b1;
			conif.RegWrite = 1'b1;
		end
		SLTI  : begin
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_SLT;
			conif.MemtoReg = 1'b1;			
		end
		SLTIU : begin
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_SLTU;
			conif.MemtoReg = 1'b1;
			conif.RegWrite = 1'b1;
		end
		ANDI  : begin
			conif.extend_immi = 1'b1;
			conif.ALUop = ALU_AND;
			conif.MemtoReg = 1'b1;
			conif.RegWrite = 1'b1;	
		end
		ORI   : begin
			conif.extend_immi = 1'b1;
			conif.ALUop = ALU_OR;
			conif.MemtoReg = 1'b1;	
			conif.RegWrite = 1'b1;	
		end
		XORI  : begin
			conif.extend_immi = 1'b1;
			conif.ALUop = ALU_XOR;
			conif.MemtoReg = 1'b1;	
			conif.RegWrite = 1'b1;		
		end
		LUI   : begin
			conif.lui_flag = 1'b1;
			conif.RegWrite = 1'b1;
		end
		LW    : begin
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_ADD;
			conif.MemRead = 1'b1;
			conif.RegWrite = 1'b1;
		end
		SW    : begin
			conif.ALUSrc = 1'b1;
			conif.ALUop = ALU_ADD;
			conif.MemWrite = 1'b1;
		end
		HALT  : begin
			conif.halt = 1'b1;
		end
		RTYPE : begin
			case(conif.instruction[5:0])
				SLLV  : begin
					conif.ALUop = ALU_SLL;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;
					conif.RegWrite = 1'b1;
				end
				SRLV  : begin
					conif.ALUop = ALU_SRL;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;		
					conif.RegWrite = 1'b1;			
				end
				JR   : begin
					conif.jr_flag = 1'b1;
				end
				ADD  : begin 
					conif.ALUop = ALU_ADD;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;
					conif.RegWrite = 1'b1;
				end
				ADDU : begin
					conif.ALUop = ALU_ADD;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;
					conif.RegWrite = 1'b1;				
				end
				SUB  : begin 
					conif.ALUop = ALU_SUB;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				SUBU : begin
					conif.ALUop = ALU_SUB;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				AND  : begin
					conif.ALUop = ALU_AND;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				OR   : begin
					conif.ALUop = ALU_OR;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;					
				end
				XOR  : begin
					conif.ALUop = ALU_XOR;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				NOR  : begin
					conif.ALUop = ALU_NOR;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				SLT  : begin
					conif.ALUop = ALU_SLT;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;	
					conif.RegWrite = 1'b1;				
				end
				SLTU : begin
					conif.ALUop = ALU_SLTU;
					conif.MemtoReg = 1'b1;
					conif.RegDst = 1'b1;		
					conif.RegWrite = 1'b1;			
				end
			endcase
		end
	endcase
end
endmodule




