	.data
	
str1:	.asciiz "Digite o primeiro numero: "
str2:	.asciiz "Digite o segundo numero: "

	.text
	
	.globl main

main:
	#Imprimir str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Imprimir str1
	li $v0, 4
	la $a0, str2
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t1, $v0
	
	slt $a0, $t0, $t1
	beq $t0, $zero, else
	
	#Soma 4
	addi $t0, $t0, 4
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	j encerrar
	
else:
	#Soma 5
	addi $t0, $t0, 5
	
	li $v0, 1
	move $a0, $t0
	syscall
	
encerrar:
	#Encerrar
	li $v0, 10
	syscall