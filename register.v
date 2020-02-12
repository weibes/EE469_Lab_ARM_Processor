module  register(regin, regout, writeEnable, reset, clk);

input wire writeEnable, reset, clk;

input wire [31:0] regin;
output reg [31:0] regout;


wire [31:0] registerqwire;
reg [31:0] registerd;


always @* begin

	regout = registerqwire;
	
	if (writeEnable == 1)
		registerd = regin;
	else
		registerd = regout;
	
end

	D_FF bit31 (.q(registerqwire[31]), .d(registerd[31]), .reset(reset), .clk(clk));
	D_FF bit30 (.q(registerqwire[30]), .d(registerd[30]), .reset(reset), .clk(clk));
	D_FF bit29 (.q(registerqwire[29]), .d(registerd[29]), .reset(reset), .clk(clk));
	D_FF bit28 (.q(registerqwire[28]), .d(registerd[28]), .reset(reset), .clk(clk));
	D_FF bit27 (.q(registerqwire[27]), .d(registerd[27]), .reset(reset), .clk(clk));
	D_FF bit26 (.q(registerqwire[26]), .d(registerd[26]), .reset(reset), .clk(clk));
	D_FF bit25 (.q(registerqwire[25]), .d(registerd[25]), .reset(reset), .clk(clk));
	D_FF bit24 (.q(registerqwire[24]), .d(registerd[24]), .reset(reset), .clk(clk));
	D_FF bit23 (.q(registerqwire[23]), .d(registerd[23]), .reset(reset), .clk(clk));
	D_FF bit22 (.q(registerqwire[22]), .d(registerd[22]), .reset(reset), .clk(clk));
	D_FF bit21 (.q(registerqwire[21]), .d(registerd[21]), .reset(reset), .clk(clk));
	D_FF bit20 (.q(registerqwire[20]), .d(registerd[20]), .reset(reset), .clk(clk));
	D_FF bit19 (.q(registerqwire[19]), .d(registerd[19]), .reset(reset), .clk(clk));
	D_FF bit18 (.q(registerqwire[18]), .d(registerd[18]), .reset(reset), .clk(clk));
	D_FF bit17 (.q(registerqwire[17]), .d(registerd[17]), .reset(reset), .clk(clk));
	D_FF bit16 (.q(registerqwire[16]), .d(registerd[16]), .reset(reset), .clk(clk));
	D_FF bit15 (.q(registerqwire[15]), .d(registerd[15]), .reset(reset), .clk(clk));
	D_FF bit14 (.q(registerqwire[14]), .d(registerd[14]), .reset(reset), .clk(clk));
	D_FF bit13 (.q(registerqwire[13]), .d(registerd[13]), .reset(reset), .clk(clk));
	D_FF bit12 (.q(registerqwire[12]), .d(registerd[12]), .reset(reset), .clk(clk));
	D_FF bit11 (.q(registerqwire[11]), .d(registerd[11]), .reset(reset), .clk(clk));
	D_FF bit10 (.q(registerqwire[10]), .d(registerd[10]), .reset(reset), .clk(clk));
	D_FF bit09 (.q(registerqwire[9]), .d(registerd[9]), .reset(reset), .clk(clk));
	D_FF bit08 (.q(registerqwire[8]), .d(registerd[8]), .reset(reset), .clk(clk));
	D_FF bit07 (.q(registerqwire[7]), .d(registerd[7]), .reset(reset), .clk(clk));
	D_FF bit06 (.q(registerqwire[6]), .d(registerd[6]), .reset(reset), .clk(clk));
	D_FF bit05 (.q(registerqwire[5]), .d(registerd[5]), .reset(reset), .clk(clk));
	D_FF bit04 (.q(registerqwire[4]), .d(registerd[4]), .reset(reset), .clk(clk));
	D_FF bit03 (.q(registerqwire[3]), .d(registerd[3]), .reset(reset), .clk(clk));
	D_FF bit02 (.q(registerqwire[2]), .d(registerd[2]), .reset(reset), .clk(clk));
	D_FF bit01 (.q(registerqwire[1]), .d(registerd[1]), .reset(reset), .clk(clk));
	D_FF bit00 (.q(registerqwire[0]), .d(registerd[0]), .reset(reset), .clk(clk));


endmodule


//
//
//
//module register_testbench();
//
//reg writeEnable, reset, clk;
//
//reg [31:0] regin;
//
//wire [31:0] regout;
//
//
//register dut (.regin, .regout(), .writeEnable, .reset, .clk);
//
//
// // Set up the clock.
// parameter CLOCK_PERIOD=100;
// initial begin
//	clk <= 0;
//	forever #(CLOCK_PERIOD/2) clk <= ~clk;
// end
//
// // Set up the inputs to the design. Each line is a clock cycle.
// initial begin
//													@(posedge clk);
//		reset	<= 1;								@(posedge clk);
//		reset	<= 0;								@(posedge clk);
//		writeEnable <= 0;						@(posedge clk);
//		regin	<= 32'hffffffff;				@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		writeEnable <= 1;						@(posedge clk);		
//		writeEnable <= 0;						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);	
//													@(posedge clk);
//		regin	<= 32'hAAAAAAAA;				@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);		
//		writeEnable <= 1;						@(posedge clk);
//		writeEnable <= 0;						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		regin	<= 32'hffffffff;				@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		writeEnable <= 1;						@(posedge clk);	
//		writeEnable <= 0;						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		writeEnable <= 1;						@(posedge clk);		
//		writeEnable <= 0;						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);	
//		regin	<= 32'hAAAAAAAA;				@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		writeEnable <= 1;						@(posedge clk);		
//		writeEnable <= 0;						@(posedge clk);
//													@(posedge clk);		
//													@(posedge clk);
//
//		$stop; // End the simulation.
// 
// end
//endmodule 
