module aluOutputMux(opcode, ALUresult, branchImmediate, aluMuxout);

input wire [4:0] opcode;
input wire [31:0] ALUresult, branchImmediate;

output reg [31:0] aluMuxout


if (opcode == 5'b10001)
	aluMuxout = branchImmediate;
else 
	aluMuxout = ALUresult;

endmodule
