module dataMemory(addr, dataIn, dataOut, memoryEnable, readNotWrite, reset, clk);


	input wire [31:0] addr, dataIn;
	input wire readNotWrite, memoryEnable, reset, clk; //not sure about function of enable, need to check
	
	output reg [31:0] dataOut;
	
	reg [31:0] internalData;
	reg [31:0] mainMemory [255:0]; //1 kB memory
	
	//memory needs to be clocked for simplicity
	always @* begin
		
		if (readNotWrite == 1)
			internalData = mainMemory[addr];
		else
			internalData = dataIn;
	
	end 
	
	integer i;
	always @(posedge clk) begin
		if (reset) begin
			for (i = 0; i < 256; i=i+1) 
				mainMemory[i] <= 0;
		end
		if (readNotWrite == 1)
			dataOut <= internalData;
		else begin
			if (memoryEnable == 1) begin //is a write, need to actually write lmao
				mainMemory[addr] <= dataIn;
			end
			dataOut <= 0;
		end
	end
endmodule



//TODO: finish writing testbench, make sure it works
module dataMemory_testbench();
	
	reg [31:0] addr, dataIn;
	reg readNotWrite, memoryEnable, reset, clk;
	wire [31:0] dataOut;
	
	dataMemory dut(.addr(addr), .dataIn(dataIn), .dataOut(dataOut), .readNotWrite(readNotWrite), .memoryEnable(memoryEnable), .reset(reset), .clk(clk));
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	
	initial begin
		addr = 0; dataIn = 0; readNotWrite = 0; memoryEnable = 0; reset = 1;	@(posedge clk);
		reset = 0;	addr = 32'h00000008;													@(posedge clk);
		memoryEnable = 1;																		@(posedge clk);
		readNotWrite = 1;																		@(posedge clk);
		addr = 32'h00000010; readNotWrite = 0;											@(posedge clk);
		addr = 32'h00000008;	readNotWrite = 1;											@(posedge clk);
		addr = 32'h00000010;	memoryEnable = 0;											@(posedge clk);
																									@(posedge clk);
		
		
		
		
		$stop;
	end
endmodule

