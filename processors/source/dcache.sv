import cpu_types_pkg::*;

module dcache (
	input logic CLK, nRST,
	datapath_cache_if.dcache dcif,
	caches_if.dcache cif
);

typedef struct packed {
	//frame1 table
	logic [25:0] frame1_tag;
	word_t frame1_data1, frame1_data2;
	logic frame1_dirty, frame1_valid;
	//frame2 table
	logic [25:0] frame2_tag;
	word_t frame2_data1, frame2_data2;
	logic frame2_dirty, frame2_valid;
} dcache_t;

typedef enum logic[3:0] {
	IDLE, WRITEBACK1, WRITEBACK2, LOAD1, LOAD2, FLUSH1, FLUSH2, DIRTY, COUNT, HALT
} state_t;

//Declaration
dcache_t cache[7:0];
integer i;

logic offset;
logic [25:0] tag;
logic [2:0] index, truncated_row;

logic miss, available[7:0], next_available[7:0];
logic [4:0] row, next_row;
word_t hit_count, next_hit_count;

state_t state, next_state;
//Seperate my input address
assign offset = dcif.dmemaddr[2];
assign index = dcif.dmemaddr[5:3];
assign tag = dcif.dmemaddr[31:6];
assign truncated_row = row[2:0] - 1;
//IDLE state
logic [25:0] frame1_tag, frame2_tag;
word_t frame1_data1, frame1_data2, frame2_data1, frame2_data2;
logic frame1_dirty, frame1_valid, frame2_dirty, frame2_valid;


always_ff @(posedge CLK or negedge nRST) begin
	if(~nRST) begin
		 for (i = 0; i < 8; i++) begin
		 	cache[i].frame1_tag <= 0;
		 	cache[i].frame1_data1 <= 0;
		 	cache[i].frame1_data2 <= 0;
		 	cache[i].frame1_dirty <= 0;
		 	cache[i].frame1_valid <= 0;

		 	cache[i].frame2_tag <= 0;
		 	cache[i].frame2_data1 <= 0;
		 	cache[i].frame2_data2 <= 0;
		 	cache[i].frame2_dirty <= 0;
		 	cache[i].frame2_valid <= 0;
		 end
	end else begin
		cache[index].frame1_data1 <= frame1_data1;
		cache[index].frame1_data2 <= frame1_data2;
		cache[index].frame2_data1 <= frame2_data1;
		cache[index].frame2_data2 <= frame2_data2;
		cache[index].frame1_dirty <= frame1_dirty;
		cache[index].frame2_dirty <= frame2_dirty;
		cache[index].frame1_tag <= frame1_tag;
		cache[index].frame1_valid <= frame1_valid;
		cache[index].frame2_tag <= frame2_tag;
		cache[index].frame2_valid <= frame2_valid;
	end
end

//State Machine
always_ff @(posedge CLK or negedge nRST) begin
	if(~nRST) begin
		 state <= IDLE;
		 for (i = 0; i < 8; i++)
		 	available[i] <= 0;
		 row <= 0;
		 hit_count <= 0;
	end else begin
		 state <= next_state;
		 for (i = 0; i < 8; i++)
		 	available[i] <= next_available[i];
		 row <= next_row;
		 hit_count <= next_hit_count;
	end
end

