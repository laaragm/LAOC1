//Lara Galvani Moura
//Latch D
module latch_d(d, q, enable, reset);

	input d, enable, reset;
	output reg q;

	always @(d or enable or reset)
	begin
		if(reset != 0)
			q <= d;
		else
			if(enable)
				q <= 1'b0;
	end

endmodule
