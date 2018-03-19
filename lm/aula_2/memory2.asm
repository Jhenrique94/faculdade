global _start

SECTION .data
    charA:   db  'A', 10
    ; char:   db  0x41, 0Ah
    ; char:   db  41h, OaH
    ; char:   db  65, 10
    charB:   db   10, 'B', 10, 10 

SECTION .text

_start:
    mov     ecx,  charA   ; arg2, pointer to string
    mov     edx,  2       ; string size
    mov     ebx,  1       ; arg1, where to write, screen
    mov     eax,  4       ; write sysout command to int 80 hex
    int     0x80          ; interrupt 80 hex, call kernel

    mov     ecx,  charB   ; arg2, pointer to string
    mov     edx,  4       ; string size
    mov     ebx,  1       ; arg1, where to write, screen
    mov     eax,  4       ; write sysout command to int 80 hex
    int     0x80          ; interrupt 80 hex, call kernel

    mov     ebx,  0       ; exit code, 0 = ssnormal
    mov     eax,  1       ; exit command to kernel
    int     0x80
