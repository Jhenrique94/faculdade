global _start

SECTION .data

valor:  DB  15

SECTION .text


_start:
  
  ; mov   [valor], 20
  mov   [valor], BYTE 20
  mov   BYTE [valor], 20

  mov   ebx, [valor]

  mov   eax,  1       ; exit command to kernel
  int   0x80