//Next State Logic
always_comb begin : NEXT_LOGIC
	next_state = state;
	next_row = row;
	case(state)
		IDLE : begin
			if (dcif.halt) next_state = DIRTY;
			else if (miss) begin
				if (available[index] == 0) begin
					next_state = cache[index].frame1_dirty? WRITEBACK1:LOAD1;
				end else begin
					next_state = cache[index].frame2_dirty? WRITEBACK1:LOAD1;
				end
			end
		end
		WRITEBACK1 : begin
			if (~cif.dwait) next_state = WRITEBACK2;
		end
		WRITEBACK2 : begin
			if (~cif.dwait) next_state = LOAD1;
		end
		LOAD1 : begin
			if (~cif.dwait) next_state = LOAD2;
		end
		LOAD2 : begin
			if (~cif.dwait) next_state = IDLE;
		end
		DIRTY : begin
			if (row < 8) begin
				if(cache[row[2:0]].frame1_dirty) begin
					next_state = FLUSH1;
				end
			end else begin
				if(cache[row[2:0]].frame2_dirty) begin
					next_state = FLUSH1;
				end
			end
			next_row = row + 1;
		 	if(row == 5'b10000)
		 		next_state = COUNT;
		end
		FLUSH1 : begin
			if (~cif.dwait) next_state = FLUSH2;
		end
		FLUSH2 : begin
			if (~cif.dwait) next_state = DIRTY;
		end
		COUNT : begin
			if (~cif.dwait) next_state = HALT;
		end
	endcase // state
end

//Output Logic
assign dcif.flushed = (state == HALT);
integer j;
always_comb begin : OUTPUT_LOGIC
	miss = 0;
	dcif.dhit = 0;
	dcif.dmemload = 0;
	cif.dREN = 0;
	cif.dWEN = 0;
	cif.daddr = 0;
	cif.dstore = 0;

	frame1_data1 = cache[index].frame1_data1; 
	frame1_data2 = cache[index].frame1_data2;
	frame2_data1 = cache[index].frame2_data1;
	frame2_data2 = cache[index].frame2_data2;
	frame1_dirty = cache[index].frame1_dirty;
	frame2_dirty = cache[index].frame2_dirty;
	frame1_valid = cache[index].frame1_valid; 
	frame2_valid = cache[index].frame2_valid;
	frame1_tag = cache[index].frame1_tag;
	frame2_tag = cache[index].frame2_tag;

	for(j = 0; j < 8; j++) next_available[j] = available[j];
	next_hit_count = hit_count;

	case(state)
		IDLE : begin
			if (dcif.halt) next_hit_count = hit_count;
			else if (dcif.dmemREN) begin
				if ((tag == cache[index].frame1_tag) && cache[index].frame1_valid) begin
					dcif.dhit = 1;
					dcif.dmemload = offset? cache[index].frame1_data2:cache[index].frame1_data1;
					next_available[index] = 1;
					next_hit_count = hit_count + 1;
				end else if ((tag == cache[index].frame2_tag) && cache[index].frame2_valid) begin
					dcif.dhit = 1;
					dcif.dmemload = offset? cache[index].frame2_data2:cache[index].frame2_data1;
					next_available[index] = 0;
					next_hit_count = hit_count + 1;
				end else begin
					miss = 1;
					next_hit_count = hit_count - 1;
				end
			end else if (dcif.dmemWEN) begin
				if ((tag == cache[index].frame1_tag)) begin
					dcif.dhit = 1;
					frame1_dirty = 1;
					next_available[index] = 1;
					next_hit_count = hit_count + 1;
					if(offset == 0) frame1_data1 = dcif.dmemstore;
					else frame1_data2 = dcif.dmemstore;
				end else if ((tag == cache[index].frame2_tag)) begin
					dcif.dhit = 1;
					frame2_dirty = 1;
					next_available[index] = 0;
					next_hit_count = hit_count + 1;
					if(offset == 0) frame2_data1 = dcif.dmemstore;
					else frame2_data2 = dcif.dmemstore;
				end else begin
					miss = 1;
					next_hit_count = hit_count - 1;
				end
			end
		end
		WRITEBACK1 : begin
			cif.dWEN = 1;
			if(available[index] == 0) begin
				cif.daddr = {cache[index].frame1_tag, index, 3'b000};
				cif.dstore = cache[index].frame1_data1;
			end else begin
				cif.daddr = {cache[index].frame2_tag, index, 3'b000};
				cif.dstore = cache[index].frame2_data1;
			end
		end
		WRITEBACK2 : begin
			cif.dWEN = 1;
			if(available[index] == 0) begin
				cif.daddr = {cache[index].frame1_tag, index, 3'b100};
				cif.dstore = cache[index].frame1_data2;
			end else begin
				cif.daddr = {cache[index].frame2_tag, index, 3'b100};
				cif.dstore = cache[index].frame2_data2;
			end
		end
		LOAD1 : begin
			cif.dREN = 1;
			cif.daddr = {tag, index, 3'b000};
			if (available[index] == 0) begin
				frame1_data1 = cif.dload;
			end else begin
				frame2_data1 = cif.dload;
			end
		end
		LOAD2 : begin
			cif.dREN = 1;
			cif.daddr = {tag, index, 3'b100};
			if (available[index] == 0) begin
				frame1_data2 = cif.dload;
				frame1_tag = tag;
				frame1_dirty = 0;
				frame1_valid = 1;
			end else begin
				frame2_data2 = cif.dload;
				frame2_tag = tag;
				frame2_dirty = 0;
				frame2_valid = 1;
			end
		end
		FLUSH1 : begin
			cif.dWEN = 1;
			if(row - 1 < 8) begin
				cif.daddr = {cache[truncated_row].frame1_tag, truncated_row, 3'b000};
				cif.dstore = cache[truncated_row].frame1_data1;
			end else begin
				cif.daddr = {cache[truncated_row].frame2_tag, truncated_row, 3'b000};
				cif.dstore = cache[truncated_row].frame2_data1;
			end
		end
		FLUSH2 : begin
			cif.dWEN = 1;
			if(row - 1 < 8) begin
				cif.daddr = {cache[truncated_row].frame1_tag, truncated_row, 3'b100};
				cif.dstore = cache[truncated_row].frame1_data2;
			end else begin
				cif.daddr = {cache[truncated_row].frame2_tag, truncated_row, 3'b100};
				cif.dstore = cache[truncated_row].frame2_data2;
			end
		end
		COUNT : begin
			cif.dWEN = 1;
			cif.daddr = 32'h00003100;
			cif.dstore = hit_count; 
		end
	endcase // state
end

endmodule // dcache