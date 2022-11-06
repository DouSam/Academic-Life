# Exercicio 1
base = float(input("Insira a base: "))
altura = float(input("Insira a altura: "))
area = (base * altura) / 2
print(area)

# Exercicio 2
altura = float(input("Altura: "))
peso = float(input("Peso: "))
imc = peso / ( altura * altura )

if imc < 18.5:
  print("Abaixo do peso normal")
elif imc < 24.9:
  print("Peso normal")
elif imc < 29.9:
  print("Excesso de peso")
elif imc < 34.9:
  print("Obesidade classe I")
elif imc < 39.9:
  print("Obeisdade classe II")
else:
  print("Obesidade classe III")

# Exercicio 3
valor = float(input("Valor do produto: "))
valorAjustado = round(valor * 1.12,2)
print(valorAjustado)