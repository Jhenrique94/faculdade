global _start

SECTION .data

vet:    DB    "XBHSAQRTEZ"
size:   EQU   $-vet

SECTION .text

_print:
  mov ecx,  vet
  mov edx,  10
  mov ebx,  1
  mov eax,  4
  int 0x80
  ret

_start:
  mov ecx, 0
  
  jmp forExtCond

forExtBody:
  mov edx,  ecx
  inc edx
  jmp forIntCond

  forIntBody:
    mov al, [vet + ecx]
    mov bl, [vet + edx]
    cmp al, bl
    jle noexchg
    mov [vet + ecx],  bl
    mov [vet + edx],  al

    noexchg:
      inc edx

  forIntCond:
    cmp edx, size
    jl  forIntBody

  inc ecx

forExtCond:
  cmp ecx, [size]
  jl  forExtBody

  call _print

  mov ebx,  size
  mov eax,  1
  int 0x80