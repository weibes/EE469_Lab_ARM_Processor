module instructionFetchRegister(instructionIN, pcValIN, instructionOUT, pcValOUT, reset, clk);

output reg [31:0] instructionOUT, pcValOUT;

input wire reset, clk;
input wire [31:0] instructionIN, pcValIN;


 always @(posedge clk)
	if (reset) 
	begin
		instructionOUT <= 0; // On reset, set to 0
		pcValOUT <= 0;
	end
	else
	begin
		instructionOUT <= instructionIN;
		pcValOUT <= pcValIN;
	end
endmodule