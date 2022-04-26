from pymprog import*

# dados de entrada
C = [5.2, 6.8, 7.1, 2.5] # custo
R = [0.22, 0.07, 0.55, 0.08] # requisitos

P = [[0.26, 0.01, 0.25, 0.1],
     [0.05, 0.05, 0.26, 0.02],
     [0.6, 0.75, 0.45, 0.24],
     [0.07, 0, 0.01, 0.01]] # percentuais de nutrientes

n = len(C) # número de ingredientes
m = len(R) # número de nutrientes

begin("barra")
# verbose(True)
x = var("x", n) # variáveis

# função objetivo
minimize(sum(C[i]*x[i] for i in range(n)))

# restrições
for j in range(2):
  sum(P[j][i]*x[i] for i in range(n)) >= R[j]

for j in range(2,m):
  sum(P[j][i]*x[i] for i in range(n)) <= R[j]

sum(x[i] for i in range(n)) == 1

solve()

print("valor ótimo = {:.2f}".format(vobj()))

for i in range(n):
  print("x{} = {:.3f}".format(i+1,x[i].primal))

end()