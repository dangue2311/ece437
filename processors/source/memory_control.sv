/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// memory types
`include "cpu_types_pkg.vh"

//not used ccinv, ccwit, cctrans, ccwrite, ccsnoopaddr

module memory_control (
  input logic CLK, nRST, 
	cache_control_if.cc ccif
);

// type import
import cpu_types_pkg::*;

enum {idle_0, idle_1, imemfetch, ifetched, dfetched, invalidate,
setup, cache_to_cache_1, cache_to_cache_2, cache_to_cache_3, mem_to_cache_1, mem_to_cache_2,
cache_to_mem} state, n_state;
logic prio, prio_hold;

//At time of FLUSH_INIT, ramWEN is high, which it should not be.
//This is being set from bus_controller in multiple states
//PROBLEM: If not getting stuff from dCache, it will cause there to be bad writes
//Possible solution: checking for dWEN from dcache in order to assert ramWEN;
//ON CERTAIN STATES
//On flush state might have ignored 


// number of cpus for cc
parameter CPUS = 2;

always_ff @(posedge CLK, negedge nRST) begin
	if (~nRST) begin
		state = idle_0;
		prio = 1'b0;
	end
	else begin
		state = n_state;
		prio = prio_hold;
	end
end

always_comb begin
	ccif.iwait[1:0] = 2'b11;
	ccif.dwait[1:0] = 2'b11;
	ccif.iload[1:0] = '0;
	ccif.dload[1:0] = '0;
	ccif.ramREN = '0;
	ccif.ramaddr = '0;
	ccif.ramstore = '0;
	ccif.ramWEN = '0;
	ccif.ccinv[1:0] = '0;
	ccif.ccsnoopaddr[1:0] = '0;
	ccif.ccwait[1:0] = '0;
	
	prio_hold = prio;
	n_state = state;
	if(state == idle_0) begin
		if (ccif.dREN[0]||ccif.dWEN[0]) begin
			prio_hold = 1'b0;
			n_state = setup;
			ccif.ccsnoopaddr[1] = ccif.daddr[0];
			ccif.iwait[1] = 1'b1;
			ccif.ccwait[1] = 1'b1;
		end
		else if (ccif.ccwrite[0]) begin
			prio_hold = 1'b0;
			n_state = invalidate;
			ccif.ccsnoopaddr[1] = ccif.daddr[0];
			ccif.ccwait[1] = 1'b1;
			ccif.ccinv[1] = 1'b1;
		end
		else if (ccif.dREN[1]||ccif.dWEN[1]) begin
			prio_hold = 1'b1;
			n_state = setup;
			ccif.ccsnoopaddr[0] = ccif.daddr[1];
			ccif.ccwait[0] = 1'b1;
		end
		else if (ccif.ccwrite[1]) begin
			prio_hold = 1'b1;
			n_state = invalidate;
			ccif.ccsnoopaddr[0] = ccif.daddr[1];
			ccif.ccinv[0] = 1'b1;
			ccif.ccinv[0] = 1'b1;
		end
		else if (ccif.iREN[0]) begin
			prio_hold = 1'b0;
			n_state = imemfetch;
		end
		else if (ccif.iREN[1]) begin
			prio_hold = 1'b1;
			n_state = imemfetch;
		end
	end

	if(state == idle_1) begin
		if (ccif.dREN[1]||ccif.dWEN[1]) begin
			prio_hold = 1'b1;
			n_state = setup;
			ccif.ccsnoopaddr[0] = ccif.daddr[1];
			ccif.ccwait[0] = 1'b1;
		end
		else if (ccif.ccwrite[1]) begin
			prio_hold = 1'b1;
			n_state = invalidate;
			ccif.ccsnoopaddr[0] = ccif.daddr[1];
			ccif.ccinv[0] = 1'b1;
			ccif.ccinv[0] = 1'b1;
		end
		else if (ccif.dREN[0]||ccif.dWEN[0]) begin
			prio_hold = 1'b0;
			n_state = setup;
			ccif.ccsnoopaddr[1] = ccif.daddr[0];
			ccif.iwait[1] = 1'b1;
			ccif.ccwait[1] = 1'b1;		
		end
		else if (ccif.ccwrite[0]) begin
			prio_hold = 1'b0;
			n_state = invalidate;
			ccif.ccsnoopaddr[1] = ccif.daddr[0];
			ccif.ccwait[1] = 1'b1;
			ccif.ccinv[1] = 1'b1;
		end
		else if (ccif.iREN[1]) begin
			prio_hold = 1'b1;
			n_state = imemfetch;
		end
		else if (ccif.iREN[0]) begin
			prio_hold = 1'b0;
			n_state = imemfetch;
		end
	end

	if(state == imemfetch) begin
		ccif.ramaddr = ccif.iaddr[prio];
		ccif.ramREN = 1'b1;
		if (ccif.ramstate == ACCESS) begin
			n_state = ifetched;
			ccif.iload[prio] = ccif.ramload;
			ccif.iwait[prio] = 1'b0;
			ccif.ramREN = 1'b1;
		end
	end

	if(state == ifetched) begin
		ccif.iload[prio] = ccif.ramload;
		ccif.iwait[prio] = 1'b0;
		ccif.ramREN = 1'b1;
		if (ccif.iREN[prio] == 1'b0) begin
			ccif.iload[prio] = 32'b0;
			ccif.iwait[prio] = 1'b1;
			if(prio) begin
				n_state = idle_0;
			end
			else if(~prio) begin
				n_state = idle_1;
			end
		end
	end

	if(state == invalidate) begin
		ccif.ccsnoopaddr[~prio] = ccif.daddr[prio];
		ccif.ccinv[~prio] = 1'b1;
		ccif.ccwait[~prio] = 1'b1;
		ccif.ccinv[prio] = 1'b1;
//		if (ccif.ccwrite[prio] == 1'b0) begin
			if (prio) begin
				n_state = idle_0;
			end
			else if (~prio) begin
				n_state = idle_1;
			end
//		end 
	end

	if(state == setup) begin
		n_state = setup;
		ccif.ccsnoopaddr[~prio] = ccif.daddr[prio];
		ccif.ccwait[~prio] = 1'b1;
		if (ccif.dREN[prio]&ccif.cctrans[~prio])begin
			n_state = cache_to_cache_1;
			ccif.ramWEN = 1'b1;
			ccif.ramaddr = ccif.daddr[prio];
			ccif.ramstore = ccif.dstore[~prio];
		end
		else if (ccif.dREN[prio]&~ccif.cctrans[~prio])begin
			n_state = mem_to_cache_1;
			ccif.ramREN = 1'b1;
			ccif.ramaddr = ccif.daddr[prio];
		end
		else if (ccif.dWEN[prio])begin
			n_state = cache_to_mem;
			ccif.ccsnoopaddr[~prio] = 32'b0;
			ccif.ccwait[~prio] = 1'b0;
			ccif.ramWEN = 1'b1;
			ccif.ramaddr = ccif.daddr[prio];
			ccif.ramstore = ccif.dstore[prio];
		end
	end

	if(state == cache_to_cache_1) begin
		ccif.ccsnoopaddr[~prio] = ccif.daddr[prio];
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramWEN = 1'b1;
		ccif.ramaddr = ccif.daddr[prio];
		ccif.ramstore = ccif.dstore[~prio];
		if (ccif.ramstate == ACCESS) begin
			n_state = cache_to_cache_2;
			ccif.dwait[prio] = 1'b0;
			ccif.dload[prio] = ccif.dstore[~prio];
		end
	end

	if(state == cache_to_cache_2) begin
		ccif.ccsnoopaddr[~prio] = ccif.daddr[prio];
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramWEN = 1'b1;
		ccif.ramaddr = ccif.daddr[prio];
		ccif.ramstore = ccif.dstore[~prio];
		if (ccif.ramstate == ACCESS) begin
			n_state = cache_to_cache_3;
			ccif.dwait[prio] = 1'b0;
			ccif.dload[prio] = ccif.dstore[~prio];
		end
	end

	if (state == cache_to_cache_3) begin
		ccif.dwait[prio] = 1'b0;
		ccif.dload[prio] = ccif.dstore[~prio];
		ccif.ccwait[~prio] = 1'b1;
		if (~ccif.dREN[prio]) begin
			ccif.ccwait[~prio] = 1'b0;
			if (prio) begin
				ccif.ramREN = 1'b0;
				ccif.dwait[prio] = 1'b1;
				n_state = idle_0;
			end
			else if (~prio) begin
				ccif.ramREN = 1'b0;
				ccif.dwait[prio] = 1'b1;
				n_state = idle_1;
			end 
		end
	end

	if(state == mem_to_cache_1) begin
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramREN = 1'b1;
		ccif.ramaddr = ccif.daddr[prio];
		if (ccif.ramstate == ACCESS) begin
			ccif.dwait[prio] = 1'b0;
			ccif.ramREN = 1'b1;
			ccif.dload[prio] = ccif.ramload;
			n_state = mem_to_cache_2;
		end
	end

	if(state == mem_to_cache_2) begin
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramREN = 1'b1;
		ccif.ramaddr = ccif.daddr[prio];
		if (ccif.ramstate == ACCESS) begin
			ccif.dwait[prio] = 1'b0;
			ccif.ramREN = 1'b1;
			ccif.dload[prio] = ccif.ramload;
			n_state = dfetched;
		end
	end

	if(state == dfetched) begin
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramREN = 1'b0;
		ccif.dwait[prio] = 1'b1;
		if (~ccif.dREN[prio]) begin
			if (prio) begin
				ccif.ramREN = 1'b0;
				n_state = idle_0;
			end
			else if (~prio) begin
				ccif.ramREN = 1'b0;
				n_state = idle_1;
			end 
		end
	end

	if(state == cache_to_mem) begin
		ccif.ccwait[~prio] = 1'b1;
		ccif.ramWEN = 1'b1;
		ccif.ramaddr = ccif.daddr[prio];
		ccif.ramstore = ccif.dstore[prio];
		if ((ccif.ramstate == ACCESS) || (ccif.dWEN == '0)) begin	
			ccif.dwait[prio] = 1'b0;
			ccif.ccwait[~prio] = 1'b0;
			if (prio) begin
				n_state = idle_0;
			end
			else if (~prio) begin
				n_state = idle_1;
			end 
		end
	end
end


endmodule

/*

	always_comb begin //dwait & iwait 
		ccif.dwait = 1'b1;
		ccif.iwait = 1'b1;
		if (ccif.ramstate != ACCESS) begin
			ccif.dwait = 1'b1;
			ccif.iwait = 1'b1;
		end
		else begin 
			if (ccif.dREN == 1'b1 || ccif.dWEN == 1'b1) begin
				ccif.dwait = 1'b0;
			end
			else if (ccif.iREN == 1'b1) begin
				ccif.iwait = 1'b0;
			end
		end
	end

	always_comb begin //iload and dload
		ccif.iload = 32'b0;
		ccif.dload = 32'b0;
		if (ccif.ramstate == ACCESS) begin
			if (ccif.dREN == 1) begin
				ccif.dload = ccif.ramload;
			end
			else if (ccif.iREN == 1) begin
				ccif.iload = ccif.ramload;
			end
		end
	end

	always_comb begin //ramstore
		ccif.ramstore = ccif.dstore;
	end

	always_comb begin //ramaddr
		ccif.ramaddr = 32'b0;
		if (ccif.dREN == 1'b1 || ccif.dWEN == 1'b1) begin
			ccif.ramaddr = ccif.daddr;
		end
		else if (ccif.iREN == 1'b1) begin
			ccif.ramaddr = ccif.iaddr;
		end
	end
	
	always_comb begin //ramWEN
		ccif.ramWEN = 1'b0;
		if (ccif.dWEN == 1'b1) begin
			ccif.ramWEN = 1'b1;
		end
	end
	
	always_comb begin //ramREN
		ccif.ramREN = 1'b0;
		if (ccif.iREN == 1 || ccif.dREN == 1) begin
			ccif.ramREN = 1'b1;
		end
	end
endmodule

*/