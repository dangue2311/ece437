//Forwarding Unit Block

`include "cpu_types_pkg.vh"
`include "forwarding_unit_if.vh"

module forwarding_unit (
    forwarding_unit_if.fu fuif
);

  // import types
  import cpu_types_pkg::*;

  regbits_t rs, rt, rd_exec, rd_mem;

  assign rs = fuif.dec_instruction[26:21]; //RS from Decode_OUT
  assign rt = fuif.dec_instruction[21:16]; //RT from Decode_OUT
  assign rd_exec = fuif.exec_instruction[15:11];
  assign rd_mem = fuif.mem_instruction[15:11];

  always_comb begin
    fuif.forward_a = 0;
    fuif.forward_b = 0;
    if(fuif.mem_RegWrite && (rd_mem == rs) && ((rd_exec != rs) || (fuif.exec_RegWrite == 0))) fuif.forward_a = 1; //Forward A is for memory
    else if(fuif.exec_RegWrite && (rd_exec == rs) && (rd_exec != 0)) fuif.forward_a = 2;
    else if(fuif.mem_RegWrite && (rd_mem == rt) && ((rd_exec != rt) || (fuif.exec_RegWrite == 0))) fuif.forward_b = 1;
    else if(fuif.exec_RegWrite && (rd_exec == rt) && (rd_exec != 0)) fuif.forward_b = 2;
end
endmodule
