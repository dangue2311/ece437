/*
  Writeback Interface
*/
`ifndef DCACHE_IF_VH
`define DCACHE_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface dcache_if;
  // import types
  import cpu_types_pkg::*;

  

  // register file ports
  modport dc (
    input   
    output  
  );

  modport tb (
    input
    output
  );
 
endinterface

`endif //ICACHE_IF_VH