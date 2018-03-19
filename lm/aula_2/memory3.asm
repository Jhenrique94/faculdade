global _start

SECTION .data
char:   db  'ASSEMBLY'

SECTION .text

_start:
    mov     ecx,  char    ; arg2, pointer to string
    mov     edx,  1       ; string size
    mov     ebx,  1       ; arg1, where to write, screen
    mov     eax,  4       ; write sysout command to int 80 hex
    int     0x80          ; interrupt 80 hex, call kernel

    mov     ecx,  char    ; arg2, pointer to string
    mov     edx,  1       ; string size
    mov     ebx,  1       ; arg1, where to write, screen
    add     ecx,  1       
    mov     eax,  4       ; write sysout command to int 80 hex
    int     0x80          ; interrupt 80 hex, call kernel

    mov     ebx,  0       ; exit code, 0 = ssnormal
    mov     eax,  1       ; exit command to kernel
    int     0x80
