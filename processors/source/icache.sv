//INSTRUCTION WRITE BACK

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module icache (
  input logic CLK, nRST,
  datapath_cache_if.icache dpcif,
  caches_if.icache memcif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  icache_frame [15:0]cache;
  icachef_t i_add;

  logic ihit, iREN;
  word_t iaddr, imemload;

  assign i_add.tag = dpcif.imemaddr[31:6];
  assign i_add.idx = dpcif.imemaddr[5:2];
  assign i_add.bytoff = dpcif.imemaddr[1:0];


  always_comb begin
    iREN = memcif.iREN;
    iaddr = memcif.iaddr;
    ihit = dpcif.ihit;
    imemload = dpcif.imemload;
    if (dpcif.imemREN == 1'b1 && memcif.iwait == 1'b1) begin
      if ((cache[i_add.idx].tag == i_add.tag) && cache[i_add.idx].valid) begin
        ihit = 1'b1;
        imemload = cache[i_add.idx].data;
      end
      else begin
        ihit = 1'b0;
        iREN = 1'b1;
        iaddr = dpcif.imemaddr;
      end
    end
    else if (memcif.iwait == 1'b0) begin 
      ihit = 1'b1;
      imemload = memcif.iload;
    end
  end

  always_ff @(posedge CLK, negedge nRST) begin
    if (~nRST) begin
      cache[15:0] <= '0;
      memcif.iREN <= '0;
      memcif.iaddr <= '0;
      dpcif.ihit <= '0;
      dpcif.imemload <= '0;
    end
    else
      memcif.iREN <= iREN;
      memcif.iaddr <= iaddr;
      dpcif.ihit <= ihit;
      dpcif.imemload <= imemload;
      if (memcif.iwait == 1'b0) begin
        cache[i_add.idx].data <= memcif.iload;
        cache[i_add.idx].tag <= i_add.tag;
        cache[i_add.idx].valid <= 1'b1;
      end
  end

endmodule