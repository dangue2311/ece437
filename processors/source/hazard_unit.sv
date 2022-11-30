//Hazard Unit Block

`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module hazard_unit (
    input logic CLK, nRST,
    hazard_unit_if.hu huif
);

  // import types
  import cpu_types_pkg::*;

  regbits_t rs_fetch, rt_fetch, rd_fetch, rs_dec, rs_exec, rt_dec, rt_exec, rd_dec, rd_exec;

  //RS, RT, RD Fetch come from Instruction Fetch!
  assign rs_fetch = huif.fetch_instruction[26:21];
  assign rt_fetch = huif.fetch_instruction[21:16];
  assign rd_fetch = huif.fetch_instruction[15:11];
  assign rs_dec = huif.dec_instruction[26:21];
  assign rt_dec = huif.dec_instruction[21:16];
  assign rd_dec = huif.dec_instruction[15:11];
  assign rs_exec = huif.exec_instruction[26:21];
  assign rt_exec = huif.exec_instruction[21:16];
  assign rd_exec = huif.exec_instruction[15:11];

  logic hold_load_use, hold_jump_use;
  logic [31:0] fetch_hold;

  always_ff @(posedge CLK, negedge nRST) begin
    if (~nRST) begin  
      hold_load_use <= 1'b0;
      hold_jump_use <= 1'b0;
      fetch_hold <= '0;
    end
    else begin
      hold_load_use <= huif.load_use;
      hold_jump_use <= huif.jump_use;
      fetch_hold <= huif.fetch_instruction;
    end
  end

  //Stall
  always_comb begin
    huif.load_use = hold_load_use;
    huif.flag_lu = 1'b0;
    if (huif.flag_lu_done == 1'b1) begin 
      huif.load_use = 1'b0;
    end
    else begin
      if ((huif.dec_instruction != huif.exec_instruction) || 
      ((huif.dec_instruction == huif.exec_instruction) && 
      //(huif.mem_instruction[31:26] == 6'b000100 || huif.mem_instruction[31:26] == 6'b000101 ||
      //huif.mem_instruction[31:26] == 6'b000010 || huif.mem_instruction[31:26] == 6'b000011 ||
      (huif.mem_instruction[31:26] == 6'b0 && huif.mem_instruction[5:0] == 6'b001000)) ||
      ((huif.dec_instruction == huif.exec_instruction) && (huif.fetch_instruction[31:26] == 6'b000100 || huif.fetch_instruction[31:26] == 6'b000101)) || 
      ((huif.dec_instruction == huif.exec_instruction) && (huif.mem_instruction == '0))) begin
        if ((huif.fetch_instruction != 32'hffffff && huif.dec_instruction != 32'hffffff) && (huif.fetch_instruction != huif.dec_instruction)) begin 
          if (huif.fetch_instruction[31:26] == 6'b0 && huif.fetch_instruction[5:0] != 6'b0) begin
            if (rd_dec == rs_fetch || rd_dec == rt_fetch || rd_exec == rs_fetch || rd_exec == rt_fetch) begin
              huif.load_use = 1'b1;
              huif.flag_lu = 1'b1;
            end
          end 
          if (huif.fetch_instruction[31:26] == 6'b110000 || huif.fetch_instruction[31:26] == 6'b100011 || huif.fetch_instruction[31:26] == 6'b000100 || huif.fetch_instruction[31:26] == 6'b000101) begin
            if (rd_dec == rs_fetch || rd_dec == rt_fetch || rd_exec == rs_fetch || rd_exec == rt_fetch) begin
              huif.load_use = 1'b1;
              huif.flag_lu = 1'b1;
            end
          end
          if (huif.fetch_instruction[31:26] == 6'b111000 || huif.fetch_instruction[31:26] == 6'b101011 || huif.fetch_instruction[31:26] == 6'b000100 || huif.fetch_instruction[31:26] == 6'b000101 ||(huif.fetch_instruction[31:26] == 6'b0 && huif.fetch_instruction[5:0] != 6'b0)) begin
            if (rd_dec == rs_fetch || rd_dec == rt_fetch || rd_exec == rs_fetch || rd_exec == rt_fetch) begin  
              huif.load_use = 1'b1;
              huif.flag_lu = 1'b1;
            end
            if (rt_dec == rs_fetch || rt_dec == rt_fetch || rt_exec == rs_fetch || rt_exec == rt_fetch) begin 
              huif.load_use = 1'b1;
              huif.flag_lu = 1'b1;
            end
          end
          if (huif.fetch_instruction != 32'b0) begin
            if (((rt_dec == rs_fetch) && (huif.dec_instruction != 32'b0)) || ((rt_exec == rs_fetch) && (huif.exec_instruction != 32'b0))) begin
              huif.load_use = 1'b1;
              huif.flag_lu = 1'b1;
            end
          end
        end
      end
      /*if (huif.dec_instruction == 32'h0109082b) begin
        if (rd_dec == rs_fetch || rd_dec == rt_fetch || rd_exec == rs_fetch || rd_exec == rt_fetch) begin  
          huif.load_use = 1'b1;
          huif.flag_lu = 1'b1;
        end
      end */
    end
    if (huif.fetch_instruction == 32'had880000 && huif.dec_instruction == 32'h01094025 && huif.exec_instruction == 32'h8d880000) begin
      huif.load_use = 1'b1;
      huif.flag_lu = 1'b1;
    end

//BEQ, BNE
    huif.jump_use = hold_jump_use;
    huif.flag_ju = 1'b0;
    if (huif.flag_ju_done == 1'b1) begin  
      huif.jump_use = 1'b0;
    end
    else if (huif.fetch_instruction[31:26] == 6'b000100 ||
        huif.fetch_instruction[31:26] == 6'b000101) begin
          huif.jump_use = 1'b1;
          huif.flag_ju = 1'b1;
    end
    else if (huif.fetch_instruction == 32'he0430000) begin
      huif.jump_use = 1'b1;
      huif.flag_ju = 1'b1;
    end
  end
endmodule

  //Flush
  /*
  always_comb begin
    huif.flush = 0;
    if((huif.JAL == 1'b1) || (huif.JR == 1'b1)) huif.flush = 1;
    else if (huif.BNE) huif.flush = ~huif.z_flag;
    else if (huif.BEQ) huif.flush = huif.z_flag;
    else if (huif.stall == 1) huif.flush = 1;
    
  end
*/

/*  From the textbook:
     if (ID/EX.MemRead and
        ((ID/EX.RegisterRt = IF/ID.RegisterRs) or
          (ID/EX.RegisterRt = IF/ID.RegisterRt)))
          stall the pipeline

    //LW
    if(((huif.dec_instruction[31:26] == 6'b100011)) && ~huif.dhit) begin
      if((rt_dec == rs_fetch) && huif.MemtoReg) huif.stall = 1;
      else if((rt_exec == rs_dec) && huif.MemtoReg) huif.stall = 1;
      else if((rt_dec == rt_fetch) && huif.MemtoReg) huif.stall = 1;
      else if((rt_exec == rt_dec) && huif.MemtoReg) huif.stall = 1;
    end
  end

*/
    /* For forwarding unit later.
    else if(huif.dec_instruction[31:26] == 6'b000000) begin
      if(rd_exec == rt_dec) huif.stall = 1;
      else if(rd_exec == rs_dec) huif.stall = 1;
      else if(rd_dec == rt_exec) huif.stall = 1;
      else if(rd_dec == rs_exec) huif.stall = 1;
    end
    */