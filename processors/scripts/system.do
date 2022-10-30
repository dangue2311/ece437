onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/cache
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/i_add
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/ihit
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/miss
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/imemload
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/cache
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/i_add
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/ihit
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/miss
add wave -noupdate -group iCache /system_tb/DUT/CPU/CM/ICACHE/imemload
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/offset
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/i
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/index
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/truncated_row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/miss
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/hit_count
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_hit_count
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_state
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_data1
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_data2
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_data1
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_data2
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_dirty
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_valid
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_dirty
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_valid
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/j
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/offset
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/i
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/index
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/truncated_row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/miss
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_row
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/hit_count
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_hit_count
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/next_state
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_tag
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_data1
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_data2
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_data1
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_data2
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_dirty
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame1_valid
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_dirty
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/frame2_valid
add wave -noupdate -expand -group dCache /system_tb/DUT/CPU/CM/DCACHE/j
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/halt
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/ihit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold1
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold2
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dhit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemWEN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/flushed
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemstore
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/halt
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/ihit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold1
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold2
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dhit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemWEN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/flushed
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemstore
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/halt
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/ihit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold1
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold2
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dhit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/datomic
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemWEN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/flushed
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemstore
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/halt
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/ihit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold1
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/hold2
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/imemaddr
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dhit
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/datomic
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemREN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemWEN
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/flushed
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemload
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemstore
add wave -noupdate -expand -group Datapath /system_tb/DUT/CPU/DP/caif/dmemaddr
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_sig
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/ihit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/dhit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/load_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/pp4
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/new_PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/cache_in
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/instruction
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_add
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_jr
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_sig
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/ihit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/dhit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/load_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/pp4
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/new_PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/cache_in
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/instruction
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_add
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_jr
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_sig
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/ihit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/dhit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/load_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/pp4
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/new_PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/cache_in
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/instruction
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_add
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_jr
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_sig
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/ihit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/dhit
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/load_use
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/pp4
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/new_PC
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/cache_in
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/instruction
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_add
add wave -noupdate -group {instruction fetch} /system_tb/DUT/CPU/DP/ifif/jump_jr
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_sig
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/ihit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/dhit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/load_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/new_PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_add
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_jr
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_sig
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/ihit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/dhit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/load_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/new_PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_add
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_jr
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_sig
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/ihit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/dhit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/load_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/new_PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_add
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_jr
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_sig
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/ihit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/dhit
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/load_use
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/new_PC
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_add
add wave -noupdate -group {Program Counter} /system_tb/DUT/CPU/DP/IFETCH/pcif/jump_jr
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/PCSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/bne_eq
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/MemtoReg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/in_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/out_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BNE
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BEQ
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LUI
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JAL
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JR
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/halt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dREN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ihit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dhit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/flushed
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ALUSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegDest
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/instruction
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_in
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/write_data
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/SignExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ZeroExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LowerZero
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/shamt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rs
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rd
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/init_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/final_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/aluop
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/imm
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat1
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat2
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/inst_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpJr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/PCSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/bne_eq
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/MemtoReg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/in_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/out_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BNE
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BEQ
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LUI
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JAL
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JR
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/halt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dREN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ihit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dhit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/flushed
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ALUSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegDest
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/instruction
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_in
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/write_data
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/SignExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ZeroExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LowerZero
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/shamt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rs
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rd
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/init_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/final_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/aluop
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/imm
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat1
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat2
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/inst_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpJr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/PCSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/bne_eq
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/MemtoReg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/in_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/out_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BNE
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BEQ
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LUI
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JAL
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JR
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/halt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dREN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ihit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dhit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/flushed
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ALUSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegDest
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/instruction
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_in
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/write_data
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/SignExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ZeroExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LowerZero
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/shamt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rs
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rd
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/init_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/final_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/aluop
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/imm
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat1
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat2
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/inst_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpJr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/PCSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/bne_eq
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/MemtoReg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/in_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/out_WEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BNE
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/BEQ
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LUI
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JAL
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JR
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/halt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dWEN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dREN
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ihit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/dhit
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/jump_use
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/flushed
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/load_use_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ALUSrc
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/RegDest
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpSel_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/instruction
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_in
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/pp4_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/write_data
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/SignExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/ZeroExt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/LowerZero
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/shamt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rs
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rt
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rd
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/init_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/final_write_reg
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/aluop
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/imm
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat1
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/rdat2
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/inst_out
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpAddr_inst
add wave -noupdate -group Decode /system_tb/DUT/CPU/DP/deif/JumpJr_inst
add wave -noupdate -group Register -expand /system_tb/DUT/CPU/DP/DEC/REGF/registers
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/WEN
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wsel
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wdat
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/register31
add wave -noupdate -group Register -expand /system_tb/DUT/CPU/DP/DEC/REGF/registers
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/WEN
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wsel
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wdat
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/register31
add wave -noupdate -group Register -expand /system_tb/DUT/CPU/DP/DEC/REGF/registers
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/WEN
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wsel
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wdat
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/register31
add wave -noupdate -group Register -expand /system_tb/DUT/CPU/DP/DEC/REGF/registers
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/WEN
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wsel
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rsel2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/wdat
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat1
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/rdat2
add wave -noupdate -group Register /system_tb/DUT/CPU/DP/DEC/rfif/register31
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/PCSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/MemtoReg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BNE
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BEQ
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/LUI
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JAL
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JR
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/halt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imemREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ihit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dhit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ALUSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegDest
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JumpSel
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/inst
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/aluop
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rs
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rd
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/init_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/final_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imm
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/shamt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/PCSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/MemtoReg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BNE
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BEQ
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/LUI
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JAL
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JR
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/halt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imemREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ihit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dhit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ALUSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegDest
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JumpSel
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/inst
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/aluop
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rs
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rd
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/init_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/final_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imm
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/shamt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/PCSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/MemtoReg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BNE
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BEQ
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/LUI
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JAL
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JR
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/halt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imemREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ihit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dhit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ALUSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegDest
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JumpSel
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/inst
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/aluop
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rs
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rd
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/init_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/final_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imm
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/shamt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/PCSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/MemtoReg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BNE
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/BEQ
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/LUI
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JAL
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JR
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/halt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dWEN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imemREN
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ihit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/dhit
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/ALUSrc
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/RegDest
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/JumpSel
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/inst
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/aluop
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rs
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rt
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/rd
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/init_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/final_write_reg
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/imm
add wave -noupdate -group {Control Unit} /system_tb/DUT/CPU/DP/DEC/cuif/shamt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ihit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/dhit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/flushed
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/extend_immi
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/z_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/aluop
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/addr_curr4
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/sign_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/zero_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/branch_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_eq
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_a
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_b
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_alu
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ALUSrc
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ihit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/dhit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/flushed
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/extend_immi
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/z_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/aluop
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/addr_curr4
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/sign_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/zero_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/branch_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_eq
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_a
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_b
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_alu
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ALUSrc
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ihit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/dhit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/flushed
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/extend_immi
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/z_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/aluop
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/addr_curr4
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/sign_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/zero_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/branch_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_eq
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_a
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_b
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_alu
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ALUSrc
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ihit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/dhit
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/flushed
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/load_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_use_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/extend_immi
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/z_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_flag_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/aluop
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/write_reg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/addr_curr4
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/sign_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/zero_extend
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/branch_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat1_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_dat2_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lower_zero_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_addr_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jr_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/j_jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_write_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/mem_read_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/lui_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jal_flag_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/memtoreg_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/halt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/regWEN
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/bne_eq
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/read_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/instruction_next
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_a
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_b
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_alu
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/forward_mem
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/jump_out
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/exeif/ALUSrc
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/zero
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/overflow
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/negative
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/aluop
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/outport
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/zero
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/overflow
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/negative
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/aluop
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/outport
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/zero
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/overflow
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/negative
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/aluop
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/outport
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/zero
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/overflow
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/negative
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/aluop
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/EXECUTE/aluif/outport
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jr_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/stall
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/branch_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_in
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat2_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/dhit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/ihit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/flushed
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/zout
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat1
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_eq
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jr_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/stall
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/branch_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_in
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat2_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/dhit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/ihit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/flushed
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/zout
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat1
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_eq
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jr_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/stall
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/branch_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_in
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat2_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/dhit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/ihit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/flushed
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/zout
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat1
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_eq
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/load_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jr_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_flag
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/stall
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_mem_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/branch_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regWEN
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump_use_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/write_reg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_in
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memory_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lui_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jal_flag_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memtoreg_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/regwrite_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/addr_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat2_out
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/dhit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/ihit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/flushed
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/zout
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/j_jal_addr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/lower_zero
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/read_dat1
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/out_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/instruction_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memwrite
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/memread
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/halt_next
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/jump
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_eq
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/memif/bne_flag
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/ihit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/dhit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LUI
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/JAL
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/MemtoReg
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/imm
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/alu_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/read_mem
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LowerZero
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/jal_addr
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/final_write_data
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/ihit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/dhit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LUI
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/JAL
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/MemtoReg
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/imm
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/alu_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/read_mem
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LowerZero
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/jal_addr
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/final_write_data
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/ihit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/dhit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LUI
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/JAL
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/MemtoReg
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/imm
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/alu_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/read_mem
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LowerZero
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/jal_addr
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/final_write_data
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/ihit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/dhit
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LUI
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/JAL
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/MemtoReg
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/regWEN_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_in
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/write_reg_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/imm
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/alu_out
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/read_mem
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/LowerZero
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/jal_addr
add wave -noupdate -group WriteBack /system_tb/DUT/CPU/DP/wbif/final_write_data
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/load_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/jump_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/fetch_instruction
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rs_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rt_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rd_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rs_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rt_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rd_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rs_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rt_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rd_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rs_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rt_fetch
add wave -noupdate -group Hazard -group {Fetch instruction} /system_tb/DUT/CPU/DP/HUNIT/rd_fetch
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/dec_instruction
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rs_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rt_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rd_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rs_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rt_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rd_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rs_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rt_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rd_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rs_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rt_dec
add wave -noupdate -group Hazard -group Decode /system_tb/DUT/CPU/DP/HUNIT/rd_dec
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/exec_instruction
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rs_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rt_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rd_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rs_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rt_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rd_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rs_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rt_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rd_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rs_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rt_exec
add wave -noupdate -group Hazard -group Execuute /system_tb/DUT/CPU/DP/HUNIT/rd_exec
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/load_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/jump_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/fetch_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/dec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/exec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/load_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/jump_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/fetch_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/dec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/exec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/load_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/jump_use
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/fetch_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/dec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/exec_instruction
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_lu_done
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flag_ju_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {851677 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {267 ns} {1157 ns}
