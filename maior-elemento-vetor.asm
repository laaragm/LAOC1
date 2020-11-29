	# Declara main como uma fun��o global
	.globl Main
	.text

Main:                  # Label para marcar ponto de in�cio
  la $s0, vetor        # carrega endere�o vetor
  li $s2, 20           # carrega quantidade de elementos
  lw $s3, 0($s0)       # inicializa o vetor na posi��o 0 
  li $s1, 0            # inicializa o registrador s1 em 0
  j VerifyCondition    # Pula para VerifyCondition
  
VerifyCondition:
  add $s1, $s1, 1      # incrementa o �ndice em 1
  beq $s1, $s2, Print  # salta para Print se j� tivermos percorrido todos os elementos
  bne $s1, $s2, Loop   # salta para Loop se n�o tivermos percorrido todos os elementos
  
Loop:
  add $t2, $s1, $s1    # t2 = s1 + s1; multiplica o �ndice por 2 para percorrermos, posteriormente, os bytes
  add $t2, $t2, $t2    # multiplica o �ndice novamente para que possamos avan�ar os bytes e ir pra pr�xima posi��o do vetor
  add $t2, $t2, $s0    # passa o endere�o pra do pr�ximo �ndice pro vetor
  lw $t3, 0($t2)       # carrega o valor do vetor na posi��o atual (vetor[i]) no registrador t3
  slt $t4, $s3, $t3    # t4 = s3 < t3 ? 1 : 0
  beq $t4, $zero, VerifyCondition # Salta para Loop se t4 for igual a 0
  addi $s3, $t3, 0     # s3 recebe o novo valor m�ximo(vetor[i]) se t4 for igual a 1
  j VerifyCondition    # pula para Loop 

Print:
  add $a0, $zero, $s3  # s3 est� armazenando o valor do m�ximo, logo passamos esse valor pra a0 para exib�-lo
  li $v0, 1            # Carrega 1 em v0 para executar chamada de sistema para printar na tela o valor m�ximo
  syscall              # Executa chamada de sistema
  j Exit               # Pula para Exit
  
Exit:
  li $v0, 10           #Carrega 10 em v0 para executar chamada de sistema para "exit"
  syscall              #Executa chamada de sistema. Fun��o (exit) depende do valor em v0
        
	.data
vetor: .word 23,22,9,7,1,4,3,5,2,88,77,13,14,15,16,20,28,52,19,17 #elementos do vetor
