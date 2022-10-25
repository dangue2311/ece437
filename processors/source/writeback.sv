//INSTRUCTION WRITE BACK

`include "cpu_types_pkg.vh"
`include "writeback_if.vh"

module writeback (
    writeback_if.wb wbif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  //This line needs to be changed
  assign wbif.final_write_data = (wbif.LUI) ? wbif.LowerZero : (wbif.JAL) ? wbif.jal_addr : (wbif.MemtoReg) ? wbif.read_mem : wbif.alu_out;
  assign wbif.regWEN_out = wbif.regWEN_in;
  assign wbif.write_reg_out = wbif.write_reg_in;

endmodule