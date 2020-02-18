module  ALU(data1, data2, operation, result, flags, AluWritebackTest, reset, clk);

input wire [31:0] data1, data2;
input wire [4:0] operation;
input wire reset,clk;

output reg [31:0] result;  //either logical or signed
output reg [3:0] flags;

reg [31:0] unsignedData1, unsignedData2, unsignedResult;
reg [1:0] negativeData; 
reg Z, C, N, V; //zero carry negative overflow flags
reg AluWritebackTest;



always @* begin

// convert signed input data to unsigned
if (data1[31] == 1) 
	begin
	unsignedData1 = ((~data1) + 1);
	negativeData[1] = 1;
	end
	
else
	begin
	unsignedData1 = data1;
	negativeData[1] = 0;
	end

if (data2[31] == 1) 
	begin
	unsignedData2 = ((~data2) + 1);
	negativeData[0] = 1;
	end
	
else
	begin
	unsignedData2 = data2;
	negativeData[0] = 0;
	end

	


case (operation)
	5'b00000:  	begin
					unsignedResult = (data1 & data2);			// AND (and)
					AluWritebackTest = 1;
					end
					
	5'b00001:	begin
					unsignedResult = (data1 ^ data2);			// EOR (exclusive or) 
					AluWritebackTest = 1;
					end
	
	5'b00010:	begin
					AluWritebackTest = 1;							// SUB (subtract)	
					if ((negativeData == 2'b10)|(negativeData == 2'b01))
						unsignedResult = (unsignedData1 + unsignedData2);
					else if (unsignedData2 > unsignedData1)
						unsignedResult = (unsignedData2 - unsignedData1);
					else unsignedResult = (unsignedData1 - unsignedData2);
					end
						
	5'b00011:	begin
					AluWritebackTest = 1;
					unsignedResult = (unsignedData2 - unsignedData1);	
			
					end                                                      // RSB (reverse subtract)
	
	5'b00100:	begin
					AluWritebackTest = 1;												// ADD (add)
					
					
					if ((negativeData == 2'b10)|(negativeData == 2'b01))
						if (unsignedData1 > unsignedData2)
							unsignedResult = (unsignedData1 - unsignedData2);
						else
							unsignedResult = (unsignedData2 - unsignedData1);
					else
						unsignedResult = (unsignedData1 + unsignedData2);			
					end
					
//	5'b00101:	 		not responsible for this	// ADC (add with carry)
//	5'b00110:			not responsible for this	// SBC (subtract with carry)
//	5'b00111:			not responsible for this	// RSC (reverse subtract with carry)


	5'b01000:	begin
					AluWritebackTest = 0;
					unsignedResult =	(data1 & data2);	
					end
																	// TST (Test bits)	
	5'b01001:	begin
					AluWritebackTest = 0;
					unsignedResult =	(data1 ^ data2);										//	TEQ (Test bitwise equality)
					end
	
	5'b01010:	begin
					AluWritebackTest = 0;
			
					if ((negativeData == 2'b10)|(negativeData == 2'b01))				//	CMP (Compare)
						unsignedResult = (unsignedData1 + unsignedData2);
					else if (unsignedData2 > unsignedData1)
						unsignedResult = (unsignedData2 - unsignedData1);
					else unsignedResult = (unsignedData1 - unsignedData2);
					end
					
	5'b01011:	begin
					AluWritebackTest = 0;														//	CMN (Compare Negative)
					
					if ((negativeData == 2'b10)|(negativeData == 2'b01))
						if (unsignedData1 > unsignedData2)
							unsignedResult = (unsignedData1 - unsignedData2);
						else
							unsignedResult = (unsignedData2 - unsignedData1);
					else
						unsignedResult = (unsignedData1 + unsignedData2);			
					end



	5'b01100:	begin
					AluWritebackTest = 1;
					unsignedResult = (data1 | data2);
					end													// ORR (or)
	
	5'b01101:	begin
					AluWritebackTest = 1;
					unsignedResult = (data2);						// MOV (Move register or constant)
					end
	
	5'b01110:	begin
					AluWritebackTest = 1;
					unsignedResult = (data1 & ~data2);			//	BIC (Bit Clear)
					end
					
	5'b01111:	begin
					AluWritebackTest = 1;
					unsignedResult = (~data2);					// MVN (Move negative register)
					end
	
