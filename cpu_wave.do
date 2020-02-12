onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/CLOCK_PERIOD
add wave -noupdate /cpu_testbench/clk
add wave -noupdate /cpu_testbench/nreset
add wave -noupdate /cpu_testbench/led
add wave -noupdate /cpu_testbench/debug_port1
add wave -noupdate /cpu_testbench/debug_port2
add wave -noupdate /cpu_testbench/debug_port3
add wave -noupdate /cpu_testbench/debug_port4
add wave -noupdate /cpu_testbench/debug_port5
add wave -noupdate /cpu_testbench/debug_port6
add wave -noupdate /cpu_testbench/debug_port7
add wave -noupdate /cpu_testbench/dut/PC/Branch
add wave -noupdate /cpu_testbench/dut/PC/Reset
add wave -noupdate /cpu_testbench/dut/PC/clk
add wave -noupdate /cpu_testbench/dut/PC/branchImmediate
add wave -noupdate /cpu_testbench/dut/PC/currData
add wave -noupdate /cpu_testbench/dut/PC/nextData
add wave -noupdate /cpu_testbench/dut/Memory/nreset
add wave -noupdate /cpu_testbench/dut/Memory/addr
add wave -noupdate /cpu_testbench/dut/Memory/dataOut
add wave -noupdate /cpu_testbench/dut/Memory/addrReg
add wave -noupdate /cpu_testbench/dut/Memory/memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 262
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
WaveRestoreZoom {0 ps} {14604 ps}
