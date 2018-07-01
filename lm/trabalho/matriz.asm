






global preencher_matriz
global imprimir_matrizes
global multiplica_por_inteiro
global multiplica_linha_por_coluna
global maior_valor_diagonal_principal_mutiplicada
global main

extern __stack_chk_fail
extern putchar
extern printf
extern puts
extern rand
extern srand


SECTION .text   

preencher_matriz:
        push    ebp
        mov     ebp, esp
        push    ebx
        sub     esp, 20
        mov     eax, dword [ebp+10H]
        sub     esp, 12
        push    eax
        call    srand
        add     esp, 16
        mov     dword [ebp-0CH], 0
        jmp     L_004

L_001:  mov     dword [ebp-10H], 0
        jmp     L_003

L_002:  mov     edx, dword [ebp-0CH]
        mov     eax, edx
        add     eax, eax
        add     eax, edx
        shl     eax, 2
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        lea     ebx, [edx+eax]
        call    rand
        mov     ecx, eax
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        shl     eax, 2
        add     eax, edx
        add     eax, eax
        sub     ecx, eax
        mov     edx, ecx
        mov     eax, dword [ebp-10H]
        mov     dword [ebx+eax*4], edx
        add     dword [ebp-10H], 1
L_003:  cmp     dword [ebp-10H], 2
        jle     L_002
        add     dword [ebp-0CH], 1
L_004:  cmp     dword [ebp-0CH], 3
        jle     L_001
        mov     dword [ebp-10H], 0
        jmp     L_008

L_005:  mov     dword [ebp-0CH], 0
        jmp     L_007

L_006:  mov     eax, dword [ebp-0CH]
        shl     eax, 4
        mov     edx, eax
        mov     eax, dword [ebp+0CH]
        lea     ebx, [edx+eax]
        call    rand
        mov     ecx, eax
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        shl     eax, 2
        add     eax, edx
        add     eax, eax
        sub     ecx, eax
        mov     edx, ecx
        mov     eax, dword [ebp-10H]
        mov     dword [ebx+eax*4], edx
        add     dword [ebp-0CH], 1
L_007:  cmp     dword [ebp-0CH], 2
        jle     L_006
        add     dword [ebp-10H], 1
L_008:  cmp     dword [ebp-10H], 3
        jle     L_005
        nop
        mov     ebx, dword [ebp-4H]
        leave
        ret


imprimir_matrizes:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 12
        push    L_030
        call    puts
        add     esp, 16
        mov     dword [ebp-0CH], 0
        jmp     L_012

L_009:  mov     dword [ebp-10H], 0
        jmp     L_011

L_010:  mov     edx, dword [ebp-0CH]
        mov     eax, edx
        add     eax, eax
        add     eax, edx
        shl     eax, 2
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        add     edx, eax
        mov     eax, dword [ebp-10H]
        mov     eax, dword [edx+eax*4]
        sub     esp, 8
        push    eax
        push    L_031
        call    printf
        add     esp, 16
        add     dword [ebp-10H], 1
L_011:  cmp     dword [ebp-10H], 2
        jle     L_010
        sub     esp, 12
        push    10
        call    putchar
        add     esp, 16
        add     dword [ebp-0CH], 1
L_012:  cmp     dword [ebp-0CH], 3
        jle     L_009
        sub     esp, 12
        push    L_032
        call    puts
        add     esp, 16
        mov     dword [ebp-0CH], 0
        jmp     L_016

L_013:  mov     dword [ebp-10H], 0
        jmp     L_015

L_014:  mov     eax, dword [ebp-0CH]
        shl     eax, 4
        mov     edx, eax
        mov     eax, dword [ebp+0CH]
        add     edx, eax
        mov     eax, dword [ebp-10H]
        mov     eax, dword [edx+eax*4]
        sub     esp, 8
        push    eax
        push    L_031
        call    printf
        add     esp, 16
        add     dword [ebp-10H], 1
L_015:  cmp     dword [ebp-10H], 3
        jle     L_014
        sub     esp, 12
        push    10
        call    putchar
        add     esp, 16
        add     dword [ebp-0CH], 1
L_016:  cmp     dword [ebp-0CH], 2
        jle     L_013
        nop
        leave
        ret


multiplica_por_inteiro:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     dword [ebp-4H], 0
        jmp     L_020

L_017:  mov     dword [ebp-8H], 0
        jmp     L_019

