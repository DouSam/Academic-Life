import os
import collections
os.system('clear')

aluno = collections.namedtuple("Aluno", "nome nota1 nota2 media status")
alunos = []
qtdAprov = 0
qtdExame = 0
qtdRepro = 0
mediaTurma = 0

for i in range(4):
    nome = input("Entre com o nome: ")
    nota1 = float(input("Entre com a nota 1: "))
    nota2 = float(input("Entre com a nota 2: "))
    media = (nota1 + nota2) / 2

    if media >= 6:
        status = "Aprovado"
        qtdAprov += 1
    elif media >= 2:
        status = "Exame"
        qtdExame += 1
    else:
        status = "Reprovado"
        qtdRepro += 1

    mediaTurma += media
    
    alunos.append(aluno(nome, nota1, nota2, media, status))

for aluno in alunos:
    print(f"Aluno: {aluno.nome}\t nota1: {aluno.nota1}\t nota2: {aluno.nota2}\t media: {aluno.media}\t status: {aluno.status}")

mediaTurma /= len(alunos)

print(f"Media Turma: {mediaTurma}")
print(f"Aprovados: {qtdAprov}")
print(f"Reprovados: {qtdRepro}")
print(f"Exame: {qtdExame}")