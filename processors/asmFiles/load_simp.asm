org 0x0000
ori $1, $0, 0x000f
ori $2, $0, 0x00f0
ori $3, $0, 0x0f00
or $1, $2, $3
or $2, $1, $3
or $3, $4, $5

halt
