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

  
	// PROGRAMCOUNTER variables
		//to
	reg isBranch;
	reg [23:0] branchImmediate;
		//from
	wire [31:0] instrLocWire;

	
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
	
	
	//REGISTERFILE variables
	//to
	reg readWrite;
	reg [3:0] rd,rm,rn;
	reg [31:0] writeData;
		//from
	wire [31:0] rmDataWire, rnDataWire;
	 // pass to register
	reg  rmDataReg, rnDataReg;
 
  
  //CONDITIONTEST variables
  		//to
	reg [3:0] cond, CPSRstatus;
	
		//from
	wire conditionalExecuteWire;
	wire [3:0] CPSRflagsWire;
	
	
  
  	// ALU variables
		//to
	reg ALUexecute;
	reg [31:0] ALUData1, ALUData2;
	reg opcode;
		//from
	wire [3:0] CPSRflagsWire;
	wire [31:0] resultWire;
	
//	//FLAGREGISTER variables
//		//to
//	reg [3:0] CPSRflags;
//	reg CPSRwrite;
//		//from
//	wire [3:0] CPSRstatusWire;
	
	
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


	programCounter PC(.Branch(isBranch), .Reset(nreset), .currData(instrLocWire),
                    .branchImmediate(branchImmediate), .clk(clk));
						  
	instructionMemory Memory(.clk(clk), .nreset(nreset), .addr(instrLoc), .dataOut(nextInstrWire));
	
	
	instructionFetchRegister instFetch(.instructionIN(nextInstrReg), .instructionOUT(nextInstr), .reset(nreset), .clk(instructionFetchGo));////////////////////////////////////////////////////////////////////////
	

	sortInstruction sortInstr(.instruction(nextInstr), .linkBit(linkBitWire), .prePostAddOffset(prePostAddOffsetWire), .upDownOffset(upDownOffsetWire),
  												.byteOrWord(byteOrWordWire), .writeBack(writeBackWire), .loadStore(loadStoreWire), .rd(rdWire), .rn(rnWire), .rm(rmWire), .opcode(opcodeWire),
  												.cond(condWire), .rotateVal(rotateValWire), .rm_shift(rm_shiftWire), .immediateVal(immediateValWire), .immediateOffset(immediateOffsetWire),
  												.branchImmediate(branchImmediateWire), .reset(nreset), .clk(clk), .CPSRwrite(CPSRwritewire),.shiftType(shiftTypeWire),
												.immediateOperand(immediateOperandWire), .rm_shiftSDT(rm_shiftSDTWire));										

	registerFile reg_file(.writeDestination(rd), .writeEnable(readWrite), .readReg1(rm), .readReg2(rn),
                         .writeData(writeData), .readData1(rmDataWire), .readData2(rnDataWire), .reset(nreset), .clk(clk));

						 
	shifter shifty(.opcode(), .rotateVal(), .rm_shift(), .immediateVal(), .immediateOffset(),
												 .immediateOperand(), .rm_shiftSDT(), .shiftType());
	
	
	registerFetchRegister regFetch(.Data1IN(rmDataReg), .Data2IN(rnDataReg), linkBit(), prePostAddOffset(), upDownOffset(),
												byteOrWord(), writeBack(), loadStore(), rd(), rn(), rm(), opcode(),
												cond(), immediateVal(), immediateOffset(),
												branchImmediate(), CPSRwrite(), immediateOperand(),
												rm_shiftSDT.Data1OUT(), .Data2OUT(), .reset(nreset), .clk(registerFetchGo));	///////////////////////////////////////////////
	
	
	
	conditionTest condTest (.cond(cond), .CPSRIn(CPSRstatus), .conditionalExecute(conditionalExecuteWire), .reset(nreset), .clk(clk));

	ALU numberCrunch (.ALUexecute(ALUexecute), .data1(ALUData1), .data2(ALUData2), .operation(opcode), .result(resultWire), .flags(CPSRflagsWire), .reset(nreset), .clk(clk));
	
	
	executeRegister ex (.writeData(), .reset(nreset), .clk(executeGo));  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

	dataMemory dataMem(.addr(), .dataIn(), .dataOut(), .memoryEnable(), .readNotWrite(), .reset(nreset), .clk(clk));
	
	
	DataMemoryRegister( .reset(nreset), .clk(dataMemoryGo)); //////////////////////////////////////////////////////////////////////////////////


	
	writebackRegister(.writeAddress(), .writeData(), .reset(nreset), .clk(writebackGo)); /////////////////////////////////////////////////////////////////////////////////
	

// State variables.

parameter 	instructionFetch = 3'b000,
				registerFetch = 3'b001,
				execute = 3'b010,
				dataMemory = 3'b011,
				writeback = 3'b100;

reg [2:0] ps, ns;


always @* begin

	nextInstrReg = nextInstrWire;

	rmDataReg = rmDataWire;
	rnDataReg = rnDataWire
	
	
	
	

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
			writebackGo = 0;
			
			ns = registerFetch;
			end
			
	registerFetch: 		begin
	
	//read instruction and send values to register file
	//read registers
			instructionFetchGo = 0; 
			registerFetchGo = 1;
			executeGo = 0;
			dataMemoryGo = 0;
			writebackGo = 0;
	
			ns = execute;
			end
	
	execute:					begin 
	
	//send values from registers to the ALU
	//get value of computation from ALU
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 1;
			dataMemoryGo = 0;
			writebackGo = 0;
			
			ns = dataMemory;
			end
			
	dataMemory: 			begin
	
	// load or store values into memory
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 0;
			dataMemoryGo = 1;
			writebackGo = 0;
			
			ns = writeback;
			end
			
	writeback: 				begin
	
	// write to the registers
			instructionFetchGo = 0; 
			registerFetchGo = 0;
			executeGo = 0;
			dataMemoryGo = 0;
			writebackGo = 1;
			
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
