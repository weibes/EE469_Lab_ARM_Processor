module  sortInstruction(instruction, noop,linkBit, prePostAddOffset, upDownOffset, shifterVals,
												byteOrWord, writeBack, loadStore, rd, rn, rm, opcode,
												cond, branchImmediate, reset, clk, CPSRwrite, immediateOperand);

	input wire [31:0] instruction;
	input wire reset, clk, noop;

	output reg linkBit, prePostAddOffset, upDownOffset, byteOrWord, writeBack,
							 loadStore, CPSRwrite, immediateOperand;
	output reg [3:0] rd, rn, rm, cond;
	output reg [4:0] opcode;
	output reg [23:0] branchImmediate;
	
	
	//no more rotateVal, immediateVal
	//no more rm_shiftSDT
	output reg [11:0] shifterVals;

	

	always @* begin

	// information used by all instructions
		cond = instruction [31:28];
		opcode = 5'b11111; //invalid opcode
		rn = 0;
		rd = 0;
		rm = 0;
		
		// data processing information
		CPSRwrite = 0;
		immediateOperand = 0;
		
		//single data transfer information
		linkBit = 0;
		branchImmediate = 0;
		prePostAddOffset = 0;
		upDownOffset = 0;
		byteOrWord = 0;
		writeBack = 0;
		loadStore = 0;
		shifterVals = 0;

		if (instruction [27:26] == 2'b00)  //if instruction format is "data processing"
		
		begin
			rn = instruction[19:16];
			rd = instruction[15:12];
			rm = instruction[3:0];
			immediateOperand = instruction[25];
			shifterVals = instruction[11:0];
			CPSRwrite = instruction [20]; 		// Set conditionc codes
		
			case (instruction [24:21]) //opcode
			//	encode opcode for ALU
			4'b0000: opcode = 5'b00000;  //"AND"
			4'b0001: opcode = 5'b00001;  //"EOR"
			4'b0010: opcode = 5'b00010;  //"SUB"
			4'b0011: opcode = 5'b00011;  //"RSB"
			4'b0100: opcode = 5'b00100;  //"ADD"
			4'b0101: opcode = 5'b00101;  //"ADC"
			4'b0110: opcode = 5'b00110;  //"SBC"
			4'b0111: opcode = 5'b00111;  //"RSC"
			4'b1000: opcode = 5'b01000;  //"TST"
			4'b1001: opcode = 5'b01001;  //"TEQ"
			4'b1010: opcode = 5'b01010;  //"CMP"
			4'b1011: opcode = 5'b01011;  //"CMN"
			4'b1100: opcode = 5'b01100;  //"ORR"
			4'b1101: opcode = 5'b01101;  //"MOV"
			4'b1110: opcode = 5'b01110;  //"BIC"
			4'b1111: opcode = 5'b01111;  //"MVN"
			endcase
		end

		else if (instruction [27:26] == 2'b01)  //if instruction format is "single data transfer"
			
			begin 
			
			opcode = 5'b10000; // code for load or store
			
			prePostAddOffset = instruction[24];
			upDownOffset = instruction[23];
			byteOrWord = instruction[22];
			writeBack = instruction[21];
			loadStore = instruction[20];
			rn = instruction[19:16];
			rd = instruction[15:12];
			rm = instruction[3:0];
			immediateOperand = instruction[25];
			shifterVals = instruction[11:0];
			end

		else if (instruction [27:25] == 3'b101) //if instruction format is branch
			begin
			
			opcode = 5'b10001; // code for branch
			
			linkBit = instruction[24];
			branchImmediate = instruction[23:0];
			end
			
			if (noop == 1)
				opcode = 5'b11111;
			
			
	end

endmodule






/*
module  sortInstruction_testbench();

	reg [31:0] instruction;
	reg reset, clk;
	wire linkBit, prePostAddOffset, upDownOffset, byteOrWord, writeBack,
							 loadStore;
	wire [3:0] rd, rn, rm, opcode, cond, rotateVal;
	wire [7:0] rm_shift, immediateVal;
	wire [11:0] immediateOffset;
	wire [23:0] branchImmediate;

sortInstruction dut (.instruction(instruction), .linkBit(linkBit), .prePostAddOffset(prePostAddOffset), .upDownOffset(upDownOffset),
												.byteOrWord(byteOrWord), .writeBack(writeBack), .loadStore(loadStore), .rd(rd), .rn(rn), .rm(rm), .opcode(opcode),
												.cond(cond), .rotateVal(rotateVal), .rm_shift(rm_shift), .immediateVal(immediateVal), .immediateOffset(immediateOffset),
												.branchImmediate(branchImmediate),.reset(reset), .clk(clk));


 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
													@(posedge clk);
		reset	<= 1;								@(posedge clk);
		reset	<= 0;								@(posedge clk);
													@(posedge clk);
	instruction = 32'h00000000;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	instruction = 32'he28db004;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	instruction = 32'he59f0014;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	instruction = 32'hebfffffe;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
	instruction = 32'he3a03000;			@(posedge clk);
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
