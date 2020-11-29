# Lara Galvani Moura -  11/10/2020 - LAOC 1

	# Declara main como uma função global
	.globl Main
	.text

# Instruções suportadas pelo nRISC: 
# opcode (2 bits) | rsd (3 bits) | rt (3 bits) - instruções no formato R (aritméticas)
# opcode (2 bits) | rsd (3 bits) | rt (3 bits) - instruções no formato I (transferência)
# opcode (2 bits) | rsd (2 bits) | rt (2 bits) | offset (2 bits) - instruções no formato J (desvio condicional)

# Register number | Conventional name | Usage
#              $0 | $zero             | Always 0
#         $1 - $2 | $t0 - $t1         | Temporary data, not preserved by subprograms
#         $3 - $5 | $s0 - $s2         | Saved registers, preserved by subprograms
# 	       $6 | $v0               | Return values from functions
#              $7 | $a0               | Arguments to functions - not preserved by subprograms

Main:                               # Label para marcar ponto de início
  add $s0, vetor                    # carrega endereço vetor em s0 - 00 011 XXX (XXX pois depende do endereço do vetor em memória) 
  lsw $s2, 0($s0)                   # inicializa o vetor na posição 0 - 11 101 011
  add $s1, $zero                    # inicializa o registrador s1 em 0 - 00 100 000
  beq $zero, $zero, VerifyCondition # Pula para VerifyCondition - 10 00 00 01 
  
VerifyCondition:
  add $t0, $a0          # copia o valor do registrador a0 (que é 7) para t0 - 00 001 111
  add $t1, $t0          # carrega quantidade de elementos - 00 010 001 
  
  add $t0, $t0          # copia o valor do registrador t0 (que é 1) para t0 - 00 001 001
  add $s1, $t0          # incrementa o índice em 1 - 00 100 001
  
  slt $t1, $s1          # $t1 = $t1 < $s1 ? 1 : 0 (verifica se os elementos ainda não foram todos percorridos) - 01 010 100 
  add $t0, $t0          # copia o valor do registrador t0 (que é 1) para t0 - 00 001 001
  beq $t0, $t1, Loop    # se t1 for 1 é porque os elementos ainda não foram todos percorridos e aí pula pra Loop - 10 01 10 10
  beq $zero, $t1, Print # se t1 for igual a 0 é porque já percorremos todos os elementos e aí pularemos para Print - 10 00 10 01
  
Print:
  add $a0, $s2           # s2 está armazenando o valor do mínimo, logo passamos esse valor pra a0 para exibí-lo - 00 111 101
  add $v0, $t0           # Carrega 1 em v0 para executar chamada de sistema para printar na tela o valor mínimo - 00 110 001
  syscall                # Executa chamada de sistema - 00001100
  beq $zero, $zero, Exit # Pula para Exit - 10 00 00 01
  
Exit:
  add $v0, $a0         # adiciona o valor do registrador a0 (que é 7) para v0 - 00 110 111
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  syscall              # Executa chamada de sistema. Função (exit) depende do valor em v0 (nesse caso é 10) - 00001100
  
Loop:
  add $t0, $s1         		     # t0 = t0 + s1 - 00 001 100
  add $t0, $s1         		     # t0 = t0 + s1 (multiplica o índice por 2 para percorrermos os bytes) - 00 001 100
  add $t1, $t0         		     # t2 = t2 + t0; para percorrermos os bytes - 00 010 001
  add $t1, $t1         		     # t1 = t1 + t1; para que possamos ir pra próxima posição do vetor - 00 010 010
  add $t1, $s0                       # passa o endereço do próximo índice pro vetor pra t1 - 00 010 011 
  lsw $t0, 0($t1)                    # carrega o valor do vetor na posição atual (vetor[i]) no registrador t0 - 11 001 010
  add $t1, $t0                       # faz uma cópia do valor de t0 para t1 - 00 010 001
  slt $t1, $s2                       # t1 = t1 < s2 ? 1 : 0; verifica se o elemento atual é menor que o menor - 01 001 101
  beq $t1, $zero, VerifyCondition2   # Salta para VerifyCondition2 se t1 for igual a 0 - 10 10 00 11
  add $s2, $t0     	             # s2 recebe o novo valor mínimo(vetor[i]) se t1 for igual a 1 - 00 101 001
  beq $zero, $zero, VerifyCondition2 # pula para VerifyCondition2 - 10 00 00 01
  
VerifyCondition2:
  add $t0, $a0           # copia o valor do registrador a0 (que é 7) para t0 - 00 001 111
  add $t1, $t0           # carrega quantidade de elementos - 00 010 001 
  
  add $t0, $t0           # copia o valor do registrador t0 (que é 1) para t0 - 00 001 001
  add $s1, $t0           # incrementa o índice em 1 - 00 100 001

  slt $t1, $s1           # $t1 = $t1 < $s1 ? 1 : 0 (verifica se os elementos ainda não foram todos percorridos) - 01 010 100 
  add $t0, $t0           # copia o valor do registrador t0 (que é 1) para t0 - 00 001 001
  beq $t0, $t1, Loop     # se t1 for 1 é porque os elementos ainda não foram todos percorridos e aí pula pra Loop - 10 01 10 10
  beq $zero, $t1, Print2  # se t1 for igual a 0 é porque já percorremos todos os elementos e aí pularemos para Print2 - 10 00 10 01

Print2:
  add $a0, $s2            # s2 está armazenando o valor do mínimo, logo passamos esse valor pra a0 para exibí-lo - 00 111 101
  add $v0, $t0            # Carrega 1 em v0 para executar chamada de sistema para printar na tela o valor mínimo - 00 110 001
  syscall                 # Executa chamada de sistema - 00001100
  beq $zero, $zero, Exit2 # Pula para Exit2 - 10 00 00 01
  
Exit2:
  add $v0, $a0         # adiciona o valor do registrador a0 (que é 7) para v0 - 00 110 111
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  add $v0, $t1         # adiciona o valor do registrador t0 (que é 1) para v0 - 00 110 001
  syscall              # Executa chamada de sistema. Função (exit) depende do valor em v0 (nesse caso é 10) - 00001100
      
	.data              # The .data section is dynamically created and its addresses cannot be easily predicted
vetor: .word 3,7,1,2,6,4,5 # Elementos do vetor; variable 1 in memory
