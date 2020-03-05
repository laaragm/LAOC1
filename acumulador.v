//Lara Galvani Moura
//Acumulador 
module acumulador(out,clk,in,rst);

	output reg [15:0]out;
	input [15:0]in;
	input clk, rst; //rst é o clear assíncrono
	
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			out = 16'b0;
		else
			out = (out+in);
	end	
endmodule
