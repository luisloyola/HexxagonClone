################################################
# Solo deja las celdas que tengan el valor indicado en $a0
#$a0 = valor de las celdas que se conservan
FILTRAR_VECINOS1:
la $s0, vecinos1	#$s0 = vecinos1
lw $s2, 0($s0)		#$s2 = n
addi $s0, $s0, 4	#avanza a donde empieza la celda 
move $s1, $s0 		#$s1 = puntero a donde se escribe la celda
li $s3, 0			#$s3 = cuenta1 = 0
li $v0, 0			#$v0 = cuenta2 =0

filtrar_vecinos1_for1:	#for cuenta1=0 to n
beq $s2,$s3, filtrar_vecinos1_for1_end
	lw $t0, 8($s0)		#$t0 = matrix[i][j]
	bne $t0, $a0, filtrar_vecinos1_no_valido #if (matrix[i][j] != filtro) jump
		#carga los datos de la celda en temporales
		lw $t0, 0($s0)		#i
		lw $t1, 4($s0)		#j
		lw $t2, 8($s0)		#matrix[i][j]
		lw $t3, 12($s0)		#&matrix[i][j]
		#escribe los datos de los temporales a la posición donde deben estar.
		sw $t0, 0($s1)		#i
		sw $t1, 4($s1)		#j
		sw $t2, 8($s1)		#matrix[i][j]
		sw $t3, 12($s1)		#&matrix[i][j]
		addi $s1, $s1, 16	#$s1 + 16 = puntero donde escribir apunta a la siguiente posicion
		addi $v0, $v0, 1	#cuenta2++
	filtrar_vecinos1_no_valido: 
	addi $s3, $s3, 1		#cuenta1++
	addi $s0, $s0, 16		#avanza a la siguiente celda
	j filtrar_vecinos1_for1
filtrar_vecinos1_for1_end:
la $t0, vecinos1
lw $v0, 0($t0)
jr $ra
#fin de FILTRAR_VECINOS1.


################################################
# Solo deja las celdas que tengan el valor indicado en $a0
#$a0 = valor de las celdas que se conservan
FILTRAR_VECINOS2:
la $s0, vecinos2	#$s0 = vecinos2
lw $s2, 0($s0)		#$s2 = n
addi $s0, $s0, 4	#avanza a donde empieza la celda 
move $s1, $s0 		#$s1 = puntero a donde se escribe la celda
li $s3, 0			#$s3 = cuenta1 = 0
li $v0, 0			#$v0 = cuenta2 =0

filtrar_vecinos2_for1:	#for cuenta1=0 to n
beq $s2,$s3, filtrar_vecinos1_for1_end
	lw $t0, 8($s0)		#$t0 = matrix[i][j]
	bne $t0, $a0, filtrar_vecinos2_no_valido #if (matrix[i][j] != filtro) jump
		#carga los datos de la celda en temporales
		lw $t0, 0($s0)		#i
		lw $t1, 4($s0)		#j
		lw $t2, 8($s0)		#matrix[i][j]
		lw $t3, 12($s0)		#&matrix[i][j]
		#escribe los datos de los temporales a la posición donde deben estar.
		sw $t0, 0($s1)		#i
		sw $t1, 4($s1)		#j
		sw $t2, 8($s1)		#matrix[i][j]
		sw $t3, 12($s1)		#&matrix[i][j]
		addi $s1, $s1, 16	#$s1 + 16 = puntero donde escribir apunta a la siguiente posicion
		addi $v0, $v0, 1	#cuenta2++
	filtrar_vecinos2_no_valido: 
	addi $s3, $s3, 1		#cuenta1++
	addi $s0, $s0, 16		#avanza a la siguiente celda
	j filtrar_vecinos2_for1
filtrar_vecinos1_for2_end:
la $t0, vecinos2
lw $v0, 0($t0)
jr $ra
#fin de FILTRAR_VECINOS2.