/*
  Eric Villasenor
  evillase@gmail.com

  register file fpga wrapper
*/

// interface
`include "alu_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module alu (
	alu_if.alu alurf
);

	assign alurf.negative = 1'b0;
	
	always_comb begin
		if (alurf.outport == 32'b0) 
			alurf.zero = 1'b1;
		else
			alurf.zero = 1'b0;
	end

	always_comb begin
		alurf.overflow = 1'b0;
		alurf.outport = 32'b0;

		case(alurf.aluop)
			4'b0000:	begin //shift left
							alurf.outport = alurf.portB << alurf.portA;
						end
			4'b0001:	begin //shift right
							alurf.outport = alurf.portB >> alurf.portA;
						end
			4'b0010:	begin //add idk
							alurf.outport = alurf.portA + alurf.portB;
							alurf.overflow = (~alurf.outport[31] & alurf.portA[31] & alurf.portB[31]) | (alurf.outport[31] & ~(alurf.portA[31]) & ~(alurf.portB[31]));
						end
			4'b0011:	begin //sub idk
							alurf.outport = alurf.portA - alurf.portB;
							alurf.overflow = (~(alurf.outport[31]) & alurf.portA[31] & ~(alurf.portB[31])) | (alurf.outport[31] & ~(alurf.portA[31]) & (alurf.portB[31]));
						end
			4'b0100: begin //and
							alurf.outport = alurf.portA & alurf.portB;
						end
			4'b0101: begin //or
							alurf.outport = alurf.portA | alurf.portB;
						end
			4'b0110: begin //xor
							alurf.outport = alurf.portA ^ alurf.portB;
						end
			4'b0111: begin //nor
							alurf.outport = ~(alurf.portA | alurf.portB);
						end
			4'b1010: begin //slt 
							alurf.outport = 32'b0;
							if (alurf.portA[31] == 0 && alurf.portB[31] == 0) begin
								alurf.outport = (alurf.portA < alurf.portB) ? 1'b1 : 1'b0;
							end
							else if (alurf.portA[31] == 1 && alurf.portB[31] == 1) begin
								alurf.outport = (alurf.portA > alurf.portB) ? 1'b1 : 1'b0;
							end
							else if (alurf.portA[31] == 1 && alurf.portB[31] == 0) begin
								alurf.outport = 32'd1;
							end
							else if (alurf.portA[31] == 0 && alurf.portB[31] == 1) begin 
								alurf.outport = 32'd0;
							end
						end
			4'b1011: begin //sltu
							alurf.outport = (alurf.portA < alurf.portB) ? 1'b1 : 1'b0;
						end
			endcase
		end
endmodule




