onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group {Datapath 0} /system_tb/DUT/CPU/dcif0/halt
add wave -noupdate -group {Datapath 0} /system_tb/DUT/CPU/dcif0/flushed
add wave -noupdate -group {Datapath 0} /system_tb/DUT/CPU/DP0/DEC/REGF/registers
add wave -noupdate -group {Datapath 0} -group Instruction /system_tb/DUT/CPU/dcif0/ihit
add wave -noupdate -group {Datapath 0} -group Instruction /system_tb/DUT/CPU/dcif0/imemREN
add wave -noupdate -group {Datapath 0} -group Instruction /system_tb/DUT/CPU/dcif0/imemload
add wave -noupdate -group {Datapath 0} -group Instruction /system_tb/DUT/CPU/dcif0/imemaddr
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dhit
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dmemREN
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dmemWEN
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/datomic
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dmemload
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dmemstore
add wave -noupdate -group {Datapath 0} -group Data /system_tb/DUT/CPU/dcif0/dmemaddr
add wave -noupdate -group {Datapath 1} /system_tb/DUT/CPU/dcif1/halt
add wave -noupdate -group {Datapath 1} /system_tb/DUT/CPU/dcif1/flushed
add wave -noupdate -group {Datapath 1} /system_tb/DUT/CPU/DP1/DEC/REGF/registers
add wave -noupdate -group {Datapath 1} -group Instruction /system_tb/DUT/CPU/dcif1/ihit
add wave -noupdate -group {Datapath 1} -group Instruction /system_tb/DUT/CPU/dcif1/imemREN
add wave -noupdate -group {Datapath 1} -group Instruction /system_tb/DUT/CPU/dcif1/imemload
add wave -noupdate -group {Datapath 1} -group Instruction /system_tb/DUT/CPU/dcif1/imemaddr
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dhit
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dmemREN
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dmemWEN
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/datomic
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dmemload
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dmemstore
add wave -noupdate -group {Datapath 1} -group Data /system_tb/DUT/CPU/dcif1/dmemaddr
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/load_use
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/jump_use
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/fetch_instruction
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/dec_instruction
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/exec_instruction
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/mem_instruction
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/flag_lu
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/flag_ju
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/flag_lu_done
add wave -noupdate -group {Hazard Unit 0} /system_tb/DUT/CPU/DP0/huif/flag_ju_done
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/load_use
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/jump_use
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/fetch_instruction
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/dec_instruction
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/exec_instruction
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/mem_instruction
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/flag_lu
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/flag_ju
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/flag_lu_done
add wave -noupdate -group {Hazard Unit 1} /system_tb/DUT/CPU/DP1/huif/flag_ju_done
add wave -noupdate /system_tb/DUT/CPU/CC/state
add wave -noupdate /system_tb/DUT/CPU/CC/prio
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramREN
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramWEN
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramaddr
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramstore
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramload
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/ramstate
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/memREN
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/memWEN
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/memaddr
add wave -noupdate -group Ram /system_tb/DUT/CPU/scif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5618538 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 148
configure wave -valuecolwidth 115
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
WaveRestoreZoom {5304 ns} {6469 ns}
