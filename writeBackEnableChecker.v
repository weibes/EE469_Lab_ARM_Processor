module writeBackEnableChecker(notBran);
	input wire notBranch, condMet, writeBackBit;
	input wire [4:0] opcode;
	
	output wire writeBackEnable

	always @* begin
		writeBackEnable = ((opcode != 5'b10001) && condMet)
	end
	

endmodule
