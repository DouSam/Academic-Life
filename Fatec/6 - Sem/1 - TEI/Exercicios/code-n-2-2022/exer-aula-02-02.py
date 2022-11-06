import os
os.system('clear')

lisRes = []

for i in range(4):
    lisRes.append(int(input(f"Entre com a resistência {i + 1}: ")))

print(f"Soma: {sum(lisRes)}")
print(f"Maior: {max(lisRes)}")
print(f"Menor: {min(lisRes)}")