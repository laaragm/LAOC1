module multiplexador(entrada0, entrada1, entrada2, entrada3, entrada4, entrada5, entrada6, entrada7, controle, saida);
	
	input [7:0] entrada0,entrada1,entrada2,entrada3,entrada4,entrada5,entrada6,entrada7;
	input [2:0] controle;
	output reg [7:0] saida;
	
	always@(entrada0,entrada1,entrada2,entrada3,entrada4,entrada5,entrada6,entrada7,controle,saida)
		case(controle)
			3'b000: saida = entrada0;
			3'b001: saida = entrada1;
			3'b010: saida = entrada2;
			3'b011: saida = entrada3;
			3'b100: saida = entrada4;
			3'b101: saida = entrada5;
			3'b110: saida = entrada6;
			3'b111: saida = entrada7;
		endcase
endmodule
