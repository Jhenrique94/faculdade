.global gas_multiplica_por_inteiro
.global gas_menor_valor_diagonal_principal_mutiplicada

.text

gas_multiplica_por_inteiro:
        # X     number  A_linhas   A_Colunas
        # +8    +12     +16        +20

        # l     c
        # -4    -8
        push    %ebp 
        mov     %esp, %ebp
        sub     $8, %esp

        push    %eax    # pusha
        push    %ebx
        push    %ecx
        push    %edx

        movl    $0, -4(%ebp)      # l = 0
        jmp     _for_linhas_mul

_body_for_linhas_mul:
        movl     $0, -8(%ebp)     # c = 0
        jmp     _for_colunas_mul

        _body_for_colunas_mul:
                movl    -4(%ebp), %eax          # eax = l
                movl    16(%ebp), %ebx
                imul    %ebx, %eax              # eax = l * (A_Colunas),

                movl    8(%ebp), %ebx           # ebx = X 
                lea     (%ebx, %eax, 4), %ecx   # ecx = X[l][0]
                movl    -8(%ebp), %eax          # eax = c
                imul    $4, %eax
                add     %eax, %ecx
                movl    (%ecx), %eax            # eax = X[l][c]
                imul    12(%ebp), %eax          # eax = X[l][c] * 5
                movl    %eax, %edx              # edx = X[l][c] * 5
                mov     -8(%ebp), %eax          # eax = c
                movl     %edx, (%ecx)           # X[l][c] = X[l][c] * 5

                add     $1, -8(%ebp)            # c++

        _for_colunas_mul:
                mov     20(%ebp), %edx
                cmp     %edx, -8(%ebp)          # c < A_Colunas
                jl      _body_for_colunas_mul
                add     $1, -4(%ebp)            # l++

_for_linhas_mul:
        mov     16(%ebp), %edx
        cmp     %edx, -4(%ebp)                  # l < A_Linhas
        jl      _body_for_linhas_mul

        pop     %edx    # popa
        pop     %ecx
        pop     %ebx
        pop     %eax
        mov     %ebp, %esp
        pop     %ebp   
        ret

gas_multiplica_linha_por_coluna:
        # X     Y       pos     max     A_Linhas  A_Colunas  C_Linhas  C_Colunas
        # +8    +12     +16     +20     +24       28         +32       +36

        # resultado     c
        # -4            -8
        push    %ebp 
        mov     %esp, %ebp
        sub     $8, %esp

        push    %ebx
        push    %ecx
        push    %edx

        movl    $0, -4(%ebp)                   # resultado = 0
        movl    $0, -8(%ebp)                   # c = 0
        jmp     _for_mul_linha

        _body_for_mul_linha:
                movl    28(%ebp), %edx
                cmp     %edx, -8(%ebp)         # c < A_Colunas
                jge     _valor_nao_contido_na_matriz
                movl    32(%ebp), %edx
                cmp     %edx, -8(%ebp)         # c < C_Linhas
                jge     _valor_nao_contido_na_matriz
                /* if (c < A_Colunas && c < C_Linhas) */

                movl    16(%ebp), %eax          # eax = pos
                movl    28(%ebp), %ebx
                imul    %ebx, %eax              # eax = pos * (A_Colunas)

                movl    8(%ebp), %ebx           # ebx = X 
                add     -8(%ebp), %eax          # eax = Xpos + c
                imul    $4, %eax
                add     %ebx, %eax
                movl    (%eax), %ecx             # ecx = X[pos][c]

                movl    -8(%ebp), %eax          # eax = c
                movl    36(%ebp), %ebx
                imul    %ebx, %eax              # eax = c * (C_Colunas)

                movl    12(%ebp), %ebx          # ebx = Y
                add     16(%ebp), %eax          # eax = Yc + pos
                imul    $4, %eax
                add     %ebx, %eax
                movl    (%eax), %eax             # eax = Y[c][pos]

                imul    %ecx, %eax

                add     %eax, -4(%ebp)
        _valor_nao_contido_na_matriz:
                add     $1, -8(%ebp)             # c++

_for_mul_linha:
        movl    -8(%ebp), %eax                  # c
        cmp     20(%ebp), %eax                  # c < max
        jle     _body_for_mul_linha
        movl    -4(%ebp), %eax     # return resultado

        pop     %edx
        pop     %ecx
        pop     %ebx
        mov     %ebp, %esp
        pop     %ebp
        ret


gas_menor_valor_diagonal_principal_mutiplicada:
        # X     Y       A_Linhas  A_Colunas  C_Linhas  C_Colunas
        # +8    +12     +16       +20        +24       +28

        # resultado     c       tamanho_diagonal
        # -4            -8      -12
        # nao precisa de aux, pois eax já armazena o resultado
        push    %ebp 
        mov     %esp, %ebp
        sub     $12, %esp

        push    %ebx
        push    %ecx
        push    %edx

        movl    16(%ebp), %edx
        movl    %edx, -12(%ebp)         # tamanho_diagonal = A_linhas
        movl    $-1, -4(%ebp)           # resultado = -1
        movl    24(%ebp), %edx
        cmp     %edx, -12(%ebp)         # se tamanho_diagonal > C_Colunas
        jle     _nao_altera_tamanho_diagonal
        movl    %edx, -12(%ebp)         # tamanho_diagonal = C_Colunas

_nao_altera_tamanho_diagonal:
        movl    $0, -8(%ebp)             # c = 0
        jmp     _for_item_diagonal

        _body_for_item_diagonal:
                push    28(%ebp)        # C_Colunas
                push    24(%ebp)        # C_Linhas
                push    20(%ebp)        # A_Colunas
                push    16(%ebp)        # A_Linhas
                push    -12(%ebp)       # tamanho_diagonal
                push    -8(%ebp)        # c
                push    12(%ebp)        # Y
                push    8(%ebp)         # X
                call    gas_multiplica_linha_por_coluna# eax = _multiplica_linha_por_coluna(X, Y, c, tamanho_diagonal, A_Linhas, A_Colunas, C_Linhas, C_Colunas)
                add     $32, %esp
                
                cmp     -4(%ebp), %eax
                jl      _menor_valor            # se eax < resultado
                movl    $-1, %edx
                cmp     %edx, -4(%ebp)
                jnz     _proximo_valor          # ou resultado == -1
        _menor_valor:
                mov     %eax, -4(%ebp)          # resultado = eax
        _proximo_valor:
                add     $1, -8(%ebp)      # c++

_for_item_diagonal:
        mov     -8(%ebp), %eax
        cmp     -12(%ebp), %eax
        jl      _body_for_item_diagonal         # c < tamanho_diagonal
        mov     -4(%ebp), %eax                  # return resultado

        pop     %edx
        pop     %ecx
        pop     %ebx
        mov     %ebp, %esp
        pop     %ebp   
        ret
