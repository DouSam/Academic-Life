# -*- coding: utf-8 -*-
"""Trabalho Final - S

Automatically generated by Colaboratory.

Original file is located at (PUBLIC for access)
    https://colab.research.google.com/drive/1ghFKotyyhWFlALHM6KRylfgD5QCTuGu6
"""

# Instalando a biblioteca PyMathProg
# !pip install pymprog

# Importando a biblioteca
from pymprog import* 
import time

# Abrindo o arquivo dados.txt 
linhas = [] # Array com as linhas do arquivo
with open('./Instancias/inst_60_47.txt') as arquivo:
    linhas = arquivo.read().splitlines()

# Dados de entrada
  # Quantidade de funcionario
n = int(linhas[0])
  # Numero minimo de funcionarios por turno
l = int(linhas[1])
  # Dias escolhidos por cada funcionario
d = linhas[2:] 
  # Ajustando as linhas para inteiro
d = list(linha.split(' ') for linha in d)
d = [list(map(int, linha)) for linha in d]
  # Maximo de dias para trabalho consecutivo
m = 6
  # Numero de folgas no mes
f = 5
  # Numero de dias do mes
nD = 30
  # Dias que sao feriados ou domingos
nF = [5, 12, 16, 19, 26]
  # Folgas nos feriados ou domingos
nP = 1

begin("Scheduling problem") # Inicializa o problema
#verbose(True) # demonstrar o modelo apos a forma padrao

start_time = time.time() # Mensurando o tempo de execucao

# Variaveis de decisao
  # Matriz funcionario x dia folgado
A = iprod(range(n),range(nD))
x = var('x', A, bool) # Onde 1 = folgou e 0 = trabalhou

  # Matriz para percorrer apenas os dias escolhidos
B = iprod(range(n), range(f-1))

# Funcao objetivo
  # Maximizando a quantidade de folgas que cairam no dia selecionado pelo funcionario
maximize(sum(x[func,d[func][dia] - 1] for func, dia in B), "Numero de folgas nos dias requisitados pelos funcionários") 

# Restrições
  # Ter f folgas por mes
for func in range(n):
  sum(x[func,dia] for dia in range(nD)) == f

  # Ter l funcionarios por turno
for dia in range(nD):
  sum(x[func,dia] for func in range(n)) <= n - l

  # Funcionario nao pode trabalhar mais que m dias consecutivos
for func,dia in A:
  if dia <= nD - m:
    sum(x[func, i] for i in range(dia, dia + m)) >= 1

  # Ao menos nP folgas devem ocorrer no domingo ou feriado
for func in range(n):
  sum(x[func, dia-1] for dia in nF) >= nP

solve() # Soluciona o problema

print("--- Tempo de execução %.2f segundos ---" % (time.time() - start_time))

#sensitivity() # Printar o relatório do problema de maneira mais clara

print("**********Parametros de Entrada*********")
print("Quantidade de funcionários: {}".format(n))
print("Quantidade minima de funcionarios por turno: {}".format(l))
print("Maximo de dias consecutivos trabalhados: {}".format(m))
print("Número de folgas no mês: {}".format(f))
print("Quantidade de dias no mês: {}".format(nD))
print("Quantidade minima de folgas em domingos/feriados: {}".format(nP))
print("Dias que são feriados ou domingos: ",end="")

for dia in nF:
  print("{} ".format(dia), end="")

print("\n\nTabela de Turnos")

print("\n\033[1;37mFuncionario/Dia |", end="")

for dia in range(1, nD+1):
  print("{:4d}".format(dia), end="")

print("")

for func in range(n):
  print("\033[0;37mFuncionario {:3d} |".format(func + 1), end="")
  for dia in range(nD):
    if dia + 1 in d[func]:
      print("\033[1;33m", end = "")
    else:
      print("\033[0;37m", end = "")
    print("{:4.0f}".format(x[func,dia].primal),end="")
  print("")

print("OBS: Em amarelo estão destacados os dias selecionados pelos funcionarios.")

print("\n\033[1;31mValor Ótimo: {}\033[0;37m".format(vobj()))

print("\n\n\033[1;34mDias escolhidos pelos funcionários")

for func in range(n):
  print("Funcionario {:3d} |".format(func + 1), end="")
  for dia in range(f-1):
    print("{:4.0f}".format(d[func][dia]),end="")
  print("")

end()

# http://pymprog.sourceforge.net/constr.html
# http://pymprog.sourceforge.net/advanced.html

# OBS: Removi os espaços em branco que estavam após as linhas nos arquivos
# isso estava complicando no momento de extrair as informações, na pasta instancias
# estao os arquivos já sem os espaços.
# pode ocorrer do print sair com '033[1' em alguns sistemas operacionais, caso 
# ocorra, execute direto no colab pelo link no inicio do arquivo, ele é PUBLICO!
# Relatório: https://docs.google.com/document/d/1WSCXwQepaz2Mzp772lQZlB1UEgd3uxW_Xkg7Qq050ww/edit?usp=sharing
# Apresentação: https://docs.google.com/presentation/d/1dnLKnUK_f-wqWOa_GhhuOsRBvgD-_4mOnTW5zOkPiz0/edit?usp=sharing