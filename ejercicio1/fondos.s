.section .text
.include "colores.s"
	
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x30,[sp,-8]!

.globl pasto

pasto:

    // Configura las coordenadas del rectángulo del pasto de la izquierda
    ldr x0, = Verde_pasto_1     // Cargar la dirección de Verde_pasto_1 (si es un valor definido en .data)
    
    mov x1, 0            	// Coordenada X del extremo inferior izquierdo
    mov x2, 479            	// Coordenada Y del extremo inferior izquierdo
    mov x3, 148            	// Coordenada X del extremo superior derecho
    mov x4, 0            	// Coordenada Y del extremo superior derecho

    //Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    // Configura las coordenadas del rectángulo del pasto de la derecha
    ldr x0, = Verde_pasto_1    	// Cargar la dirección de Verde_pasto_1 (si es un valor definido en .data)
    
    mov x1, 452            	// Coordenada X del extremo inferior izquierdo
    mov x2, 479            	// Coordenada Y del extremo inferior izquierdo
    mov x3, 639            	// Coordenada X del extremo superior derecho
    mov x4, 0            	// Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    ret
