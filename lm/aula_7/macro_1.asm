global _start

SECTION .data

var1:   db    4
; var2:   db    10h

SECTION .text

%macro dobro 0
  add eax,  eax
%endmacro

%macro quadrado 0
  mov ebx,  eax
  mul ebx
%endmacro

_start:
  mov eax, [var1]
  dobro
  quadrado

  mov ebx,  eax
  mov eax,  1
  int 0x80