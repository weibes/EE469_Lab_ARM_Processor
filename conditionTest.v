module conditionTest (cond, CPSRIn, conditionalExecute, reset, clk);

input wire [3:0] cond, CPSRIn;
input wire reset, clk;
reg Z,C,N,V;
output reg conditionalExecute;


always @* begin

Z = CPSRIn[0];
C = CPSRIn[1];
N = CPSRIn[2];
V = CPSRIn[3];


	//condition test
case (cond)	
4'b0000: if (Z == 1)						//EQ	Z set									(equal)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0001: if (Z == 0)						//NE	Z clear 								(not equal)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0010: if (C == 1)						//CS	C set 								(unsigned higher or same)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0011: if (C == 0)						//CC	C clear 								(unsigned lower)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0100: if (N == 1)						//MI	N set 								(negative)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0101:	if (N == 0)						//PL 	N clear 								(positive or zero)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0110: if (V == 1)						//VS 	V set 								(overflow)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b0111: if (V == 0)						//VC 	V clear								(no overflow)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1000: if ((C == 1) && (Z == 0))	//HI 	C set and Z clear					(unsigned higher)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1001: if ((C == 0) | (Z == 1))	//LS 	C clear or Z set 					(unsigned lower or same)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1010: if (N == V)						//GE 	N equals V 							(greater or equal)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1011: if (N != V)						//LT 	N not equal to V 					(less than)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1100: if ((Z == 0) && (N == V))	//GT 	Z clear AND (N equals V)		(greater than)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1101: if ((Z == 1) | (N != V))	//LE 	Z set OR (N not equal to V) 	(less than or equal)
				conditionalExecute = 1; else conditionalExecute = 0;
				
4'b1110: 									//AL 	(ignored) 							(always)
				conditionalExecute = 1;
default: 	conditionalExecute = 1;
endcase
end
endmodule

//
//module conditionTest_testbench ();
//
//reg [3:0] cond;
//reg Z, C, N, V, reset, clk;
//wire conditionalExecute;
//
//conditionTest dut (.cond(cond), .Z(Z), .C(C), .N(N), .V(V), .conditionalExecute(conditionalExecute), .reset(reset), .clk(clk));
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
//		cond	<= 0;								@(posedge clk); 			
//													@(posedge clk);    
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 1;								@(posedge clk);			
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 2;						      @(posedge clk);		
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 3;								@(posedge clk);		
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);
//		cond	<= 4;								@(posedge clk);				
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 5;								@(posedge clk);				
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 6;								@(posedge clk);
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 7;								@(posedge clk);
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);		
//													@(posedge clk);
//		cond	<= 8;								@(posedge clk); 			
//													@(posedge clk);    
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 9;								@(posedge clk);			
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 10;					      @(posedge clk);		
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 11;							@(posedge clk);		
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);
//		cond	<= 12;							@(posedge clk);				
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 13;							@(posedge clk);				
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 14;							@(posedge clk);
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//													@(posedge clk);	
//		cond	<= 15;							@(posedge clk);
//													@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
//		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
//		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);	
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