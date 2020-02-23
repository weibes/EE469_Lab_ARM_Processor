onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/clk
add wave -noupdate /cpu_testbench/nreset
add wave -noupdate /cpu_testbench/dut/instFetch/instructionOUT
add wave -noupdate /cpu_testbench/dut/instFetch/reset
add wave -noupdate /cpu_testbench/dut/instFetch/clk
add wave -noupdate /cpu_testbench/dut/instFetch/instructionIN
add wave -noupdate /cpu_testbench/dut/sortInstr/instruction
add wave -noupdate /cpu_testbench/dut/sortInstr/reset
add wave -noupdate /cpu_testbench/dut/sortInstr/clk
add wave -noupdate /cpu_testbench/dut/sortInstr/linkBit
add wave -noupdate /cpu_testbench/dut/sortInstr/prePostAddOffset
add wave -noupdate /cpu_testbench/dut/sortInstr/upDownOffset
add wave -noupdate /cpu_testbench/dut/sortInstr/byteOrWord
add wave -noupdate /cpu_testbench/dut/sortInstr/writeBack
add wave -noupdate /cpu_testbench/dut/sortInstr/loadStore
add wave -noupdate /cpu_testbench/dut/sortInstr/CPSRwrite
add wave -noupdate /cpu_testbench/dut/sortInstr/immediateOperand
add wave -noupdate /cpu_testbench/dut/sortInstr/rd
add wave -noupdate /cpu_testbench/dut/sortInstr/rn
add wave -noupdate /cpu_testbench/dut/sortInstr/rm
add wave -noupdate /cpu_testbench/dut/sortInstr/cond
add wave -noupdate /cpu_testbench/dut/sortInstr/opcode
add wave -noupdate /cpu_testbench/dut/sortInstr/branchImmediate
add wave -noupdate /cpu_testbench/dut/sortInstr/shifterVals
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/Branch
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/clk
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/writeEnable
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/incrEnable
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/reset
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/branchImmediate
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/writeData
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/currData
add wave -noupdate -expand -group PC /cpu_testbench/dut/PC/nextData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {69 ps} 0}
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
WaveRestoreZoom {0 ps} {491 ps}
