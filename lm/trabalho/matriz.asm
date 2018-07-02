global nasm_multiplica_por_inteiro
global nasm_menor_valor_diagonal_principal_mutiplicada

; dword = tamanho inteiro em C

SECTION .text

nasm_multiplica_por_inteiro:
        ; X     number  A_linhas   A_Colunas
        ; +8    +12     +16        +20

        ; l     c
        ; -4    -8
        enter   8, 0
        mov     dword [ebp - 4], 0      ; l = 0
        jmp     _for_linhas_mul

_body_for_linhas_mul:
        mov     dword [ebp - 8], 0      ; c = 0
        jmp     _for_colunas_mul

        _body_for_colunas_mul:
                mov     eax, dword [ebp - 4]    ; eax = l
                mov     ebx, dword [ebp + 16]
                mul     ebx                     ; eax = l * (A_Colunas)

                mov     ebx, dword [ebp + 8]    ; ebx = X 
                lea     ecx, [ebx + eax * 4]    ; ecx = X[l][0]
                mov     eax, dword [ebp - 8]    ; eax = c
                mov     eax, [ecx + eax * 4]    ; eax = X[l][c]
                mul     dword [ebp + 12]        ; eax = X[l][c] * 5
                mov     edx, eax                ; edx = X[l][c] * 5
                mov     eax, dword [ebp - 8]    ; eax = c
                mov     dword [ecx + eax * 4], edx ; X[l][c] = X[l][c] * 5

                add     dword [ebp - 8], 1      ; c++

        _for_colunas_mul:
                mov     edx, dword [ebp + 20]
                cmp     dword [ebp - 8], edx    ; c < A_Colunas
                jl      _body_for_colunas_mul
                add     dword [ebp - 4], 1      ; l++

_for_linhas_mul:
        mov     edx, dword [ebp + 16]
        cmp     dword [ebp - 4], edx            ; l < A_Linhas
        jl      _body_for_linhas_mul
        leave
        ret


nasm_multiplica_linha_por_coluna:
        ; X     Y       pos     max     A_Linhas  A_Colunas  C_Linhas  C_Colunas
        ; +8    +12     +16     +20     +24       28         +32       +36

        ; resultado     c
        ; -4            -8
        enter   8, 0
        mov     dword [ebp - 4], 0      ; resultado = 0
        mov     dword [ebp - 8], 0      ; c = 0
        jmp     _for_mul_linha

        _body_for_mul_linha:
                mov     edx, dword [ebp + 28]
                cmp     dword [ebp - 8], edx    ; c < A_Colunas
                jge     _valor_nao_contido_na_matriz
                mov     edx, dword [ebp + 32]
                cmp     dword [ebp - 8], edx    ; c < C_Linhas
                jge     _valor_nao_contido_na_matriz
                ; if (c < A_Colunas && c < C_Linhas)

                mov     eax, dword [ebp + 16]   ; eax = pos
                mov     ebx, dword [ebp + 28]
                mul     ebx                     ; eax = pos * (A_Colunas)

                mov     ebx, dword [ebp + 8]    ; ebx = X 
                add     eax, dword [ebp - 8]    ; eax = Xpos + c
                mov     ecx, [ebx + eax * 4]    ; ecx = X[pos][c]

                mov     eax, dword [ebp - 8]    ; eax = c
                mov     ebx, dword [ebp + 36]
                mul     ebx                     ; eax = c * (C_Colunas)

                mov     ebx, dword [ebp + 12]   ; ebx = Y
                add     eax, dword [ebp + 16]   ; eax = Yc + pos
                mov     eax, [ebx + eax * 4]    ; eax = Y[c][pos]
                mul     ecx

                add     dword [ebp - 4], eax
        _valor_nao_contido_na_matriz:
                add     dword [ebp - 8], 1      ; c++

_for_mul_linha:
        mov     eax, dword [ebp - 8]    ; c
        cmp     eax, dword [ebp + 20]   ; c < max
        jle     _body_for_mul_linha
        mov     eax, dword [ebp - 4]    ; return resultado
        leave
        ret     8


nasm_menor_valor_diagonal_principal_mutiplicada:
        ; X     Y       A_Linhas  A_Colunas  C_Linhas  C_Colunas
        ; +8    +12     +16       +20        +24       +28

        ; resultado     c       tamanho_diagonal
        ; -4            -8      -12
        ; nao precisa de aux, pois eax já armazena o resultado
        enter   12, 0

        mov     edx, dword [ebp + 16]
        mov     dword [ebp - 12], edx   ; tamanho_diagonal = A_linhas
        mov     dword [ebp - 4], -1     ; resultado = -1
        mov     edx, dword [ebp + 24]
        cmp     dword [ebp - 12], edx   ; se tamanho_diagonal > C_Colunas
        jle     _nao_altera_tamanho_diagonal
        mov     dword [ebp - 12], edx   ; tamanho_diagonal = C_Colunas

_nao_altera_tamanho_diagonal:
        mov     dword [ebp - 8], 0     ; c = 0
        jmp     _for_item_diagonal

        _body_for_item_diagonal:
                push    dword [ebp + 28]        ; C_Colunas
                push    dword [ebp + 24]        ; C_Linhas
                push    dword [ebp + 20]        ; A_Colunas
                push    dword [ebp + 16]        ; A_Linhas
                push    dword [ebp - 12]        ; tamanho_diagonal
                push    dword [ebp - 8]         ; c
                push    dword [ebp + 12]        ; Y
                push    dword [ebp + 8]         ; X
                call    nasm_multiplica_linha_por_coluna; eax = _multiplica_linha_por_coluna(X, Y, c, tamanho_diagonal, A_Linhas, A_Colunas, C_Linhas, C_Colunas)

                cmp     eax, dword [ebp - 4]
                jl      _menor_valor            ; se eax < resultado
                cmp     dword [ebp - 4], -1
                jnz     _proximo_valor          ; ou resultado == -1
        _menor_valor:
                mov     dword [ebp - 4], eax    ; resultado = eax
        _proximo_valor:
                add     dword [ebp - 8], 1      ; c++

_for_item_diagonal:
        mov     eax, dword [ebp - 8]
        cmp     eax, dword [ebp - 12]
        jl      _body_for_item_diagonal         ; c < tamanho_diagonal
        mov     eax, dword [ebp - 4]            ; return resultado
        leave
        ret


