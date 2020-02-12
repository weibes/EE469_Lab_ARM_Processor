onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALU_testbench/cond
add wave -noupdate /ALU_testbench/data1
add wave -noupdate /ALU_testbench/data2
add wave -noupdate /ALU_testbench/operation
add wave -noupdate /ALU_testbench/reset
add wave -noupdate /ALU_testbench/clk
add wave -noupdate /ALU_testbench/dut/unsignedResult
add wave -noupdate /ALU_testbench/result
add wave -noupdate /ALU_testbench/dut/negativeData
add wave -noupdate /ALU_testbench/dut/unsignedData1
add wave -noupdate /ALU_testbench/dut/unsignedData2
add wave -noupdate /ALU_testbench/dut/Z
add wave -noupdate /ALU_testbench/dut/C
add wave -noupdate /ALU_testbench/dut/N
add wave -noupdate /ALU_testbench/dut/V
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {664 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 301
configure wave -valuecolwidth 263
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
WaveRestoreZoom {0 ps} {11276 ps}
