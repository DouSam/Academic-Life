from datetime import datetime


def ex1():
    sequencia = input("Insira a sequencia: ")
    lista = sequencia.split(",")
    tupla = tuple(lista)
    print(lista)
    print(tupla)

def ex2():
    tam = input("Insira o tamanho do array: ")
    i = int(tam.split(",")[0])
    j = int(tam.split(",")[1])

    print([[0 for x in range(i)] for y in range(j)])

def ex3():
    lista = input("Insira a lista: ").replace(" ", "").split(",")
    lista.sort()
    print(lista)

def ex4():
    sequencia = input("Insira a sequencia: ")
    numeros = 0
    letras = 0
    for i in sequencia:
        try:
            int(i)
            numeros += 1
        except:
            letras += 1
    print(f"Letras: {letras}")
    print(f"Numeros: {numeros}")

def ex5():
    sequencia = input("Insira a sequencia: ")
    lower = 0
    upper = 0
    for i in sequencia:
        if(i.isupper() and i.isalpha()):
            upper += 1
        elif(i.isalpha()):
            lower += 1
    
    print(f"Maiusculas {upper}")
    print(f"Minusculas {lower}")

def ex6():
    senha = input("Insira a senha: ")

    min = False # pelo menos uma minuscula
    dig = False # ao menos um digito num
    mai = False # ao menos uma maiscula
    sim = False # ao menos um simbolo
    tam = False # 6 >= x =< 12

    if len(senha) < 6 or len(senha) > 12:
        return False
    else:
        tam = True

    for i in senha:
        if(i.islower()):
            min = True
        
        if(i.isupper()):
            mai = True
        
        if(i.isdigit()):
            dig = True
        
        if(i.isalnum()):
            sim = True
    
    return min and dig and mai and sim and tam

def ex7():
    actual_date = datetime.now()
    print(actual_date)
    ano = actual_date.year
    print(ano)
    mes = actual_date.month
    print(mes)
    dia = actual_date.day
    print(dia)

    formated = actual_date.strftime("%d/%m/%Y")

    print(formated)

    formated = actual_date.strftime("%d de %B de %Y")

    print(formated)


def calc(n):
    resultado = []

    a,b = 0, 1
    while a < n:
        resultado.append(a)
        a, b = b, a + b
    return resultado

print(calc(100))