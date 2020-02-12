module conditionTest (cond, Z, C, N, V, execute, reset, clk);

input wire [3:0] cond;
input wire Z, C, N, V, reset, clk;
output reg execute;


always @* begin
	//condition test
case (cond)	
4'b0000: if (Z == 1)						//EQ	Z set									(equal)
				execute = 1; else execute = 0;
				
4'b0001: if (Z == 0)						//NE	Z clear 								(not equal)
				execute = 1; else execute = 0;
				
4'b0010: if (C == 1)						//CS	C set 								(unsigned higher or same)
				execute = 1; else execute = 0;
				
4'b0011: if (C == 0)						//CC	C clear 								(unsigned lower)
				execute = 1; else execute = 0;
				
4'b0100: if (N == 1)						//MI	N set 								(negative)
				execute = 1; else execute = 0;
				
4'b0101:	if (N == 0)						//PL 	N clear 								(positive or zero)
				execute = 1; else execute = 0;
				
4'b0110: if (V == 1)						//VS 	V set 								(overflow)
				execute = 1; else execute = 0;
				
4'b0111: if (V == 0)						//VC 	V clear								(no overflow)
				execute = 1; else execute = 0;
				
4'b1000: if ((C == 1) && (Z == 0))	//HI 	C set and Z clear					(unsigned higher)
				execute = 1; else execute = 0;
				
4'b1001: if ((C == 0) | (Z == 1))	//LS 	C clear or Z set 					(unsigned lower or same)
				execute = 1; else execute = 0;
				
4'b1010: if (N == V)						//GE 	N equals V 							(greater or equal)
				execute = 1; else execute = 0;
				
4'b1011: if (N != V)						//LT 	N not equal to V 					(less than)
				execute = 1; else execute = 0;
				
4'b1100: if ((Z == 0) && (N == V))	//GT 	Z clear AND (N equals V)		(greater than)
				execute = 1; else execute = 0;
				
4'b1101: if ((Z == 1) | (N != V))	//LE 	Z set OR (N not equal to V) 	(less than or equal)
				execute = 1; else execute = 0;
				
4'b1110: 									//AL 	(ignored) 							(always)
				execute = 1;
default: 	execute = 1;
endcase
end
endmodule


module conditionTest_testbench ();

reg [3:0] cond;
reg Z, C, N, V, reset, clk;
wire execute;

conditionTest dut (.cond(cond), .Z(Z), .C(C), .N(N), .V(V), .execute(execute), .reset(reset), .clk(clk));

  
 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 
 
 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
													@(posedge clk);
		reset	<= 1;								@(posedge clk);
		reset	<= 0;								@(posedge clk);
													@(posedge clk);
		cond	<= 0;								@(posedge clk); 			
													@(posedge clk);    
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 1;								@(posedge clk);			
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 2;						      @(posedge clk);		
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 3;								@(posedge clk);		
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);
		cond	<= 4;								@(posedge clk);				
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 5;								@(posedge clk);				
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 6;								@(posedge clk);
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 7;								@(posedge clk);
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);		
													@(posedge clk);
		cond	<= 8;								@(posedge clk); 			
													@(posedge clk);    
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 9;								@(posedge clk);			
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 10;					      @(posedge clk);		
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 11;							@(posedge clk);		
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);
		cond	<= 12;							@(posedge clk);				
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 13;							@(posedge clk);				
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 14;							@(posedge clk);
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
													@(posedge clk);	
		cond	<= 15;							@(posedge clk);
													@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 0; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 0; N <= 1; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 0; V <= 1;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 0;					@(posedge clk);
		Z <= 1; C <= 1; N <= 1; V <= 1;					@(posedge clk);
		Z <= 0; C <= 0; N <= 0; V <= 0;					@(posedge clk);	
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
													@(posedge clk);
							
			

		$stop; // End the simulation.
 
 end
endmodule 