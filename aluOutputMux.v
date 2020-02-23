module aluOutputMux(opcode, ALUresult, branchImmediate, aluWritebackTest, conditionalExecute, writebackEnable,  aluMuxout);

input wire aluWritebackTest,conditionalExecute;
input wire [4:0] opcode;
input wire [31:0] ALUresult, branchImmediate;

output reg writebackEnable;
output reg [31:0] aluMuxout;

always @* begin

writebackEnable = (aluWritebackTest && conditionalExecute);

if (opcode == 5'b10001)
	aluMuxout = branchImmediate;
else 
	aluMuxout = ALUresult;

	end

endmodule



