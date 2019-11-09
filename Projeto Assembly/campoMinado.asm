.data
	# criação de uma matriz 22x22
	mdArray:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
			.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	# por ser uma matriz quadrada 22x22
	size: 		.word 22
	# constante que representa o tamanho do tipo do dado
	.eqv DATA_SIZE 4
	
	# pular linha
	nline:		.asciiz "\n"
	
.text
	.globl main
	main:
		# carregar endereço do mdArray[0][0]
		la $a0, mdArray
		# carregar o tamanho da matriz (numero de linhas e colunas)
		lw $a1, size
		# função de somar a diagonal
		jal sumDiagonal
		
		# imprimir o resultado da função
		move $a0, $v0
		li $v0, 1
		syscall 
		
		#j randomNumber
		j printMatriz
		
		#end
		li $v0, 10
		syscall
		
	sumDiagonal:
		li $v0, 0 # soma = 0
		li $t0, 0 # index
		
		sumLoop:
			mul $t1,$t0,$a1 # t1 = index * colSize
			add $t1,$t1,$t0 #                 + colIndex
			mul $t1, $t1, DATA_SIZE # * data_size
			add $t1, $t1, $a0   # + base address
			
			lw $t2, ($t1)
			add $v0, $v0, $t2  # sum = sum + mdArray[i][i]
			
			
			addi $t0, $t0, 1   # i++
			blt $t0, $a1, sumLoop  # if i < size, loop again
			
		jr $ra
		
		
		
		
		
	randomNumber:
		li $v0, 30        # Syscall 30: System Time syscall
		syscall                  # $a0 will contain the 32 LS bits of the system time
		move $t0, $a0     # Save $a0 value in $t0 

		li $v0, 40        # Syscall 40: Random seed
		add $a0, $zero, $zero   # Set RNG ID to 0
		add $a1, $zero, $t0     # Set Random seed to
		syscall

		li $v0, 42        # Syscall 42: Random int range
		add $a0, $zero, $zero   # Set RNG ID to 0
		li $a1, 50     # Set upper bound to 4 (exclusive)
		syscall                  # Generate a random number and put it in $a0
		add $s1, $zero, $a0     # Copy the random number to $s1
		
		# print random number
		li $v0, 1   # 1 is the system call code to show an int number
		syscall     # as I said your generated number is at $a0, so it will be printed
		
		
		
	printMatriz:
		# carregar endereço da matriz em t1 e em k0
		la $t1, mdArray
		la $k0, mdArray
		
		# valor limite
		li $s6, 21
		
		#contador linha
		li $s0, 1
		
		# imprimir linha por linha
		loopLinha:
			# imprimir pular linha(\n)
			li $v0, 4
			la $a0, nline
			syscall
			# se linha = 11, terminar
			beq $s0, $s6, endPrintMatriz
			#contador coluna
			li $s1, 1
			
			loopColuna:
				# carregar valor do endereço em t2
				lw $t2, 0($t1)
				
				# imprimir valor
				li $v0, 1
				move $a0, $t2
				syscall
				
				# optional - syscall number for printing character (space)
    				li      $a0, 32
    				li      $v0, 11  
    				syscall
    
				# avançar para proximo endereço
				mul $t1, $s0, 22
				add $t1, $t1, $s1
				mul $t1, $t1, DATA_SIZE
				add $t1, $t1, $k0
				
				# coluna++
				addi $s1, $s1, 1
			
				# se coluna != 11, continuar loop
				bne $s1, $s6, loopColuna
			
				# senão, linha++
				addi $s0, $s0, 1
				# recomeçar
				j loopLinha
		
		endPrintMatriz:
		
		
		
		
		
		
		
		
		
		
		
		
