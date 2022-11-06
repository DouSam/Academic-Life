# Exercicio 1
while True:
    try:
        peso = float(input("Insira o peso: "))
        altura = float(input("Insira a altura: "))
        imc = peso / (altura * altura)
        print(f"IMC : {peso}")
        resp = input("Deseja continuar? (N/S)")
        if resp == "N":
            break
    except:
        print("Insira um número.")

