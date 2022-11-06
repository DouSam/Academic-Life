import collections
import json
import os

op = -1
codigo = 1
fator_venda = 1.25
lista_produtos = []
Produto = collections.namedtuple("Produto","codigo nome valor_compra valor_venda quantidade")


def cadastrarProduto():
    global codigo
    nome = input("Insira o nome do produto: ")
    valorC = float(input("Insira o valor de compra: "))
    valorV = fator_venda * valorC
    qtdE = int(input("Insira a quantidade em estoque: "))

    lista_produtos.append(Produto(codigo,nome,valorC,valorV,qtdE))
    codigo += 1

def relatorioProdutos():
    for produto in lista_produtos:
        print(f"Codigo: {produto.codigo} \tNome: {produto.nome} \t\tValor de Compra: {produto.valor_compra} \tValor de Venda: {produto.valor_venda} \tQuantidade em Estoque: {produto.quantidade}")

def relatorioEstoque():
    for produto in lista_produtos:
        if(produto.quantidade <= 5):
            print(f"Codigo: {produto.codigo} \tNome: {produto.nome} \t\tValor de Compra: {produto.valor_venda} \tValor de Venda: {produto.valor_venda} \tQuantidade em Estoque: {produto.quantidade}")

def exportarDados():
    f = open("av.json","w+")
    json.dump([produto._asdict() for produto in lista_produtos],f, indent=4)
    f.close()

while(op != 0):
    print("Varejão do João")
    print("[1] Cadastrar produto")
    print("[2] Relatório de Produtos")
    print("[3] Relatório de Estoque Baixo")
    print("[4] Exportar Dados")
    print("[0] Sair")

    op = int(input("Insira a opção: "))

    os.system("cls")

    lista_produtos.sort(key=lambda produto: produto.nome)

    match op:
        case 1:
            cadastrarProduto()
        case 2:
            relatorioProdutos()
        case 3:
            relatorioEstoque()
        case 4:
            exportarDados()