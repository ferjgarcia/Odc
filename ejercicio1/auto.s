# .section ".data"
# rect_color: .word 0x808080   // Color gris en formato RGB

# .section ".text"
# .globl _auto
# _auto:
#     // Configura las coordenadas del rectángulo
#     mov x0, rect_color      // Color gris
#     mov x1, #100            // Coordenada X del extremo inferior izquierdo
#     mov x2, #100            // Coordenada Y del extremo inferior izquierdo
#     mov x3, #300            // Coordenada X del extremo superior derecho
#     mov x4, #300            // Coordenada Y del extremo superior derecho

#     // Llama a la función Pinta_rectangulo
#     bl Pinta_rectangulo

#     // Salir del programa
#     mov x8, #93             // Syscall exit (número 93)
#     svc #0

# .section ".text.Pinta_punto"
# Pinta_punto:
#     // Código para pintar un punto en el framebuffer
#     // Implementación de Pinta_punto aquí
#     ret



















.section ".data"
rect_color: .word 0x808080   // Color gris en formato RGB

.section ".text"
.globl _auto
_auto:
    // Configura las coordenadas del rectángulo
    mov x0, rect_color      // Color gris
    mov x1, #100            // Coordenada X del extremo inferior izquierdo
    mov x2, #100            // Coordenada Y del extremo inferior izquierdo
    mov x3, #300            // Coordenada X del extremo superior derecho
    mov x4, #300            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    // Salir del programa
    mov x8, #93             // Syscall exit (número 93)
    svc #0

