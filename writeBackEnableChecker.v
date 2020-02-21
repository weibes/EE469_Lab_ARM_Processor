module writeBackEnableChecker(notBranch, condMet, writeBackBit, opcode, writeBackEnable);
	input wire notBranch, condMet, writeBackBit;
	input wire [4:0] opcode;
	
	output reg writeBackEnable;

	always @* begin
		writeBackEnable = ((opcode != 5'b10001) && condMet);
	end
	

endmodule
