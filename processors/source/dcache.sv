//INSTRUCTION WRITE BACK

`include "cpu_types_pkg.vh"
`include "icache_if.vh"

module dcache (
  input logic CLK, nRST,
  dcache_if.dc dcif
);

  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;


endmodule