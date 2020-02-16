module registerFile(writeDestination, writeEnable, readReg1, readReg2,
	 										writeData, readData1, readData2, reset, clk);

input wire writeEnable, reset, clk;

input wire [31:0] writeData;
input wire [3:0] writeDestination, readReg1, readReg2;

output reg [31:0] readData1;
output reg [31:0] readData2;

wire [31:0] readData1wire;
wire [31:0] readData2wire;

//output from the flipflops 
wire [31:0] regupdate_R15;
wire [31:0] regupdate_R14;
wire [31:0] regupdate_R13;
wire [31:0] regupdate_R12;
wire [31:0] regupdate_R11;
wire [31:0] regupdate_R10;
wire [31:0] regupdate_R9;
wire [31:0] regupdate_R8;
wire [31:0] regupdate_R7;
wire [31:0] regupdate_R6;
wire [31:0] regupdate_R5;
wire [31:0] regupdate_R4;
wire [31:0] regupdate_R3;
wire [31:0] regupdate_R2;
wire [31:0] regupdate_R1;
wire [31:0] regupdate_R0;

//output of writeRegister case sends flag to registers
reg writeTo_R15;
reg writeTo_R14;
reg writeTo_R13;
reg writeTo_R12;
reg writeTo_R11;
reg writeTo_R10;
reg writeTo_R9;
reg writeTo_R8;
reg writeTo_R7;
reg writeTo_R6;
reg writeTo_R5;
reg writeTo_R4;
reg writeTo_R3;
reg writeTo_R2;
reg writeTo_R1;
reg writeTo_R0;

always @* begin
	writeTo_R0 = 0;
	writeTo_R1 = 0;
	writeTo_R2 = 0;
	writeTo_R3 = 0;
	writeTo_R4 = 0;
	writeTo_R5 = 0;
	writeTo_R6 = 0;
	writeTo_R7 = 0;
	writeTo_R8 = 0;
	writeTo_R9 = 0;
	writeTo_R10 = 0;
	writeTo_R11 = 0;
	writeTo_R12 = 0;
	writeTo_R13 = 0;
	writeTo_R14 = 0;
	writeTo_R15 = 0;

	readData1 = readData1wire;
	readData2 = readData2wire;
	if(writeEnable) begin
		case (writeDestination)
			4'b0000:  	writeTo_R0 = 1;
			4'b0001: 	writeTo_R1 = 1;
			4'b0010: 	writeTo_R2 = 1;
			4'b0011: 	writeTo_R3 = 1;
			4'b0100: 	writeTo_R4 = 1;
			4'b0101: 	writeTo_R5 = 1;
			4'b0110: 	writeTo_R6 = 1;
			4'b0111: 	writeTo_R7 = 1;
			4'b1000: 	writeTo_R8 = 1;
			4'b1001: 	writeTo_R9 = 1;
			4'b1010: 	writeTo_R10 = 1;
			4'b1011: 	writeTo_R11 = 1;
			4'b1100: 	writeTo_R12 = 1;
			4'b1101: 	writeTo_R13 = 1;
			4'b1110:    writeTo_R14 = 1;
			4'b1111: 	writeTo_R15 = 1;
		endcase
	 end
	end

register R15( .regin(writeData), .regout(regupdate_R15), .writeEnable(writeTo_R15), .reset(reset), .clk(clk));
register R14( .regin(writeData), .regout(regupdate_R14), .writeEnable(writeTo_R14), .reset(reset), .clk(clk));
register R13( .regin(writeData), .regout(regupdate_R13), .writeEnable(writeTo_R13), .reset(reset), .clk(clk));
register R12( .regin(writeData), .regout(regupdate_R12), .writeEnable(writeTo_R12), .reset(reset), .clk(clk));
register R11( .regin(writeData), .regout(regupdate_R11), .writeEnable(writeTo_R11), .reset(reset), .clk(clk));
register R10( .regin(writeData), .regout(regupdate_R10), .writeEnable(writeTo_R10), .reset(reset), .clk(clk));
register R9( .regin(writeData), .regout(regupdate_R9), .writeEnable(writeTo_R9), .reset(reset), .clk(clk));
register R8( .regin(writeData), .regout(regupdate_R8), .writeEnable(writeTo_R8), .reset(reset), .clk(clk));
register R7( .regin(writeData), .regout(regupdate_R7), .writeEnable(writeTo_R7), .reset(reset), .clk(clk));
register R6( .regin(writeData), .regout(regupdate_R6), .writeEnable(writeTo_R6), .reset(reset), .clk(clk));
register R5( .regin(writeData), .regout(regupdate_R5), .writeEnable(writeTo_R5), .reset(reset), .clk(clk));
register R4( .regin(writeData), .regout(regupdate_R4), .writeEnable(writeTo_R4), .reset(reset), .clk(clk));
register R3( .regin(writeData), .regout(regupdate_R3), .writeEnable(writeTo_R3), .reset(reset), .clk(clk));
register R2( .regin(writeData), .regout(regupdate_R2), .writeEnable(writeTo_R2), .reset(reset), .clk(clk));
register R1( .regin(writeData), .regout(regupdate_R1), .writeEnable(writeTo_R1), .reset(reset), .clk(clk));
register R0( .regin(writeData), .regout(regupdate_R0), .writeEnable(writeTo_R0), .reset(reset), .clk(clk));

readData readDataOne (.readRegister(readReg1), .regupdate_R15(regupdate_R15), .regupdate_R14(regupdate_R14),
.regupdate_R13(regupdate_R13), .regupdate_R12(regupdate_R12), .regupdate_R11(regupdate_R11),
.regupdate_R10(regupdate_R10), .regupdate_R9(regupdate_R9), .regupdate_R8(regupdate_R8),
.regupdate_R7(regupdate_R7), .regupdate_R6(regupdate_R6), .regupdate_R5(regupdate_R5),
.regupdate_R4(regupdate_R4), .regupdate_R3(regupdate_R3), .regupdate_R2(regupdate_R2),
.regupdate_R1(regupdate_R1), .regupdate_R0(regupdate_R0), .readData(readData1wire), .reset(reset), .clk(clk));

readData readDataTwo (.readRegister(readReg2), .regupdate_R15(regupdate_R15), .regupdate_R14(regupdate_R14),
.regupdate_R13(regupdate_R13), .regupdate_R12(regupdate_R12), .regupdate_R11(regupdate_R11),
.regupdate_R10(regupdate_R10), .regupdate_R9(regupdate_R9), .regupdate_R8(regupdate_R8),
.regupdate_R7(regupdate_R7), .regupdate_R6(regupdate_R6), .regupdate_R5(regupdate_R5),
.regupdate_R4(regupdate_R4), .regupdate_R3(regupdate_R3), .regupdate_R2(regupdate_R2),
.regupdate_R1(regupdate_R1), .regupdate_R0(regupdate_R0), .readData(readData2wire), .reset(reset), .clk(clk));

endmodule
/*
module registerFile_testbench();

reg writeEnable, reset, clk;
reg [31:0] writeData;
reg [3:0] writeDestination, readReg1, readReg2;

wire [31:0] readData1;
wire [31:0] readData2;


registerFile dut (.writeDestination(writeDestination), .writeEnable(writeEnable), .readReg1(readReg1), .readReg2(readReg2),
	 									.writeData(writeData), .readData1(readData1), .readData2(readData2), .reset(reset), .clk(clk));


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

		$stop; // End the simulation.

 end
endmodule
*/
