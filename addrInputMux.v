module addrInputMux(preCheck, ALUInput, d0Input, dataOut);
	input wire preCheck;
	input wire [31:0] ALUInput, d0Input;
	
	output reg [31:0] dataOut;
	
	always @* begin
		if (preCheck) //input addr should be from ALU
			dataOut = ALUInput;
		else //input is directly from D0 port
			dataOut = d0Input;
	end

	
endmodule
