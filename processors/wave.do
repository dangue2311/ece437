onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /icache_tb/CLK
add wave -noupdate /icache_tb/nRST
add wave -noupdate -divider Input
add wave -noupdate /icache_tb/memcif/iwait
add wave -noupdate /icache_tb/memcif/iload
add wave -noupdate /icache_tb/dpcif/imemREN
add wave -noupdate /icache_tb/dpcif/imemaddr
add wave -noupdate -divider Output
add wave -noupdate /icache_tb/dpcif/ihit
add wave -noupdate /icache_tb/dpcif/imemload
add wave -noupdate /icache_tb/memcif/iREN
add wave -noupdate /icache_tb/memcif/iaddr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {191 ns} 0}
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
WaveRestoreZoom {0 ns} {1 us}
