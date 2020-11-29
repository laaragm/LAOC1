module decodificador(entrada, saida);

	input [2:0] entrada;
	output reg [7:0] saida;
	
	always@(entrada, saida)
		case(entrada)
			3'b000: saida[0] = 1;
			3'b001: saida[1] = 1;
			3'b010: saida[2] = 1;
			3'b011: saida[3] = 1;
			3'b100: saida[4] = 1;
			3'b101: saida[5] = 1;
			3'b110: saida[6] = 1;
			3'b111: saida[7] = 1;
		endcase
endmodule
