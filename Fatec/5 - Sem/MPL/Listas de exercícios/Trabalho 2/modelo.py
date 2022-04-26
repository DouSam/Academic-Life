# TRABALHO 2
# https://colab.research.google.com/drive/18FLz8ITSHDu9b7TDHUmANKJrGVMVnxuX#scrollTo=tBStR-zGKBvc&line=1&uniqifier=1
from pymprog import *

# Dados de entrada
E = [1, 2, 5, 3, 2, 6, 3, 2] # Quantidade de barcos encomendados para o mes i

n = len(E) # Numero de meses

begin("Construtor de Barcos") # Inicia o modelo
#verbose("True") # Demonstrar o modelo

x = var("x", n, int) # quantidade de barcos construído no mês i
y = var("y", range(-1,n), int) # quantidade de barcos armazenados no mês i
c = var("c", n, bool) # 1 se construido barco no mes i, 0 se contrario
M = sum(E[i] for i in range(n)) 

# Funcao objetiva
minimize(sum(x[i] * 10000 + c[i] * 4000 + y[i] * 1000 for i in range(n)))

# Restrições

for i in range(n):
  x[i] + y[i-1] - y[i] == E[i] # atendimento da encomenda

for i in range(n):
  x[i] <= 4 # maximo de barcos construidos em um mes

for i in range(n):
  y[i] <= 3 # maximo de barcos estocados em um mes

for i in range(n):
  x[i] <= M * c[i] # acoplamento entre x e c

y[-1] == 0 # inicia o estoque em 0

solve()

print("Valor ótimo = {}".format(vobj()))

for i in range(n):
  print("Quantidade de barcos contruídos - estocados no mês x[{}]: {} - {}".format(i+1, x[i].primal, y[i].primal))

end()

# http://pymprog.sourceforge.net/index.html