module flagRegister (flags, CPSRwrite, CPSRstatus, reset, clk);

input wire reset, clk, CPSRwrite;
input wire [3:0] flags;

output reg [3:0] CPSRstatus;

always @* begin
	
	CPSRstatus = flags;
	
end
 
endmodule







