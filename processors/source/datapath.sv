// data path interface
`include "datapath_cache_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"
`include "instruction_fetch_if.vh"
`include "decode_if.vh"
`include "execution_if.vh"
`include "memory_if.vh"
`include "writeback_if.vh"
`include "forwarding_unit_if.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp caif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT;
  
  //Interface Initialization
  instruction_fetch_if ifif();
  decode_if deif();
  hazard_unit_if huif();
  execution_if exeif();
  memory_if memif();
  writeback_if wbif();
  forwarding_unit_if fuif();
	
  //DUT
  instruction_fetch #(.PC_INIT(PC_INIT)) IFETCH(CLK, nRST, ifif);
  decode DEC(CLK, nRST, deif);
  hazard_unit HUNIT(CLK, nRST, huif);
  execution EXECUTE (CLK, nRST, exeif);
  memory REMEMBER(CLK, nRST, memif);
  writeback WBACK(wbif);
  forwarding_unit FORWARD(fuif);

  logic[31:0] hold1, hold2, hold2_reg, addr_reg;
  logic state, next_state, enable;
  
  always_comb begin

    next_state = state;
    if(state == 0) begin
      enable = 1'b1;
      if (caif.dhit == 1'b1) begin
        next_state = 1'b1;
      end
    end
    else if(state == 1'b1) begin
      enable = 1'b0;
      if (addr_reg != exeif.out)begin
        enable = 1'b1;
        next_state = 1'b0;
      end
    end

    //Datomic comes out of datapath. Goes into dcache.

    //Assign Instruction Fetch inputs
    ifif.enable = enable;
    ifif.ihit = caif.ihit;
    ifif.dhit = caif.dhit;
 //   ifif.flushed = caif.flushed;
    ifif.new_PC = memif.addr_next;
    ifif.cache_in = caif.imemload;
    ifif.jump_use = huif.jump_use;
    ifif.load_use = huif.load_use;
    ifif.jump_sig = deif.JumpSel_inst;
    ifif.jump_add = deif.JumpAddr_inst;
    ifif.jump_jr = deif.JumpJr_inst;

    //Assign Decode inputs
    deif.enable = enable;
    deif.inst_addr = ifif.addr_curr;
    deif.bne_eq = huif.jump_use;
  	deif.ihit = caif.ihit;
    deif.dhit = caif.dhit;
    //deif.flushed = caif.flushed;
    deif.instruction = ifif.instruction;
    deif.pp4_in = ifif.pp4;
    deif.write_data = wbif.final_write_data;
  	deif.in_WEN = wbif.regWEN_out;
    deif.final_write_reg = wbif.write_reg_out;
    deif.load_use = huif.load_use;
    deif.jump_use = huif.flag_ju;

    //Assign Hazard Unit inputs
    huif.flag_lu_done = memif.load_use_out;
    huif.flag_ju_done = memif.jump_use_out;
    huif.fetch_instruction = ifif.instruction;
    huif.dec_instruction = deif.inst_out;
    huif.exec_instruction = exeif.instruction_next;
    huif.mem_instruction = memif.instruction_next;

    //Assign Forwarding Unit inputs
    //CHECK THIS SHIT TO MAKE SURE INPUTS ARE RIGHT
    fuif.dec_instruction = ifif.instruction;
    fuif.exec_instruction = deif.inst_out;
    fuif.mem_instruction = exeif.instruction_next;
    fuif.exec_RegWrite = exeif.regWEN_next;
    fuif.mem_RegWrite = memif.write_reg_next;

    //Assign Execution inputs
    //control signals
    exeif.enable = enable;
    exeif.shift_inst = deif. shift_inst;
    exeif.bne_eq = huif.jump_use;
    exeif.ihit = caif.ihit;
    exeif.dhit = caif.dhit;
    exeif.instruction = deif.inst_out;
    //exeif.flushed = caif.flushed;
    exeif.lui_flag = deif.LUI;
    exeif.jal_flag = deif.JAL;
    exeif.memtoreg = deif.MemtoReg;
    exeif.jr_flag = deif.JR;
    exeif.j_jal_flag = deif.JAL;
    exeif.mem_write = deif.dWEN;
    exeif.mem_read = deif.dREN;
    exeif.bne_flag = deif.BNE;
    exeif.aluop = deif.aluop;
    exeif.ALUSrc = deif.ALUSrc;
    exeif.extend_immi = deif.SignExt;
    exeif.halt = deif.halt;
    //word signals (32bits)
    exeif.addr_curr4 = deif.pp4_out;
    exeif.j_jal_addr = deif.JumpAddr;
    exeif.sign_extend = deif.SignExt;
    exeif.zero_extend = deif.ZeroExt;
    exeif.lower_zero = deif.LowerZero;
    exeif.read_dat1 = deif.rdat1;
    exeif.read_dat2 = deif.rdat2;
    //register write signals
		exeif.regWEN = deif.out_WEN;
    exeif.regWEN = deif.RegWEN;
    exeif.write_reg = deif.init_write_reg;
    exeif.instruction = deif.inst_out;
    exeif.jump_use = deif.jump_use_out;
    exeif.load_use = huif.flag_lu;
    //forwarding unit
    exeif.forward_a = fuif.forward_a;
    exeif.forward_b = fuif.forward_b;
    exeif.forward_alu = exeif.out;
    exeif.forward_mem = memif.memory_out;
    exeif.jump = deif.JumpSel;

    hold2 = (caif.dmemload == 32'b0) ? ((enable == 1'b0) ? hold2 : 32'b0) :caif.dmemload;
    
    //Assign Memory inputs
    //control signals
    memif.enable = enable;
    memif.bne_flag = exeif.bne_flag_out;
    memif.jump_use = exeif.jump_use_out;
    memif.bne_eq = huif.jump_use;
    memif.ihit = caif.ihit;
    memif.dhit = caif.dhit;
    memif.instruction = exeif.instruction_next;
    //memif.flushed = caif.flushed;
    memif.lui_flag = exeif.lui_flag_next;
    memif.jal_flag = exeif.jal_flag_next;
    memif.memtoreg = exeif.memtoreg_next;
    memif.jr_flag = exeif.jr_flag_next;
    memif.j_jal_flag = exeif.j_jal_flag_next;
    memif.zout = exeif.z_out;
    memif.halt = exeif.halt_next;
    //data memory signals
		memif.read_mem = hold2; //caif.dmemload;
    memif.memory_in = hold2; //caif.dmemload;
    //register write signals
    memif.regWEN = exeif.regWEN_next;
    memif.write_reg = exeif.write_reg_next;
    //other
    memif.j_jal_addr = exeif.j_jal_addr_next;
    memif.lower_zero = exeif.lower_zero_next;
    memif.read_dat1 = exeif.out;
    memif.branch_addr = exeif.branch_addr;
    memif.regwrite = exeif.out;
    memif.load_use = exeif.load_use_out;
    memif.jump = exeif.jump_out;

    //Assign Writeback inputs
    wbif.enable = enable;
    wbif.ihit = caif.ihit;
    wbif.dhit = caif.dhit;
    //flags
    wbif.LUI = memif.lui_flag_next;
    wbif.JAL = memif.jal_flag_next;
    wbif.MemtoReg = memif.memtoreg_next;
    //addresses
    wbif.jal_addr = memif.j_jal_addr_next;
    wbif.read_mem = memif.memory_out;
    wbif.LowerZero = memif.lower_zero_next; 
    //register info
    wbif.regWEN_in = memif.regWEN_next;
    wbif.write_reg_in = memif.write_reg_next;
    wbif.alu_out = memif.out_next;

    //assign DP
    caif.imemREN = (huif.jump_use == 1'b1) ? 1'b0 : 1'b1; // || hold1 && ~hold2
    caif.imemaddr = ifif.PC;
    caif.dmemREN = exeif.mem_read_next && ~(exeif.halt_next || memif.halt_next) && enable;
    caif.dmemWEN = exeif.mem_write_next && ~(exeif.halt_next || memif.halt_next) && enable;
    caif.dmemstore = exeif.read_dat2_next;
    caif.dmemaddr = exeif.out;
    
  end

    always_ff @(posedge CLK, negedge nRST) begin
      if(~nRST) begin
        caif.halt <= 1'b0;
        hold1 <= 32'b0;
        hold2_reg <= 32'b0;
        state <= 1'b0;
        addr_reg <= 32'b0;
      end
      else begin
        caif.halt <= memif.halt_next | caif.halt;
        hold1 <= exeif.out;
        hold2_reg <= hold2;
        state <= next_state;
        addr_reg <= exeif.out;
      end
    end

endmodule