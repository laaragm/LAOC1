module ULA(control, A, B, out, zero);
    input [2:0] control;
    input [7:0] A,B;
    output reg [7:0] out;
    output zero; 

    assign zero = (out == 0);
    always@(control, A, B) begin
        case(control)
            0: out <= A & B; //and
            1: out <= A | B; //or
            2: out <= A + B; //add
            3: out <= A - B; //sub
            5: out <= A < B ? 1 : 0; //slt
            6: out <= -(A | B); //nor
            default: out <= 0;
        endcase
    end
endmodule

