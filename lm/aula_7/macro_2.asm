global _start

SECTION .data

var1:   db    3
; var2:   db    10h

SECTION .text

%macro dobro 1
  add %1, %1
%endmacro

%macro quadrado 1
  mov eax,  %1
  mul %1
  mov %1,   eax  
%endmacro

_start:
  mov edx, [var1]
  dobro edx
  quadrado edx

  mov ebx,  edx
  mov eax,  1
  int 0x80