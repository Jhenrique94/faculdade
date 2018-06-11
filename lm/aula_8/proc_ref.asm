global _start

SECTION .data

var1:   DB    32
var2:   DB    15

SECTION .text

_start:
  push  WORD  [var1]
  push  WORD  [var2]

  call  _triplo_maior

  mov   bx,   ax
  mov   eax,  1
  int   0x80

_triplo_maior: ;(W, W) -> ax
  push  ebp
  mov   ebp,  esp
  mov   ax,   [ebp + 10]
  mov   bx,   [ebp + 8]
  cmp   ax,   bx
  jl    b_maior
  jmp   triplo
b_maior:
  mov   ax,   bx
triplo:
  mov   bx,   3
  mul   bx
  mov   esp,  ebp
  pop   ebp
  ret   4