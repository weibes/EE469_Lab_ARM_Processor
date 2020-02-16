module shifter(rmData, opcode, rotateVal, rm_shift, immediateVal, immediateOffset,
												 immediateOperand, rm_shiftSDT, shiftType, shiftedData);

input wire immediateOperand;
input wire [1:0] shiftType;
input wire [3:0] rotateVal;
input wire [4:0] opcode, rm_shift;
input wire [7:0] rm_shiftSDT, immediateVal;
input wire [11:0] immediateOffset;
input wire [31:0] rmData;

output reg [31:0] shiftedData;


always @* begin
		
		if (opcode == 5'b10000) // load / store
		
			shiftedData = rm_shiftSDT// gotta figure this one out
		
		if (immediateOperand = 0)  // data processing
			case (shiftType)
			//	 shift type select
			2'b00: ; shiftedData = rmData << rm_shift;// logical left
			2'b01: ;	shiftedData = rmData >> rm_shift;// logical right
			2'b10: ; shiftedData = rmData >>> rm_shift// arithmetic right
			2'b11: ; shiftedData = rmData >>> rm_shift;// rotate right	(also incorrect)		
			endcase
					
		else if (immediateOperand = 1)
			shiftedData = immediateVal << rotateVal;
			
		else shiftedData = rmData;
	
end			
		
endmodule
