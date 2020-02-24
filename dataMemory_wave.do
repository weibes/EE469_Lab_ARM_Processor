onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dataMemory_testbench/dut/addr
add wave -noupdate /dataMemory_testbench/dut/dataIn
add wave -noupdate /dataMemory_testbench/dut/readNotWrite
add wave -noupdate /dataMemory_testbench/dut/memoryEnable
add wave -noupdate /dataMemory_testbench/dut/reset
add wave -noupdate /dataMemory_testbench/dut/clk
add wave -noupdate /dataMemory_testbench/dut/dataOut
add wave -noupdate /dataMemory_testbench/dut/internalData
add wave -noupdate /dataMemory_testbench/dut/mainMemory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {55 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 142
configure wave -valuecolwidth 191
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {902 ps}
