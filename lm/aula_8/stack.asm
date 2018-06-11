global _start

SECTION .data

varb:   DB    31
varw:   DW    29
vard:   DD    64

SECTION .text

_start:
  mov   eax,  [vard]
  push  eax
  pop   ebx

  push  WORD  [varw]
  pop   ebx

  ; push  BYTE [varb]
  ; pop   ebx

  mov eax,  1
  int 0x80