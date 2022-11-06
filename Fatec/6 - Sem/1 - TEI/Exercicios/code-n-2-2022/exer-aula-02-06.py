from email.mime import audio
import os
os.system('clear')

def continuar():
    x = 0
    while x == 0:
        opt = input("Deseja continuar [S / N]: ").upper()
        if opt == 'S':
            retorno = True
            x = 1
        elif opt == 'N':
            retorno = False
            x = 1
        else:
            print("Digite uma opção valida!!!")
    return retorno

def maior(lista):
    print(f"O maior número: {max(lista)}")


def menor(lista):
    print(f"O menor número: {min(lista)}")

def media(lista):
    print(f"A media: {sum(lista) / len(lista)}")

def quais_impares(lista):
    listAux = []
    for i in lista:
        if i % 2 != 0:
            listAux.append(i)
    print(f"Os impares são: {listAux}")

def qtd_pares(lista):
    count = 0
    for i in lista:
        if i % 2 == 0:
            count += 1
    print(f"Qtd de pares: {count}")

lista = []
aux = 0

while aux == 0:
    try:
        valor = int(input("Entre com o valor: "))
        opt = continuar()
        if opt:
            lista.append(valor)
        else:
            os.system("clear")
            lista.append(valor)
            print(f"Numeros: {lista}")
            qtd_pares(lista)
            quais_impares(lista)
            maior(lista)
            menor(lista)
            media(lista)
            aux = 1
    except ValueError:
        print("Entre com o valor correto!!")
    


