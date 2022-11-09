org 0x0000
ori $1, $0, 0x0000000f
ori $2, $0, 0x00000ff0
ori $3, $0, 0x000ff000
ori $4, $0, 0xff000000
jal    jump
ori   $2, $zero, 0x100
jump:
ori   $2, $zero, 0x100
sw    $6, 0($2)
sw    $7, 4($2)
halt
ori $8, $0, 0x0000000f
ori $9, $0, 0x00000ff0
ori $10, $0, 0x000ff000
ori $11, $0, 0xff000000
jr $31
halt


