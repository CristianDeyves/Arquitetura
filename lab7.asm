	.data
	.text
	
	.globl main

main:
	#Setando o "i" do nosso laço
	li $t0, 0
	
	#Setando o valor comparador do laço
	li $t1, 10
	
	bne $t1, $t2, else
	
else:
	#Soma 1
	addi $t0, $t0, 1
	bne $t1, $t2, else
	
	#Mostrar na tela
	li $v0, 1
	move $a0, $t0
	syscall
	
encerrar:
	#Encerrar
	li $v0, 10
	syscall