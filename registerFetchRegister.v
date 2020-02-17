module registerFetchRegister(Data1IN, Data2IN, linkBitIN, prePostAddOffsetIN, upDownOffsetIN,
												byteOrWordIN, writeBackIN, loadStoreIN, rdIN, opcodeIN,
												condIN, immediateOffsetIN,
												branchImmediateIN, CPSRwriteIN, immediateOperandIN,
												rm_shiftSDTIN,
												
												Data1OUT, Data2OUT, linkBitOUT, prePostAddOffsetOUT, upDownOffsetOUT,
												byteOrWordOUT, writeBackOUT, loadStoreOUT, rdOUT, opcodeOUT,
												condOUT, immediateOffsetOUT,
												branchImmediateOUT, CPSRwriteOUT, immediateOperandOUT,
												rm_shiftSDTOUT, 
												
												reset, clk);


	input wire [31:0] Data1IN;
	input wire [31:0] Data2IN;
	input wire linkBitIN;
	input wire prePostAddOffsetIN;
	input wire upDownOffsetIN;
	input wire byteOrWordIN;
	input wire writeBackIN;
	input wire loadStoreIN;
	input wire [3:0] rdIN;
	input wire [4:0] opcodeIN;
	input wire [3:0] condIN;
	input wire immediateOffsetIN;
	input wire branchImmediateIN;
	input wire CPSRwriteIN;
	input wire immediateOperandIN;
	input wire rm_shiftSDTIN;
	input wire reset, clk;							

	output reg [31:0] Data1OUT;
	output reg [31:0] Data2OUT;
	output reg linkBitOUT;
	output reg prePostAddOffsetOUT;
	output reg upDownOffsetOUT;
	output reg byteOrWordOUT;
	output reg writeBackOUT;
	output reg loadStoreOUT;
	output reg [3:0] rdOUT;
	output reg [4:0] opcodeOUT;
	output reg [3:0] condOUT;
	output reg immediateOffsetOUT;
	output reg branchImmediateOUT;
	output reg CPSRwriteOUT;
	output reg immediateOperandOUT;
	output reg rm_shiftSDTOUT;
													

													
													
	 always @(posedge clk)
	 if (reset)
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
		opcodeOUT <= 0;
		condOUT <= 0;
		immediateOffsetOUT <= 0;
		branchImmediateOUT <= 0;
		CPSRwriteOUT <= 0;
		immediateOperandOUT <= 0;
		rm_shiftSDTOUT <= 0;
	 
	 else
		Data1OUT <= Data1IN;
		Data1OUT <= Data1IN;
		linkBitOUT <= linkBitIN;
		prePostAddOffsetOUT <= prePostAddOffsetIN;
		upDownOffsetOUT <= upDownOffsetIN;
		byteOrWordOUT <= byteOrWordIN;
		writeBackOUT <= writeBackIN;
		loadStoreOUT <= loadStoreIN;
		rdOUT <= rdIN;
		opcodeOUT <= opcodeIN;
		condOUT <= condIN;
		immediateOffsetOUT <= immediateOffsetIN;
		branchImmediateOUT <= branchImmediateIN;
		CPSRwriteOUT <= CPSRwriteIN;
		immediateOperandOUT <= immediateOperandIN;
		rm_shiftSDTOUT <= rm_shiftSDTIN;										
												
endmodule
