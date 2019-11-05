	.data
str1:	.asciiz "Digite um numero inteiro para as linhas: "
str2:	.asciiz "Digite um numero inteiro para as colunas: "
str3:	.asciiz "Digite um numero inteiro para compor a matriz: "

matriz:	.word 0 : $t0
	
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
	
	# Scan para as colunas da matriz
	li $v0,5
	syscall
	move $t2,$v0
