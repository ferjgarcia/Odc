.global draw_point_animation

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGHT, 480
.equ DELAY, 100000000  // retraso 0.1 s (en nanosegundos)

.section .data
x_pos: .quad 320        // Coordenada x inicial (centro horizontal de la pantalla)
y_pos: .quad 480        // Coordenada y inicial (parte inferior de la pantalla)

.section .text

draw_point_animation:
    // Configura el punto inicial
    ldr x9, =x_pos       // Carga la dirección de x_pos en x9
    ldr x10, =y_pos      // Carga la dirección de y_pos en x10

draw_loop:
    // Borra el punto anterior
    mov x0, 0x000000     // Color negro
    bl Pinta_punto       // Borra el punto anterior

    // Mueve el punto hacia arriba
    sub x10, x10, #1     // Decrementa la coordenada y (mover hacia arriba)

    // Verifica si el punto ha salido de la pantalla
    cmp x10, 0
    bge draw_point       // Si y >= 0, dibuja el punto
    b reset_point        // Si el punto sale de la pantalla, reinicia las coordenadas

    // Espera un breve momento antes de dibujar el siguiente punto
    ldr x11, =DELAY
    bl Wait

    b draw_loop         // Vuelve al inicio del bucle

reset_point:
    // Reinicia las coordenadas al punto inicial
    ldr x10, =SCREEN_HEIGHT // Coordenada y inicial (parte inferior de la pantalla)
    b draw_loop

.global Wait
Wait:
    // Espera el tiempo especificado en x11 (en ciclos de reloj)
    mov x0, x11          // Carga el tiempo de espera en ciclos de reloj
wait_loop:
    subs x0, x0, #1      // Decrementa el contador de tiempo
    bne wait_loop        // Salta de nuevo al bucle si el contador no ha llegado a cero
    ret                  // Retorna cuando el tiempo de espera ha transcurrido
