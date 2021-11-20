.data 
	cantidades: .float 12.0, 12.0, 70.0, 50.0,80.0
	copia: .float 1.5, 1.3, 57.0, 40.0, 10.0
	precio: .float  7.2, 1.5, 1.1, 0.5,10.0
	p1: .asciiz "Agua"
	p2: .asciiz "Coca Cola"
	p3: .asciiz "Galletas"
	p4: .asciiz "Chifles"
	p5: .asciiz "Chifles222"
	productos: .word p1, p2,p3,p4,p5
	newline: .asciiz "\n"
	space: .asciiz ", "
	const: .float 100.0
	presentacion: .asciiz "-----BIENVENIDO-----\n"
	titulo: .asciiz "******Tenemos estas opciones******\n"	
	stock: .asciiz "BAJO STOCK"
	string: .asciiz ".- "
.text 
	main :
		j menu

#		addi $t0,$zero,0
#		addi $a0,$zero,5
#		l.s $f1,cantidades($t0)	
#		l.s $f0,copia($t0)
#		mtc1 $v0,$f2
#		li $v0, 2
#		mov.s $f12, $f2
#		syscall 			
	

	exit:
		li $v0,10
		syscall

	
checkStock:
  addi $sp,$sp,16
  sw $ra,0($sp)
  sw $t0,4($sp)
  s.s $f2,8($sp)
  s.s $f3,12($sp)
  
  addi $t0,$zero,100
  mtc1 $t0,$f2
  cvt.s.w $f2,$f2
  mul.s  $f3,$f0,$f2
  div.s  $f3,$f3,$f1
  mfc1 $v0,$f3
  
  lw $ra,0($sp)
  lw $t0,4($sp)
  l.s $f2,8($sp)
  l.s $f3,12($sp)
  addi $sp,$sp,16  
  jr $ra

menu: 
	li $v0, 4
	la $a0, presentacion
	syscall
	li $v0, 4
	la $a0, titulo
	syscall
	j whilemenu	


whilemenu:
	addi $t1,$t1,1
   	beq $t0,20,exit # CAMBIAR ETIQUETA Y OBTENER EL LEN
	l.s $f0,copia($t0)
	l.s $f1,cantidades($t0)	
	l.s $f2,precio($t0)
	lw $t7,productos($t0)
	
	addi $t0, $t0,4 
	jal checkStock

	mtc1 $v0,$f3
	
	addi $t2,$zero,10
	mtc1 $t2,$f4
	cvt.s.w $f4,$f4
	addi $t3,$zero,16
	mtc1 $t3,$f5
	cvt.s.w $f5,$f5
	
	c.lt.s $f3,$f4
	bc1t else
	c.lt.s $f3,$f5
	bc1f else
	
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0, 4
	la $a0, string
	syscall
	li $v0, 4
	move $a0, $t7
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
			
	li $v0, 2
	mov.s $f12, $f2
	syscall 
	li $v0, 4
	la $a0, space
	syscall	

	li $v0, 4
	la $a0, stock
	syscall

	li $v0, 4
	la $a0, newline
	syscall		
	j whilemenu	

else: 			
	  	li $v0,1
		move $a0,$t1
		syscall
		
		li $v0, 4
		la $a0, string
		syscall

		li $v0, 4
		move $a0, $t7
		syscall
	
		li $v0, 4
		la $a0, space
		syscall
			
		li $v0, 2
		mov.s $f12, $f2
		syscall 	

		li $v0, 4
		la $a0, newline
		syscall
		
		j whilemenu