//	5'b10000:
//	5'b10001:
//	5'b10010:
//	5'b10011:
//	5'b10100:
//	5'b10101:
//	5'b10110:
//	5'b10111:
//	5'b11000:				this is for other operations
//	5'b11001:
//	5'b11010:
//	5'b11011:
//	5'b11100:
//	5'b11101:
//	5'b11110:
//	5'b11111:
	default:
		begin
	unsignedResult = 0;
	AluWritebackTest = 0;
		end
	endcase



	
	
	// FLAGS LOGIC
	
	// zero flag
	if (unsignedResult == 0) Z = 1; else Z = 0;
	
	//negative flag
			//if operation is ADD or CMN
	if ((operation == 5'b00100) | (operation == 5'b01011))
		if ((unsignedData1 > unsignedData2) && (negativeData == 2'b10 ))
			N = 1;
		else if ((unsignedData1 < unsignedData2) && (negativeData == 2'b01 ))
			N = 1;
		else if (negativeData == 2'b11 )
			N = 1;
		else
			N = 0;
	
			//if operation is SUB or RSB or CMP
	else if ((operation == 5'b00010) |  (operation == 5'b00011) | (operation == 5'b01010))
		if ((unsignedData1 > unsignedData2) && (negativeData == 2'b11 ))
			N = 1;
		else if ((unsignedData1 < unsignedData2) && (negativeData == 2'b00 ))
			N = 1;
		else if ((unsignedData1 <= unsignedData2) && (negativeData == 2'b10 ))
			N = 1;
		else
			N = 0;
			
	else N = 0;
	
	
		// convert answer from unsigned to signed
	if (N == 1)
			result = ~(unsignedResult-1);
		else 
			result = unsignedResult;
	
	
	//overflow and carry flags
			//if operation is ADD or CMN
	if ((operation == 5'b00100) | (operation == 5'b01011))
			if(((negativeData == 2'b00) && (result[31] == 1)) | ((negativeData == 2'b11) && (result[31] == 0)))
				begin
				V = 1;
				//C = 1;
				end
			else
				begin
				V = 0;
				//C = 0;
				end
			//if operation is SUB or RSB or CMP
	else if ((operation == 5'b00010) |  (operation == 5'b00011) | (operation == 5'b01010))
			if(((negativeData == 2'b01) && (result[31] == 1)) | ((negativeData == 2'b10) && (result[31] == 0))) 
				begin
				V = 1;
				//C = 0;
				end
			else
				begin
				V = 0;
				//C = 1;
				end
	else
		begin
		V = 0;
		//C = 0;
		end
	
	
/// encode CPSR output
flags[0] = Z;
flags[1] = C;
flags[2] = N;
flags[3] = V;

		
	
end



	
endmodule




//
//
//module ALU_testbench ();
//
//
//reg [3:0] cond;
//reg [31:0] data1, data2;
//reg [4:0] operation;
//reg reset,clk;
//wire [31:0] result;  //either logical or signed
//
//
//ALU dut (.cond(cond), .data1(data1), .data2(data2), .operation(operation), .result(result), .reset(reset), .clk(clk));
//
//  
// // Set up the clock.
// parameter CLOCK_PERIOD=100;
// initial begin
//	clk <= 0;
//	forever #(CLOCK_PERIOD/2) clk <= ~clk;
// end
//
// 
// 
// // Set up the inputs to the design. Each line is a clock cycle.
// initial begin
//													@(posedge clk);
//		reset	<= 1;								@(posedge clk);
//		reset	<= 0;								@(posedge clk);
//													@(posedge clk);
//		operation	<= 5'b00100; 			@(posedge clk); 	// ADD
//		data1 <= 3;								@(posedge clk); /// 3+7 = 10
//		data2 <= 7;								@(posedge clk);   
//													@(posedge clk);	
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);    
//													@(posedge clk);							
//		data1 <= ~(3-1);						@(posedge clk); /// (-3)+7 = 4
//		data2 <= 7;								@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 3;								@(posedge clk); /// 3+(-7) = (-4)
//		data2 <=  ~(7-1);						@(posedge clk); 
//													@(posedge clk);							
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= ~(3-1);						@(posedge clk); /// (-3)+(-7) = (-10)
//		data2 <=  ~(7-1);						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= ~(7-1);						@(posedge clk); /// (-7)+7 = 0
//		data2 <= 7;								@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 7;								@(posedge clk); /// 7+(-7) = 0
//		data2 <=  ~(7-1);						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= ~(7-1);						@(posedge clk); /// -7+(-7) = -14
//		data2 <=  ~(7-1);						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		operation	<= 5'b00010; 			@(posedge clk); 	// SUB
//		data1 <= 3;								@(posedge clk); /// 3-7 = -4
//		data2 <= 7;								@(posedge clk);   
//													@(posedge clk);	
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);    
//													@(posedge clk);							
//		data1 <= ~(3-1);						@(posedge clk); /// (-3)-7 = -10
//		data2 <= 7;								@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 3;								@(posedge clk); /// 3-(-7) = 10
//		data2 <=  ~(7-1);						@(posedge clk); 
//													@(posedge clk);							
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= ~(3-1);						@(posedge clk); /// (-3)-(-7) = 4
//		data2 <=  ~(7-1);						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= ~(7-1);						@(posedge clk); /// (-7)-7 = -14
//		data2 <= 7;								@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 7;								@(posedge clk); /// 7-(-7) = 14
//		data2 <=  ~(7-1);						@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//	operation	<= 5'b00000; 				@(posedge clk); 	// LOGICAL AND
//		data1 <= 56;							@(posedge clk); /// 111000 and 000111 is 0000000
//		data2 <= 7;								@(posedge clk);   
//													@(posedge clk);	
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);    
//													@(posedge clk);							
//		data1 <= 56;							@(posedge clk); /// 111000 and 111000 is 111000
//		data2 <= 56;							@(posedge clk);   
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 15;							@(posedge clk); /// 1111 and 1100 is 1100
//		data2 <= 12;							@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);  
//	operation	<= 5'b00001; 				@(posedge clk); 	// LOGICAL XOR
//		data1 <= 56;							@(posedge clk); /// 111000 XOR 000111 is 111111
//		data2 <= 7;								@(posedge clk);   
//													@(posedge clk);	
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);    
//													@(posedge clk);							
//		data1 <= 56;							@(posedge clk); /// 111000 XOR 111000 is 000000
//		data2 <= 56;							@(posedge clk);   
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 15;							@(posedge clk); /// 1111 XOR 1100 is 0011
//		data2 <= 12;							@(posedge clk);   
//													@(posedge clk);							
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//	operation	<= 5'b01110; 				@(posedge clk); 	// LOGICAL BIC
//		data1 <= 56;							@(posedge clk); /// 111000 BIC 000111 is 111000
//		data2 <= 7;								@(posedge clk);   
//													@(posedge clk);	
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);    
//													@(posedge clk);							
//		data1 <= 56;							@(posedge clk); /// 111000 BIC 111000 is 000000
//		data2 <= 56;							@(posedge clk);   
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//		data1 <= 15;							@(posedge clk); /// 1111 BIC 1100 is 0011
//		data2 <= 12;							@(posedge clk);   
//													@(posedge clk);							
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//													@(posedge clk);
//
//
//							
//		$stop; // End the simulation.
// 
// end
//endmodule 
//
//
