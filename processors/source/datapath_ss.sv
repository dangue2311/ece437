/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "alu_if.vh"
`include "request_unit_if.vh"
`include "register_file_if.vh"
`include "control_if.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

	//interface
	alu_if aluif();
	request_unit_if ruif();
	register_file_if rfif();
	control_if conif();
	
	//DUT
	alu hey(aluif);
	request_unit heyy(CLK, nRST, ruif);
	register_file heyyy(CLK, nRST, rfif);
	control heyyyy(conif);
	
	//initialize
	logic ihit, zero;
	logic [31:0] addr_curr, addr_curr4, j_jal_addr, branch_addr, addr_nxt;
	logic [31:0] instruction, addr_curr_nxt;
	int reg_31 = 31;
	int p4 = 4;
	logic [31:0] instruction_low16, instruction_0extend, instruction_signextend;
	logic [31:0] read_data1, read_data2, read_data_sh2, addr_data, read_memory;
	logic halt, jal_flag, RegDst, jr_flag, j_jal_flag, branch;
	logic LUI_flag, bne_flag, ALUSrc, MemRead, Memwrite, MemtoReg, extend_immi, RegWrite;
	logic zero_check, branch_check;
	aluop_t ALUop;
	logic [27:0] instruction_sh2;
	logic [31:0] write_data;
	logic [4:0] write_reg;
	logic [31:0] in_2;

	//loading next ins 
	always_ff @ (posedge CLK, negedge nRST) begin
		if (nRST == 1'b0) begin
			addr_curr = 0;
		end
		else begin
			//addr_curr = addr_curr_nxt;
			if(dpif.ihit == 1'b1) 
				addr_curr = addr_nxt;
		end
	end
	
always_comb begin
	addr_nxt = addr_curr;
	//address stuff
	addr_curr4 = addr_curr + p4;
	instruction_sh2 = dpif.imemload[25:0] << 2;
	j_jal_addr = {addr_curr4[31:28], instruction_sh2};
//	read_data_sh2 = instruction_signextend << 2;
//	branch_addr = read_data_sh2 + addr_curr4;
//	branch_check = zero_check && conif.branch;
	
	addr_nxt = addr_curr4;
	if (conif.jr_flag == 1'b1)
		addr_nxt = rfif.rdat1;
	else if (conif.j_jal_flag == 1'b1)
		addr_nxt = j_jal_addr;
//	else if (branch_check == 1'b1)
//		addr_nxt = branch_addr;
	
	//instruction changes
	if (dpif.imemload[15] == 1'b1)
		instruction_signextend = {16'hffff,dpif.imemload[15:0]};
	else
		instruction_signextend = {16'b0,dpif.imemload[15:0]};

	instruction_low16 = {dpif.imemload[15:0],16'b0};
	instruction_0extend = {16'b0,dpif.imemload[15:0]};
	read_data_sh2 = instruction_signextend << 2;
	branch_addr = read_data_sh2 + addr_curr4;


	//zero
	if (conif.bne_flag == 1'b0)
		zero_check = aluif.zero;
	else
		zero_check = ~aluif.zero;

	//fuck u branch check	
	branch_check = zero_check && conif.branch;	
	if (branch_check == 1'b1)
		addr_nxt = branch_addr;

	//writedata
	write_data = dpif.dmemload;
	if (conif.MemtoReg == 1'b1)
		write_data = aluif.outport;
	else if (conif.jal_flag == 1'b1)
		write_data = addr_curr4;
	else if (conif.lui_flag == 1'b1) 
		write_data = instruction_low16;
	
	//writereg
	write_reg = dpif.imemload[20:16];
	if (conif.RegDst == 1'b1) 
		write_reg = dpif.imemload[15:11];
	else if (conif.jal_flag == 1'b1)
		write_reg = reg_31;
	
	//in2
	in_2 = rfif.rdat2;
	if (conif.ALUSrc == 1'b1)
		in_2 = instruction_signextend;
	else if (conif.extend_immi == 1'b1)
		in_2 = instruction_0extend;
	
	//functions
	//conif.instruction = ihit | dmemREN | dmemWEN ? dpif.imemload : 0;
	conif.instruction = dpif.imemload;
	conif.dhit = dpif.dhit;
	conif.ihit = dpif.ihit;	
	
	aluif.portA = rfif.rdat1;
	aluif.portB = in_2;
	aluif.aluop = conif.ALUop;
	
	rfif.wsel = write_reg;
	rfif.WEN = conif.RegWrite && (dpif.ihit || dpif.dhit);
	rfif.rsel1 = dpif.imemload[25:21];
	rfif.rsel2 = dpif.imemload[21:16];
	rfif.wdat = write_data;
	
	ruif.halt = conif.halt;
	ruif.ihit = dpif.ihit;
	ruif.dhit = dpif.dhit;
	ruif.MemWrite = conif.MemWrite;
	ruif.MemRead = conif.MemRead;
	dpif.imemREN = ruif.iREN;
	dpif.dmemREN = ruif.dREN;
	dpif.dmemWEN = ruif.dWEN;
	
	//datapath ports
	dpif.halt = conif.halt;
	dpif.imemaddr = addr_curr;
	dpif.dmemaddr = aluif.outport;
	dpif.dmemstore = rfif.rdat2;
end

endmodule











