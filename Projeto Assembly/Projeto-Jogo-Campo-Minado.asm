	.data
str1:	.asciiz "Digite um numero inteiro para as linhas: "
str2:	.asciiz "Digite um numero inteiro para as colunas: "
str3:	.asciiz "Digite um numero inteiro para compor a matriz: "

campominado:	.word 0 : 10

campousuario:	.word 0 : 10
	
	.text
	.globl main
main:
	# Printando STR1
	li $v0,4
	la $a0,str1
	syscall
	
	# Scan para as linhas da matriz
	li $v0,5
	syscall
	move $t1,$v0
	
	# Printando STR2
	li $v0,4
	la $a0,str2
	syscall
	
	# Scan para as colunas da matriz
	li $v0,5
	syscall
	move $t2,$v0
	
	# Contador de linhas
	li $t3,0
	
	# Contador de colunas
	li $t4,0
	
calculandotamanhodamatriz:	
	
	# Multiplicando linhas por colonas para saber o tamanho total da Matriz e armazenar no registrador $t0
	mult $t1,$t2
	#mflo $t0
	
	# Ajustando o valor total de $t0 para ficar com o tamanho da matriz
	#sub $t0,$t0,1
	
preenchendomatrizusuario:
	
	# Printa str3 para solicitar ao usuario um numero inteiro
	li $v0,4
	la $a0,str3
	syscall
	
	# Scan para numero inteiro para compor matriz
	li $v0, 5
	syscall
	move $t5,$v0
	
	# Atribuindo o valor dois para $t6, para pegar o resto da divisão e preencher a matriz
	li $t6,2
	
	# Pegando o resto da divisão por 2
	div $t5,$t6
	mfhi $s0
	
loop:    mult     $t3, $t2       # $s2 = linha * cols (sequência de duas instruções)
         mflo     $t0            # mova o resultado da multiplicação do registro lo para $s2
         add      $t0, $t0, $t4  # $s2 += contador de colunas
         #  sll      $s2, $s2, 2    # $s2 *= 4 (desloque para a esquerda 2 bits) para deslocamento de bytes
         sw       $t5, campominado($t0) # armazene o valor no elemento da matriz
	