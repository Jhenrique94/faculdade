_print:
    ; mov     ecx,  str_addr    ; arg2 pointer to string
    ; mov     edx,  str_len     ; arg3 string size
    mov     ebx,  1             ; arg1, where to write, screen
    mov     eax,  4             ; write sysout command to int 80 hex
    int     0x80                ; interrupt 80 hex, call kernel
    ret

_exit:
    ; mov     ebx,  int_result       ; exit code, 0 = ssnormal
    mov     eax,  1       ; exit command to kernel
    int     0x80