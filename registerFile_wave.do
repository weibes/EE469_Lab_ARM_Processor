onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /registerFile_testbench/CLOCK_PERIOD
add wave -noupdate /registerFile_testbench/writeEnable
add wave -noupdate /registerFile_testbench/readReg1
add wave -noupdate /registerFile_testbench/readReg2
add wave -noupdate /registerFile_testbench/reset
add wave -noupdate /registerFile_testbench/clk
add wave -noupdate /registerFile_testbench/writeData
add wave -noupdate /registerFile_testbench/writeDestination
add wave -noupdate /registerFile_testbench/readData1
add wave -noupdate /registerFile_testbench/readData2
add wave -noupdate /registerFile_testbench/writeToPC
add wave -noupdate /registerFile_testbench/oldPCVal
add wave -noupdate -expand /registerFile_testbench/dut/regFile
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 393
configure wave -valuecolwidth 229
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
WaveRestoreZoom {0 ps} {10776 ps}
