module Memory(
	output [7:0] data,
	input clock,
	input write_enabled, 
	input [7:0] address,
	input [7:0] write_data
);

	reg [7:0] memory [255:0];
	initial $readmemb ("numbers.txt", memory);
	always @ (posedge clock) begin
		if (write_enabled) 
			memory[address] <= write_data;
	end
	assign data = memory[address];
endmodule