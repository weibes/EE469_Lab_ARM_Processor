module regWriteMux(opcode, ALUresult, memData, regWriteDataout);

	input wire [3:0] opcode;
	input wire [31:0] ALUresult;
	input wire [31:0] memData;

	output reg [31:0] regWriteDataout;


	always @* begin
		if (opcode == 5'b10000) // load or store
			regWriteDataout = memData;
		else
			regWriteDataout = ALUresult;
	end
endmodule
