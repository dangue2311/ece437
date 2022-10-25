/*
  Eric Villasenor
  evillase@gmail.com

  register file fpga wrapper
*/

// interface
`include "register_file_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module register_file (
	input logic CLK, nRST,
	register_file_if.rf rfif
);
	int i;
	logic [31:0][31:0] register;
	logic [31:0][31:0] register_nxt;
	logic [31:0] rdata1_nxt;
	logic [31:0] rdata2_nxt;

	always_ff @ (posedge CLK, negedge nRST) begin
		if (~nRST) begin
			register <= '{default: '0};
		end 
		else begin
			register <= register_nxt;
		end
	end

	always_comb begin 
		register_nxt = register;
		if (rfif.WEN == 1'b1) begin
			if (rfif.wsel == 1'b0)
				register_nxt[0] = 32'b0;
			else
				register_nxt[rfif.wsel] = rfif.wdat;
		end
	end

	always_comb begin
		rfif.rdat1 = register[rfif.rsel1];
		rfif.rdat2 = register[rfif.rsel2];
		if (rfif.rsel1 == 0) begin
			rfif.rdat1 = 32'b0;
		end 
		if (rfif.rsel2 == 0) begin
			rfif.rdat2 = 32'b0;
		end 
	end

endmodule




