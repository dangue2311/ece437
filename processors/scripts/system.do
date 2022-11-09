onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/halt
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/ihit
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/imemREN
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/imemload
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/imemaddr
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dhit
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/datomic
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dmemREN
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dmemWEN
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/flushed
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dmemload
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dmemstore
add wave -noupdate -group Datapath /system_tb/DUT/CPU/dcif/dmemaddr
add wave -noupdate /system_tb/DUT/CPU/DP/hold2
add wave -noupdate /system_tb/DUT/CPU/DP/state
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/load_use
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/jump_use
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/fetch_instruction
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/dec_instruction
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/exec_instruction
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/mem_instruction
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/flag_lu
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/flag_ju
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/flag_lu_done
add wave -noupdate -group {Hazard Unit} /system_tb/DUT/CPU/DP/huif/flag_ju_done
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/CLK
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/nRST
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/state
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_state
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/hit_cnt
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_hit_cnt
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/miss_count
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_miss_count
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/miss_hit_flag
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_miss_hit_flag
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/lru
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_lru
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/ind
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_ind
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/request
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/frames
add wave -noupdate -group {Data Cache} /system_tb/DUT/CPU/CM/DCACHE/n_frames
add wave -noupdate /system_tb/DUT/CPU/DP/DEC/REGF/registers
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/jump_sig
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/enable
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/ihit
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/dhit
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/jump_use
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/load_use
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/PC
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/pp4
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/new_PC
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/cache_in
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/instruction
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/jump_add
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/jump_jr
add wave -noupdate -group {Instruction Fetch} /system_tb/DUT/CPU/DP/ifif/addr_curr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4895811 ps} 0}
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
WaveRestoreZoom {4764878 ps} {5054259 ps}
