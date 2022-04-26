# Exercício 5

#from pymprog import*
import pymprog

# Dados de entrada
D = [[900, 1500, 1300],
     [700, 900, 800]] # demanda
C = [[1.5, 1.5, 2],
     [0.5, 0.5, 0.8]] # custo de produção por litro
CE = [[0.5, 0.25, 0],
      [0.25, 0.25, 0]] # custo de estoque
CP = [[200, 400, 400],
      [400, 500, 500]] # custo de preparação do tanque
T = [100/1000, 80/1000] # tempo de produção por litro
TL = [12, 8] # tempo de preparação do tanque
TD = [250, 320, 200] # disponibilidade do tanque por período

n = len(T) # número de bebidas
m = len(TD) # número de períodos
M = sum(D[i][j] for i in range(n) for j in range(m)) # M grande

begin("bebidas") # iniciando um modelo

A = iprod(range(n), range(m)) # cria índices para as variáveis x e s
x = var("x", A) # cria variável de produção x
s = var("s", A, bool) # cria variável de setup s

B = iprod(range(n), range(-1, m)) # cria índices para a variável y
y = var("y", B) # cria variável y de estoque

# função objetivo
minimize(sum(C[i][j] * x[i,j] + CE[i][j] * y[i,j] + CP[i][j] * s[i,j] for (i,j) in A))

# restrições
for (i,j) in A:
  x[i,j] + y[i,j-1] - y[i,j] == D[i][j] # atendimento da demanda


for i in range(n):
  y[i,-1] == 0 # estoque inicila nulo

for j in range(m):
  sum(T[i] * x[i,j] + TL[i] * s[i,j] for i in range(n)) <= TD[j] # disponibilidade do tanque

for (i,j) in A:
  x[i,j] <= M * s[i,j] # acoplamento entre x e s


# Resolvendo
solve()

print("Valor ótimo = {}".format(vobj()))
print()
print("y[1,0] = {:<10.2f}    y[2,0] = {}".format(y[0,-1].primal,y[1,-1].primal))
for (i, j) in A:
  print("x[{0},{1}] = {2:<10.2f}    y[{0},{1}] = {3}".format(i+1,j+1,x[i,j].primal,y[i,j].primal))

end()
