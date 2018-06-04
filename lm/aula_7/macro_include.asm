%include "aula_7/macro.txt"

global _start

SECTION .data

var1:   db    3
; var2:   db    10h

SECTION .text

_start:
  mov edx, [var1]
  dobro edx
  quadrado edx

  mov ebx,  edx
  mov eax,  1
  int 0x80