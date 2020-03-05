//Lara Galvani Moura
//Flip Flop D
module ffD(clock, q, d, reset);

	input d, clock, reset;
	output reg q;

	initial begin
		q = 1'b0;
	end

	always @(posedge clock)
	begin
		if(reset==1'b0) 
			q <= d;
		else 
			q <= 1'b0;
	end
endmodule
