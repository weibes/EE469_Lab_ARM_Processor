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
				if (immediateOperand == 0) 
					immediateOffset///
					
				shiftedData = rm_shiftSDT; // gotta figure this one out
			
			if (immediateOperand == 0) begin // data processing
				case (shiftType)
					//	 shift type select
					2'b00: 	shiftedData = rmData << rm_shift; // logical left
					2'b01:	shiftedData = rmData >> rm_shift; // logical right
					2'b10: 	shiftedData = rmData >>> rm_shift; // arithmetic right
					//2'b11: 	shiftedData = {rmData[rm_shift:0], rmData[15:(15 - rm_shift)]}; //rotate right, still doesn't work
					
					
					2'b11: 	case(rm_shift)
									5'b00000:	shiftedData = rmData;
									5'b00001:	shiftedData = {rmData[0], rmData[31:1]};
									5'b00010:	shiftedData = {rmData[1:0], rmData[31:2]};
									5'b00011:	shiftedData = {rmData[2:0], rmData[31:3]};
									5'b00100:	shiftedData = {rmData[3:0], rmData[31:4]};
									5'b00101:	shiftedData = {rmData[4:0], rmData[31:5]};
									5'b00110:	shiftedData = {rmData[5:0], rmData[31:6]};
									5'b00111:	shiftedData = {rmData[6:0], rmData[31:7]};
									5'b01000:	shiftedData = {rmData[7:0], rmData[31:8]};
									5'b01001:	shiftedData = {rmData[8:0], rmData[31:9]};
									5'b01010:	shiftedData = {rmData[9:0], rmData[31:10]};
									5'b01011:	shiftedData = {rmData[10:0], rmData[31:11]};
									5'b01100:	shiftedData = {rmData[11:0], rmData[31:12]};
									5'b01101:	shiftedData = {rmData[12:0], rmData[31:13]};
									5'b01110:	shiftedData = {rmData[13:0], rmData[31:14]};
									5'b01111:	shiftedData = {rmData[14:0], rmData[31:15]};
									5'b10000:	shiftedData = {rmData[15:0], rmData[31:16]};
									5'b10001:	shiftedData = {rmData[16:0], rmData[31:17]};
									5'b10010:	shiftedData = {rmData[17:0], rmData[31:18]};
									5'b10011:	shiftedData = {rmData[18:0], rmData[31:19]};
									5'b10100:	shiftedData = {rmData[19:0], rmData[31:20]};
									5'b10101:	shiftedData = {rmData[20:0], rmData[31:21]};
									5'b10110:	shiftedData = {rmData[21:0], rmData[31:22]};
									5'b10111:	shiftedData = {rmData[22:0], rmData[31:23]};
									5'b11000:	shiftedData = {rmData[23:0], rmData[31:24]};
									5'b11001:	shiftedData = {rmData[24:0], rmData[31:25]};
									5'b11010:	shiftedData = {rmData[25:0], rmData[31:26]};
									5'b11011:	shiftedData = {rmData[26:0], rmData[31:27]};
									5'b11100:	shiftedData = {rmData[27:0], rmdata[31:28]};
									5'b11101:	shiftedData = {rmData[28:0], rmData[31:29]};
									5'b11111:	shiftedData = {rmData[29:0], rmData[31:30]};
					
									default:		shiftedData = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
												
								endcase
				endcase
			end
						
			else if (immediateOperand == 1)
				shiftedData = immediateVal << rotateVal;
			else 
				shiftedData = rmData;
		
	end			

endmodule
