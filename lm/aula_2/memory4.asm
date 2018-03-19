global _start

SECTION .data
LINE_BREAK  EQU   10

chx:    TIMES 2   DB  'X', LINE_BREAK
chz:              DB  'Z', LINE_BREAK

SECTION .text

_start:
  mov   ebx,  1       ; arg1, where to write, screen
  mov   edx,  2       ; arg3 string length
  mov   ecx,  chx     ; arg2, pointer to string
  mov   eax,  4       ; write sysout command to int 80 hex
  int   0x80          ; interrupt 80 hex, call kernel

  mov   ebx,  1       ; arg1, where to write, screen
  mov   eax,  4       ; write sysout command to int 80 hex
  mov   edx,  4
  add   ecx,  2
  int   0x80          ; interrupt 80 hex, call kernel

  mov   ebx,  0       ; exit code, 0 = ssnormal
  mov   eax,  1       ; exit command to kernel
  int   0x80
