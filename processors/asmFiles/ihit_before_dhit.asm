org 0x0000

ori $1, $0, 0xFFFC
ori $2, $0, 3
ori $3, $0, 4
lw $2, 0($1)
lw $2, 0($1)
sw $2, 0($1)
sw $2, 0($1)

halt
