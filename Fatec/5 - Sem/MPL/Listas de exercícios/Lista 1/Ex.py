from pymprog import* # Importando a biblioteca

# Dados de entrada
# Parametros
C = [5.20, 6.8, 7.10, 2.50] # Custo por kilo de cada ingrediente
P = [
     [0.26, 0.05, 0.60, 0.07],
     [0.01, 0.05, 0.75, 0],
     [0.25, 0.26, 0.45, 0.01],
     [0.10, 0.02, 0.24, 0.01]
] # Percentual do nutriente para cada ingrediente
A = [1, 1, 0.55, 0.08] # Maximo do nutriente por barra
B = [0.22, 0.07, 0, 0] # Minimo do nutriente por barra

n = len(C) # Ingredientes
m = len(A) # Nutrientes

begin("Fabrica de Alimentos") # Inicia o modelo
verbose("True") # Demonstrar o modelo
# Variaveis de decisao
X = var("x",n, float) # Quantidade fabricada de cada ingrediente

# Funcao objetivo
minimize(sum(X[i] * C[i] for i in range(n)))

# Restricoes
for j in range(m): # Restricao de maximo do nutriente j
  sum(X[i] * P[i][j] for i in range(n)) <= A[j]

for j in range(m): # Restricao de minimo do nutriente j
  sum(X[i] * P[i][j] for i in range(n)) >= B[j]

for i in range(n): # Restricao de positividade
  X[i] >= 0

sum(X[i] for i in range(n)) == 1 # Restricao de unidade

solve() # Resolvendo o modelo

# Valor otimo, solução otima
print("Custo mínimo = {:.2f}".format(vobj()))

# Solução ótima
for i in range(n):
  print("Total utilizado do ingrediente {}: {:.2f}Kg".format(i + 1, X[i].primal))
end()