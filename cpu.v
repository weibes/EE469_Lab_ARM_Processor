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
	reg [31:0] instrLoc;
		//from
	wire [31:0] nextInstrWire;
	 // pass to register
	reg nextInstrReg;
	
	
	//instructionFetchRegister variables
	//from
	wire [31:0] nextInstr_INSTfetch_Wire;
	
	// SORTINSTRUCTION variables
		//to
	reg [31:0] nextInstr_INSTfetch_Reg;
		//from
	wire linkBitWire, prePostAddOffsetWire, upDownOffsetWire, byteOrWordWire, writeBackWire, loadStoreWire, CPSRwritewire, immediateOperandWire;
	wire [1:0] shiftTypeWire;
	wire [3:0] rdWire, rnWire, rmWire, condWire, rotateValWire;
	wire [4:0] opcodeWire, rm_shiftWire;
	wire [7:0] rm_shiftSDTWire, immediateValWire;
	wire [11:0] immediateOffsetWire;
	wire [23:0] branchImmediateWire;
	
	// pass to register

	reg linkBitReg, prePostAddOffsetReg, upDownOffsetReg, byteOrWordReg, writeBackReg, loadStoreReg, CPSRwriteReg, immediateOperandReg;
	reg [1:0] shiftTypeReg;
	reg [3:0] rdReg, rnReg, rmReg, condReg, rotateValReg;
	reg [4:0] opcodeReg, rm_shiftReg;
	reg [7:0] rm_shiftSDTReg, immediateValReg;
	reg [11:0] immediateOffsetReg;
	reg [23:0] branchImmediateReg;
	
	

	//REGISTERFILE variables
	//to
	reg readWrite;
	reg [3:0] rd,rm,rn;
	reg [31:0] writeData;
		//from
	wire [31:0] rmDataWire, rnDataWire;
	 // pass to register
	reg [31:0] rnDataReg, rmDataReg;
	
	
	

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
	wire [3:0] conditionalExecute_RFR;
	wire [11:0] immediateOffset_RFR;
	wire [7:0] rm_shiftSDT_RFR;

	reg [31:0] Data1_RFR_Reg;
	reg [31:0] Data2_RFR_Reg;
	reg linkBit_RFR_Reg, prePostAddOffset_RFR_Reg, upDownOffset_RFR_Reg, byteOrWord_RFR_Reg, writeBack_RFR_Reg, loadStore_RFR_Reg, CPSRwrite_RFR_Reg, immediateOperand_RFR_Reg;
	reg [3:0] rd_RFR_Reg, rm_RFR_Reg;
	reg [4:0] opcode_RFR_Reg;
	reg [3:0] conditionalExecute_RFR_Reg;
	reg [11:0] immediateOffset_RFR_Reg;
	reg [7:0] rm_shiftSDT_RFR_Reg;

  
  	// ALU variables
		//to
		//from
	wire [31:0] resultWire;
	wire [3:0] CPSRStatusWire;
	wire AluWritebackTestWire;
	 //pass to register
	reg ALUResultReg;
	reg AluWritebackTestReg;

	//aluOutputMux variables
	wire [31:0] ALUMuxWire;
	wire writebackEnableWire;
	//pass to register
	reg [31:0] ALUMuxReg;
	reg writebackEnableReg;
	
	
	//EXECUTE REGISTER variables
	
	//from
	wire [31:0] Data1_EX_Wire;
	wire [31:0] Data2_EX_Wire;
	wire linkBit_EX_Wire, prePostAddOffset_EX_Wire, upDownOffset_EX_Wire, byteOrWord_EX_Wire, writeBack_EX_Wire, loadStore_EX_Wire, writebackEnable_EX_Wire;
	wire [3:0] rd_EX_Wire;
	wire [3:0] rm_EX_Wire;
	wire [4:0]opcode_EX_Wire;
	wire [31:0] writeData_EX_Wire;
	
	// pass to register
	reg [31:0] Data1_EX_Reg;
	reg [31:0] Data2_EX_Reg;
	reg linkBit_EX_Reg, prePostAddOffset_EX_Reg, upDownOffset_EX_Reg, byteOrWord_EX_Reg, writeBack_EX_Reg, loadStore_EX_Reg, writebackEnable_EX_Reg;
	reg [3:0] rd_EX_Reg;
	reg [3:0] rm_EX_Reg;
	reg [4:0]opcode_EX_Reg;
	reg [31:0] writeData_EX_Reg;
	
	
	
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

  // These are how you communicate back to the serial port debugger.
  
  
//  assign debug_port1 = instrLoc[7:0];
//  assign debug_port2 = nextInstr[27:20];
//  assign debug_port3[3:0] = cond;
//  assign debug_port3[7:4] = rd;
//  assign debug_port4[3:0] = rm;
//  assign debug_port4[7:4] = rn;
//  assign debug_port5 = branchImmediate[7:0];
//  assign debug_port6 = immediateVal;
//  assign debug_port7 = 8'h07;


//YOUR CODE GOES HERE



						  
	instructionMemory Memory (.clk(clk), .nreset(nreset), .addr(instrLoc), .dataOut(nextInstrWire));
	
	
	instructionFetchRegister instFetch (.instructionIN(nextInstrReg),  .instructionOUT(nextInstr_INSTfetch_Wire), .reset(nreset), .clk(instructionFetchGo));////////////////////////////////////////////////////////////////////////
	

	sortInstruction sortInstr (.instruction(nextInstr_INSTfetch_Reg), .linkBit(linkBitWire), .prePostAddOffset(prePostAddOffsetWire), .upDownOffset(upDownOffsetWire),
  												.byteOrWord(byteOrWordWire), .writeBack(writeBackWire), .loadStore(loadStoreWire), .rd(rdWire), .rn(rnWire), .rm(rmWire), .opcode(opcodeWire),
  												.cond(condWire), .rotateVal(rotateValWire), .rm_shift(rm_shiftWire), .immediateVal(immediateValWire), .immediateOffset(immediateOffsetWire),
  												.branchImmediate(branchImmediateWire), .reset(nreset), .clk(clk), .CPSRwrite(CPSRwritewire),.shiftType(shiftTypeWire),
												.immediateOperand(immediateOperandWire), .rm_shiftSDT(rm_shiftSDTWire));										

						
	registerFile reg_file (.writeDestination(rd), .writeEnable(readWrite), .readReg1(rn), .readReg2(rm),
                         .writeData(writeData), .readData1(rnDataWire), .readData2(rmDataWire), .reset(nreset), .clk(clk), .oldPCVal(instrLoc), .writeToPC(writeToPC));

						 
	shifter shifty (.rm(rmDataReg), .opcode(opcodeReg), .rotateVal(rotateValReg), .rm_shift(rm_shiftReg), .immediateVal(immediateValReg), .immediateOffset(immediateOffsetReg),
												 .immediateOperand(immediateOperandReg), .rm_shiftSDT(rm_shiftSDTReg), .shiftType(shiftTypeReg), .shiftedData(shiftedDataWire), .clk(clk), .reset(nreset));
	
	
	conditionTest condTest (.cond(condReg), .CPSRIn(CPSRStatusReg), .conditionalExecute(conditionalExecuteWire), .reset(nreset), .clk(clk));
	
	
	registerFetchRegister regFetch (.Data1IN(rnDataReg), .Data2IN(shiftedDataReg), .linkBitIN(linkBitReg), .prePostAddOffsetIN(prePostAddOffsetReg), .upDownOffsetIN(upDownOffsetReg),
												.byteOrWordIN(byteOrWordReg), .writeBackIN(writeBackReg), .loadStoreIN(loadStoreReg), .rdIN(rd), .rmIN(rm), .opcodeIN(opcodeReg),
												.conditionalExecuteIN(conditionalExecuteReg), .immediateOffsetIN(immediateOffsetReg),
												.CPSRwriteIN(CPSRwriteReg), .immediateOperandIN(immediateOperandReg),
												.rm_shiftSDTIN(rm_shiftSDTReg),
												
												.Data1OUT(Data1_RFR), .Data2OUT(Data2_RFR), .linkBitOUT(linkBit_RFR), .prePostAddOffsetOUT( prePostAddOffset_RFR), .upDownOffsetOUT(upDownOffset_RFR),
												.byteOrWordOUT(byteOrWord_RFR), .writeBackOUT(writeBack_RFR), .loadStoreOUT(loadStore_RFR), .rdOUT(rd_RFR), .rmOUT(rm_RFR), .opcodeOUT(opcode_RFR),
												.conditionalExecuteOUT(conditionalExecute_RFR), .immediateOffsetOUT(immediateOffset_RFR),
												.CPSRwriteOUT(CPSRwrite_RFR), .immediateOperandOUT(immediateOperand_RFR),
												.rm_shiftSDTOUT(rm_shiftSDT_RFR),
												
												.reset(nreset), .clk(registerFetchGo));	///////////////////////////////////////////////

	

	ALU numberCrunch (.data1(Data1_RFR_Reg), .data2(Data2_RFR_Reg), .operation(opcode_RFR_Reg), .result(resultWire), .flags(CPSRStatusWire), .AluWritebackTest(AluWritebackTestWire), .reset(nreset), .clk(clk));
	
	
	aluOutputMux aluOutMux (.opcode(opcode_RFR_Reg), .ALUresult(ALUResultReg), .branchImmediate(Data2_RFR_Reg), 
									.aluWritebackTest(AluWritebackTestReg), .conditionalExecute(conditionalExecute_RFR_Reg),
									.writebackEnable(writebackEnableWire), .aluMuxout(ALUMuxWire));
	

	
	
	executeRegister ex (.Data1_EX(Data1_RFR_Reg), .Data2_EX(Data2_RFR_Reg), .linkBit_EX(linkBit_RFR_Reg), .prePostAddOffset_EX(prePostAddOffset_RFR_Reg),
								.upDownOffset_EX(upDownOffset_RFR_Reg), .byteOrWord_EX(byteOrWord_RFR_Reg), .writeBack_EX(writeBack_RFR_Reg), .loadStore_EX(loadStore_RFR_Reg),
								.rd_EX(rd_RFR_Reg), .rm_EX(rm_RFR_Reg), .opcode_EX(opcode_RFR_Reg), .writebackEnable_EX(writebackEnableReg),
								.writeData_EX(ALUMuxReg), 
								
								.Data1_EX_OUT(Data1_EX_Wire), .Data2_EX_OUT(Data2_EX_Wire), .linkBit_EX_OUT(linkBit_EX_Wire), .prePostAddOffset_EX_OUT(prePostAddOffset_EX_Wire),
								.upDownOffset_EX_OUT(upDownOffset_EX_Wire), .byteOrWord_EX_OUT(byteOrWord_EX_Wire), .writeBack_EX_OUT(writeBack_EX_Wire), .loadStore_EX_OUT(loadStore_EX_Wire),
								.rd_EX_OUT(rd_EX_Wire), .rm_EX_OUT(rm_EX_Wire), .opcode_EX_OUT(opcode_EX_Wire), .writebackEnable_EX_OUT(writebackEnable_EX_Wire),
								.writeData_EX_OUT(writeData_EX_Wire),
								
								.reset(nreset), .clk(executeGo));  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//addrInputMux(

	
	
	
	
	dataMemory dataMem (.addr(), .dataIn(), .dataOut(), .memoryEnable(), .readNotWrite(), .reset(nreset), .clk(clk));
	
	regWriteMux regWmux (.opcode(), .ALUresult(), .memData(), .conditionalExecute(), .regWriteDataout(), .writeEnable());
	
	DataMemoryRegister DataMemReg ( .reset(nreset), .clk(dataMemoryGo)); //////////////////////////////////////////////////////////////////////////////////
	
	programCounter PC (.Branch(), .currData(instrLocWire),
                    .branchImmediate(branchImmediate), .clk(PCGo), .writeEnable(writeToPC), .writeData(writeData));
	
	

