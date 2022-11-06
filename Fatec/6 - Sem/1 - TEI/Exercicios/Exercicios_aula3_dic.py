#Faça um programa capaz de gerar usernames e senhas para alunos da FATEC de Ribeirão Preto.
#O programa recebe como entrada o nome completo do aluno e produzir um username contendo:
#   •A primeira letra do nome e o sobrenome
#O resultado deve ser armazenado em um estrutura da sua preferência: Tupla, Lista, Dicionário ou Conjunto.
#O programa deve garantir que não sejam gerados. username duplicados
#As senhas provisórias deve conter no mínimo 8 caracteres (números, letras e símbolos) com máxima segurança.

import collections
import random

Aluno = collections.namedtuple("Aluno","username senha")
alunos = []
nomes = {}

letras = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
numeros = ['0','1','2','3','4','5','6','7','8','9']
simbolos = ['!','@','#','$','%','&','*','(',')']

while True:
    nome = input("Insira o nome do aluno (N) para parar: ")

    if nome == "N":
        break

    username = nome.split(" ")[0][0] + nome.split(" ")[-1]
    p = 1

    while nomes.get(username) != None:
        username = username = nome.split(" ")[0][0] + nome.split(" ")[-1] + str(p)
        p += 1
    
    p = 1

    senha = ""
    for i in range(4):
        senha += letras[random.randint(0,51)]
        senha += numeros[random.randint(0,9)]
        senha += simbolos[random.randint(0,8)]
    
    aluno = Aluno(username,senha)

    alunos.append(aluno)
    nomes[username] = nome

    print(aluno)

for aluno in alunos:
    print(nomes[aluno.username],end="\t\t")
    print(aluno.username,end="\t\t")
    print(aluno.senha,end="\n")