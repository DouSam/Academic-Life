import os
os.system("clear")

num = int(input("Entre com o valor: "))

for i in range(1, 11):
    print(f"{num} x {i} = {num * i}")