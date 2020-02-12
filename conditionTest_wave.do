onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /conditionTest_testbench/cond
add wave -noupdate /conditionTest_testbench/Z
add wave -noupdate /conditionTest_testbench/C
add wave -noupdate /conditionTest_testbench/N
add wave -noupdate /conditionTest_testbench/V
add wave -noupdate /conditionTest_testbench/reset
add wave -noupdate /conditionTest_testbench/clk
add wave -noupdate /conditionTest_testbench/execute
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 253
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
WaveRestoreZoom {0 ps} {1444 ps}
