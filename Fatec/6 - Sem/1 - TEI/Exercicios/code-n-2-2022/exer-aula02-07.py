import os
from turtle import ht
os.system('clear')

def curriculo(nome, endereco):
    html = f"""
    <html>
        <body>
            <h1>Meu Curriculo</h1>
            Nome: {nome}<br>
            Endereço: {endereco}
        </body>
    </html>"""

    htmlFile = open("teste.html", "w", encoding="utf8")
    htmlFile.write(html)
    htmlFile.close()

    print(html)

nome = input("Entre com o nome: ")
endereco = input("Entre com o endereço: ")

curriculo(nome, endereco)