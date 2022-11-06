import os
os.system('clear')

f = open("arquivo.txt", "r", encoding='utf8')

todas = f.read()
print(todas)
f.close()