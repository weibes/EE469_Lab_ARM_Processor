module aluOutputMux(opcode, ALUresult, branchImmediate, conditionalExecute, aluMuxout, aluWritebackTest, writebackEnable, noop);

input wire [4:0] opcode;
input wire [31:0] ALUresult, branchImmediate;
input wire conditionalExecute, aluWritebackTest;

output reg [31:0] aluMuxout;
output reg writebackEnable;
output reg noop;

always @* begin
	writebackEnable = (aluWritebackTest && conditionalExecute);

	if (opcode == 5'b10001)
		aluMuxout = branchImmediate;
	else 
		aluMuxout = ALUresult;

	if ((opcode == 5'b10001) && conditionalExecute)
		noop = 1;
	else 
		noop =0;

	end

endmodule



