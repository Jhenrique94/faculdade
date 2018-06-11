global _start

SECTION .data

var1:   DB    32
var2:   DB    15

SECTION .text

_start:
  mov   al,   [var1]
  mov   bl,   [var2]

  call  _triplo_maior

  mov   bx,   ax
  mov   eax,  1
  int   0x80

_triplo_maior: ;(al, bl) -> ax
  cmp   al,   bl
  jl    b_maior
  jmp   triplo
b_maior:
  mov   al,   bl
triplo:
  mov   bl,   3
  mul   bl
  ret