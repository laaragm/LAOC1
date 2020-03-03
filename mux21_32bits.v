module mux21_32bits(A, B, ctrl, S);

input [31:0] A, B; //entradas possíveis, cada uma tem 32 bits
input ctrl; //controle do mux 
output S;

//an expression using conditional operator evaluates the logical expression before the '?'
//if the expression is true then the expression before the colon (:) is evaluated and assigned to the output
//if the logical expression is false then the expression after the colon is evaluated and assigned to the output

assign S = (ctrl) ? B:A;

endmodule
