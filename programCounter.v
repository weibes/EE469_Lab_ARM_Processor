module programCounter(Branch, currData, branchImmediate, clk, writeEnable, writeData, incrEnable, reset);
  input wire Branch, clk, writeEnable, incrEnable, reset;
  input wire [23:0] branchImmediate;
  input wire [31:0] writeData;
  
  output reg [31:0] currData;

  reg [31:0] nextData;


  always @* begin
	
	 if (Branch == 1'b1)
      nextData = currData + 4'b1000 - branchImmediate;
    else if (writeEnable)
		nextData = writeData;
	 else if (incrEnable)
      nextData = currData + 3'b100;
	 else 
		nextData = currData;
  end

  always @(posedge clk) begin
	if (reset)
		currData <= 0;
	else
		currData <= nextData;
	end
endmodule

/*
module programCounter_testbench();
  reg Branch, Reset, clk;
  reg [23:0] branchImmediate;

  wire [31:0] currData;

 programCounter dut (.Branch(Branch), .Reset(Reset), .currData(currData), .branchImmediate(branchImmediate), .clk(clk));

 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
													@(posedge clk);
		Reset	<= 1;								@(posedge clk);
		Reset	<= 0;								@(posedge clk);
		Branch <= 0;							@(posedge clk);
		branchImmediate<= 0;					@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
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
