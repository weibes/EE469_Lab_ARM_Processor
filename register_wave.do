onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_testbench/CLOCK_PERIOD
add wave -noupdate /register_testbench/reset
add wave -noupdate /register_testbench/clk
add wave -noupdate /register_testbench/writeEnable
add wave -noupdate /register_testbench/regin
add wave -noupdate /register_testbench/regout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {261 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 275
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {261 ps} {4671 ps}
