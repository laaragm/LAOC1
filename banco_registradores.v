module banco_registradores (Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, clock);	
	
	input clock;

	//Registradores relacionados a escrita 
	input RegWrite; //1 significa que o registrador está habilitado para escrita e 0 o contrário
	input [2:0] WriteReg; //índice do registrador no qual iremos escrever  
	input [15:0] WriteData;	//dados que queremos escrever
	reg [15:0] register_file[7:0]; //vetor com 8 registradores, cada um deles tem 16 bits

	//Registradores relacionados a leitura e armazenamento de dados
	input [2:0] Read1, Read2; //data stored in Read1 will be in Data1; data stored in Read2 will be in Data2
	output reg[15:0] Data1, Data2; //output data from Read1 and Read2
	
	always@(posedge clock) begin
		if(RegWrite) //se estiver habilitado para escrita
			//O registrador register_file na posição WriteReg (que funciona como um índice do registrador onde queremos
			//escrever) vai receber WriteData (que é o conteúdo que queremos escrever)
			//register_file[WriteReg] vai funcionar como um decodificador 
			register_file[WriteReg] <= WriteData; 
			
		//Save data stored at Read1 into Data1
		Data1 <= Read1;
		
		//Save data stored at Read2 into Data2
		Data2 <= Read2;
	end
	
endmodule
