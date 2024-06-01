.global draw_point_animation

.equ DELAY, 100000000  //retraso 0.1 s (en nanosegundos)

draw_point_animation:
    // Inicializa las coordenadas del punto
    mov x9, #320        // Coordenada x inicial (centro horizontal de la pantalla)
    mov x10, #240        // Coordenada y inicial (centro vertical de la pantalla)

draw_loop:

    // Dibuja el punto en las coordenadas actuales
    mov x0, 0xffffff //Color del punto

    bl Pinta_punto

    // Mueve el punto hacia la derecha y hacia abajo para dibujar una diagonal
    add x9, x9, #1      // Incrementa la coordenada x
    add x10, x10, #1      // Incrementa la coordenada y

    // Verifica si el punto ha llegado al borde de la pantalla
    cmp x9, 640
    bge reset_point    // Si x >= SCREEN_WIDTH, reinicia las coordenadas al centro
    cmp x10, 480
    bge reset_point

    // Espera un breve momento antes de dibujar el siguiente punto
    ldr x11,=DELAY
    bl Wait

    // Vuelve al inicio del bucle
    b draw_loop

reset_point:
    // Reinicia las coordenadas al centro de la pantalla
    mov x9, #320
    mov x10, #240
    b draw_loop

    // Retorno
    ret

.globl Wait

Wait:
    // Espera el tiempo especificado en x11 (en ciclos de reloj)
    mov x0, x11  // Carga el tiempo de espera en ciclos de reloj
wait_loop:
    subs x0, x0, #1  // Decrementa el contador de tiempo
    bne wait_loop    // Salta de nuevo al bucle si el contador no ha llegado a cero
    ret              // Retorna cuando el tiempo de espera ha transcurrido

.globl Borra_punto_anterior // La idea es borrar el rastro haciendo algo asi

Borra_punto_anterior:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x22,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!

    mov x0, 0x00
    sub x9, x9, #1 //posicion x anterior
    sub x10, x10,#1 // posicion y anterior

    bl Pinta_punto

    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x22,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret
