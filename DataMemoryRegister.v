module DataMemoryRegister(dataMemOut_DMR, rd_DMR, linkBit,writebackEnable, dataMemOut_DMR_OUT,  rd_DMR_OUT, linkBit_DMR_OUT, writebackEnable_DMR_OUT, reset, clk);

input wire linkBit, writebackEnable, reset, clk;	
input wire [31:0] dataMemOut_DMR;
input wire [3:0] rd_DMR


output reg [31:0] dataMemOut_DMR_OUT;
output reg [3:0] rd_DMR_OUT;
output reg linkBit_DMR_OUT, writebackEnable_DMR_OUT;

	 always @(posedge clk) begin
		 if (reset) begin
			// On reset, set to 0
		dataMemOut_DMR_OUT <= 0;
		rd_DMR_OUT <= 0;
		linkBit_DMR_OUT <= 0;
		writebackEnable_DMR_OUT <= 0;
		
		 end
		 else begin
		dataMemOut_DMR_OUT <= dataMemOut_DMR;
		rd_DMR_OUT <= rd_DMR;
		linkBit_DMR_OUT <= linkBit;
		writebackEnable_DMR_OUT <= writebackEnable;
		end			
end
endmodule

