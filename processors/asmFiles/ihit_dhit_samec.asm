org 0x0000
ori $2, $0, 0x23456789
ori $3, $0, #256
loop:
lw $2, 0($1)
lw $2, 0($1)
addi $1, $1, #1
addi $1, $1, #1
bne $1, $3, loop
exit:
halt