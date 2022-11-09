  org 0x0000

  ori   $1, $1, 1
  ori   $8, $8, 4
  ori   $6, $6, 0x0F00
  lw    $15, 0($6)
  lw    $4, 4 ($2)
  halt  #14, $12. $2
  addu  $5, $3, $4
  sw    $5, 8 ($2)
  addu  $2, $2, $8
  subu  $15, $15, $1
  halt



