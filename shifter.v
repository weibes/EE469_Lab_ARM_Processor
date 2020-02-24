module shifter(opcode, data12In, branchOffset, rmData, shiftedData, immediateOperand);

	input wire immediateOperand;
	input wire [4:0]  opcode;
	input wire [11:0] data12In;
	input wire [23:0] branchOffset;
	input wire [31:0] rmData;
	
	output reg [31:0] shiftedData;
	
	reg [7:0] rm_shift;
	reg [1:0] shiftType;
	reg [31:0] immediateData;

	always @* begin
			rm_shift = 0;
			shiftType = 0;
			
			if (opcode == 5'b10001) begin //input is branch
				if (branchOffset[23] == 1'b1)
					shiftedData = {6'b100000, (branchOffset[22:0] <<< 2'b10)};
				else 
					shiftedData = {6'b000000, (branchOffset[22:0] <<< 2'b10)};
			end
			
			//data proc && not im offset OR (data transfer AND immediate offset)
			else if ((opcode == 5'b10000 && immediateOperand == 1) || (opcode != 5'b10000 &&  immediateOperand == 0)) begin 
				
				rm_shift = data12In[11:7];
				shiftType = data12In[6:5];
			
				case (shiftType)
						//	 shift type select
						2'b00: 	shiftedData = rmData << rm_shift; // logical left
						2'b01:	shiftedData = rmData >> rm_shift; // logical right
						2'b10: 	shiftedData = rmData >>> rm_shift; // arithmetic right

						
						
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
										5'b11100:	shiftedData = {rmData[27:0], rmData[31:28]};
										5'b11110:	shiftedData = {rmData[29:0], rmData[31:30]};
										5'b11111:	shiftedData = {rmData[30:0], rmData[31]};
						
										default:		shiftedData = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
													
									endcase
					endcase
			end
			else if (immediateOperand == 1) begin //data proc, immoffset
	
				immediateData = {24'b000000000000000000000000, data12In[7:0]};
				rm_shift = {data12In[11:8], 1'b0};
				
				case(rm_shift)
					5'b00000:	shiftedData = immediateData;
					//5'b00001:	shiftedData = {rmData[0], rmData[31:1]};
					5'b00010:	shiftedData = {immediateData[1:0], immediateData[31:2]};
					//5'b00011:	shiftedData = {rmData[2:0], rmData[31:3]};
					5'b00100:	shiftedData = {immediateData[3:0], immediateData[31:4]};
					//5'b00101:	shiftedData = {rmData[4:0], rmData[31:5]};
					5'b00110:	shiftedData = {immediateData[5:0], immediateData[31:6]};
					//5'b00111:	shiftedData = {rmData[6:0], rmData[31:7]};
					5'b01000:	shiftedData = {immediateData[7:0], immediateData[31:8]};
					//5'b01001:	shiftedData = {rmData[8:0], rmData[31:9]};
					5'b01010:	shiftedData = {immediateData[9:0], immediateData[31:10]};
					//5'b01011:	shiftedData = {rmData[10:0], rmData[31:11]};
					5'b01100:	shiftedData = {immediateData[11:0], immediateData[31:12]};
					//5'b01101:	shiftedData = {rmData[12:0], rmData[31:13]};
					5'b01110:	shiftedData = {immediateData[13:0], immediateData[31:14]};
					//5'b01111:	shiftedData = {rmData[14:0], rmData[31:15]};
					5'b10000:	shiftedData = {immediateData[15:0], immediateData[31:16]};
					//5'b10001:	shiftedData = {rmData[16:0], rmData[31:17]};
					5'b10010:	shiftedData = {immediateData[17:0], immediateData[31:18]};
					//5'b10011:	shiftedData = {rmData[18:0], rmData[31:19]};
					5'b10100:	shiftedData = {immediateData[19:0], immediateData[31:20]};
					//5'b10101:	shiftedData = {rmData[20:0], rmData[31:21]};
					5'b10110:	shiftedData = {immediateData[21:0], immediateData[31:22]};
					//5'b10111:	shiftedData = {rmData[22:0], rmData[31:23]};
					5'b11000:	shiftedData = {immediateData[23:0], immediateData[31:24]};
					//5'b11001:	shiftedData = {rmData[24:0], rmData[31:25]};
					5'b11010:	shiftedData = {immediateData[25:0], immediateData[31:26]};
					//5'b11011:	shiftedData = {rmData[26:0], rmData[31:27]};
					5'b11100:	shiftedData = {immediateData[27:0], immediateData[31:28]};
					//5'b11101:	shiftedData = {rmData[28:0], rmData[31:29]};
					5'b11110:	shiftedData = {immediateData[29:0], immediateData[31:30]};
					//5'b11111:	shiftedData = {rmData[30:0], rmData[31]};
						
					default:		shiftedData = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
													
				endcase
				
			end
			
			else begin //something else, who cares
				
				shiftedData = rmData;
			end
				
	end	
endmodule




/*
module shifter_testbench();


	reg immediateOperand, clk, reset;
	reg [4:0]  opcode;
	reg [11:0] data12In;
	reg [23:0] branchOffset;
	reg [31:0] rmData;

	
	wire [31:0] shiftedData;
	

shifter dut (.opcode(opcode), .data12In(data12In), .branchOffset(branchOffset),
					.rmData(rmData), .shiftedData(shiftedData), .immediateOperand(immediateOperand), 
					.clk(clk), .reset(reset));


					 
	

	// Set up the clock.
	 parameter CLOCK_PERIOD=100;
	 initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	 end
	 

	 	 initial begin
														@(posedge clk);
			reset	<= 1;								@(posedge clk);
			reset	<= 0;								@(posedge clk);
			opcode <= 5'b10001;					@(posedge clk);//branch
			branchOffset <= 3;					@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
														@(posedge clk);
		

			$stop; // End the simulation.

	 end
endmodule

*/