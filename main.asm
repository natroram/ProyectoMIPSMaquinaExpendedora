.data 
	cantidades: .float 12.0, 2.0, 7.0, 5.0
	copia: .float 6.0, 2.0, 7.0, 5.0
	precio: .float  7.2, 1.5, 1.1, 0.5
	p1: .asciiz "Agua"
	p2: .asciiz "Coca Cola"
	p3: .asciiz "Galletas"
	p4: .asciiz "Chifles"
	productos: .word p1, p2,p3,p4	
	newline: .asciiz "\n"
	space: .asciiz " "
	const: .float 100.0
.text 
	main :


		addi $t0,$zero,0
		addi $a0,$zero,5
		l.s $f1,copia($t0)
		l.s $f2,cantidades($t0)	
		jal checkStock
	while:
		beq $t0,16,exit
		l.s $f2,cantidades($t0)
		lw $t7,productos($t0)
		l.s $f1,precio($t0)
		addi $t0, $t0, 4		
		
		li $v0, 2
		mov.s $f12, $f2
		syscall 
		li $v0, 4
		la $a0, space
		syscall
		li $v0,2
		mov.s $f12 ,$f1
		syscall 
		li $v0, 4
		la $a0, space
		syscall
		li $v0, 4
		move $a0, $t7
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		j while
	exit:
		li $v0,10
		syscall

	
checkStock:
#   l.s  $f1, 2.0
 #  li.s  $f2,$a1
   la	$a0,const
   l.s $f4, 0($a0)
   mul.s  $f3, $f1, $f4
   div.s  $f3,$f3,$f2
   l.s $f1, 0($f3)
   li $v0,2
   mov.s $f12 ,$f1
   syscall 
   add.s $v0,$zero,$t0
   jr $ra
   