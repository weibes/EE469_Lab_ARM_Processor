module writeBackEnableChecker(notBranch, condMet, writeBackEnable);
	input wire notBranch, condMet;
	
	output wire writeBackEnable;

	always @* begin
		writeBackEnable = (notBranch && condMet);
	end
	

endmodule
