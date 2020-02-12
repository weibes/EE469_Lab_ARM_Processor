module  sortInstruction(instruction, linkBit, prePostAddOffset, upDownOffset,
												byteOrWord, writeBack, loadStore, rd, rn, rm, opcode,
												cond, rotateVal, rm_shift, immediateVal, immediateOffset,
												branchImmediate, reset, clk, isBranch);


	input wire [31:0] instruction;
	input wire reset, clk;
	output reg linkBit, prePostAddOffset, upDownOffset, byteOrWord, writeBack,
							 loadStore, isBranch;
	output reg [3:0] rd, rn, rm, opcode, cond, rotateVal;
	output reg [7:0] rm_shift, immediateVal;
	output reg [11:0] immediateOffset;
	output reg [23:0] branchImmediate;



	always @* begin

	// send condition from instruction to register_file
		cond = instruction [31:28];

		opcode = 0;
		rn = 0;
		rd = 0;
		rm = 0;
		rm_shift = 0;
		immediateVal = 0;
		rotateVal = 0;
		immediateOffset = 0;
		linkBit = 0;
		branchImmediate = 0;
		prePostAddOffset = 0;
		upDownOffset = 0;
		byteOrWord = 0;
		writeBack = 0;
		loadStore = 0;
		isBranch = 0;

		if (instruction [27:26] == 2'b00)

			begin  //if instruction format is "data processing"
			isBranch = 1'b0;
			opcode = instruction[24:21];
			rn = instruction[19:16];
			rd = instruction[15:12];


				if (instruction[25] == 1'b0)

				begin
				rm = instruction[3:0];
				rm_shift = instruction[11:4];
				end

				else

				begin
				immediateVal = instruction[7:0];
				rotateVal = instruction[11:8];
				end
				end



	//	instruction [31:28] 	//cond
	//
	//	if (instruction [25] & 1 ) //if immediate bit is true
	//		instruction [11:8] //rotate
	//		instruction [7:0]//immediate value
	//	else
	//		instruction [11:4] //shift
	//		instruction [3:0] // rm
	//
	//	instruction [24:21] 	//opcode
	//	instruction [20] 		//S bit
	//	instruction [19:16] 	//rn
	//	instruction [15:12] 	//rd

		/*
		case (instruction [24:21]) //read opcode


		// 3210
		begin

		//	Meaning of each instuction
		4'b0000: inst = "AND";
		4'b0001: inst = "EOR";
		4'b0010: inst = "SUB";
		4'b0011: inst = "RSB";
		4'b0100: inst = "ADD";
		4'b0101: inst = "ADC";
		4'b0110: inst = "SBC";
		4'b0111: inst = "RSC";
		4'b1000: inst = "TST";
		4'b1001: inst = "TEQ";
		4'b1010: inst = "CMP";
		4'b1011: inst = "CMN";
		4'b1100: inst = "ORR";
		4'b1101: inst = "MOV";
		4'b1110: inst = "BIC";
		4'b1111: inst = "MVN";

		end
		endcase

		*/

		else if (instruction [27:26] == 2'b01)

		begin //if instruction format is "single data transfer"

	/*
	// Interpretation of Single Data Swap instructions
		instruction [31:28] //cond
		instruction [25] 	//immediate
		instruction [24] 	//Pre/Post indexing
		instruction [23] 	//up/down
		instruction [22] 	//byte/word
		instruction [21] 	//write-back
		instruction [20] 	//load/Store
		instruction [19:16] 	//rn (base register)
		instruction [15:12] 	//rd (source/destination register)
		instruction [11:0] 	//offset
	*/
			isBranch = 1'b0;
			prePostAddOffset = instruction[24];
			upDownOffset = instruction[23];
			byteOrWord = instruction[22];
			writeBack = instruction[21];
			loadStore = instruction[20];
			rn = instruction[19:16];
			rd = instruction[15:12];


			if (instruction[25] == 1'b1)

			begin
				rm_shift = instruction[11:4];
				rm = instruction[3:0];
			end

			else

			begin
				immediateOffset = instruction[11:0];
			end
		end

		else if (instruction [27:25] == 3'b101)
		begin //if instruction format is branch
		linkBit = instruction[24];
		branchImmediate = instruction[23:0];
		if (cond == 4'b1110) //execute unconditionalBranch
			isBranch = 1'b1;
		else
			isBranch = 1'b0;



	/*
		instruction [31:28] 	//cond
		instruction [24] 		//link
		instruction [23:0] 	//offset
	*/
		end
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
