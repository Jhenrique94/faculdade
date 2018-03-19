_exit:
    ; mov     ebx,  int_result       ; exit code, 0 = ssnormal
    mov     eax,  1       ; exit command to kernel
    int     0x80