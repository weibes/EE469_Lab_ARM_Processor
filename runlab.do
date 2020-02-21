# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./programCounter.v"
vlog "./registerFile.v"
vlog "./sortInstruction.v"
vlog "./cpu.v"
vlog "./instructionMemory.v"
vlog "./ALU.v"
vlog "./conditionTest.v"
vlog "./shifter.v"
vlog "./writeBackEnableChecker.v"
vlog "./writeBackEnableChecker.v"
vlog "./regWriteMux.v"
vlog "./instructionFetchRegister.v"
vlog "./executeRegister.v"
vlog "./DataMemoryRegister.v"
vlog "./dataMemory.v"
vlog "./ALUOutputMux.v"
vlog "./addrInputMux.v"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work registerFile_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do registerFile_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
