	.data
	
str1:	.asciiz "Digite um valor inteiro para k: "
str2:	.asciiz "Digite um valor inteiro para f: "
str3:	.asciiz "Digite um valor inteiro para i: "
str4:	.asciiz "Digite um valor inteiro para j: "
str5:	.asciiz "Digite um valor inteiro para g: "
str6:	.asciiz "Digite um valor inteiro para h: "

	.text
	.globl main

main:
	#Printar str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#Lendo valor de K
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Printar str2
	li $v0, 4
	la $a0, str2
	syscall
	
	#Lendo valor de f
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Printar str3
	li $v0, 4
	la $a0, str3
	syscall
	
	#Lendo valor de i
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Printar str4
	li $v0, 4
	la $a0, str4
	syscall
	
	#Lendo valor de j
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Printar str5
	li $v0, 4
	la $a0, str5
	syscall
	
	#Lendo valor de g
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Printar str6
	li $v0, 4
	la $a0, str6
	syscall
	
	#Lendo valor de h
	li $v0, 5
	syscall
	move $t1, $v0
	
	