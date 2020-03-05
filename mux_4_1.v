//Lara Galvani Moura
//MUX 4:1
module mux_4_1 (a, b, c, d, Control, S); 

	input a, b, c, d, Control;
	output reg S;

	always @(Control, a, b, c, d)
	begin
		case(Control)
			2'b00: S <= a;
			2'b01: S <= b;
			2'b10: S <= c;
			2'b11: S <= d;
		endcase
	end

endmodule
