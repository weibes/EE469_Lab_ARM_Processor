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

TODO: finish writing testbench, make sure it works
module dataMemory_testbench() begin
	wire [31:0] addr, dataIn;
	wire readNotWrite, enable, reset, clk;
	reg [31:0] dataOut;

	dataMemory dut (.addr, .dataIn, .dataOut, .readNotWrite, .enable, .reset, .clk, .dataOut);
	
	
	// Set up the clock.
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	
	initial begin
		addr = 0;	dataIn = 0;	readNotWrite = 0;	enable = 0;	reset = 0;	@(posedge clk);
		
		
		
		$stop;

endmodule
*/
