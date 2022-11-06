# Exercicio 1
nomeProduto = input('Digite o nome do produto: ')
valorProduto = float(input('Digite o valor do produto: '))
if valorProduto < 0:
    print('Atenção: valor inserido é negativo')

desconto = 0
if valorProduto >= 50 and valorProduto < 200:
    desconto = 0.05
elif valorProduto >= 200 and valorProduto < 500:
    desconto = 0.06
elif valorProduto >= 500 and valorProduto < 1000:
    desconto = 0.07
elif valorProduto >= 1000:
    desconto = 0.08

print(f'Produto: {nomeProduto}\nValor original: {valorProduto}\nValor com desconto: {valorProduto - (valorProduto * desconto)}')

# Exercicio 2
resistencia = []

resistencia.append(float(input('Digite o valor da resistência 1: ')))
menorResistencia = resistencia[0]
maiorResistencia = resistencia[0]

for i in range(3, 5):
    resistencia.append(float(input('Digite o valor da resistência ' + str(i) + ': ')))
    if resistencia[i-1] < menorResistencia:
        menorResistencia = resistencia[i-1]
    elif resistencia[i-1] > maiorResistencia:
        maiorResistencia = resistencia[i-1]

print("Resistências:")
for i in resistencia:
    print(str(i) + " ohms, ", end="")
print("\nA maior resistência é " + str(maiorResistencia) + " ohms\nA menor resistência é " + str(menorResistencia) + " ohms\nA resistência equivalente é " + str(sum(resistencia)/len(resistencia)) + " ohms")

# Exercicio 3
n = input("Digite um número: ")
print("Tabuada do " + n + ":")
for i in range(1, 11):
    print(n + " x " + str(i) + " = " + str(int(n) * i))

# Exercicio 4
def centuryFromYear(year):
    return (year - 1) // 100 + 1

year = int(input('Insert year: '))

century = centuryFromYear(year)
print(century)