import os
os.system('clear')

while True:
    try:
        altura = float(input("Entre com a altura: "))
        peso = float(input("Entre com o peso: "))
        imc = peso / (altura ** 2)
        print(f"IMC: {round(imc, 2)}")
        sair = input("Digite S para continuar ou N para sair: ").upper()
        if sair == 'N':
            break
    except ValueError as erro:
        print(erro)
        print("Valor invalido")