// State variables.

parameter 	instructionFetch = 3'b000,
				registerFetch = 3'b001,
				execute = 3'b010,
				dataMemory = 3'b011,
				PCUpdate = 3'b100;

reg [2:0] ps, ns;


always @* begin
	
	instrLoc = instrLocWire;
	
	nextInstrReg = nextInstrWire;
	
	nextInstr_INSTfetch_Reg = nextInstr_INSTfetch_Wire;
	
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
	rm_shiftReg = rm_shiftWire;
	rm_shiftSDTReg = rm_shiftSDTWire;
	immediateValReg = immediateValWire;
	immediateOffsetReg = immediateOffsetWire;
	branchImmediateReg = branchImmediateWire;

	rd = rdWire; 
	rn = rnWire;
	rm = rmWire;
	rmDataReg = rmDataWire;
	rnDataReg = rnDataWire;

	shiftedDataReg = shiftedDataWire;
	
	CPSRStatusReg = CPSRStatusWire;
	

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
	immediateOffset_RFR_Reg =immediateOffset_RFR;
	rm_shiftSDT_RFR_Reg = rm_shiftSDT_RFR;
	
	ALUResultReg = resultWire;
	
	ALUMuxReg = ALUMuxWire;
	
	AluWritebackTestReg = AluWritebackTestWire;
	
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
	
	
if (opcodeReg == 5'b10001) isBranch = 1; 
else isBranch = 0;


	
 // State logic
	case (ps)
	
	instructionFetch: 	begin
			
			instructionFetchGo = 1; 
			registerFetchGo = 0;
			executeGo = 0;
			dataMemoryGo = 0;
			PCGo = 0;
			
			ns = registerFetch;
			end
			
	registerFetch: 		begin
	
	//read instruction and send values to register file
	//read registers
			instructionFetchGo = 0; 
			registerFetchGo = 1;
			executeGo = 0;
			dataMemoryGo = 0;
			PCGo = 0;
	
			ns = execute;
			end
	
	execute:					begin 
	
	//send values from registers to the ALU
	//get value of computation from ALU
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 1;
			dataMemoryGo = 0;
			PCGo = 0;
			
			ns = dataMemory;
			end
			
	dataMemory: 			begin
	
	// load or store values into memory
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 0;
			dataMemoryGo = 1;
			PCGo = 0;
			
			ns = PCUpdate;
			end
			
	PCUpdate: 				begin
	
	// write to the registers then update PC
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 0;
			dataMemoryGo = 0;
			PCGo = 1;
			
			ns = instructionFetch;
			end
			
	endcase
 end


 // DFFs
 always @(posedge clk) begin
	if (nreset)
		ps <= instructionFetch;
	else
		ps <= ns;
	end



endmodule


/*

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
*/
