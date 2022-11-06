import os
import random
from re import L
os.system('clear')

def gerarNumeros():
    return random.randint(0, 255)

def popularMatriz():
    matriz = []

    for i in range(10):
        linha = []
        for j in range(10):
            linha.append(gerarNumeros())
        
        matriz.append(linha)
    return matriz

def imprimir(matriz):
    for i in range(10):
        for j in range(10):
            print(matriz[i][j], end='\t')

        print("")

matriz = popularMatriz()
imprimir(matriz)