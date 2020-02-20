module writeBackEnableChecker(notBran);
	input wire notBranch, condMet, writeBackBit;
	
	output wire writeBackEnable;

	always @* begin
		writeBackEnable = (notBranch && condMet)
	end
	

endmodule
