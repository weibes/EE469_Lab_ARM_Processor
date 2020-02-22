module writeBackEnableChecker(condMet, notBranch, writeBackEnable);
	input wire condMet, notBranch;
	output reg writeBackEnable;

	always @* begin
		writeBackEnable = (notBranch && condMet);
	end
	

endmodule
