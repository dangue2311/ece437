`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

module dcache (
    input logic CLK, nRST,
    datapath_cache_if dcif,
    caches_if.dcache cif
);

    import cpu_types_pkg::*;
    parameter BLKS_PER_SET = 8;
    parameter NUM_SETS = 2;

    enum { COMPARE_TAG, ALL1, ALL2, WB1, WB2, FLUSH_INIT, FLUSH1, 
		FLUSH2, FLUSH3, FLUSH4, FLUSH5, FINAL_FLUSH, FINAL_FLUSH2} state, n_state;

    word_t hit_cnt, n_hit_cnt, total_cnt, n_total_cnt;
    word_t miss_count, n_miss_count;
    logic miss_hit_flag, n_miss_hit_flag, lru, n_lru;
	logic [4:0] ind, n_ind;
    dcachef_t request;
    dcache_frame [1:0][7:0] frames, n_frames;

    always_ff @(posedge CLK, negedge nRST) begin
        if (~nRST) begin
            frames <= '0;
            state <= COMPARE_TAG;
			ind <= '0;
            lru <= 0;
            hit_cnt <= '0;
            miss_hit_flag <= '0;
            miss_count <= '0;
            total_cnt <= '0;
        end else begin
            frames <= n_frames;
            state <= n_state;
			ind <= n_ind;
            lru <= n_lru;
            miss_count <= n_miss_count;
            hit_cnt <= n_hit_cnt;
            miss_hit_flag <= n_miss_hit_flag;
            total_cnt <= n_total_cnt;
        end
    end


    always_comb begin
        n_state = state;
        n_frames = frames;
        n_lru = lru;
        n_miss_count = miss_count;
        dcif.dhit = 1'b0;
        dcif.dmemload = 32'h0;
        cif.dREN = '0;
        cif.dWEN = '0;
        cif.daddr = '0;
		n_ind = ind; 
		dcif.flushed = 1'b0;
        n_miss_hit_flag = miss_hit_flag;
        n_hit_cnt = hit_cnt;
        cif.dstore = '0;
        n_total_cnt = total_cnt;

        casez(state)
            COMPARE_TAG: begin
                if(dcif.halt == 1) begin
                    n_state = FLUSH_INIT;
                    n_ind = 0;
                end 
                else if (!dcif.dmemREN && !dcif.dmemWEN) begin
                    n_state = COMPARE_TAG;
                end
                else if((dcif.dmemWEN == 1) || (dcif.dmemREN == 1)) begin
                    if(frames[0][request.idx].tag == request.tag && frames[0][request.idx].valid) begin
                        dcif.dhit = 1;
                        n_lru = ~lru;
                        n_total_cnt = total_cnt + 1;
                        dcif.dmemload = frames[0][request.idx].data[request.blkoff];
                        if (dcif.dmemWEN) begin
                            dcif.dmemload = dcif.dmemstore;
                            n_frames[0][request.idx].data[request.blkoff] = dcif.dmemstore;
                            n_frames[0][request.idx].dirty = 1;
                        end
                    end 
                    else if (frames[1][request.idx].tag == request.tag && frames[1][request.idx].valid) begin
                        dcif.dhit = 1;
                        n_lru = ~lru;
                        n_total_cnt = total_cnt + 1;
                        dcif.dmemload = frames[1][request.idx].data[request.blkoff];
                        if (dcif.dmemWEN) begin
                            dcif.dmemload = dcif.dmemstore;
                            n_frames[1][request.idx].data[request.blkoff] = dcif.dmemstore;
                            n_frames[1][request.idx].dirty = 1;
                        end
                    end
                    else begin
                        n_state = frames[lru][request.idx].dirty ? WB1 : ALL1;
                    end
                end
            end

            ALL1: begin
			 if(cif.dwait) begin
                    cif.dREN = 1;
                    cif.daddr = {request[31:3], 1'b0, request[1:0]};
                    n_state = ALL1;
                end else begin
                    n_frames[lru][request.idx].data[0] = cif.dload;
                    cif.dREN = 1;
                    cif.daddr =  {request[31:3], 1'b0, request[1:0]};
                    n_state = ALL2;
                end
            end

            ALL2: begin
				 if(cif.dwait) begin
                    cif.dREN = 1;
                    cif.daddr = {request[31:3], 1'b1, request[1:0]}; //request + 32'd4;
                    n_state = ALL2;
	
                end else begin
                    n_frames[lru][request.idx].valid = 1;
                    n_frames[lru][request.idx].dirty = 0;
                    n_frames[lru][request.idx].tag = request.tag;
                    n_frames[lru][request.idx].data[1] = cif.dload;
                    cif.dREN = 1;
                    cif.daddr =  {request[31:3], 1'b1, request[1:0]};
                    n_miss_hit_flag = 1;
                    n_miss_count = miss_count + 1;
                    n_state = COMPARE_TAG;
                end
            end

            WB1: begin
                cif.dstore = frames[lru][request.idx].data[0];
				if(cif.dwait) begin
                    cif.dWEN = 1;
                    cif.daddr = {frames[lru][request.idx].tag, request.idx, 1'b0, 2'b00}; // request
                end else begin
                    n_state = WB2;
                    cif.dWEN = 1;
                    cif.daddr =  {frames[lru][request.idx].tag, request.idx, 1'b0, 2'b00}; //{request[31:3], 1'b0, request[1:0]};
                end
            end

            WB2: begin
                cif.dstore = frames[lru][request.idx].data[1];
				 if(cif.dwait) begin
                    cif.dWEN = 1;
                    cif.daddr = {frames[lru][request.idx].tag, request.idx, 1'b1, 2'b00}; //{request[31:3], 1'b1, request[1:0]}; //request + 32'd4;

                end else begin
                    cif.dWEN = 1;
                    cif.daddr =  {frames[lru][request.idx].tag, request.idx, 1'b1, 2'b00}; //{request[31:3], 1'b0, request[1:0]};
                    n_state = ALL1;
                end
            end

			FLUSH_INIT: begin
				if (ind == 8) begin
					n_state = FLUSH3;
					n_ind = 0;
				end else if(frames[0][ind[2:0]].dirty) begin
					n_state = FLUSH1; 
				end	else begin
					n_ind = ind + 1;
					n_state = FLUSH_INIT;
				end						
			end

			FLUSH1:begin
                cif.dWEN = 1;
                cif.daddr = {frames[0][ind[2:0]].tag, ind[2:0], 1'b0, 2'b00};
                cif.dstore = frames[0][ind[2:0]].data[0];
                if(cif.dwait) begin
                end else begin
                    n_state =  FLUSH2; 
                end
			end  

			FLUSH2:begin
                cif.dWEN = 1;
                cif.daddr = {frames[0][ind[2:0]].tag, ind[2:0], 1'b1, 2'b00};
                cif.dstore = frames[0][ind[2:0]].data[1];
                if(cif.dwait) begin
                end else begin
                    n_state =  FLUSH_INIT; 
					n_ind = ind + 1;
                end
			end 
 		
			FLUSH3:begin
				if (ind == 8) begin
					n_state = FINAL_FLUSH;
					n_ind = 0; 
				end else if(frames[1][ind[2:0]].dirty) begin
					n_state = FLUSH4; 
				end	else begin
					n_ind = ind + 1; 
					n_state = FLUSH3; 
				end						
			end

			FLUSH4: begin
                cif.dWEN = 1;
                cif.daddr = {frames[1][ind[2:0]].tag, ind[2:0], 1'b0, 2'b00};
                cif.dstore = frames[1][ind[2:0]].data[0];
                if(cif.dwait) begin
                end else begin
                    n_state =  FLUSH5; 
                end
			end
			
			FLUSH5: begin
                cif.dWEN = 1;
                cif.daddr = {frames[1][ind[2:0]].tag, ind[2:0], 1'b1, 2'b00};
                cif.dstore = frames[1][ind[2:0]].data[1];
                if(cif.dwait) begin
                end
                else begin	
					n_ind = ind + 1;
                    n_state =  FLUSH3; 
                end
			end 
 	
			FINAL_FLUSH: begin
                cif.dWEN = 1;
                cif.daddr = 32'h00003100;
                cif.dstore = total_cnt - miss_count;
                
                n_state = (cif.dwait == 1'b0) ? FINAL_FLUSH2 : FINAL_FLUSH;
			end

            FINAL_FLUSH2: begin
                dcif.flushed = 1;
            end
        endcase
    end
    
    assign request = dcif.dmemaddr;

endmodule
