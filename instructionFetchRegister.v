module instructionFetchRegister(instructionIN, pcValIN, CPSRFlags_In, noopIN, writeBackEnable_In,
										  instructionOUT, pcValOUT, CPSRFlags_INST_OUT, noopOUT, writeBackEnable_INST_OUT,
										  reset, clk);

output reg [31:0] instructionOUT, pcValOUT;
output reg [3:0] CPSRFlags_INST_OUT;
output reg writeBackEnable_INST_OUT, noopOUT;

input wire reset, clk, writeBackEnable_In, noopIN;
input wire [3:0] CPSRFlags_In;
input wire [31:0] instructionIN, pcValIN;


 always @(posedge clk)
	if (reset) 
	begin
		instructionOUT <= 0; // On reset, set to 0
		pcValOUT <= 0;
		CPSRFlags_INST_OUT <= 0;
		writeBackEnable_INST_OUT <= 0;
		noopOUT <= 0;
	end
	else
	begin
		instructionOUT <= instructionIN;
		pcValOUT <= pcValIN;
		CPSRFlags_INST_OUT <= CPSRFlags_In;
		writeBackEnable_INST_OUT <= writeBackEnable_In;
		noopOUT <= noopIN;
	end
endmodule