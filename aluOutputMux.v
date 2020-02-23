module aluOutputMux(opcode, ALUresult, branchImmediate, conditionalExecute, aluMuxout, aluWritebackTest, writebackEnable);

input wire [4:0] opcode;
input wire [31:0] ALUresult, branchImmediate;
input wire conditionalExecute, aluWritebackTest;

output reg [31:0] aluMuxout;
output reg writebackEnable;

always @* begin
	writebackEnable = (aluWritebackTest && conditionalExecute);

	if (opcode == 5'b10001)
		aluMuxout = branchImmediate;
	else 
		aluMuxout = ALUresult;

	end

endmodule



