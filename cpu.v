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

  
	// programCounter variables
		//to
	reg isBranch;
		//from
	wire [31:0] instrLoc;
	wire [23:0] branchImmediate;

	
	// instructionMemory variables
		//to
		
		//from
	wire [31:0] nextInstr;
	
	
	// sortinstruction variables
		//to
		
		//from
	wire linkBit, prePostAddOffset, upDownOffset, byteOrWord, writeBack, loadStore;
	wire [3:0] rd, rn, rm, cond, rotateVal;
	wire [4:0] opcode;
	wire [7:0] rm_shift, immediateVal;
	wire [11:0] immediateOffset;
	wire isBranchWire, CPSRwritewire;
	
	
	//registerFile variables
		//to
	reg readWrite;	
		//from
	wire [31:0] rmData, rnData, writeData;
  
  
  //conditionTest variables
  		//to
		
		//from
  wire conditionalExecute;
  wire [3:0] CPSRflags;
  
 
  	// ALU variables
		//to
		
		//from
		
		
	//flagRegister variables
		//to
		
		//from
	
	

  // Controls the LED on the board.
  assign led = 1'b1;

  // These are how you communicate back to the serial port debugger.
  assign debug_port1 = instrLoc[7:0];
  assign debug_port2 = nextInstr[27:20];
  assign debug_port3[3:0] = cond;
  assign debug_port3[7:4] = rd;
  assign debug_port4[3:0] = rm;
  assign debug_port4[7:4] = rn;
  assign debug_port5 = branchImmediate[7:0];
  assign debug_port6 = immediateVal;
  assign debug_port7 = 8'h07;


//YOUR CODE GOES HERE





	programCounter PC(.Branch(isBranch), .Reset(nreset), .currData(instrLoc),
                    .branchImmediate(branchImmediate), .clk(clk));
						  

	instructionMemory Memory(.clk(clk), .nreset(nreset), .addr(instrLoc), .dataOut(nextInstr));
	

	sortInstruction sortInstr(.instruction(nextInstr), .linkBit(linkBit), .prePostAddOffset(prePostAddOffset), .upDownOffset(upDownOffset),
  												.byteOrWord(byteOrWord), .writeBack(writeBack), .loadStore(loadStore), .rd(rd), .rn(rn), .rm(rm), .opcode(opcode),
  												.cond(cond), .rotateVal(rotateVal), .rm_shift(rm_shift), .immediateVal(immediateVal), .immediateOffset(immediateOffset),
  												.branchImmediate(branchImmediate), .reset(nreset), .clk(clk), .isBranch(isBranchWire), .CPSRwrite(CPSRwritewire));
												

	registerFile reg_file(.writeDestination(rd), .writeEnable(readWrite), .readReg1(rm), .readReg2(rn),
                         .writeData(writeData), .readData1(rmData), .readData2(rnData), .reset(nreset), .clk(clk));
								 
								 
	conditionTest condTest (.cond(cond), .CPSRIn(CPSRflags), .conditionalExecute(conditionalExecute), .reset(nreset), .clk(clk));

	
	ALU numberCrunch (.cond(), .data1(), .data2(), .operation(), .result(), .flags(), .reset(nreset), .clk(clk));

	
	flagRegister CPSRegister(.flags(), .CPSRwrite(), .CPSRstatus(), .reset(nreset), .clk(clk));
	
	
	
	
	
	
	
	

// State variables.

parameter 	instructionFetch = 3'b000,
				registerFetch = 3'b001,
				execute = 3'b010,
				dataMemory = 3'b011,
				writeback = 3'b100;

reg [2:0] ps, ns;


always @* begin

isBranch = isBranchWire;

 
 
 // State logic
	case (ps)
	
	instructionFetch: 	begin
	//read R15
	//compute pc value
	//write R15 and make it the new PC value
	
//send the pc value to instruction memory
//get the instruction from instruction memory
	
			ns = registerFetch;
			end
			
	registerFetch: 		begin
	
	//read instruction and send values to register file
	//read registers
	
	
			ns = execute;
			end
	
	execute:					begin 
	
	//send values from registers to the ALU
	//get value of computation from ALU
	
			ns = dataMemory;
			end
			
	dataMemory: 			begin
	
	// load or store values into memory
	
			ns = writeback;
			end
			
	writeback: 				begin
	
	// write to the registers
	
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
