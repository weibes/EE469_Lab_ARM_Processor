module flagRegister (flags, CPSRwrite, CPSRstatus, reset, clk);

input wire reset, clk;
input wire [3:0] flags;
input wire CPSRwrite;
output reg [3:0] CPSRstatus;

wire [3:0] registerqwire;
reg [3:0] CPSRhold;


always @* begin

	CPSRstatus = registerqwire;
	
	if (CPSRwrite == 1)
		CPSRhold = flags;
	else
		CPSRhold = CPSRstatus;
	
end

	D_FF flag03 (.q(registerqwire[3]), .d( CPSRhold[3]), .reset(reset), .clk(clk));
	D_FF flag02 (.q(registerqwire[2]), .d( CPSRhold[2]), .reset(reset), .clk(clk));
	D_FF flag01 (.q(registerqwire[1]), .d( CPSRhold[1]), .reset(reset), .clk(clk));
	D_FF flag00 (.q(registerqwire[0]), .d( CPSRhold[0]), .reset(reset), .clk(clk));
 
endmodule







