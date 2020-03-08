module noopMux(opcodeIN, opcodeOUT, noop);

input wire [4:0] opcodeIN;
input wire noop;

output reg [4:0] opcodeOUT;



always @* begin

if (noop)
	opcodeOUT = 5'b11111;
	
	else
   
	opcodeOUT = opcodeIN;
	
	end

endmodule


