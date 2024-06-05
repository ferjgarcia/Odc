.include "colores.s"


// Defines
	.equ SCREEN_WIDTH, 640
	.equ SCREEN_HEIGHT, 480
	.equ BITS_PER_PIXEL, 32

// Inicializo los registros

	IniRegistros:
		mov x29,x0
		mov x19,SCREEN_WIDTH
		mov x20,SCREEN_HEIGHT
		ret

// Loop infinito para poder ver el trabajo

	InfLoop:
	b InfLoop


.globl main
main:
   	bl IniRegistros
	
	bl _fondo
	bl Dibuja_arboles

	ldr x14, =Azul_sombra
	// inicializo el auto
    mov x10, #0
    mov x11, #0
	bl Car_animation



 
    b InfLoop
