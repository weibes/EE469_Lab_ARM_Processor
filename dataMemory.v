module dataMemory(addr, dataIn, dataOut, memoryEnable, readNotWrite, reset, clk);


	input wire [31:0] addr, dataIn;
	input wire readNotWrite, memoryEnable, reset, clk; //not sure about function of enable, need to check
	
	output reg [31:0] dataOut;
	
	reg [31:0] internalDataHold;
	reg [31:0] mainMemory [255:0]; //1 kB memory
	
	//memory needs to be clocked for simplicity
	always @* begin
		
		if ((readNotWrite == 0) && (memoryEnable == 1))
			internalDataHold = dataIn;
	
		else
			internalDataHold = mainMemory[addr];
		
	end
	
	always @(posedge clk) begin
	
		mainMemory[addr] <= internalDataHold;
	
	
		if (memoryEnable == 1)
			dataOut <= internalDataHold;
		else
			dataOut <= 0;
			
	end
endmodule

/*
module dataMemory_testbench();
	
	reg [31:0] addr, dataIn;
	reg readNotWrite, memoryEnable, reset, clk;
	wire [31:0] dataOut;
	
	dataMemory dut (.addr(addr), .dataIn(dataIn), .dataOut(dataOut), .readNotWrite(readNotWrite), .memoryEnable(memoryEnable), .reset(reset), .clk(clk));
	
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	
	initial begin
		addr = 0;	dataIn = 0;	readNotWrite = 0;	memoryEnable = 0;	reset = 1;	@(posedge clk);
		reset = 0;	dataIn = 32'h00000008;													@(posedge clk);
		memoryEnable = 1;																			@(posedge clk);
		readNotWrite = 1;																			@(posedge clk);
		readNotWrite = 0; dataIn = 32'h12345678; memoryEnable = 0;					@(posedge clk);
		memoryEnable = 1;																			@(posedge clk);
		
		$stop;
	end
endmodule
*/