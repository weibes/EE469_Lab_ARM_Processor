module programCounter(Branch, Reset, currData, branchImmediate, clk);
  input wire Branch, Reset, clk;
  input wire [23:0] branchImmediate;
  
  output reg [31:0] currData;

  reg [31:0] nextData;

  reg branchCheck;

  always @* begin

    if (Branch == 1'b1)
      nextData = currData + 3'b100 - branchImmediate;
    else
      nextData = currData + 3'b100;
  end

  always @(posedge clk) begin
    if(Reset == 1'b1)
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
