onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /readData_testbench/CLOCK_PERIOD
add wave -noupdate /readData_testbench/reset
add wave -noupdate /readData_testbench/clk
add wave -noupdate /readData_testbench/readRegister
add wave -noupdate /readData_testbench/regupdate_R15
add wave -noupdate /readData_testbench/regupdate_R14
add wave -noupdate /readData_testbench/regupdate_R13
add wave -noupdate /readData_testbench/regupdate_R12
add wave -noupdate /readData_testbench/regupdate_R11
add wave -noupdate /readData_testbench/regupdate_R10
add wave -noupdate /readData_testbench/regupdate_R9
add wave -noupdate /readData_testbench/regupdate_R8
add wave -noupdate /readData_testbench/regupdate_R7
add wave -noupdate /readData_testbench/regupdate_R6
add wave -noupdate /readData_testbench/regupdate_R5
add wave -noupdate /readData_testbench/regupdate_R4
add wave -noupdate /readData_testbench/regupdate_R3
add wave -noupdate /readData_testbench/regupdate_R2
add wave -noupdate /readData_testbench/regupdate_R1
add wave -noupdate /readData_testbench/regupdate_R0
add wave -noupdate /readData_testbench/readData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 233
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
WaveRestoreZoom {0 ps} {4135 ps}
