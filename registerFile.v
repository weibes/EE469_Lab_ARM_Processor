module registerFile(writeDestination, writeEnable, readReg1, readReg2,
	 										writeData, readData1, readData2, reset, clk,
											writeToPC, oldPCVal);

	input wire writeEnable, reset, clk;

	input wire [31:0] writeData, oldPCVal;
	input wire [3:0] writeDestination, readReg1, readReg2;

	output reg [31:0] readData1;
	output reg [31:0] readData2;
	output reg writeToPC;
	
	reg [31:0] internalDataHold;
	 
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
		
		if (writeEnable)
			regFile[writeDestination] <= writeData;
		else
			regFile[writeDestination] <= internalDataHold;
	end
endmodule
	
	

module registerFile_testbench();

	reg writeEnable, reset, clk;
	reg [31:0] writeData, oldPCVal;
	reg [3:0] writeDestination, readReg1, readReg2;

	wire [31:0] readData1;
	wire [31:0] readData2;
	wire writeToPC;

	registerFile dut (.writeDestination(writeDestination), .writeEnable(writeEnable), .readReg1(readReg1), .readReg2(readReg2),
											.writeData(writeData), .readData1(readData1), .readData2(readData2), .reset(reset), .clk(clk), .writeToPC(writeToPC), .oldPCVal(oldPCVal));


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

			$stop; // End the simulation.

	 end
endmodule

