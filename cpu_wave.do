onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_testbench/clk
add wave -noupdate /cpu_testbench/nreset
add wave -noupdate /cpu_testbench/dut/ps
add wave -noupdate /cpu_testbench/dut/ns
add wave -noupdate -group PC /cpu_testbench/dut/PC/Branch
add wave -noupdate -group PC /cpu_testbench/dut/PC/clk
add wave -noupdate -group PC /cpu_testbench/dut/PC/writeEnable
add wave -noupdate -group PC /cpu_testbench/dut/PC/reset
add wave -noupdate -group PC /cpu_testbench/dut/PC/branchImmediate
add wave -noupdate -group PC /cpu_testbench/dut/PC/writeData
add wave -noupdate -group PC /cpu_testbench/dut/PC/currData
add wave -noupdate -group PC /cpu_testbench/dut/PC/nextData
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/clk
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/nreset
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/addr
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/dataOut
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/memory
add wave -noupdate -group instrMem /cpu_testbench/dut/Memory/addrReg
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/instructionOUT
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/pcValOUT
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/CPSRFlags_INST_OUT
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/reset
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/clk
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/CPSRFlags_In
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/instructionIN
add wave -noupdate -group {IF Register --------------} /cpu_testbench/dut/instFetch/pcValIN
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/instruction
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/reset
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/clk
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/linkBit
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/prePostAddOffset
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/upDownOffset
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/byteOrWord
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/writeBack
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/loadStore
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/CPSRwrite
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/immediateOperand
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/rd
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/rn
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/rm
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/cond
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/opcode
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/branchImmediate
add wave -noupdate -group {sort Instr} /cpu_testbench/dut/sortInstr/shifterVals
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/writeEnable
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/reset
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/clk
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/linkBit
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/writeData
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/oldPCVal
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/writeDestination
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/readReg1
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/readReg2
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/readData1
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/readData2
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/writeToPC
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/internalDataHold
add wave -noupdate -group {reg file} /cpu_testbench/dut/reg_file/regFile
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/immediateOperand
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/opcode
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/data12In
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/branchOffset
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/rmData
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/shiftedData
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/rm_shift
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/shiftType
add wave -noupdate -group shifter /cpu_testbench/dut/shifty/immediateData
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/cond
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/CPSRIn
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/reset
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/clk
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/conditionalExecute
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/Z
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/C
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/N
add wave -noupdate -group condTest /cpu_testbench/dut/condTest/V
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/Data1IN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/Data2IN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/linkBitIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/prePostAddOffsetIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/upDownOffsetIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/byteOrWordIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/writeBackIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/loadStoreIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/CPSRwriteIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/immediateOperandIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/reset
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/clk
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/rdIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/rmIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/opcodeIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/conditionalExecuteIN
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/Data1OUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/Data2OUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/linkBitOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/prePostAddOffsetOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/upDownOffsetOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/byteOrWordOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/writeBackOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/loadStoreOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/CPSRwriteOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/immediateOperandOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/rdOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/rmOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/opcodeOUT
add wave -noupdate -group {Register Fetch Register --} /cpu_testbench/dut/regFetch/conditionalExecuteOUT
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/data1
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/data2
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/operation
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/reset
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/clk
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/result
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/flags
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/AluWritebackTest
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/unsignedData1
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/unsignedData2
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/unsignedResult
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/negativeData
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/Z
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/C
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/N
add wave -noupdate -group ALU /cpu_testbench/dut/numberCrunch/V
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/opcode
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/ALUresult
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/branchImmediate
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/conditionalExecute
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/aluWritebackTest
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/aluMuxout
add wave -noupdate -group {alu out mux} /cpu_testbench/dut/aluOutMux/writebackEnable
add wave -noupdate -group {address mux} /cpu_testbench/dut/addrMux/preCheck
add wave -noupdate -group {address mux} /cpu_testbench/dut/addrMux/ALUInput
add wave -noupdate -group {address mux} /cpu_testbench/dut/addrMux/d0Input
add wave -noupdate -group {address mux} /cpu_testbench/dut/addrMux/dataOut
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/Data1_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/Data2_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/linkBit_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/prePostAddOffset_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/upDownOffset_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/byteOrWord_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writeBack_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/loadStore_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writebackEnable_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/reset
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/clk
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/rd_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/rm_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/opcode_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writeData_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/addrFinalWire_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/ALUResult_EX
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/CPSRFlags_EX_In
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/Data1_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/Data2_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/linkBit_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/prePostAddOffset_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/upDownOffset_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/byteOrWord_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writeBack_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/loadStore_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writebackEnable_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/rd_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/rm_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/opcode_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/writeData_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/addrFinalWire_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/ALUResult_EX_OUT
add wave -noupdate -group {EX Register --------------} /cpu_testbench/dut/ex/CPSRFlags_EX_OUT
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/addr
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/dataIn
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/readNotWrite
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/memoryEnable
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/reset
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/clk
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/dataOut
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/internalDataHold
add wave -noupdate -group dataMemory /cpu_testbench/dut/dataMem/mainMemory
add wave -noupdate -group writeDataMux /cpu_testbench/dut/whatWrite/dMemIn
add wave -noupdate -group writeDataMux /cpu_testbench/dut/whatWrite/ALUIn
add wave -noupdate -group writeDataMux /cpu_testbench/dut/whatWrite/isDataAccess
add wave -noupdate -group writeDataMux /cpu_testbench/dut/whatWrite/regWriteDataOut
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/linkBit
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/writebackEnable
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/reset
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/clk
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/dataMemOut_DMR
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/writeData_DMR
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/rd_DMR
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/CPSRStatus_In
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/dataMemOut_DMR_OUT
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/writeData_DMR_OUT
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/rd_DMR_OUT
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/CPSRStatus_DMR_OUT
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/linkBit_DMR_OUT
add wave -noupdate -group {dataMem REgister ---------} /cpu_testbench/dut/DataMemReg/writebackEnable_DMR_OUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1300 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 367
configure wave -valuecolwidth 218
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
WaveRestoreZoom {0 ps} {10981 ps}
