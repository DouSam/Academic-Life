import os
os.system('clear')

produto = input("Entre com o produto: ")
vProduto = float(input("Entre com o valor: "))

desc = 0

if vProduto <= 0.0:
    print(f"Produto {produto} com valor errado {vProduto}")

elif 50 <= vProduto < 200: 
    desc = vProduto * 0.05
elif 200 <= vProduto < 500: 
    desc = vProduto * 0.06
elif 500 <= vProduto < 1000: 
    desc = vProduto * 0.07
elif vProduto >= 1000: 
    desc = vProduto * 0.08

if vProduto > 0:
    print(f"Produto: {produto} de R${vProduto} para R${round((vProduto-desc),2)}")



