global _start

SECTION .data

var1:   DB    89
var2:   DW    70
var3:   DD    103

SECTION .text

_start:
  push  WORD  [var1]
  mov   ax,   [var2]
  push  ax
  mov   eax,  [var3]
  push  eax

  mov   ebx,  [esp]

  ; mov   ebx,  [esp + 4]
  
  add   esp,  6
  pop   bx

  mov eax,  1
  int 0x80