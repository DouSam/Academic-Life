from math import prod
import random
import collections

# Exercicio 1
def main1():
    numbers = []
    for i in range(5):
        numbers.append(random.randrange(-1000,1000))
    print(f"Numeros: {numbers}")
    qtdPar(numbers)
    nImpar(numbers)
    soma(numbers)
    maior(numbers)
    menor(numbers)
    qtdPos(numbers)


def qtdPar(numeros):
    qtd = 0
    for numero in numeros:
        if numero % 2 == 0:
            qtd += 1
    print(f"Quantidade de números pares: {qtd}")

def qtdPos(numeros):
    qtd = 0
    for numero in numeros:
        if numero >= 0:
            qtd += 1
    print(f"Quantidade de números positivos: {qtd}")

def nImpar(numeros):
    print(f"Números impares: ")

    for numero in numeros:
        if numero % 2 != 0:
            print(numero,end=",")
    print("\n")

def maior(numeros):
    maior = numeros[0]
    for numero in numeros:
        if numero > maior:
            maior = numero
    print(f"Maior numero inserido: {maior}")

def menor(numeros):
    menor = numeros[0]
    for numero in numeros:
        if numero < menor:
            menor = numero
    print(f"Menor número inserido: {menor}")

def soma(numeros):
    soma = 0
    for numero in numeros:
        soma += numero
    print(f"Soma dos números inseridos: {soma}")

#main1()

# Exercicio 2

def main2():
    image = []

    for i in range(10):
        linha = []
        for j in range(10):
            linha.append(random.randint(0,255))
        image.append(linha)
    print(image)

#main2()

# Exercicio 3
def main3():
    Aluno = collections.namedtuple("Aluno","nome p1 p2")
    notas = []
    for i in range(6):
        print(f"Insira as informações do aluno {i+1}")
        nome = input("Nome: ")
        p1 = float(input("Nota da P1: "))
        p2 = float(input("Nota da P2: "))
        notas.append(Aluno(nome, p1, p2))
    
    print("Aluno\t\t1º Prova\t2º Prova\tMédia\t\tSituação")
    
    mediaTurma = 0
    qtdAprovados = 0
    qtdReprovados = 0

    for aluno in notas:
        media = (aluno.p1 + aluno.p2) / 2
        mediaTurma += media
        print(aluno.nome, end="\t\t")
        print(aluno.p1, end="\t\t")
        print(aluno.p2, end="\t\t")
        print(media, end="\t\t")
        if media > 6:
            print("Aprovado")
            qtdAprovados += 1
        else:
            print("Reprovado")
            qtdReprovados += 1
    
    print(f"Média da classe: {mediaTurma/6}")
    print(f"Quantidade aprovados: {qtdAprovados}")
    print(f"Quantidade reprovados: {qtdReprovados}")

#main3()

def main4():
    Produto = collections.namedtuple("Produto","nome preco")
    produtos = []
    for i in range(5):
        print(f"Insira as informações do produto {i+1}")
        produtos.append(Produto(input("Nome: "),float(input("Preço: "))))
    
    inf50(produtos)
    bet50100(produtos)
    media100(produtos)

def inf50(produtos):
    qtdP = 0
    for produto in produtos:
        if produto.preco < 50:
            qtdP += 1
    print(f"Quantidade de produtos com preço inferior a 50: {qtdP}")

def bet50100(produtos):
    nomes = []
    for produto in produtos:
        if produto.preco > 50 and produto.preco < 100:
            nomes.append(produto.nome)
    print(f"Produtos com valor entre 50 e 100: {nomes}")

def media100(produtos):
    soma = 0
    for produto in produtos:
        if produto.preco > 100:
            soma += produto.preco
    
    print(f"Média dos produtos com preco acima de 100: {soma/len(produtos)}")

#main4()

def checkPalindrome(palavra):
    if palavra == palavra[::-1]:
        return True
    else:
        return False

#print(checkPalindrome("a"))
#print(checkPalindrome("aabaa"))
#print(checkPalindrome("abac"))

# Exercicio 2 2

def main5():
    numerosOriginal = [int(input(f"Número {i}: ")) for i in range(15)]
    maiorNumero = max(numerosOriginal)
    numerosFinal = [numero / maiorNumero for numero in numerosOriginal]
    print(numerosFinal)

#main5()

def adjacentElementsProduct(array):
    maior = 0
    for i in range(len(array[:-1])):
        if array[i] * array[i+1] > maior:
            maior = array[i] * array[i+1]

    return maior

print(adjacentElementsProduct([3, 6, -2, 7, 7, 3]))