.section .text
.include "colores.s"
.global Car_animation

.equ DELAY_AUTO, 100000000  //retraso 0.5 s (en nanosegundos)
.equ DELAY_COMIENZO, 1000000000

Car_animation:
    str x0, [sp, -8]!
    str x1, [sp, -8]!
    str x2, [sp, -8]!
    str x3, [sp, -8]!
    str x4, [sp, -8]!
    str x10, [sp, -8]!
    str x11, [sp, -8]!
    str x12, [sp, -8]!
    str x13, [sp, -8]!
    str x14, [sp, -8]!
    str x23, [sp, -8]!
    str x24, [sp, -8]!
    str x25, [sp, -8]!
    str x30, [sp, -8]!

    
    mov x10, #0
    mov x11, #0

    bl _auto
    // inicializo el rectangulo

    ldr x13,=DELAY_COMIENZO
    bl Wait
draw_loop:

    bl tapa_rastro

    bl _auto

    // Incrementa la coordenada y
    add x11, x11, #10
    sub x2, x2, #10      
    sub x4, x4, #10

    // Verifica si el punto ha llegado al borde de la pantalla
    //cmp x9, 640
    //bge reset_point    // Si x >= SCREEN_WIDTH, reinicia las coordenadas al centro
    //cmp x10, 480
    //bge reset_point

    // Espera un breve momento antes de dibujar el siguiente punto

    ldr x13,=DELAY_AUTO
    bl Wait
    // Vuelve al inicio del bucle
    b draw_loop

reset_point:
    // Reinicia las coordenadas al centro de la pantalla
    //mov x9, #320
    //mov x10, #240
    //b draw_loop

    ldr x30, [sp], 8
    ldr x25, [sp], 8
    ldr x24, [sp], 8
    ldr x23, [sp], 8
    ldr x14, [sp], 8
    ldr x13, [sp], 8
    ldr x12, [sp], 8
    ldr x11, [sp], 8
    ldr x10, [sp], 8
    ldr x4, [sp], 8
    ldr x3, [sp], 8
    ldr x2, [sp], 8
    ldr x1, [sp], 8
    ldr x0, [sp], 8

    ret

.globl Wait

Wait:
    str x0,[sp,-8]!
    str x13,[sp,-8]!
    // Espera el tiempo especificado en x11 (en ciclos de reloj)
    mov x0, x13  // Carga el tiempo de espera en ciclos de reloj
wait_loop:
    subs x0, x0, #1  // Decrementa el contador de tiempo
    bne wait_loop    // Salta de nuevo al bucle si el contador no ha llegado a cero

    ldr x0,[sp],8
    ldr x13,[sp],8

    ret              // Retorna cuando el tiempo de espera ha transcurrido

.globl tapa_rastro
tapa_rastro:

    str x0, [sp, -8]!
    str x1, [sp, -8]!
    str x2, [sp, -8]!
    str x3, [sp, -8]!
    str x4, [sp, -8]!

    ldr x0, =Gris_ruta_1
    mov x1, #280 //X
    mov x2, #300//Y
    mov x3, #360//X
    mov x4, #190//Y

    bl Pinta_rectangulo

    ldr x4, [sp], 8
    ldr x3, [sp], 8
    ldr x2, [sp], 8
    ldr x1, [sp], 8
    ldr x0, [sp], 8

    ret

