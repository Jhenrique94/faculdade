global _start

SECTION .data

char:   DB  'X'

SECTION .text

_start:
  mov   eax,  4

  ; add   eax,  0x30
  add   eax,  48

  mov   [char], eax

  mov   ecx,  char    ; arg2, pointer to string
  mov   ebx,  1       ; arg1, where to write, screen
  mov   edx,  2       ; arg3 string length
  mov   eax,  4       ; write sysout command to int 80 hex
  int   0x80          ; interrupt 80 hex, call kernel

  mov   ebx,  0       ; exit code, 0 = ssnormal
  mov   eax,  1       ; exit command to kernel
  int   0x80
