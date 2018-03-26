global _start

SECTION .data

char   DB    'A'

SECTION .text

_start:
  
  mov   ebx,  [char]  ; char content
  ; mov   ebx,  char    ; char address
  ; lea   ebx,  [char]  ; char address
  ; lea   ebx,  char    ; invalido

  mov   eax,  1       ; exit command to kernel
  int   0x80
