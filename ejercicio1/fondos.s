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
    ldr x0, = Verde_pasto_1     // Cargar la dirección de Verde_pasto_1 (valor incluido en colores.s)
    mov x1, #0            	// Coordenada X del extremo inferior izquierdo
    mov x2, #479            	// Coordenada Y del extremo inferior izquierdo
    mov x3, #639            	// Coordenada X del extremo superior derecho
    mov x4, #0            	// Coordenada Y del extremo superior derecho


    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    //Ruta base
    ldr x0, =Gris_ruta_1
    mov x1, #152
    mov x2, #479
    mov x3, #488
    mov x4, #0
    bl Pinta_rectangulo
    
    //Lineas de la calle
    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #100
    mov x3, #269
    mov x4, #16
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #224
    mov x3, #269
    mov x4, #140
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #348
    mov x3, #269
    mov x4, #264
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #264
    mov x2, #472
    mov x3, #269
    mov x4, #388
    bl Pinta_rectangulo

    //Línea del medio de la calle
    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #100
    mov x3, #381
    mov x4, #16
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #224
    mov x3, #381
    mov x4, #140
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #348
    mov x3, #381
    mov x4, #264
    bl Pinta_rectangulo

    ldr x0, =Linea_blanca_ruta
    mov x1, #376
    mov x2, #472
    mov x3, #381
    mov x4, #388
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

