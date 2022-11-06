import os
os.system('clear')

def pares(lista):
    return[x for x in lista if x % 2 == 0]

def impares(lista):
    return[x for x in lista if x % 2 ]

def positivos(lista):
    return[x for x in lista if x > 0]

vet = [85, 47, -96, 142, 544, 564, 7, 1]

print(f'Lista: {vet}')
print(f'Pares: {pares(vet)}')
print(f'Impares: {impares(vet)}')
print(f'Soma: {sum(vet)}')
print(f'Maior: {max(vet)}')
print(f'Menor: {min(vet)}')
print(f'Positivos: {positivos(vet)}')