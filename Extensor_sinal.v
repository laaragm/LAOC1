module Extensor_sinal(
  input clock,
  input [2:0] unextended, // bit mais significativo é o sinal
  output reg [7:0] extended // saída após extensão de sinal
);

always@(posedge clock)
  begin 
    extended <= $signed(unextended);
  end
endmodule

