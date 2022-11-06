import os
os.system("clear")

peso = float(input("Entre com o peso: "))
altura = float(input("Entre com a altura: "))

imc = (peso/(altura*altura))

if(round(imc,2) <= 18.5):
    print(f"Imc: {round(imc,2)} abaixo do peso")
elif (round(imc,2) >= 18.6 and round(imc,2) <= 24.9):
    print(f"Imc: {round(imc,2)} Peso ideal ")
elif (round(imc,2) >= 25.0 and round(imc,2) <= 29.9):
    print(f"Imc: {round(imc,2)} Obesidade Grau I ")    
elif (round(imc,2) >= 30.0 and round(imc,2) <= 34.9):
    print(f"Imc: {round(imc,2)} Obesidade Grau I ")
else:            
    print(f"Imc: {round(imc,2)} Deu ruim ")