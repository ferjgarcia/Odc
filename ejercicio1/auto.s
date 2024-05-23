.globl plot_point

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGHT, 480
.equ BITS_PER_PIXEL, 32


.section ".text"
plot_point:
    // x0 -> color
    // (x1,x2) y (x3,x4) extremos opuestos
    // x25 -> sumo al color
    // x22 -> sumo al 2do color

    str x0,[sp,-8]!
    str x24,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    minix .req x5
    miniy .req x6
    maxix .req x7
    maxiy .req x8
    xx .req x9
    yy .req x10
    sumo .req x25
    sumo2 .req x22

        mov minix,x1
        mov miniy,x2
        mov maxix,x3
        mov maxiy,x4

        ret
