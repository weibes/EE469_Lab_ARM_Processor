module instructionMemory(clk, nreset, addr, dataOut);
  input wire clk, nreset;
  input wire [31:0] addr;
  output reg[31:0] dataOut;


  reg [7:0] memory[127:0]; //subject to change, currrently only 32 bytes
  reg [31:0] addrReg;



  always @* begin
    addrReg = addr;


	dataOut[7:0] = memory[addrReg];
	dataOut[15:8] = memory[addrReg + 3'b100];
   dataOut[23:16] = memory[addrReg + 4'b1000];
   dataOut[31:24] = memory[addrReg + 4'b1100];

	//PUT MEMORY HERE, PROBABLY DON'T DIRECTLY INTERACT W COMPUTER

    memory[0] = 8'h00;
    memory[1] = 8'h00;
    memory[2] = 8'h00;
    memory[3] = 8'h00;
    memory[4] = 8'h00;
    memory[5] = 8'h00;
    memory[6] = 8'h00;
    memory[7] = 8'h00;
    memory[8] = 8'h00;
    memory[9] = 8'h00;
    memory[10] = 8'h00;
    memory[11] = 8'h00;
    memory[12] = 8'h00;
    memory[13] = 8'h00;
    memory[14] = 8'h00;
    memory[15] = 8'h00;
    memory[16] = 8'h00;
    memory[17] = 8'h00;
    memory[18] = 8'h00;
    memory[19] = 8'h00;
    memory[20] = 8'h00;
    memory[21] = 8'h00;
    memory[22] = 8'h00;
    memory[23] = 8'h00;
    memory[24] = 8'h00;
    memory[25] = 8'h00;
    memory[26] = 8'h00;
    memory[27] = 8'h00;
    memory[28] = 8'h00;
    memory[29] = 8'h00;
    memory[30] = 8'h00;
    memory[31] = 8'h00;
    memory[32] = 8'he2;
    memory[33] = 8'h8d;
    memory[34] = 8'hb0;
    memory[35] = 8'h04;
    memory[36] = 8'he5;
    memory[37] = 8'h9f;
    memory[38] = 8'h00;
    memory[39] = 8'h14;
    memory[40] = 8'h00;
    memory[41] = 8'h00;
    memory[42] = 8'h00;
    memory[43] = 8'h00;
    memory[44] = 8'he3;
    memory[45] = 8'ha0;
    memory[46] = 8'h30;
    memory[47] = 8'h00;
    memory[48] = 8'he1;
    memory[49] = 8'ha0;
    memory[50] = 8'h00;
    memory[51] = 8'h03;
    memory[52] = 8'he2;
    memory[53] = 8'h4b;
    memory[54] = 8'hd0;
    memory[55] = 8'h04;
    memory[56] = 8'hda;
    memory[57] = 8'hff;
    memory[58] = 8'hff;
    memory[59] = 8'hf6;
    memory[60] = 8'he5;
    memory[61] = 8'h0b;
    memory[62] = 8'h30;
    memory[63] = 8'h08;
    memory[64] = 8'hea;
    memory[65] = 8'h00;
    memory[66] = 8'h00;
    memory[67] = 8'h0b;
    memory[68] = 8'h00;
    memory[69] = 8'h00;
    memory[70] = 8'h00;
    memory[71] = 8'h00;
    memory[72] = 8'h00;
    memory[73] = 8'h00;
    memory[74] = 8'h00;
    memory[75] = 8'h00;
    memory[76] = 8'h00;
    memory[77] = 8'h00;
    memory[78] = 8'h00;
    memory[79] = 8'h00;
    memory[80] = 8'h00;
    memory[81] = 8'h00;
    memory[82] = 8'h00;
    memory[83] = 8'h00;
    memory[84] = 8'h00;
    memory[85] = 8'h00;
    memory[86] = 8'h00;
    memory[87] = 8'h00;
    memory[88] = 8'h00;
    memory[89] = 8'h00;
    memory[90] = 8'h00;
    memory[91] = 8'h00;
    memory[92] = 8'h00;
    memory[93] = 8'h00;
    memory[94] = 8'h00;
    memory[95] = 8'h00;
    memory[96] = 8'h00;
    memory[97] = 8'h00;
    memory[98] = 8'h00;
    memory[99] = 8'h00;
    memory[100] = 8'h00;
    memory[101] = 8'h00;
    memory[102] = 8'h00;
    memory[103] = 8'h00;
    memory[104] = 8'h00;
    memory[105] = 8'h00;
    memory[106] = 8'h00;
    memory[107] = 8'h00;
    memory[108] = 8'h00;
    memory[109] = 8'h00;
    memory[110] = 8'h00;
    memory[111] = 8'h00;
    memory[112] = 8'h00;
    memory[113] = 8'h00;
    memory[114] = 8'h00;
    memory[115] = 8'h00;
    memory[116] = 8'h00;
    memory[117] = 8'h00;
    memory[118] = 8'h00;
    memory[119] = 8'h00;
    memory[120] = 8'h00;
    memory[121] = 8'h00;
    memory[122] = 8'h00;
    memory[123] = 8'h00;
    memory[124] = 8'h00;
    memory[125] = 8'h00;
    memory[126] = 8'h00;
    memory[127] = 8'h00;

  end


endmodule
