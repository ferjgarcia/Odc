.section .text
.include "colores.s"
.globl _auto
_auto:

    // Configura las coordenadas del auto
    ldr x0, =Rojo          // Cargar la dirección de Rojo (valor incluido en colores.s)
    mov x1, 293            // Coordenada X del extremo inferior izquierdo
    mov x2, 200            // Coordenada Y del extremo inferior izquierdo
    mov x3, 347            // Coordenada X del extremo superior derecho
    mov x4, 280            // Coordenada Y del extremo superior derecho

    // Llama a la función Pinta_rectangulo
    bl Pinta_rectangulo

        //RUEDAS

    // Inicializa las coordenadas de la primera rueda
    ldr x0, =Ruedas        // Cargar la dirección de Ruedas (valor incluido en colores.s)
    mov x5, 300            // Coordenada X inicial del extremo inferior izquierdo
    mov x6, 300            // Coordenada Y inicial del extremo inferior izquierdo
    mov x7, 305            // Coordenada X inicial del extremo superior derecho
    mov x8, 320            // Coordenada Y inicial del extremo superior derecho

    mov w9, 0              // Inicializa el contador de ruedas en 0

ruedas_loop:
    // Configura las coordenadas del rectángulo para la rueda
    mov x1, x5
    mov x2, x6
    mov x3, x7
    mov x4, x8

    
    bl Pinta_rectangulo

   
    add x5, x5, #54        
    add x7, x7, #54        

    
    add w9, w9, #1

    // Comprueba si ya se han dibujado las 4 ruedas
    cmp w9, #4
    b.lt ruedas_loop       // Si aún no se han dibujado 4 ruedas, repite el bucle

    ret

 //LINEA VACIA
