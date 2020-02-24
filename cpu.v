module cpu(
  input wire clk,
  input wire nreset,
  output wire led,
  output wire [7:0] debug_port1,
  output wire [7:0] debug_port2,
  output wire [7:0] debug_port3,
  output wire [7:0] debug_port4,
  output wire [7:0] debug_port5,
  output wire [7:0] debug_port6,
  output wire [7:0] debug_port7
  );

  

	

	
	// INSTRUCTIONMEMORY variables
		//to
	reg [31:0] instrLocReg;
		//from
	wire [31:0] nextInstrWire;
	 // pass to register
	reg  [31:0] nextInstrReg;
	
	
	//instructionFetchRegister variables
	//from
	wire [31:0] nextInstr_INSTfetch_Wire, pcVal_INST_Wire;
	wire [3:0] CPSRStatus_INST_Wire;
	wire writeBackEnable_INST_Wire;
	//to reg
	reg [3:0] CPSRStatus_INST_Reg;
	reg writeBackEnable_INST_Reg;
	//nextInstr in sort Instruction
	//pcVal_INST_Reg in regFile
	
	
	// SORTINSTRUCTION variables
		//to
	reg [31:0] nextInstr_INSTfetch_Reg;
		//from
	wire linkBitWire, prePostAddOffsetWire, upDownOffsetWire, byteOrWordWire, writeBackWire, loadStoreWire, CPSRwritewire, immediateOperandWire;
	wire [1:0] shiftTypeWire;
	wire [3:0] rdWire, rnWire, rmWire, condWire, rotateValWire;
	wire [4:0] opcodeWire;
	wire [7:0] immediateValWire;
	wire [23:0] branchImmediateWire;
	wire [11:0] shifterValsWire;
	
	// pass to register

	reg linkBitReg, prePostAddOffsetReg, upDownOffsetReg, byteOrWordReg, writeBackReg, loadStoreReg, CPSRwriteReg, immediateOperandReg;
	reg [1:0] shiftTypeReg;
	reg [3:0] rdReg, rnReg, rmReg, condReg, rotateValReg;
	reg [4:0] opcodeReg;
	reg [7:0] immediateValReg;
	reg [23:0] branchImmediateReg;
	reg [11:0] shifterValsReg;
	
	

	//REGISTERFILE variables
	//to
	reg readWrite;
	reg [3:0] rd,rm,rn;
	reg [31:0] writeData, pcVal_INST_Reg;
		//from
	wire [31:0] rmDataWire, rnDataWire;
	wire WriteToPCWire;
	 // pass to register
	reg [31:0] rnDataReg, rmDataReg;
	reg WriteToPCReg;
	
	
	

	//SHIFTER variables
	//from
	wire [31:0] shiftedDataWire;
	//pass to register 
	reg [31:0] shiftedDataReg;
  
  
  //CONDITIONTEST variables
  		//to
	reg [3:0] CPSRStatusReg;	
		//from
	wire conditionalExecuteWire;
	//pass to register
	reg conditionalExecuteReg;
												
								

	//registerFetchRegister variables							
	//from
	wire [31:0] Data1_RFR;
	wire [31:0] Data2_RFR;
	wire linkBit_RFR, prePostAddOffset_RFR, upDownOffset_RFR, byteOrWord_RFR, writeBack_RFR, loadStore_RFR, CPSRwrite_RFR, immediateOperand_RFR;
	wire [3:0] rd_RFR, rm_RFR;
	wire [4:0] opcode_RFR;
	wire  conditionalExecute_RFR;
	

	reg [31:0] Data1_RFR_Reg;
	reg [31:0] Data2_RFR_Reg;
	reg linkBit_RFR_Reg, prePostAddOffset_RFR_Reg, upDownOffset_RFR_Reg, byteOrWord_RFR_Reg, writeBack_RFR_Reg, loadStore_RFR_Reg, CPSRwrite_RFR_Reg, immediateOperand_RFR_Reg;
	reg [3:0] rd_RFR_Reg, rm_RFR_Reg;
	reg [4:0] opcode_RFR_Reg;
	reg  conditionalExecute_RFR_Reg;


  
  	// ALU variables
		//to
		//from
	wire [31:0] resultWire;
	wire [3:0] CPSRStatusWire;
	wire AluWritebackTestWire;
	 //pass to register
	reg  [31:0] ALUResultReg;
	reg AluWritebackTestReg;

	
	
	//aluOutputMux variables
	wire [31:0] ALUMuxWire;
	wire writebackEnableWire;
	//pass to register
	reg writebackEnableReg;
	reg [31:0] ALUMuxReg;

	//addrInputMux variables
		//to
	//	prePostAddOffset bit, determines if from ALU or direct from D0
	//	ALU result from ALU
		//from
	wire [31:0] addrFinalWire;
	//to reg
	reg [31:0] addrFinalReg;
	
	
	
	//EXECUTE REGISTER variables
	
	//from
	wire [31:0] Data1_EX_Wire;
	wire [31:0] Data2_EX_Wire;
	wire [31:0] ALUResult_EX_Wire;
	wire linkBit_EX_Wire, prePostAddOffset_EX_Wire, upDownOffset_EX_Wire, byteOrWord_EX_Wire, writeBack_EX_Wire, loadStore_EX_Wire, writebackEnable_EX_Wire;
	wire [3:0] rd_EX_Wire, rm_EX_Wire, CPSRStatus_EX_Wire;
	wire [4:0]opcode_EX_Wire;
	wire [31:0] writeData_EX_Wire;
	wire [31:0] addrFinal_EX_Wire;
	
	// pass to register
	reg [31:0] Data1_EX_Reg;	
	reg [31:0] Data2_EX_Reg;
	reg [31:0] ALUResult_EX_Reg;
	reg linkBit_EX_Reg, prePostAddOffset_EX_Reg, upDownOffset_EX_Reg, byteOrWord_EX_Reg, writeBack_EX_Reg, loadStore_EX_Reg, writebackEnable_EX_Reg;
	reg [3:0] rd_EX_Reg, rm_EX_Reg, CPSRStatus_EX_Reg;
	reg [4:0] opcode_EX_Reg;
	reg [31:0] writeData_EX_Reg;
	reg [31:0] addrFinal_EX_Reg;
	
	
	//dataMem
	//from
	wire [31:0] dataMemOutWire;
	//to reg
	reg [31:0] dataMemOutReg;
	
	//WriteDataMux variables
	//from
	wire [31:0] writeDataWire;
	//to reg
	reg [31:0] writeDataReg;
	
	
	//DATAMEMORY REGISTER variables
	//to
	
	//from
	wire [31:0] dataMemOut_DMR_Wire, writeData_DMR_Wire, data2_DMR_Wire;
	wire [3:0] rd_DMR_Wire;
	wire linkBit_DMR_Wire;
	wire writebackEnable_DMR_Wire;
	wire [3:0] CPSRStatus_DMR_Wire;
	wire [4:0] opcode_DMR_Wire;
	
	// pass
	reg [3:0] rd_DMR_Reg;
	reg readWrite_DMR_Reg;
	reg linkBit_DMR_Reg;									  
	reg writebackEnable_DMR_Reg;
	reg [3:0] CPSRStatus_DMR_Reg;
	reg [31:0] writeData_DMR_Reg, data2_DMR_Reg;
	reg [4:0] opcode_DMR_Reg;
	
	// PROGRAMCOUNTER variables
		//to
	reg isBranch;
	reg [23:0] branchImmediate;
		//from
	wire [31:0] instrLocWire;
		//to_registerFile
	reg writeToPC;
	


	//GO variables
	reg instructionFetchGo, registerFetchGo, executeGo, dataMemoryGo, PCGo;
	
  // Controls the LED on the board.
  assign led = 1'b1;

  	
	//Hotfix: reset isnt being transmitted properly. Therefore, add reset checks, keep reset 1 until its used.
	//		  aka full cycle of reset before first instruction is read.

	reg dataResetReg, dataResetReg_ns;
 
  
  // These are how you communicate back to the serial port debugger.
  
  
  assign debug_port1 = 0 ; //instrLoc[7:0];
  assign debug_port2 = 0; //nextInstr[27:20];
 assign debug_port3[3:0] = 0 ;// cond;
  assign debug_port3[7:4] = 0 ;// rd;
  assign debug_port4[3:0] = 0 ;// rm;
  assign debug_port4[7:4] = 0 ;// rn;
  assign debug_port5 = 0 ;// branchImmediate[7:0];
  assign debug_port6 = 0 ;// immediateVal;
  assign debug_port7 = 0 ;// 8'h07;


