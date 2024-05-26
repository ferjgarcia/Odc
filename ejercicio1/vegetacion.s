.section .text
.include "colores.s"

.globl _arboles
_arboles:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!
    // COPA ARBOL
        ldr x0,=Verde_arbol_claro
		mov x1, 600  // X
		mov x2, 100  // Y
		mov x3, 20 // Radio
	bl Pinta_circulo
    // TRONCO
        ldr x0, =Tronco_claro          // Cargar la dirección de Tronco_claro (valor incluido en colores.s)
        mov x1, 598            // Coordenada X del extremo inferior izquierdo
        mov x2, 120            // Coordenada Y del extremo inferior izquierdo
        mov x3, 603           // Coordenada X del extremo superior derecho
        mov x4, 130            // Coordenada Y del extremo superior derecho

    bl Pinta_rectangulo

    // ARBUSTOS
        ldr x0,=Verde_arbol_claro
		mov x1, 570  // X
		mov x2, 200  // Y
		mov x3, 10
	bl Pinta_circulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret
