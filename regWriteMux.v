module regWriteMux(opcode, ALUresult, memData, conditionalExecute, regWriteDataout, writeEnable);

	input wire [3:0] opcode;
	input wire [31:0] ALUresult;
	input wire [31:0] memData;
	input wire conditionalExecute;

	output reg [31:0] regWriteDataout;
	output reg writeEnable;


	always @* begin
		if (opcode == 5'b10000) // load or store
			regWriteDataout = memData;
		else
			regWriteDataout = ALUresult;
			
		if ((opcode != 5'b10001) && (conditionalExecute == 1))
			writeEnable = 1;

		else writeEnable = 0;
	end
endmodule
