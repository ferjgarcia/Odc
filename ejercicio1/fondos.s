.section .text
.include "colores.s"

.globl _fondo
_fondo:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

    // Configura las coordenadas del rectángulo
    ldr x0, = Verde_pasto_1         // Cargar la dirección de Verde_pasto_1 (valor incluido en colores.s)
    mov x1, #0            // Coordenada X del extremo inferior izquierdo
    mov x2, #479            // Coordenada Y del extremo inferior izquierdo
    mov x3, #639            // Coordenada X del extremo superior derecho
    mov x4, #0            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

ret

