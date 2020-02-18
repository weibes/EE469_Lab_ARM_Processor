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
	
	
	// SORTINSTRUCTION variables
		//to
	reg [31:0] nextInstr;
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

  
  	// ALU variables
		//to
	reg ALUexecute;
	reg [31:0] ALUData1, ALUData2;
	reg opcode;
		//from
	wire [31:0] resultWire;
	wire [3:0] CPSRStatusWire

	
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



						  
	instructionMemory Memory(.clk(clk), .nreset(nreset), .addr(instrLoc), .dataOut(nextInstrWire));
	
	
	instructionFetchRegister instFetch(.instructionIN(nextInstrReg),  .instructionOUT(nextInstr), .reset(nreset), .clk(instructionFetchGo));////////////////////////////////////////////////////////////////////////
	

	sortInstruction sortInstr(.instruction(nextInstr), .linkBit(linkBitWire), .prePostAddOffset(prePostAddOffsetWire), .upDownOffset(upDownOffsetWire),
  												.byteOrWord(byteOrWordWire), .writeBack(writeBackWire), .loadStore(loadStoreWire), .rd(rdWire), .rn(rnWire), .rm(rmWire), .opcode(opcodeWire),
  												.cond(condWire), .rotateVal(rotateValWire), .rm_shift(rm_shiftWire), .immediateVal(immediateValWire), .immediateOffset(immediateOffsetWire),
  												.branchImmediate(branchImmediateWire), .reset(nreset), .clk(clk), .CPSRwrite(CPSRwritewire),.shiftType(shiftTypeWire),
												.immediateOperand(immediateOperandWire), .rm_shiftSDT(rm_shiftSDTWire));										

						
	registerFile reg_file(.writeDestination(rd), .writeEnable(readWrite), .readReg1(rn), .readReg2(rm),
                         .writeData(writeData), .readData1(rnDataWire), .readData2(rmDataWire), .reset(nreset), .clk(clk), .oldPCVal(instrLoc), .writeToPC(writeToPC));

						 
	shifter shifty(.rm(rmDataReg), .opcode(opcodeReg), .rotateVal(rotateValReg), .rm_shift(rm_shiftReg), .immediateVal(immediateValReg), .immediateOffset(immediateOffsetReg),
												 .immediateOperand(immediateOperandReg), .rm_shiftSDT(rm_shiftSDTReg), .shiftType(shiftTypeReg), .shiftedData(shiftedDataWire));
	
	
	conditionTest condTest (.cond(condReg), .CPSRIn(CPSRStatusReg), .conditionalExecute(conditionalExecuteWire), .reset(nreset), .clk(clk));
	
	
	registerFetchRegister regFetch (.Data1IN(rnDataReg), .Data2IN(shiftedDataReg), .linkBitIN(linkBitReg), .prePostAddOffsetIN(), .upDownOffsetIN(),
												.byteOrWordIN(), .writeBackIN(), .loadStoreIN(), .rdIN() .rmIN(), , .opcodeIN(),
												.conditionalExecuteIN(), .immediateOffsetIN(),
												.branchImmediateIN(), .CPSRwriteIN(), .immediateOperandIN(),
												.rm_shiftSDTIN(),
												
												.Data1OUT(), .Data2OUT(), .linkBitOUT(), .prePostAddOffsetOUT(), .upDownOffsetOUT(),
												.byteOrWordOUT(), .writeBackOUT(), .loadStoreOUT(), .rdOUT(), .rmOUT(), .opcodeOUT(),
												.conditionalExecuteOUT(), .immediateOffsetOUT(),
												.branchImmediateOUT(), .CPSRwriteOUT(), .immediateOperandOUT(),
												.rm_shiftSDTOUT(), 
												
												.reset(nreset), .clk(registerFetchGo));	///////////////////////////////////////////////
	

	ALU numberCrunch (.data1(ALUData1), .data2(ALUData2), .operation(opcode), .result(resultWire), .flags(CPSRStatusWire), .reset(nreset), .clk(clk));
	
	
	aluOutputMux aluOutMux (.opcode(), .ALUresult(), .branchImmediate(), .aluMuxout());
	
	
	executeRegister ex (.writeData(), .reset(nreset), .clk(executeGo));  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	dataMemory dataMem (.addr(), .dataIn(), .dataOut(), .memoryEnable(), .readNotWrite(), .reset(nreset), .clk(clk));
	
	regWriteMux regWmux (.opcode(), .ALUresult(), .memData(), .conditionalExecute(), .regWriteDataout(), .writeEnable());
	
	DataMemoryRegister DataMemReg ( .reset(nreset), .clk(dataMemoryGo)); //////////////////////////////////////////////////////////////////////////////////
	
	programCounter PC(.Branch(), .currData(instrLocWire),
                    .branchImmediate(branchImmediate), .clk(PCGo), .writeEnable(writeToPC), .writeData(wrieData));
	
	

// State variables.

parameter 	instructionFetch = 3'b000,
				registerFetch = 3'b001,
				execute = 3'b010,
				dataMemory = 3'b011,
				PCUpdate = 3'b100;

reg [2:0] ps, ns;


always @* begin

	nextInstrReg = nextInstrWire;


	
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
	
if (opcode == 5'b10001) isBranch = 1; 
else isBranch = 0;

// always connected
instrLoc = instrLocWire;
	
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
			
			ns = PCupdate;
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
