
SECTION .data

msg:
    db  "Hello World", 10

SECTION .text

global _start

; Program entry point
_start:

    mov eax, 4      ; write sysout command to int 80 hex
    mov ebx, 1      ; arg1, where to write, screen
    mov ecx, msg    ; arg2, pointer to string
    mov edx, 12     ; arg3, string size
    int 0x80        ; interrupt 80 hex, call kernel    mov ebx, 0      ; exit code, 0=normal
    mov eax, 1      ; exit command to kernel
    int 0x80        ; interrupt 80 hex, call kernel