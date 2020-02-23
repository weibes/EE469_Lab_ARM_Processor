module instructionFetchRegister(instructionIN, pcValIN, CPSRFlags_In, writeBackEnable_In,
										  instructionOUT, pcValOUT, CPSRFlags_INST_OUT, writeBackEnable_INST_OUT,
										  reset, clk);

output reg [31:0] instructionOUT, pcValOUT;
output reg [3:0] CPSRFlags_INST_OUT;
output reg writeBackEnable_INST_OUT;

input wire reset, clk, writeBackEnable_In;
input wire [3:0] CPSRFlags_In;
input wire [31:0] instructionIN, pcValIN;


 always @(posedge clk)
	if (reset) 
	begin
		instructionOUT <= 0; // On reset, set to 0
		pcValOUT <= 0;
		CPSRFlags_INST_OUT <= 0;
		writeBackEnable_INST_OUT <= 0;
	end
	else
	begin
		instructionOUT <= instructionIN;
		pcValOUT <= pcValIN;
		CPSRFlags_INST_OUT <= CPSRFlags_In;
		writeBackEnable_INST_OUT <= writeBackEnable_In;
	end
endmodule