module registerFile(writeDestination, writeEnable, readReg1, readReg2,
	 										writeData, readData1, readData2, reset, clk,
											writeToPC, oldPCVal, linkBit);

	input wire writeEnable, reset, clk, linkBit;

	input wire [31:0] writeData, oldPCVal;
	input wire [3:0] writeDestination, readReg1, readReg2;

	output reg [31:0] readData1, readData2;
	output reg writeToPC;
	
	reg [31:0] internalDataHold, resetVal;

	reg [31:0] regFile [0:15];
	
	always @* begin

			internalDataHold = regFile[writeDestination];
			
			if((writeEnable == 1) && (writeDestination == 4'b1111))
				writeToPC = 1;
			else 
				writeToPC = 0;
			
			if (readReg1 == 4'b1111)
				readData1 = regFile[oldPCVal];
			else
				readData1 = regFile[readReg1];
			
			if (readReg2 == 4'b1111)
				readData2 = regFile[oldPCVal];
			else
				readData2 = regFile[readReg2];
			
		end
	
	always @(posedge clk) begin
		if (reset) begin
			regFile[0] <= 0;
			regFile[1] <= 0;
			regFile[2] <= 0;
			regFile[3] <= 0;
			regFile[4] <= 0;
			regFile[5] <= 0;
			regFile[6] <= 0;
			regFile[7] <= 0;
			regFile[8] <= 0;
			regFile[9] <= 0;
			regFile[10] <= 0;
			regFile[11] <= 0;
			regFile[12] <= 0;
			regFile[13] <= 0;
			regFile[14] <= 0;
		end
		if (writeEnable)
			regFile[writeDestination] <= writeData;
			if (linkBit)
				regFile[14] <= regFile[15]; //TODO: test if this works
		else
			regFile[writeDestination] <= internalDataHold;
	end
endmodule
	
	

module registerFile_testbench();

	reg writeEnable, reset, clk, linkBit;

	reg [31:0] writeData, oldPCVal;
	reg  [3:0] writeDestination, readReg1, readReg2;

	wire [31:0] readData1;
	wire [31:0] readData2;
	wire writeToPC;
	

	registerFile dut (.writeData(writeData), .oldPCVal(oldPCVal), .writeDestination(writeDestination), .readReg1(readReg1), .readReg2(readReg2), .readData1(readData1),
							.readData2(readData2), .writeToPC(writetoPC), .writeEnable(writeEnable), .reset(reset), .clk(clk), .linkBit(linkBit));

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
			writeEnable	 <= 0;					@(posedge clk);
			writeDestination	<= 4'b1000;		@(posedge clk);
			writeData	<= 32'hAAAAAAAA;		@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			writeEnable	 <= 1;					@(posedge clk);
			writeEnable	 <= 0;					@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			readReg1		<= 4'b1000;				@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			writeDestination	<= 4'b0000;		@(posedge clk);
			writeData	<= 32'hCCCCCCCC;		@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			writeEnable	 <= 1;					@(posedge clk);
			writeEnable	 <= 0;					@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			readReg2 	<= 4'b0000;				@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			writeDestination	<= 4'b1111;		@(posedge clk);
			writeData	<= 32'hCCCCCCCC;		@(posedge clk);
														@(posedge clk);
			linkBit <= 1;							@(posedge clk);
														@(posedge clk);
														@(posedge clk);
			writeEnable	 <= 1;					@(posedge clk);
			writeEnable	 <= 0;					@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);

			$stop; // End the simulation.

	 end
endmodule

