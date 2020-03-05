module instructionMemory(clk, nreset, addr, dataOut);
  input wire clk, nreset;
  input wire [31:0] addr;
  output reg[31:0] dataOut;


  reg [7:0] memory[63:0]; //subject to change, currrently only 32 bytes
  reg [31:0] addrReg;



  always @* begin
    addrReg = addr;


	dataOut[7:0] = memory[addrReg + 2'b11];
	dataOut[15:8] = memory[addrReg + 2'b10];
   dataOut[23:16] = memory[addrReg + 2'b01];
   dataOut[31:24] = memory[addrReg + 2'b00];

	//PUT MEMORY HERE, PROBABLY DON'T DIRECTLY INTERACT W COMPUTER

   
    memory[0] = 8'h00;
    memory[1] = 8'h00;
    memory[2] = 8'h00;
    memory[3] = 8'h00;
    memory[4] = 8'he3;
    memory[5] = 8'ha0;
    memory[6] = 8'h00;
    memory[7] = 8'h08; //mov r0, #8
    memory[8] = 8'he3;
    memory[9] = 8'ha0;
    memory[10] = 8'h10;
    memory[11] = 8'h10;	// mov r1, #16
    memory[12] = 8'he5;
    memory[13] = 8'h81;
    memory[14] = 8'h00;
    memory[15] = 8'h00;	//str r0, [r1]
    memory[16] = 8'he5;
    memory[17] = 8'h91;
    memory[18] = 8'h20;
    memory[19] = 8'h00;	//ldr	r2, [r1]
    memory[20] = 8'he0;
    memory[21] = 8'h82;
    memory[22] = 8'h20;
    memory[23] = 8'h00; //add	r2, r2, r0
    memory[24] = 8'he1;
    memory[25] = 8'h52;
    memory[26] = 8'h00;
    memory[27] = 8'h01; //cmp 	r2, r1
    memory[28] = 8'hda;
    memory[29] = 8'hff;
    memory[30] = 8'hff;
    memory[31] = 8'hfe; //ble 	0 <.next>
    memory[32] = 8'he3;
    memory[33] = 8'ha0;
    memory[34] = 8'h00;
    memory[35] = 8'h00;	//mov 	r0, #0
    memory[36] = 8'he0;
    memory[37] = 8'ha0;
    memory[38] = 8'h10;
    memory[39] = 8'h00;	//mov	r1, #0
    memory[40] = 8'he3;
    memory[41] = 8'ha0;
    memory[42] = 8'h20;
    memory[43] = 8'h00;	//mov	r2, #0
    memory[44] = 8'hea;
    memory[45] = 8'hff;
    memory[46] = 8'hff;
    memory[47] = 8'hfe;	//b	0 <.next>
    memory[48] = 8'h00;
    memory[49] = 8'h00;
    memory[50] = 8'h00;
    memory[51] = 8'h2c;	// <next>:
    memory[52] = 8'he3;
    memory[53] = 8'ha0;
    memory[54] = 8'h10;
    memory[55] = 8'h00;	// mov	r1, #0
    memory[56] = 8'he3;
    memory[57] = 8'ha0;
    memory[58] = 8'h20;
    memory[59] = 8'h01;	// add	r1, r1, r2
    memory[60] = 8'h63;
    memory[61] = 8'ha0;
    memory[62] = 8'h10;
    memory[63] = 8'h00;	// movvs r1, #0
   

  end


endmodule
