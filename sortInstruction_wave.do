onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sortInstruction_testbench/CLOCK_PERIOD
add wave -noupdate /sortInstruction_testbench/instruction
add wave -noupdate /sortInstruction_testbench/reset
add wave -noupdate /sortInstruction_testbench/clk
add wave -noupdate /sortInstruction_testbench/linkBit
add wave -noupdate /sortInstruction_testbench/prePostAddOffset
add wave -noupdate /sortInstruction_testbench/upDownOffset
add wave -noupdate /sortInstruction_testbench/byteOrWord
add wave -noupdate /sortInstruction_testbench/writeBack
add wave -noupdate /sortInstruction_testbench/loadStore
add wave -noupdate /sortInstruction_testbench/rd
add wave -noupdate /sortInstruction_testbench/rn
add wave -noupdate /sortInstruction_testbench/rm
add wave -noupdate /sortInstruction_testbench/opcode
add wave -noupdate /sortInstruction_testbench/cond
add wave -noupdate /sortInstruction_testbench/rotateVal
add wave -noupdate /sortInstruction_testbench/rm_shift
add wave -noupdate /sortInstruction_testbench/immediateVal
add wave -noupdate /sortInstruction_testbench/immediateOffset
add wave -noupdate /sortInstruction_testbench/branchImmediate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 296
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
WaveRestoreZoom {0 ps} {12724 ps}
