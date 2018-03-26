global _start

SECTION .data

; msg   DB    'B'
msg   DB    'AD'

SECTION .text

_start:
  ; mov   ebx,  msg
  mov   ebx,  [msg]

  mov   eax,  1       ; exit command to kernel
  int   0x80
