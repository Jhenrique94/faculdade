global _start

SECTION .data

; param:    DB    7
na:   DB    6
nb:   DB    3
nc:   DB    5

SECTION .text

_start:
  mov   al, [na]
  mov   bl, [nb]
  cmp   al, bl
  jl    clna

  mov   al, [nc]

clna:
  mov   bl, [nc]

clnb:
  cmp   al, bl
  jl    ral
  jmp   fim

ral:
  mov   bl, al

fim:
  mov   eax, 1
  int   0x80
