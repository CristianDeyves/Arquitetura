#############################################################################
# Row-major order traversal of 16 x 16 array of words.
# Pete Sanderson
# 31 March 2007
#
# Para observar facilmente a ordem orientada a linhas, execute a ferramenta Visualização de Referência de Memória com suas configurações padrão neste programa.
# Você pode, ao mesmo tempo ou separadamente, executar o Simulador de cache de dados neste programa para observar o desempenho do cache.
# Compare os resultados com os do algoritmo transversal de ordem principal da coluna.
#
# O equivalente em C / C++ / Java deste programa MIPS é:
#     int size = 16;
#     int[size][size] data;
#     int value = 0;
#     for (int row = 0; col < size; row++) {
#        for (int col = 0; col < size; col++) }
#           data[row][col] = value;
#           value++;
#        }
#     }
#
#  Nota: O programa está conectado para a matriz 16 x 16. Se você deseja alterar isso, três instruções precisam ser alteradas.
#        1. A declaração do tamanho do armazenamento da matriz em "data:" precisa ser alterada de 256 (que é 16 * 16) uma coluna * linhas.
#        2. O "li" para inicializar $t0 precisa ser alterado para novas linhas.
#        3. O "li" para inicializar $t1 precisa ser alterado para novas colunas.
#
         .data
data:    .word     0 : 256       # armazenamento para matriz de palavras 16x16
         .text
         li       $t0, 16        # $t0 = número de linhas
         li       $t1, 16        # $t1 = número de colunas
         move     $s0, $zero     # $s0 = contador de linhas
         move     $s1, $zero     # $s1 = contador de colunas
         move     $t2, $zero     # $t2 = o valor a ser armazenado
#  Cada iteração de loop armazenará o valor incrementado de $t1 no próximo elemento da matriz.
#  O deslocamento é calculado a cada iteração. deslocamento = 4 * (linha * cols + col)
#  Nota: nenhuma tentativa é feita para otimizar o desempenho do tempo de execução!
loop:    mult     $s0, $t1       # $s2 = linha * cols (sequência de duas instruções)
         mflo     $s2            # mova o resultado da multiplicação do registro lo para $s2
         add      $s2, $s2, $s1  # $s2 += contador de colunas
         sll      $s2, $s2, 2    # $s2 *= 4 (desloque para a esquerda 2 bits) para deslocamento de bytes
         sw       $t2, data($s2) # armazene o valor no elemento da matriz
         addi     $t2, $t2, 1    # valor de incremento a ser armazenado
#  Controle de loop: se incrementarmos a última coluna, redefiniremos o contador de colunas e incrementaremos o contador de linhas
#                Se incrementarmos a última linha, terminaremos.
         addi     $s1, $s1, 1    # contador de colunas de incremento
         bne      $s1, $t1, loop # não no final da linha, então volte
         move     $s1, $zero     # redefinir contador de colunas
         addi     $s0, $s0, 1    # contador de incremento de linha
         bne      $s0, $t0, loop # não no final da matriz para voltar
#  Terminamos de atravessar a matriz.
         li       $v0, 10        # serviço do sistema 10 é sair
         syscall                 # nós estamos fora daqui.
         
         
         
         
