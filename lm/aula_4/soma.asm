global _start

SECTION .data

param:    DB    7

SECTION .text

_start:
  mov   al, [param]
  mov   bl, 0

cont:
  add   bl, al
  sub   al, 1
  jnz   cont

  mov   eax, 1
  int   0x80
