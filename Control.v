module Control(opcode, EscreveReg, OrigALU, OrigPC, LeMem, EscreveMem, MemParaReg);
    input [1:0] opcode;
    output reg EscreveReg;
    output reg OrigALU;
    output reg OrigPC;
    output reg LeMem;
    output reg EscreveMem;
    output reg MemParaReg;
                
    always@(*) begin
        if (opcode == 2'b00) begin //add instruction
            EscreveReg = 1'b1;
            OrigALU    = 1'b0;
            OrigPC	   = 1'b0;
            LeMem	   = 1'b0;
            EscreveMem = 1'b0;
            MemParaReg = 1'b1;
        end
        if (opcode == 2'b01) begin //slt instruction
            EscreveReg = 1'b1;
            OrigALU    = 1'b0;
            OrigPC	   = 1'b0;
            LeMem	   = 1'b0;
            EscreveMem = 1'b0;
            MemParaReg = 1'b1;
        end
        if (opcode == 2'b10) begin //beq instruction
            EscreveReg = 1'b0;
            OrigALU    = 1'b0;
            OrigPC	   = 1'b1;
            LeMem	   = 1'b0;
            EscreveMem = 1'b0;
            MemParaReg = 1'b0;
        end
        if (opcode == 2'b10) begin //lsw instruction
            EscreveReg = 1'b1;
            OrigALU    = 1'b0;
            OrigPC	   = 1'b0;
            LeMem	   = 1'b1;
            EscreveMem = 1'b1;
            MemParaReg = 1'b0;
        end
    end
endmodule