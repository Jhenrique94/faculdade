#include <stdio.h>
#include "tamanho.h"

void multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number)
{
  int c, l;

  for (l = 0; l < A_Linhas; l++) // for_linhas_mul
  {
    for (c = 0; c < A_Colunas; c++) // for_colunas_mul
    {
      X[l][c] = number * X[l][c];
    }
  }
}

int multiplica_linha_por_coluna(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas], int pos, int max)
{
  int c;
  int resultado = 0;

  for (c = 0; c <= max; c++) // for_mul_linha
  {
    if (c < A_Colunas && c < C_Linhas) // valor_nao_contido_na_matriz
    {
      resultado = resultado + (X[pos][c] * Y[c][pos]);
    }    
  }

  // printf("\n r: %d\n", resultado);

  return resultado;
}

int menor_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas])
{
  int tamanho_diagonal = A_Linhas;
  int c, aux;
  int resultado = -1;

  if (C_Colunas < tamanho_diagonal) // diagonal_eh_C_colunas
  {
    tamanho_diagonal = C_Colunas;
  }

  // printf("tam: %d\n", tamanho_diagonal);

  for (c = 0; c < tamanho_diagonal; c++) // for_item_diagonal
  {
    aux = multiplica_linha_por_coluna(X, Y, c, tamanho_diagonal);
    if (aux < resultado || resultado == -1)
    {
      resultado = aux;
    }
  }

  return resultado;
}