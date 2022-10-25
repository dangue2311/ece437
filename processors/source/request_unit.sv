/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "request_unit_if.vh"

// memory types
`include "cpu_types_pkg.vh"

//not used ccinv, ccwit, cctrans, ccwrite, ccsnoopaddr

module request_unit (
	input logic CLK, nRST,
	request_unit_if.ru ruif
);

	logic n_iREN;
	logic n_dREN;
	logic n_dWEN;
	logic ihit_nxt;
	logic [1:0] cases;
	logic [1:0] cases_nxt;

always_ff @ (posedge CLK, negedge nRST) begin
	if (~nRST) begin
		ruif.iREN <= 1'b0; 
		ruif.dREN <= 1'b0; 
		ruif.dWEN <= 1'b0;
	end
	else begin
		ruif.iREN <= n_iREN;
		ruif.dREN <= n_dREN;
		ruif.dWEN <= n_dWEN;
	end
end

// always_comb begin
// 	cases = 0;
// 	case(cases) 
// 		2'b00: begin
// 			if(ruif.halt == 1'b1) begin
// 				cases = 2'b11;
// 			end
// 			else if((ruif.MemWrite || ruif.MemRead) && !ruif.dhit) begin
// 				cases = 2'b01;
// 			end 
// 		end
// 		2'b01: begin
// 			if (ruif.dhit == 1'b1) begin
// 				cases = 2'b10;
// 			end
// 		end
// 		2'b10: begin
// 			if(ruif.ihit == 1'b1) begin
// 				cases = 2'b00;
// 			end
// 		end
// 	endcase
// end

always_comb begin
	n_iREN = 1'b1;
	n_dREN = ruif.dREN;
	n_dWEN = ruif.dWEN;
	if (!ruif.dhit && ruif.ihit) begin
		if (ruif.MemWrite == 1) begin
			n_dWEN = 1'b1;
			//ruif.iREN = 1'b0;
		end
		else if (ruif.MemRead == 1) begin
			n_dREN = 1'b1;
			//ruif.iREN = 1'b0;
		end
	end
	else if (ruif.dhit) begin
		n_dWEN = 1'b0;
		n_dREN = 1'b0;
	end
end

endmodule