//YOUR CODE GOES HERE


	
						  
	instructionMemory Memory (.clk(clk), .nreset(nreset), .addr(instrLocReg), .dataOut(nextInstrWire));
	
	
	instructionFetchRegister instFetch (.instructionIN(nextInstrReg), .pcValIN(instrLocReg), .CPSRFlags_In(CPSRStatus_DMR_Reg),
	
													.instructionOUT(nextInstr_INSTfetch_Wire), .pcValOUT(pcVal_INST_Wire), .CPSRFlags_INST_OUT(CPSRStatus_INST_Wire),
													
													.reset(nreset || dataResetReg), .clk(instructionFetchGo));////////////////////////////////////////////////////////////////////////
	
	sortInstruction sortInstr (.instruction(nextInstr_INSTfetch_Reg), .linkBit(linkBitWire), .prePostAddOffset(prePostAddOffsetWire), .upDownOffset(upDownOffsetWire),
  												.byteOrWord(byteOrWordWire), .writeBack(writeBackWire),
												.loadStore(loadStoreWire), .rd(rdWire), .rn(rnWire), .rm(rmWire), .opcode(opcodeWire),
  												.cond(condWire), .branchImmediate(branchImmediateWire), .reset(nreset || dataResetReg), .clk(clk), .CPSRwrite(CPSRwritewire), 
												.immediateOperand(immediateOperandWire), .shifterVals(shifterValsWire));		
								
								
	registerFile reg_file (.writeDestination(rd_DMR_Reg), .writeEnable(writebackEnable_DMR_Reg), .readReg1(rn), .readReg2(rm),
                          .writeData(writeData_DMR_Reg), .readData1(rnDataWire), .readData2(rmDataWire), .reset(nreset || dataResetReg), .clk(instructionFetchGo || PCGo), 
								  .oldPCVal(pcVal_INST_Reg), .writeToPC(WriteToPCWire),
								  .linkBit(linkBit_DMR_Reg));



	shifter shifty(.opcode(opcodeReg), .data12In(shifterValsReg), .branchOffset(branchImmediateReg), .rmData(rmDataReg), 
						.shiftedData(shiftedDataWire), .immediateOperand(immediateOperandReg));  
										
	conditionTest condTest (.cond(condReg), .CPSRIn(CPSRStatus_INST_Reg), .conditionalExecute(conditionalExecuteWire), .reset(nreset || dataResetReg), .clk(clk));
	
	
	registerFetchRegister regFetch (.Data1IN(rnDataReg), .Data2IN(shiftedDataReg), .linkBitIN(linkBitReg), .prePostAddOffsetIN(prePostAddOffsetReg), .upDownOffsetIN(upDownOffsetReg),
												.byteOrWordIN(byteOrWordReg), .writeBackIN(writeBackReg), .loadStoreIN(loadStoreReg), .rdIN(rdReg), .rmIN(rm), .opcodeIN(opcodeReg),
												.conditionalExecuteIN(conditionalExecuteReg),
												.CPSRwriteIN(CPSRwriteReg), .immediateOperandIN(immediateOperandReg), 
												
												.Data1OUT(Data1_RFR), .Data2OUT(Data2_RFR), .linkBitOUT(linkBit_RFR), .prePostAddOffsetOUT( prePostAddOffset_RFR), .upDownOffsetOUT(upDownOffset_RFR),
												.byteOrWordOUT(byteOrWord_RFR), .writeBackOUT(writeBack_RFR), .loadStoreOUT(loadStore_RFR), .rdOUT(rd_RFR), .rmOUT(rm_RFR), .opcodeOUT(opcode_RFR),
												.conditionalExecuteOUT(conditionalExecute_RFR),
												.CPSRwriteOUT(CPSRwrite_RFR), .immediateOperandOUT(immediateOperand_RFR),
												
												.reset(nreset || dataResetReg), .clk(registerFetchGo));	///////////////////////////////////////////////

	

	ALU numberCrunch (.data1(Data1_RFR_Reg), .data2(Data2_RFR_Reg), .operation(opcode_RFR_Reg), .result(resultWire), 
							.flags(CPSRStatusWire), .AluWritebackTest(AluWritebackTestWire), .reset(nreset || dataResetReg), .clk(clk));
	
	
	aluOutputMux aluOutMux (.opcode(opcode_RFR_Reg), .ALUresult(ALUResultReg), .branchImmediate(Data2_RFR_Reg), 
									.aluWritebackTest(AluWritebackTestReg), .conditionalExecute(conditionalExecute_RFR_Reg),
									.writebackEnable(writebackEnableWire), .aluMuxout(ALUMuxWire));

	
	addrInputMux addrMux (.preCheck(prePostAddOffset_RFR), .ALUInput(ALUResultReg), .dataOut(addrFinalWire), .d0Input(Data1_RFR));

	
	executeRegister ex (.Data1_EX(Data1_RFR_Reg), .Data2_EX(Data2_RFR_Reg), .linkBit_EX(linkBit_RFR_Reg), .prePostAddOffset_EX(prePostAddOffset_RFR_Reg),
								.upDownOffset_EX(upDownOffset_RFR_Reg), .byteOrWord_EX(byteOrWord_RFR_Reg), .writeBack_EX(writeBack_RFR_Reg), .loadStore_EX(loadStore_RFR_Reg),
								.rd_EX(rd_RFR_Reg), .rm_EX(rm_RFR_Reg), .opcode_EX(opcode_RFR_Reg), .writebackEnable_EX(writebackEnableReg), 
								.writeData_EX(ALUMuxReg), .addrFinalWire_EX(addrFinalReg), .ALUResult_EX(ALUResultReg), .CPSRFlags_EX_In(CPSRStatusReg), 
								
								.Data1_EX_OUT(Data1_EX_Wire), .Data2_EX_OUT(Data2_EX_Wire), .linkBit_EX_OUT(linkBit_EX_Wire), .prePostAddOffset_EX_OUT(prePostAddOffset_EX_Wire),
								.upDownOffset_EX_OUT(upDownOffset_EX_Wire), .byteOrWord_EX_OUT(byteOrWord_EX_Wire), .writeBack_EX_OUT(writeBack_EX_Wire), .loadStore_EX_OUT(loadStore_EX_Wire),
								.rd_EX_OUT(rd_EX_Wire), .rm_EX_OUT(rm_EX_Wire), .opcode_EX_OUT(opcode_EX_Wire), .writebackEnable_EX_OUT(writebackEnable_EX_Wire),
								.writeData_EX_OUT(writeData_EX_Wire), .addrFinalWire_EX_OUT(addrFinal_EX_Wire), .ALUResult_EX_OUT(ALUResult_EX_Wire),
								.CPSRFlags_EX_OUT(CPSRStatus_EX_Wire),
								
								.reset(nreset || dataResetReg), .clk(executeGo));  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	
	dataMemory dataMem (.addr(addrFinal_EX_Reg), .dataIn(Data2_EX_Reg), .dataOut(dataMemOutWire), .memoryEnable(opcode_EX_Reg == 5'b10000), 
							  .readNotWrite(loadStore_EX_Reg), .reset(nreset || dataResetReg), .clk(clk));

	
	WriteDataMux whatWrite (.dMemIn(dataMemOutReg), .ALUIn(writeData_EX_Reg), .isDataAccess(opcode_EX_Reg == 5'b10000), .regWriteDataOut(writeDataWire));
	
	
	DataMemoryRegister DataMemReg ( .dataMemOut_DMR(dataMemOutReg), .rd_DMR(rd_EX_Reg), .writeData_DMR(writeDataReg), 
											  .linkBit(linkBit_EX_Reg), .writebackEnable(writebackEnable_EX_Reg), .CPSRStatus_In(CPSRStatus_EX_Reg),
											  .opcode(opcode_EX_Reg), .data2In(Data2_EX_Reg), 
											  
											  .dataMemOut_DMR_OUT(dataMemOut_DMR_Wire), .rd_DMR_OUT(rd_DMR_Wire), .writeData_DMR_OUT(writeData_DMR_Wire),
											  .linkBit_DMR_OUT(linkBit_DMR_Wire), .writebackEnable_DMR_OUT(writebackEnable_DMR_Wire), .CPSRStatus_DMR_OUT(CPSRStatus_DMR_Wire),
											  .opcode_DMR_OUT(opcode_DMR_Wire), .data2_DMR_OUT(data2_DMR_Wire),
											  
											  .reset(nreset || dataResetReg), .clk(dataMemoryGo)); //////////////////////////////////////////////////////////////////////////////////
	

	
	programCounter PC (.Branch(opcode_DMR_Reg == 5'b10001), .currData(instrLocWire),
                    .branchImmediate(data2_DMR_Reg), .clk(PCGo), .writeEnable((rd_DMR_Reg == 4'b1111 && writebackEnable_DMR_Reg)), 
						  .writeData(writeData_DMR_Reg), .reset(nreset || dataResetReg));

	

// State variables.

parameter 	instructionFetch = 3'b000,
				registerFetch = 3'b001,
				execute = 3'b010,
				dataMemoryParam = 3'b011,
				PCUpdate = 3'b100;

reg [2:0] ps, ns;


always @* begin
	
	instrLocReg = instrLocWire;
	
	nextInstrReg = nextInstrWire;

	nextInstr_INSTfetch_Reg = nextInstr_INSTfetch_Wire;
	pcVal_INST_Reg = pcVal_INST_Wire;
	CPSRStatus_INST_Reg = CPSRStatus_INST_Wire;
	writeBackEnable_INST_Reg = writeBackEnable_INST_Wire;
	
	linkBitReg = linkBitWire;
	prePostAddOffsetReg = prePostAddOffsetWire;
	upDownOffsetReg = upDownOffsetWire;
	byteOrWordReg = byteOrWordWire;
	writeBackReg = writeBackWire;
	loadStoreReg = loadStoreWire;
	CPSRwriteReg = CPSRwritewire;
	immediateOperandReg = immediateOperandWire;
	shiftTypeReg = shiftTypeWire;
	rdReg = rdWire;
	rnReg = rnWire;
	rmReg = rmWire;
	condReg = condWire;
	rotateValReg = rotateValWire;
	opcodeReg = opcodeWire;
	immediateValReg = immediateValWire;
	branchImmediateReg = branchImmediateWire;
	shifterValsReg = shifterValsWire;

	rd = rdWire; 
	rn = rnWire;
	rm = rmWire;
	rmDataReg = rmDataWire;
	rnDataReg = rnDataWire;

	shiftedDataReg = shiftedDataWire;
	
	CPSRStatusReg = CPSRStatusWire;
	
	conditionalExecuteReg = conditionalExecuteWire;
	
	Data1_RFR_Reg = Data1_RFR;
	Data2_RFR_Reg = Data2_RFR;
	linkBit_RFR_Reg = linkBit_RFR; 
	prePostAddOffset_RFR_Reg = prePostAddOffset_RFR;
	upDownOffset_RFR_Reg = upDownOffset_RFR;
	byteOrWord_RFR_Reg = byteOrWord_RFR; 
	writeBack_RFR_Reg = writeBack_RFR;
	loadStore_RFR_Reg = loadStore_RFR;
	CPSRwrite_RFR_Reg = CPSRwrite_RFR;
	immediateOperand_RFR_Reg = immediateOperand_RFR;
	rd_RFR_Reg = rd_RFR; 
	rm_RFR_Reg = rm_RFR; 
	opcode_RFR_Reg = opcode_RFR; 
	conditionalExecute_RFR_Reg = conditionalExecute_RFR;
	ALUResultReg = resultWire;
	AluWritebackTestReg = AluWritebackTestWire;

	
	ALUMuxReg = ALUMuxWire;
	writebackEnableReg = writebackEnableWire;
	
	
	Data1_EX_Reg = Data1_EX_Wire;
	Data2_EX_Reg = Data2_EX_Wire;
	linkBit_EX_Reg = linkBit_EX_Wire;
	prePostAddOffset_EX_Reg = prePostAddOffset_EX_Wire;
	upDownOffset_EX_Reg = upDownOffset_EX_Wire;
	byteOrWord_EX_Reg = byteOrWord_EX_Wire;
	writeBack_EX_Reg = writeBack_EX_Wire;
	loadStore_EX_Reg = loadStore_EX_Wire;
	writebackEnable_EX_Reg = writebackEnable_EX_Wire;
	rd_EX_Reg = rd_EX_Wire;
	rm_EX_Reg = rm_EX_Wire;
	opcode_EX_Reg = opcode_EX_Wire;
	writeData_EX_Reg = writeData_EX_Wire;
	addrFinal_EX_Reg = addrFinal_EX_Wire;
	CPSRStatus_EX_Reg = CPSRStatus_EX_Wire;
	addrFinalReg = addrFinalWire;
	ALUResult_EX_Reg = ALUResult_EX_Wire;
	
	dataMemOutReg = dataMemOutWire;
	
	writeDataReg = writeDataWire;
	
	
	writebackEnable_DMR_Reg = writebackEnable_DMR_Wire;
	linkBit_DMR_Reg = linkBit_DMR_Wire; 
	CPSRStatus_DMR_Reg = CPSRStatus_DMR_Wire;
	rd_DMR_Reg = rd_DMR_Wire;
	writeData_DMR_Reg = writeData_DMR_Wire;
	opcode_DMR_Reg = opcode_DMR_Wire;
	data2_DMR_Reg = data2_DMR_Wire;
	
	if (opcodeReg == 5'b10001) begin
		isBranch = 1; 
	end
	else begin
		isBranch = 0;
	end


	
 // State logic
	case (ps)
		instructionFetch: 	begin
			
			instructionFetchGo = 1'b1; 
			registerFetchGo = 1'b0;
			executeGo = 1'b0;
			dataMemoryGo = 1'b0;
			PCGo = 1'b0;
			
			ns = registerFetch;

			dataResetReg_ns = dataResetReg;
		end

		registerFetch: 		begin
	
	//read instruction and send values to register file
	//read registers
			instructionFetchGo = 1'b0; 
			registerFetchGo = 1'b1;
			executeGo = 1'b0;
			dataMemoryGo = 1'b0;
			PCGo = 1'b0;
	
			ns = execute;
			dataResetReg_ns = dataResetReg;
		end
		
		execute:					begin 
	
	//send values from registers to the ALU
	//get value of computation from ALU
			instructionFetchGo = 1'b0; 
			registerFetchGo = 1'b0;
			executeGo = 1'b1;
			dataMemoryGo = 1'b0;
			PCGo = 1'b0;
			
			ns = dataMemoryParam;
			dataResetReg_ns = dataResetReg;
		end
			
	
		dataMemoryParam: 			begin
	
	// load or store values into memory
			instructionFetchGo = 1'b0; 
			registerFetchGo = 1'b0;
			executeGo = 1'b0;
			dataMemoryGo = 1'b1;
			PCGo = 1'b0;
			
			ns = PCUpdate;
			dataResetReg_ns = dataResetReg;
		end
		
		PCUpdate: 				begin
	
	// write to the registers then update PC
			instructionFetchGo = 1'b0; 
			registerFetchGo = 1'b0;
			executeGo = 1'b0;
			dataMemoryGo = 1'b0;
			PCGo = 1'b1;
			
			ns = 3'b000;
			//ns = instructionFetch;
			dataResetReg_ns = 1'b0;
		end
			
		default:	begin
			instructionFetchGo = 1'bX;
			registerFetchGo = 1'bX;
			executeGo = 1'bX;
			dataMemoryGo = 1'bX;
			PCGo = 1'bX;
			dataResetReg_ns = 1'bX;
		end
	endcase
 end


 // DFFs
 always @(posedge clk) begin
	if (nreset) begin
		ps <= 3'b100; //start on PC go since thats technically the "beginning"
						  //of the process
						  // last section is dataMemoryGo
		dataResetReg <= 1'b1;
	end
	else begin
		dataResetReg <= dataResetReg_ns;
		ps <= ns;
	end
 end



endmodule




module cpu_testbench();

  reg clk;
  reg nreset;
  wire led;
  wire [7:0] debug_port1;
  wire [7:0] debug_port2;
  wire [7:0] debug_port3;
  wire [7:0] debug_port4;
  wire [7:0] debug_port5;
  wire [7:0] debug_port6;
  wire [7:0] debug_port7;

cpu dut ( .clk(clk),
  .nreset(nreset), .led(led), .debug_port1(debug_port1), .debug_port2(debug_port2), .debug_port3(debug_port3),
  .debug_port4(debug_port4), .debug_port5(debug_port5), .debug_port6(debug_port6), .debug_port7(debug_port7));




 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
													@(posedge clk);
		nreset	<= 1;							@(posedge clk);
		nreset	<= 0;							@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);

		$stop; // End the simulation.

 end
endmodule

