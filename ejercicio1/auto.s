.section .text
.include "colores.s"
.globl _auto
_auto:
    //RUEDAS

    // Inicializa las coordenadas de la primera rueda
    ldr x0, =Ruedas        // Cargar la dirección de Ruedas (valor incluido en colores.s)
    mov x5, 287            // Coordenada X inicial del extremo inferior izquierdo
    mov x6, 210            // Coordenada Y inicial del extremo inferior izquierdo
    mov x7, 353            // Coordenada X inicial del extremo superior derecho
    mov x8, 240            // Coordenada Y inicial del extremo superior derecho

    mov w9, 0              // Inicializa el contador de ruedas en 0

ruedas_loop:
    // Configura las coordenadas del rectángulo para la rueda
    mov x1, x5
    mov x2, x6
    mov x3, x7
    mov x4, x8

    bl Pinta_rectangulo

    add x6, x6, #45         
    add x8, x8, #45        

    
    add w9, w9, #1

    // Comprueba si ya se han dibujado las 4 ruedas
    cmp w9, #2
    b.lt ruedas_loop       // Si aún no se han dibujado 4 ruedas, repite el bucle

    //CUERPO DEL AUTO

    // Configura las coordenadas del auto
    ldr x0, =Rojo          // Cargar la dirección de Rojo (valor incluido en colores.s)
    mov x1, 293            // Coordenada X del extremo inferior izquierdo
    mov x2, 200            // Coordenada Y del extremo inferior izquierdo
    mov x3, 348            // Coordenada X del extremo superior derecho
    mov x4, 290            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

    //VIDRIO

    ldr x0, =Vidrios          // Cargar la dirección de Rojo (valor incluido en colores.s)
    mov x1, 302            // Coordenada X del extremo inferior izquierdo
    mov x2, 215            // Coordenada Y del extremo inferior izquierdo
    mov x3, 339            // Coordenada X del extremo superior derecho
    mov x4, 230            // Coordenada Y del extremo superior derecho

    bl Pinta_rectangulo

    //LUCES


    ret

 //LINEA VACIA

 
