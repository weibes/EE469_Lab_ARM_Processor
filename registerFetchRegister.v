module registerFetchRegister(Data1IN, Data2IN, linkBitIN, prePostAddOffsetIN, upDownOffsetIN,
												byteOrWordIN, writeBackIN, loadStoreIN, rdIN, rmIN, opcodeIN,
												conditionalExecuteIN, CPSRwriteIN, immediateOperandIN,
												
												Data1OUT, Data2OUT, linkBitOUT, prePostAddOffsetOUT, upDownOffsetOUT,
												byteOrWordOUT, writeBackOUT, loadStoreOUT, rdOUT, rmOUT, opcodeOUT,
												conditionalExecuteOUT, CPSRwriteOUT, immediateOperandOUT, 
												
												reset, clk);


										
												
												
	input wire [31:0] Data1IN;
	input wire [31:0] Data2IN;
	input wire linkBitIN, prePostAddOffsetIN, upDownOffsetIN, byteOrWordIN, writeBackIN, loadStoreIN, CPSRwriteIN, immediateOperandIN, reset, clk;
	input wire [3:0] rdIN, rmIN;
	input wire [4:0] opcodeIN;
	input wire  conditionalExecuteIN;

					

   output reg [31:0] Data1OUT;
	output reg [31:0] Data2OUT;
	output reg linkBitOUT, prePostAddOffsetOUT, upDownOffsetOUT, byteOrWordOUT, writeBackOUT, loadStoreOUT, CPSRwriteOUT, immediateOperandOUT;
	output reg [3:0] rdOUT, rmOUT;
	output reg [4:0] opcodeOUT;
	output reg  conditionalExecuteOUT;


													

													
													
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
			CPSRwriteOUT <= 0;
			immediateOperandOUT <= 0;
		 end
		 else begin
			Data1OUT <= Data1IN;
			Data2OUT <= Data2IN;
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
			CPSRwriteOUT <= CPSRwriteIN;
			immediateOperandOUT <= immediateOperandIN;							
		end			
	 end
endmodule
