.section .text
.include "colores.s"

.globl pasto1
pasto1:

    // Configura las coordenadas del rectángulo
    ldr x0, = Verde_pasto_1          // Cargar la dirección de Rojo (si es un valor definido en .data)
    
    mov x1, 479            // Coordenada X del extremo inferior izquierdo
    mov x2, 0            // Coordenada Y del extremo inferior izquierdo
    mov x3, 148            // Coordenada X del extremo superior derecho
    mov x4, 0            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    ret
