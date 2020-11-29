module banco(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);

	input [2:0] Read1, Read2, WriteReg; 
	input [7:0] WriteData; 
	input RegWrite; 
	input clock; 
	output [7:0] Data1,Data2; 
	wire [7:0] saida_decodificador;
	wire [7:0] saida_reg0, saida_reg1, saida_reg2, saida_reg3, saida_reg4, saida_reg5, saida_reg6, saida_reg7; //saída dos registradores

	
	 decodificador dec1(WriteReg, saida_decodificador);
		
	
	registrador reg0(WriteData, clock, saida_decodificador[0] & RegWrite, saida_reg0);
	registrador reg1(WriteData, clock, saida_decodificador[1] & RegWrite, saida_reg1);
	registrador reg2(WriteData, clock, saida_decodificador[2] & RegWrite, saida_reg2);
	registrador reg3(WriteData, clock, saida_decodificador[3] & RegWrite, saida_reg3);
	registrador reg4(WriteData, clock, saida_decodificador[4] & RegWrite, saida_reg4);
	registrador reg5(WriteData, clock, saida_decodificador[5] & RegWrite, saida_reg5);
	registrador reg6(WriteData, clock, saida_decodificador[6] & RegWrite, saida_reg6);
	registrador reg7(WriteData, clock, saida_decodificador[7] & RegWrite, saida_reg7);
			
	multiplexador mux1(saida_reg0,saida_reg1,saida_reg2,saida_reg3,saida_reg4,saida_reg5,saida_reg6,saida_reg7,Read1,Data1);
	multiplexador mux2(saida_reg0,saida_reg1,saida_reg2,saida_reg3,saida_reg4,saida_reg5,saida_reg6,saida_reg7,Read2,Data2); 

endmodule
