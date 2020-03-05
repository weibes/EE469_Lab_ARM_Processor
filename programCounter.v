module programCounter(Branch, currData, branchImmediate, clk, writeEnable, writeData, reset);
  input wire Branch, clk, writeEnable, reset;
  input wire [31:0] writeData, branchImmediate;
  
  output reg [31:0] currData;

  reg [31:0] nextData, temp;


  always @* begin
	 if (Branch == 1'b1) begin
		if (branchImmediate[31] == 1'b1) 
			nextData = currData - (~branchImmediate + 1'b1) - 4'b1000;
			
		else
			nextData = currData + branchImmediate + 4'b1000;
	 end
    else if (writeEnable)
		nextData = writeData;
	 else
      nextData = currData + 3'b100;
  end

  always @(posedge clk) begin
	if (reset)
		currData <= 0;
	else begin
		if (nextData[31] == 1'b0)
			currData <= nextData;
		else 
			currData <= (~nextData + 1'b1);
		end
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
