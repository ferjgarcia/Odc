.section .text
.include "colores.s"
.globl _auto
_auto:

    // Configura las coordenadas del rectángulo
    ldr x0, =Rojo          // Cargar la dirección de Rojo (si es un valor definido en .data)
    mov x1, #100            // Coordenada X del extremo inferior izquierdo
    mov x2, #100            // Coordenada Y del extremo inferior izquierdo
    mov x3, #300            // Coordenada X del extremo superior derecho
    mov x4, #300            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    ret

