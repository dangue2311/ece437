onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -divider Address
add wave -noupdate /system_tb/DUT/CPU/DP/addr_curr
add wave -noupdate /system_tb/DUT/CPU/DP/addr_nxt
add wave -noupdate -divider ALU
add wave -noupdate /system_tb/DUT/CPU/DP/aluif/portA
add wave -noupdate /system_tb/DUT/CPU/DP/aluif/portB
add wave -noupdate /system_tb/DUT/CPU/DP/aluif/aluop
add wave -noupdate /system_tb/DUT/CPU/DP/aluif/zero
add wave -noupdate /system_tb/DUT/CPU/DP/aluif/outport
add wave -noupdate -divider {Request Unit}
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/MemRead
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/MemWrite
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/halt
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dREN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/dWEN
add wave -noupdate /system_tb/DUT/CPU/DP/ruif/iREN
add wave -noupdate /system_tb/DUT/CPU/DP/heyy/cases
add wave -noupdate -divider {Register File}
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat1
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rsel2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/rdat2
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/WEN
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wsel
add wave -noupdate /system_tb/DUT/CPU/DP/rfif/wdat
add wave -noupdate -divider Control
add wave -noupdate /system_tb/DUT/CPU/DP/conif/ALUop
add wave -noupdate /system_tb/DUT/CPU/DP/conif/ALUSrc
add wave -noupdate /system_tb/DUT/CPU/DP/conif/bne_flag
add wave -noupdate /system_tb/DUT/CPU/DP/conif/branch
add wave -noupdate /system_tb/DUT/CPU/DP/conif/extend_immi
add wave -noupdate /system_tb/DUT/CPU/DP/conif/halt
add wave -noupdate /system_tb/DUT/CPU/DP/conif/j_jal_flag
add wave -noupdate /system_tb/DUT/CPU/DP/conif/jal_flag
add wave -noupdate /system_tb/DUT/CPU/DP/conif/jr_flag
add wave -noupdate /system_tb/DUT/CPU/DP/conif/lui_flag
add wave -noupdate /system_tb/DUT/CPU/DP/conif/MemRead
add wave -noupdate /system_tb/DUT/CPU/DP/conif/MemtoReg
add wave -noupdate /system_tb/DUT/CPU/DP/conif/MemWrite
add wave -noupdate /system_tb/DUT/CPU/DP/conif/RegDst
add wave -noupdate /system_tb/DUT/CPU/DP/conif/RegWrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156549 ps} 0}
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
WaveRestoreZoom {0 ps} {1418530 ps}
