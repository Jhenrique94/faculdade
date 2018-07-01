#include <stdio.h>
#include "tamanho.h"

void multiplica_por_inteiro(int X[A_Linhas][A_Colunas], int number)
{
  int c, l;

  for (l = 0; l < A_Linhas; l++)
  {
    for (c = 0; c < A_Colunas; c++)
    {
      X[l][c] = number * X[l][c];
    }
  }
}

int multiplica_linha_por_coluna(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas], int pos, int max)
{
  int c;
  int x, y;
  int resultado = 0;

  for (c = 0; c <= max; c++)
  {
    x = 0;
    y = 0;
    if (c < A_Colunas)
    {
      x = X[pos][c];
    }

    if (c < C_Linhas)
    {
      y = Y[c][pos];
    }
    // printf("X[%d][%d]: %d \t Y[%d][%d]: %d \n", pos, c, x, c, pos, y);
    resultado = resultado + (x * y);
  }

  // printf("\n r: %d\n", resultado);

  return resultado;
}

int maior_valor_diagonal_principal_mutiplicada(int X[A_Linhas][A_Colunas], int Y[C_Linhas][C_Colunas])
{
  int tamanho_diagonal = A_Linhas;
  int c, aux;
  int resultado = -1;

  if (C_Colunas < tamanho_diagonal)
  {
    tamanho_diagonal = C_Colunas;
  }

  // printf("tam: %d\n", tamanho_diagonal);

  for (c = 0; c < tamanho_diagonal; c++)
  {
    aux = multiplica_linha_por_coluna(X, Y, c, tamanho_diagonal);
    if (aux < resultado || resultado == -1)
    {
      resultado = aux;
    }
  }

  return resultado;
}