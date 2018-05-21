global _start

SECTION .data

ASC_ZERO  EQU "0"
size      EQU 3
number    DW 453

char      DB  ""

SECTION .text

; _print:
;   mov ecx,  
;   mov edx,  10
;   mov ebx,  1
;   mov eax,  4
;   int 0x80
;   ret

_start:
  mov edi, number
  mov ecx, char

  mov ax, [number]
  ; mov dx, [number]
  mov bx, 10

  mov bx,   ax
  mov eax,  1
  int 0x80