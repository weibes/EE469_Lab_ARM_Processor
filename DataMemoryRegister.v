module DataMemoryRegister(dataMemOut_DMR, rd_DMR, linkBit,writebackEnable, 
								  CPSRStatus_In, writeData_DMR, opcode, data2In,
								  dataMemOut_DMR_OUT,  rd_DMR_OUT, linkBit_DMR_OUT, 
								  writebackEnable_DMR_OUT, CPSRStatus_DMR_OUT,
								  writeData_DMR_OUT, opcode_DMR_OUT, data2_DMR_OUT,
								  reset, clk);

input wire linkBit, writebackEnable, reset, clk;	
input wire [31:0] dataMemOut_DMR, writeData_DMR, data2In;
input wire [3:0] rd_DMR, CPSRStatus_In;
input wire [4:0] opcode;


output reg [31:0] dataMemOut_DMR_OUT, writeData_DMR_OUT, data2_DMR_OUT;
output reg [3:0] rd_DMR_OUT, CPSRStatus_DMR_OUT;
output reg linkBit_DMR_OUT, writebackEnable_DMR_OUT;
output reg [4:0] opcode_DMR_OUT;

	 always @(posedge clk) begin
		 if (reset) begin
			// On reset, set to 0
		dataMemOut_DMR_OUT <= 0;
		rd_DMR_OUT <= 0;
		linkBit_DMR_OUT <= 0;
		writebackEnable_DMR_OUT <= 0;
		CPSRStatus_DMR_OUT <= 0;
		writeData_DMR_OUT <= 0;
		opcode_DMR_OUT <= 0;
		data2_DMR_OUT <= 0;
		
		 end
		 else begin
		dataMemOut_DMR_OUT <= dataMemOut_DMR;
		rd_DMR_OUT <= rd_DMR;
		linkBit_DMR_OUT <= linkBit;
		writebackEnable_DMR_OUT <= writebackEnable;
		CPSRStatus_DMR_OUT <= CPSRStatus_In;
		writeData_DMR_OUT <= writeData_DMR;
		opcode_DMR_OUT <= opcode;
		data2_DMR_OUT <= data2In;
		end			
end
endmodule

