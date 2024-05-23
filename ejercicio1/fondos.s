.section .text
.include "colores.s"

.globl _fondo
_fondo:

    // Configura las coordenadas del rectángulo
    ldr x0, = Verde_pasto_1         // Cargar la dirección de Verde_pasto_1 (valor incluido en colores.s)
    mov x1, #0            // Coordenada X del extremo inferior izquierdo
    mov x2, #479            // Coordenada Y del extremo inferior izquierdo
    mov x3, #639            // Coordenada X del extremo superior derecho
    mov x4, #0            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    ret

