//Program is modified from the demo in class
`include "cpu_types_pkg.vh"
`include "register_file_if.vh"

module register_file(
  input logic CLK, nRST,
  register_file_if.rf rfif
);

import cpu_types_pkg::*;

word_t registers [31:0];

always_ff @ (posedge CLK, negedge nRST) begin
  if(nRST == 0) registers <= '{default:'0};
  else if(rfif.WEN && rfif.wsel != 0) registers[rfif.wsel] <= rfif.wdat;
end

always_comb begin
  //rfif.rdat1 = registers[rfif.rsel1];
  //rfif.rdat2 = registers[rfif.rsel2];
  rfif.register31 = registers[31];
  if (rfif.rsel1 == rfif.wsel && rfif.WEN) begin
    rfif.rdat1 = rfif.wdat;
  end
  else begin
    rfif.rdat1 = registers[rfif.rsel1];
  end
  if (rfif.rsel2 == rfif.wsel && rfif.WEN) begin
    rfif.rdat2 = rfif.wdat;
  end
  else begin
    rfif.rdat2 = registers[rfif.rsel2];
  end 
end

endmodule