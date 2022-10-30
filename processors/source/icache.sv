//INSTRUCTION WRITE BACK
`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module icache (
  input logic CLK, nRST,
  datapath_cache_if dcif,
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

  assign i_add.tag = dcif.imemaddr[31:6];
  assign i_add.idx = dcif.imemaddr[5:2];
  assign i_add.bytoff = dcif.imemaddr[1:0];

  always_comb begin
    dcif.ihit = 1'b0;
    miss = 1'b1;
    dcif.imemload = 32'b0;
    if(dcif.halt) begin
      miss = 1'b0;
      dcif.ihit = 1'b0;
      dcif.imemload = 32'b0;
    end
    else if ((dcif.imemREN == 1'b1) && (dcif.dmemREN == 0) && (dcif.dmemWEN == 0)) begin
        if ((cache[i_add.idx].tag == i_add.tag) && cache[i_add.idx].valid) begin
          miss = 1'b0;
          dcif.ihit = 1'b1;
          dcif.imemload = cache[i_add.idx].data;
        end
        else begin
          miss = 1'b1;
          dcif.ihit = 1'b0;
          dcif.imemload = 32'b0;
        end
    end
    else begin
        miss = 1'b0;
        dcif.ihit = 1'b0;
        dcif.imemload = 32'b0;
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
  assign memcif.iREN = miss ? dcif.imemREN : '0;
  assign memcif.iaddr = miss ? dcif.imemaddr: '0;
endmodule