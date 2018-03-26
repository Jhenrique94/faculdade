global _start

SECTION .data

univ:   DB  'UNESP', 0AH

SECTION .text

_start:

  mov   ecx,  6       ; moving wrong value to ecx
  mov   edx,  univ    ; moving wrong value to edx

  xchg  ecx,  edx     ; exchanging ecx and edx values

  ; print
  mov   ebx,  1  
  mov   eax,  4  
  int   0x80          

  mov   ebx,  0       ; exit code, 0 = ssnormal
  mov   eax,  1       ; exit command to kernel
  int   0x80
