module executeRegister (Data1_EX, Data2_EX, linkBit_EX, prePostAddOffset_EX,
								upDownOffset_EX, byteOrWord_EX, writeBack_EX, loadStore_EX,
								rd_EX, rm_EX, opcode_EX, writebackEnable_EX,
								writeData_EX, addrFinalWire_EX, ALUResult_EX,
								
								Data1_EX_OUT, Data2_EX_OUT, linkBit_EX_OUT, prePostAddOffset_EX_OUT,
								upDownOffset_EX_OUT, byteOrWord_EX_OUT, writeBack_EX_OUT, loadStore_EX_OUT,
								rd_EX_OUT, rm_EX_OUT, opcode_EX_OUT, writebackEnable_EX_OUT,
								writeData_EX_OUT, addrFinalWire_EX_OUT, ALUResult_EX_OUT,
								reset, clk);
								

	input wire [31:0] Data1_EX;
	input wire [31:0] Data2_EX;
	input wire linkBit_EX, prePostAddOffset_EX, upDownOffset_EX, byteOrWord_EX, writeBack_EX, loadStore_EX, writebackEnable_EX, reset, clk;
	input wire [3:0] rd_EX;
	input wire [3:0] rm_EX;
	input wire [4:0]opcode_EX;
	input wire [31:0] writeData_EX;
	input wire [31:0] addrFinalWire_EX;
	input wire [31:0] ALUResult_EX;
	

	output reg [31:0] Data1_EX_OUT;
	output reg [31:0] Data2_EX_OUT;
	output reg linkBit_EX_OUT, prePostAddOffset_EX_OUT, upDownOffset_EX_OUT, byteOrWord_EX_OUT, writeBack_EX_OUT, loadStore_EX_OUT, writebackEnable_EX_OUT;
	output reg [3:0] rd_EX_OUT;
	output reg [3:0] rm_EX_OUT;
	output reg [4:0]opcode_EX_OUT;
	output reg [31:0] writeData_EX_OUT;
	output reg [31:0] addrFinalWire_EX_OUT;
	output reg [31:0] ALUResult_EX_OUT;


		
	 always @(posedge clk) begin
		 if (reset) begin
			// On reset, set to 0
			
	Data1_EX_OUT <= 0;
	Data2_EX_OUT <= 0;
	linkBit_EX_OUT <= 0;
	prePostAddOffset_EX_OUT <= 0;
	upDownOffset_EX_OUT <= 0;
	byteOrWord_EX_OUT <= 0;
	writeBack_EX_OUT <= 0;
	loadStore_EX_OUT <= 0;
	writebackEnable_EX_OUT <= 0;
	rd_EX_OUT <= 0;
	rm_EX_OUT <= 0;
	opcode_EX_OUT <= 0;
	writeData_EX_OUT <= 0;
	addrFinalWire_EX_OUT <= 0;
	ALUResult_EX_OUT <= 0;
	
		 end
		 else begin
	Data1_EX_OUT <= Data1_EX;
	Data2_EX_OUT <= Data2_EX;
	linkBit_EX_OUT <= linkBit_EX;
	prePostAddOffset_EX_OUT <= prePostAddOffset_EX;
	upDownOffset_EX_OUT <= upDownOffset_EX;
	byteOrWord_EX_OUT <= byteOrWord_EX;
	writeBack_EX_OUT <= writeBack_EX;
	loadStore_EX_OUT <= loadStore_EX;
	writebackEnable_EX_OUT <= writebackEnable_EX;
	rd_EX_OUT <= rd_EX;
	rm_EX_OUT <= rm_EX;
	opcode_EX_OUT <= opcode_EX;
	writeData_EX_OUT <= writeData_EX;	
	addrFinalWire_EX_OUT <= addrFinalWire_EX;
	ALUResult_EX_OUT <= ALUResult_EX;
	
		end			
	 end
endmodule
