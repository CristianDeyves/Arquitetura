	.data
str1:	.asciiz "Digite um numero inteiro para as linhas: "
str2:	.asciiz "Digite um numero inteiro para as colunas: "
str3:	.asciiz "Digite um numero inteiro para compor a matriz: "

campo-minado:	.word 0 : $t0

campo-usuario:	.word 0 : $t0
	
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
	
calculando-tamanho-da-matriz:	
	
	# Multiplicando linhas por colonas para saber o tamanho total da Matriz e armazenar no registrador $t0
	mult $t1,$t2
	mflo $t0
	
	# Ajustando o valor total de $t0 para ficar com o tamanho da matriz
	sub $t0,$t0,1