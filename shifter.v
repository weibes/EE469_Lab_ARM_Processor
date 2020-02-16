module shifter(rm, opcode, rotateVal, rm_shift, immediateVal, immediateOffset,
												 immediateOperand, rm_shiftSDT, .shiftType);

input wire [1:0] shiftType;

opcode
rotateVal
rm_shift
immediateVal
immediateOffset
shiftType
immediateOperand
rm_shiftSDT





always @* begin
		
		case (shiftType) // shift type
			//	 shift type select
			2'b00: ;// logical left
			2'b01: ;// logical right
			2'b10: ;// arithmetic right
			2'b11: ;// rotate right			
					endcase
end			
endmodule