L_018:  mov     edx, dword [ebp-4H]
        mov     eax, edx
        add     eax, eax
        add     eax, edx
        shl     eax, 2
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        lea     ecx, [edx+eax]
        mov     edx, dword [ebp-4H]
        mov     eax, edx
        add     eax, eax
        add     eax, edx
        shl     eax, 2
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        add     edx, eax
        mov     eax, dword [ebp-8H]
        mov     eax, dword [edx+eax*4]
        imul    eax, dword [ebp+0CH]
        mov     edx, eax
        mov     eax, dword [ebp-8H]
        mov     dword [ecx+eax*4], edx
        add     dword [ebp-8H], 1
L_019:  cmp     dword [ebp-8H], 2
        jle     L_018
        add     dword [ebp-4H], 1
L_020:  cmp     dword [ebp-4H], 3
        jle     L_017
        nop
        leave
        ret


multiplica_linha_por_coluna:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     dword [ebp-4H], 0
        mov     dword [ebp-10H], 0
        jmp     L_024

L_021:  mov     dword [ebp-0CH], 0
        mov     dword [ebp-8H], 0
        cmp     dword [ebp-10H], 2
        jg      L_022
        mov     edx, dword [ebp+10H]
        mov     eax, edx
        add     eax, eax
        add     eax, edx
        shl     eax, 2
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        add     edx, eax
        mov     eax, dword [ebp-10H]
        mov     eax, dword [edx+eax*4]
        mov     dword [ebp-0CH], eax
L_022:  cmp     dword [ebp-10H], 2
        jg      L_023
        mov     eax, dword [ebp-10H]
        shl     eax, 4
        mov     edx, eax
        mov     eax, dword [ebp+0CH]
        add     edx, eax
        mov     eax, dword [ebp+10H]
        mov     eax, dword [edx+eax*4]
        mov     dword [ebp-8H], eax
L_023:  mov     eax, dword [ebp-0CH]
        imul    eax, dword [ebp-8H]
        add     dword [ebp-4H], eax
        add     dword [ebp-10H], 1
L_024:  mov     eax, dword [ebp-10H]
        cmp     eax, dword [ebp+14H]
        jle     L_021
        mov     eax, dword [ebp-4H]
        leave
        ret


maior_valor_diagonal_principal_mutiplicada:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     dword [ebp-10H], 4
        mov     dword [ebp-8H], 0
        cmp     dword [ebp-10H], 4
        jle     L_025
        mov     dword [ebp-10H], 4
L_025:  mov     dword [ebp-0CH], 0
        jmp     L_028

L_026:  push    dword [ebp-10H]
        push    dword [ebp-0CH]
        push    dword [ebp+0CH]
        push    dword [ebp+8H]
        call    multiplica_linha_por_coluna
        add     esp, 16
        mov     dword [ebp-4H], eax
        mov     eax, dword [ebp-4H]
        cmp     eax, dword [ebp-8H]
        jle     L_027
        mov     eax, dword [ebp-4H]
        mov     dword [ebp-8H], eax
L_027:  add     dword [ebp-0CH], 1
L_028:  mov     eax, dword [ebp-0CH]
        cmp     eax, dword [ebp-10H]
        jl      L_026
        mov     eax, dword [ebp-8H]
        leave
        ret


main:
        lea     ecx, [esp+4H]
        and     esp, 0FFFFFFF0H
        push    dword [ecx-4H]
        push    ebp
        mov     ebp, esp
        push    ecx
        sub     esp, 116

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        sub     esp, 4
        push    1
        lea     eax, [ebp-3CH]
        push    eax
        lea     eax, [ebp-6CH]
        push    eax
        call    preencher_matriz
        add     esp, 16
        sub     esp, 8
        push    5
        lea     eax, [ebp-6CH]
        push    eax
        call    multiplica_por_inteiro
        add     esp, 16
        sub     esp, 8
        lea     eax, [ebp-3CH]
        push    eax
        lea     eax, [ebp-6CH]
        push    eax
        call    maior_valor_diagonal_principal_mutiplicada
        add     esp, 16
        mov     dword [ebp-70H], eax
        sub     esp, 8
        push    dword [ebp-70H]
        push    L_033
        call    printf
        add     esp, 16
        mov     eax, 0
        mov     edx, dword [ebp-0CH]

        xor     edx, dword [gs:14H]
        jz      L_029
        call    __stack_chk_fail
L_029:  mov     ecx, dword [ebp-4H]
        leave
        lea     esp, [ecx-4H]
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_030:
        db 41H, 00H

L_031:
        db 25H, 30H, 32H, 64H, 20H, 00H

L_032:
        db 43H, 00H

L_033:
        db 52H, 65H, 73H, 75H, 6CH, 74H, 61H, 64H
        db 6FH, 20H, 43H, 3AH, 20H, 25H, 64H, 20H
        db 0AH, 00H


