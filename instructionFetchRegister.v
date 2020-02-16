module instructionFetchRegister(instructionIN, instructionOUT, reset, clk);

output reg [31:0] instructionOUT;

input wire reset, clk;
input wire [31:0] instructionIN;


 always @(posedge clk)
 if (reset)
 instructionOUT <= 0; // On reset, set to 0
 
 else
 instructionOUT <= instructionIN; // Otherwise out = d

endmodule