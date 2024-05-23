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

.section ".text.Pinta_rectangulo"
Pinta_rectangulo:
    // Guardar registros en la pila
    stp x1, x2, [sp, #-16]!
    stp x3, x4, [sp, #-16]!

    // Obtener coordenadas extremas
    ldp x1, x2, [sp], #16
    ldp x3, x4, [sp], #16

    // Ordenar coordenadas si es necesario
    cmp x1, x3
    ble Pinta_rectangulo_no_swap_x
    mov x5, x1
    mov x1, x3
    mov x3, x5
Pinta_rectangulo_no_swap_x:
    
    cmp x2, x4
    ble Pinta_rectangulo_no_swap_y
    mov x5, x2
    mov x2, x4
    mov x4, x5
Pinta_rectangulo_no_swap_y:

    // Iterar por los puntos del rectángulo
    mov x6, x2
Pinta_rectangulo_loop_y:
    cmp x6, x4
    bgt Pinta_rectangulo_end
    mov x7, x1
Pinta_rectangulo_loop_x:
    cmp x7, x3
    bgt Pinta_rectangulo_next_row
    bl Pinta_punto
    add x7, x7, #1
    b Pinta_rectangulo_loop_x
Pinta_rectangulo_next_row:
    add x6, x6, #1
    b Pinta_rectangulo_loop_y
Pinta_rectangulo_end:
    ret

.section ".text.Pinta_punto"
Pinta_punto:
    // Implementación básica para pintar un punto en el framebuffer
    // x1 = coordenada X, x2 = coordenada Y, x0 = color

    // Calcular la dirección de memoria para el pixel en el framebuffer
    mov x5, SCREEN_WIDTH
    mul x6, x2, x5       // x6 = y * SCREEN_WIDTH
    add x6, x6, x1       // x6 = y * SCREEN_WIDTH + x

    // Calcular la dirección de memoria del framebuffer
    ldr x7, =FRAMEBUFFER_ADDRESS
    add x6, x7, x6

    // Escribir el color en el framebuffer
    str x0, [x6]

    ret

.section ".bss"
    // Declaración del área de memoria para el framebuffer (no inicializada)
    .lcomm FRAMEBUFFER_ADDRESS, 640 * 480 * 4  // 640x480 píxeles, 32 bits por píxel (RGBA)

