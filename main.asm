.data 
	cantidades: .float 12.0, 12.0, 70.0, 50.0,80.0
	copia: .float 1.5, 1.3, 57.0, 40.0, 10.0
	precio: .float  7.2, 1.5, 1.1, 0.5,10.0
	monedas: .float 0.01,0.05,0.1,0.25,0.5,1.0,5.0,10.0,20.0
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
	flag: .asciiz "SI"
        buffer: .space 4
        labelmanejador: .asciiz "Desea seguir ingresando monedas/billetes: \n 1)Si \n 2)No \n"
        labelmoneda: .asciiz "Ingrese una denominacion de dinero valida: \n"
        labelcantidad: .asciiz "Ingrese el numero de monedas/billetes que tiene: \n "

.text 
	main :
		#addi $t0,$zero,100
		#mtc1 $t0,$f0
		#cvt.s.w $f0,$f0
		
		#jal contains		

#		move $t8,$v0	
				
		li $v0,1
		move $a0,$t8
		syscall
		
		jal manejador
		mtc1 $v0,$f3
		
		li $v0, 2
		mov.s $f12, $f3
		syscall 		
		
		j exit
		
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





















#LISTO
contains:
  addi $sp,$sp,-20
  sw $ra,0($sp)
  sw $t0,4($sp) # 1
  sw $t1,8($sp) # -1
  sw $t2,12($sp) # i
  s.s $f1,16($sp)  
  addi $t3,$zero,-1
  j loopcontains

loopcontains: 	  
  	beq $t2,36, freecontains # CAMBIAR ETIQUETA Y OBTENER EL LEN
	l.s $f1,monedas($t2)   
	addi $t2, $t2,4 
	c.eq.s $f0,$f1
	bc1t ifcontains
	j loopcontains
	
ifcontains:
        addi $t3,$zero,1
       	j freecontains

freecontains:
  move $v0,$t3
  lw $ra,0($sp)
  lw $t0,4($sp)
  lw $t1,8($sp)
  lw $t2,12($sp)
  l.s $f1,16($sp)
  addi $sp,$sp,20
  jr $ra  

			
						

manejador:		
   addi $sp,$zero,-20
   sw $ra,0($sp)
   sw $s0,4($sp)
   sw $s1,8($sp)
   sw $s2,12($sp)
   s.s $f1,16($sp)  
   
   addi $t0,$zero,1
   addi $t1,$zero,1
   
   addi $t9,$zero,0
   mtc1 $t9,$f1
   cvt.s.w $f1,$f1
   
   j whilemanejador
   
 
whilemanejador:
   bne $t0,$t1,freemanejador
      
   addi $s0,$zero,1 # reservar
   addi $s1,$zero,-1 # reservar
   addi $s2,$zero,-1 # reservar
   
    
   
   j whilecheckcontains   
   

input:
   li $v0, 4
   la $a0, labelmanejador
   syscall   
   
   li $v0, 5
   syscall
    
   move $t1, $v0	      
   j whilemanejador
   
   

freemanejador:
 
   mfc1 $v0,$f1
   
   lw $ra,0($sp)
   lw $s0,4($sp)
   lw $s1,8($sp)
   lw $s2,12($sp)
   l.s $f1,16($sp)  
   addi $sp,$sp,20
    
   jr $ra
 
 

whilecheckcontains:
   beq $s0,$s1,whilecantidad #next while
   
   li $v0, 4
   la $a0, labelmoneda
   syscall    
  
   li $v0, 6
   syscall
  

   
   jal contains
   add $s1,$zero, $v0
       
   j whilecheckcontains
   
 
whilecantidad:
   bgtz $s2, calculos #calculos
   
   li $v0, 4
   la $a0, labelcantidad
   syscall  
   
   li $v0, 5
   syscall
   
   move $s2, $v0
   
   j whilecantidad

calculos:

  mtc1 $s2,$f2
  cvt.s.w $f2,$f2   
  mul.s $f3,$f0,$f2
  add.s $f1,$f1,$f3
  j input
  
  
 