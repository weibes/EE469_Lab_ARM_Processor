module registerFetchRegister(Data1IN, Data2IN, linkBitIN, prePostAddOffsetIN, upDownOffsetIN,
												byteOrWordIN, writeBackIN, loadStoreIN, rdIN, rmIN, opcodeIN,
												conditionalExecuteIN, immediateOffsetIN,
												CPSRwriteIN, immediateOperandIN,
												rm_shiftSDTIN,
												
												Data1OUT, Data2OUT, linkBitOUT, prePostAddOffsetOUT, upDownOffsetOUT,
												byteOrWordOUT, writeBackOUT, loadStoreOUT, rdOUT, rmOUT, opcodeOUT,
												conditionalExecuteOUT, immediateOffsetOUT,
												CPSRwriteOUT, immediateOperandOUT,
												rm_shiftSDTOUT, 
												
												reset, clk);


										
												
												
	input wire [31:0] Data1IN;
	input wire [31:0] Data2IN;
	input wire linkBitIN, prePostAddOffsetIN, upDownOffsetIN, byteOrWordIN, writeBackIN, loadStoreIN, CPSRwriteIN, immediateOperandIN, reset, clk;
	input wire [3:0] rdIN, rmIN;
	input wire [4:0] opcodeIN;
	input wire [3:0] conditionalExecuteIN;
	input wire [11:0] immediateOffsetIN;
	input wire [7:0] rm_shiftSDTIN;						

   output reg [31:0] Data1OUT;
	output reg [31:0] Data2OUT;
	output reg linkBitOUT, prePostAddOffsetOUT, upDownOffsetOUT, byteOrWordOUT, writeBackOUT, loadStoreOUT, CPSRwriteOUT, immediateOperandOUT;
	output reg [3:0] rdOUT, rmOUT;
	output reg [4:0] opcodeOUT;
	output reg [3:0] conditionalExecuteOUT;
	output reg [11:0] immediateOffsetOUT;
	output reg [7:0] rm_shiftSDTOUT;
													

													
													
	 always @(posedge clk) begin
		 if (reset) begin
			// On reset, set to 0
			Data1OUT <= 0;
			Data2OUT <= 0;
			linkBitOUT <= 0;
			prePostAddOffsetOUT <= 0;
			upDownOffsetOUT <= 0;
			byteOrWordOUT <= 0;
			writeBackOUT <= 0;
			loadStoreOUT <= 0;
			rdOUT <= 0;
			rmOUT <= 0;
			opcodeOUT <= 0;
			conditionalExecuteOUT <= 0;
			immediateOffsetOUT <= 0;
			CPSRwriteOUT <= 0;
			immediateOperandOUT <= 0;
			rm_shiftSDTOUT <= 0;
		 end
		 else begin
			Data1OUT <= Data1IN;
			Data1OUT <= Data1IN;
			linkBitOUT <= linkBitIN;
			prePostAddOffsetOUT <= prePostAddOffsetIN;
			upDownOffsetOUT <= upDownOffsetIN;
			byteOrWordOUT <= byteOrWordIN;
			writeBackOUT <= writeBackIN;
			loadStoreOUT <= loadStoreIN;
			rdOUT <= rdIN;
			rmOUT <= rmIN;
			opcodeOUT <= opcodeIN;
			conditionalExecuteOUT <= conditionalExecuteIN;
			immediateOffsetOUT <= immediateOffsetIN;
			CPSRwriteOUT <= CPSRwriteIN;
			immediateOperandOUT <= immediateOperandIN;
			rm_shiftSDTOUT <= rm_shiftSDTIN;										
		end			
	 end
endmodule
