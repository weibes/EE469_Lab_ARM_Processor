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

  wire [31:0] rmData, rnData, writeData;
  wire linkBit, prePostAddOffset, upDownOffset, byteOrWord, writeBack,
               loadStore, isBranch;

	 reg readWrite;
  wire [3:0] rd, rn, rm, opcode, cond, rotateVal;
  wire [7:0] rm_shift, immediateVal;
  wire [11:0] immediateOffset;
  wire [23:0] branchImmediate;

  wire [31:0] instrLoc, nextInstr;

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
  												.branchImmediate(branchImmediate), .reset(nreset), .clk(clk), .isBranch(isBranch));

  registerFile reg_file(.writeDestination(rd), .writeEnable(readWrite), .readReg1(rm), .readReg2(rn),
                         .writeData(writeData), .readData1(rmData), .readData2(rnData), .reset(nreset), .clk(clk));



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
