module readData (readRegister, regupdate_R15, regupdate_R14, regupdate_R13, regupdate_R12, regupdate_R11,
regupdate_R10, regupdate_R9, regupdate_R8, regupdate_R7, regupdate_R6, regupdate_R5,
regupdate_R4, regupdate_R3, regupdate_R2, regupdate_R1, regupdate_R0, readData, reset, clk);

	input wire reset, clk;

	input wire [3:0] readRegister;

	input wire [31:0] regupdate_R15;
	input wire [31:0] regupdate_R14;
	input wire [31:0] regupdate_R13;
	input wire [31:0] regupdate_R12;
	input wire [31:0] regupdate_R11;
	input wire [31:0] regupdate_R10;
	input wire [31:0] regupdate_R9;
	input wire [31:0] regupdate_R8;
	input wire [31:0] regupdate_R7;
	input wire [31:0] regupdate_R6;
	input wire [31:0] regupdate_R5;
	input wire [31:0] regupdate_R4;
	input wire [31:0] regupdate_R3;
	input wire [31:0] regupdate_R2;
	input wire [31:0] regupdate_R1;
	input wire [31:0] regupdate_R0;

	output reg [31:0] readData;

	always @* begin
		case (readRegister)
		4'b 0000: 	begin readData = regupdate_R0 ;end
		4'b 0001: 	begin readData = regupdate_R1 ;end
		4'b 0010: 	begin readData = regupdate_R2 ;end
		4'b 0011: 	begin readData = regupdate_R3 ;end
		4'b 0100: 	begin readData = regupdate_R4 ;end
		4'b 0101: 	begin readData = regupdate_R5 ;end
		4'b 0110: 	begin readData = regupdate_R6 ;end
		4'b 0111: 	begin readData = regupdate_R7 ;end
		4'b 1000: 	begin readData = regupdate_R8 ;end
		4'b 1001: 	begin readData = regupdate_R9 ;end
		4'b 1010: 	begin readData = regupdate_R10 ;end
		4'b 1011: 	begin readData = regupdate_R11 ;end
		4'b 1100: 	begin readData = regupdate_R12 ;end
		4'b 1101: 	begin readData = regupdate_R13 ;end
		4'b 1110: 	begin readData = regupdate_R14 ;end
		4'b 1111: 	begin readData = regupdate_R15 ;end
		endcase
	 end

endmodule


/*

module readData_testbench();

reg reset, clk;

reg [3:0] readRegister;

reg [31:0] regupdate_R15;
reg [31:0] regupdate_R14;
reg [31:0] regupdate_R13;
reg [31:0] regupdate_R12;
reg [31:0] regupdate_R11;
reg [31:0] regupdate_R10;
reg [31:0] regupdate_R9;
reg [31:0] regupdate_R8;
reg [31:0] regupdate_R7;
reg [31:0] regupdate_R6;
reg [31:0] regupdate_R5;
reg [31:0] regupdate_R4;
reg [31:0] regupdate_R3;
reg [31:0] regupdate_R2;
reg [31:0] regupdate_R1;
reg [31:0] regupdate_R0;

wire [31:0] readData;


readData dut (.readRegister(readRegister), .regupdate_R15(regupdate_R15), .regupdate_R14(regupdate_R14), .regupdate_R13(regupdate_R13), .regupdate_R12(regupdate_R12), .regupdate_R11(regupdate_R11),
.regupdate_R10(regupdate_R10), .regupdate_R9(regupdate_R9), .regupdate_R8(regupdate_R8), .regupdate_R7(regupdate_R7), .regupdate_R6(regupdate_R6), .regupdate_R5(regupdate_R5),
.regupdate_R4(regupdate_R4), .regupdate_R3(regupdate_R3), .regupdate_R2(regupdate_R2), .regupdate_R1(regupdate_R1), .regupdate_R0(regupdate_R0), .readData(readData), .reset(reset), .clk(clk));



 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
													@(posedge clk);
													@(posedge clk);
regupdate_R15 <= 32'h00000000;
regupdate_R14 <= 32'h00000000;
regupdate_R13 <= 32'h00000000;
regupdate_R12 <= 32'h00000000;
regupdate_R11 <= 32'h00000000;
regupdate_R10 <= 32'h00000000;
regupdate_R9 <= 32'h00000000;
regupdate_R8 <= 32'h00000000;
regupdate_R7 <= 32'h00000000;
regupdate_R6 <= 32'h00000000;
regupdate_R5 <= 32'h00000000;
regupdate_R4 <= 32'h00000000;
regupdate_R3 <= 32'h00000000;
regupdate_R2 <= 32'h00000000;
regupdate_R1 <= 32'hCCCCCCCC;
regupdate_R0 <= 32'hAAAAAAAA;

													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
		readRegister	<= 4'b0000;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
		readRegister	<= 4'b0100;			@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
		readRegister	<= 4'b0001;			@(posedge clk);
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
		readRegister	<= 4'b1111;			@(posedge clk);
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
