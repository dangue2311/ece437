onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dhit
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dmemREN
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dmemWEN
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dmemload
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dmemstore
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/dmemaddr
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/datomic
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/flushed
add wave -noupdate -group {dCache DP0} /system_tb/DUT/CPU/dcif0/halt
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dhit
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dmemREN
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dmemWEN
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dmemload
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dmemstore
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/dmemaddr
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/datomic
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/flushed
add wave -noupdate -group {dCache DP1} /system_tb/DUT/CPU/dcif1/halt
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/prio
add wave -noupdate -group Bus /system_tb/DUT/CPU/CC/state
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group RAM /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group {iCache DP0} /system_tb/DUT/CPU/dcif0/ihit
add wave -noupdate -group {iCache DP0} /system_tb/DUT/CPU/dcif0/imemREN
add wave -noupdate -group {iCache DP0} /system_tb/DUT/CPU/dcif0/imemload
add wave -noupdate -group {iCache DP0} /system_tb/DUT/CPU/dcif0/imemaddr
add wave -noupdate -group {iCache DP0} /system_tb/DUT/CPU/dcif0/halt
add wave -noupdate -group {iCache DP1} /system_tb/DUT/CPU/dcif1/ihit
add wave -noupdate -group {iCache DP1} /system_tb/DUT/CPU/dcif1/imemREN
add wave -noupdate -group {iCache DP1} /system_tb/DUT/CPU/dcif1/imemload
add wave -noupdate -group {iCache DP1} /system_tb/DUT/CPU/dcif1/imemaddr
add wave -noupdate -group {iCache DP1} /system_tb/DUT/CPU/dcif1/halt
add wave -noupdate -group {dcache reg0} -expand -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/frames[0]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/frames[0][1]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/frames[0][1].data} -expand {/system_tb/DUT/CPU/CM0/DCACHE/frames[0][0]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/frames[0][0].data} -expand} /system_tb/DUT/CPU/CM0/DCACHE/frames
add wave -noupdate -group {dcache reg0} /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -group {dcache reg1} -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/frames[0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/frames[0][1]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/frames[0][1].data} -expand {/system_tb/DUT/CPU/CM1/DCACHE/frames[0][0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/frames[0][0].data} -expand} /system_tb/DUT/CPU/CM1/DCACHE/frames
add wave -noupdate -group {dcache reg1} /system_tb/DUT/CPU/CM1/DCACHE/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1156234 ps} 0}
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
WaveRestoreZoom {150647 ps} {1657264 ps}
