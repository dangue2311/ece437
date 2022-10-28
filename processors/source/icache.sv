//INSTRUCTION WRITE BACK

`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module icache (
  input logic CLK, nRST,
  datapath_cache_if dpcif,
  caches_if.icache memcif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  icache_frame [15:0]cache;
  icachef_t i_add;

  logic ihit, miss;
  word_t imemload;

  assign i_add.tag = dpcif.imemaddr[31:6];
  assign i_add.idx = dpcif.imemaddr[5:2];
  assign i_add.bytoff = dpcif.imemaddr[1:0];


  always_comb begin
  if(dpcif.halt) begin
    miss = 0;
    dpcif.ihit = 0;
    dpcif.imemload = 0;
  end
  else if ((dpcif.imemREN == 1'b1) && (dpcif.dmemREN == 0) && (dpcif.dmemWEN == 0)) begin
      if ((cache[i_add.idx].tag == i_add.tag) && cache[i_add.idx].valid) begin
        miss = 1'b0;
        dpcif.ihit = 1'b1;
        dpcif.imemload = cache[i_add.idx].data;
      end
      else begin
        miss = 1'b1;
        dpcif.ihit = 1'b0;
        dpcif.imemload = imemload;
      end
    end
    else begin
      miss = 1'b0;
      dpcif.ihit = 1'b0;
      dpcif.imemload = 1'b0;
    end
  end

  always_ff @(posedge CLK, negedge nRST) begin
    if (~nRST) begin
      cache[15:0] <= '0;
      cache[i_add.idx].data <= '0;
      cache[i_add.idx].tag <= '0;
      cache[i_add.idx].valid <= '0;
    end
    else
      if (ihit) begin
        cache[i_add.idx].data <= memcif.iload;
        cache[i_add.idx].tag <= i_add.tag;
        cache[i_add.idx].valid <= 1'b1;
      end
  end

  assign ihit = ~memcif.iwait;
  assign imemload = memcif.iload;
  assign memcif.iREN = miss ? dpcif.imemREN : '0;
  assign memcif.iaddr = miss ? dpcif.imemaddr: '0;
endmodule