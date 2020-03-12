module banco_registradores (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);	
	
	//Data stored in Read1 will be in Data1; Data stored in Read2 will be in Data2
	input [2:0] Read1, Read2; //register numbers to read - temos o registrador 1 e o registrador 2
	
	input [2:0] WriteReg; //index of the register you want to write it to

	//Data you want to write
	input [15:0] WriteData;	

	//RegWrite - write enabled signal (1 or 0)
	input	RegWrite, clock;	

	//Output data from Read1 and Read2
	output reg[15:0] Data1, Data2; 	
	
	//The register file will need three 3-bit addresses to select these registers from the eight possible (2^3=8)
	//Vetor com 8 registradores, cada um deles tem 16 bits
	reg [15:0] register_file[7:0]; 
	
	always@(posedge clock) begin
		if(RegWrite) //se estiver habilitado para escrita
			//O registrador register_file na posição WriteReg (que funciona como um índice do registrador onde queremos
			//escrever) vai receber WriteData (que é o conteúdo que queremos escrever)
			register_file[WriteReg] <= WriteData; 
			
		//Save data stored at Read1 into Data1
		Data1 <= Read1;
		
		//Save data stored at Read2 into Data2
		Data2 <= Read2;
	end
	
endmodule
