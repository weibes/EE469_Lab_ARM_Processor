module WriteDataMux(dMemIn, ALUIn, isDataAccess, regWriteDataOut);

	input wire [31:0] dMemIn, ALUIn;
	input wire isDataAccess;
	
	output reg [31:0] regWriteDataOut;
	
	always @* begin
		if (isDataAccess)
			regWriteDataOut = dMemIn;
		else
			regWriteDataOut = ALUIn;
	
	end


endmodule

