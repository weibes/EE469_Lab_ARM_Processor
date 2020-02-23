module DataMemoryRegister(dataMemOut_DMR, rd_DMR, linkBit, dataMemOut_DMR_OUT,  rd_DMR_OUT, linkBit_DMR_OUT, reset, clk);

input wire linkBit, reset, clk;	
input wire dataMemOut_DMR;
input wire rd_DMR;

output reg dataMemOut_DMR_OUT;
output reg rd_DMR_OUT;
output reg linkBit_DMR_OUT;

	 always @(posedge clk) begin
		 if (reset) begin
			// On reset, set to 0
		dataMemOut_DMR_OUT <= 0;
		rd_DMR_OUT <= 0;
		linkBit_DMR_OUT <= 0;
		
		 end
		 else begin
		dataMemOut_DMR_OUT <= dataMemOut_DMR;
		rd_DMR_OUT <= rd_DMR;
		linkBit_DMR_OUT <= linkBit;
		end			
end
endmodule

