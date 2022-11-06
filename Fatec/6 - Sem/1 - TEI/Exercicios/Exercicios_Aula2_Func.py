def main():
    numeros = []
    while True:
        numero = input("Insira o próximo numero ou P para parar: ")
        if numero == "P" and len(numeros) > 0:
            qtdPar(numeros)
            qtdImpar(numeros)
            maior(numeros)
            menor(numeros)
            media(numeros)
            break
        
        if numero == "P":
            break

        try:
            numeros.append(float(numero))
        except:
            print("Insira um numero valido")

def qtdPar(numeros):
    qtd = 0
    for numero in numeros:
        if numero % 2 == 0:
            qtd += 1
    print(f"Quantidade de números pares: {qtd}")

def qtdImpar(numeros):
    qtd = 0
    for numero in numeros:
        if numero % 2 != 0:
            qtd += 1
    print(f"Quantidade de números impares: {qtd}")

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

def media(numeros):
    soma = 0
    qtdN = 0
    for numero in numeros:
        qtdN += 1
        soma += numero
    print(f"Média dos números inseridos: {soma/qtdN}")

def main2():
    print("Insira os dados para preenchimento do curriculo")
    dados = {}
    dados["nome"] = input("Nome: ")
    dados["endereco"] = input("Endereço: ")
    dados["telefone"] = input("Telefone: ")
    dados["email"] = input("E-Mail: ")
    dados["escolaridade"] = input("Escolaridade: ")
    dados["experiencia"] = input("Experiência: ")
    print("Aguarde enquanto o arquivo html é gerado...")

    file = open("ex.html", "r")

    patern = [file.read()]
    
    file.close()

    insereDadosPessoais(patern,dados)
    insereDadosProfissionais(patern,dados)

    file = open("curriculum.html", "a")
    file.write(patern[0])
    file.close

    print("Arquivo salvo")


def insereDadosPessoais(patern,dados):
    patern[0] = patern[0].replace("(1)",dados["nome"])
    patern[0] = patern[0].replace("(2)",dados["endereco"])
    patern[0] = patern[0].replace("(3)",dados["telefone"])
    patern[0] = patern[0].replace("(4)",dados["email"])
    patern[0] = patern[0].replace("(5)",dados["experiencia"])

def insereDadosProfissionais(patern, dados):
    patern[0] = patern[0].replace("(6)",dados["experiencia"])

#main2()
#main()