
  #------------------------------------------------------------------
  # Test lw sw
  #------------------------------------------------------------------

  org   0x0000
  ori   $1, $zero, 0xF0
  ori   $2, $zero, 0x100
  ori   $3, $zero, 0x200
  ori   $4, $zero, 0x300
  bne   $4, $zero, jump
  ori   $1, $zero, 0xF0
  ori   $2, $zero, 0x100
  ori   $3, $zero, 0x200
  ori   $4, $zero, 0x300
  halt
jump:
  ori   $5, $zero, 0xBEEF  
  ori   $8, $zero, 0xF0
  ori   $9, $zero, 0x100
  ori   $10, $zero, 0x200
  ori   $11, $zero, 0x300
  halt      # that's all
