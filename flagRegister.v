module flagRegister (flags, CPSRstatus, reset, clk);

input wire reset, clk;
input wire [3:0] flags;
output reg [3:0] CPSRstatus;

always @* begin
	
	CPSRstatus = flags;
	
end
 
endmodule







