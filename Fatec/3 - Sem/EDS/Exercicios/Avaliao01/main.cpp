#include <iostream>
#include <cstdlib>
#include <string>
#include "Fila.cpp"

using namespace std;

//  Implemente um programa que implemente uma fila de impressão. 
//  Para cada arquivo a ser impresso devem ser armazenados: 
//  - id sequencial da impressão (começando em 1)
//  - nome do arquivo
//  - quantidade de folhas
//  Exceto o id sequencial, as outras informações devem ser digitadas pelo 
//  usuário. 
//  O programa também deve realizar um controle da quantidade de papel 
//  disponível na impressora, permitindo que o usuário 
//  realize a “inserção” de mais papel. Antes de inserir um novo documento na 
//  fila, o programa deve verificar se há papel suficiente na impressora para 
//  realizar a impressão. Se não houver papel suficiente, o programa não deve 
//  aceitar a impressão. Desenvolva métodos que:
//    a.	Permita inserir um arquivo na fila de impressão (retornar falso caso não haja papel);
//    b.	Remova um arquivo da fila da impressão (imprimir);
//    c.	Liste os arquivos da fila de impressão;
//    d.	Permita inserir mais folhas na impressora;
//    e.	Retorne o total de folhas disponíveis na impressora

// Podem realizar testes inserindo valores pré definidos.
// Podem implementar um menu com as operações.
// Podem enviar ao pgrader para correção.

// Boa prova a todos!

//Definindo cores para impressão
#define COLOR_VERMELHO     "\x1b[31m"
#define COLOR_VERDE        "\x1b[32m"
#define COLOR_AZUL         "\x1b[34m"
#define COLOR_RESET        "\x1b[0m"

int main() {
    int op=1, result = 0;

    int qtdFolhas = 0;

    string nomeArquivo, retorno;

    Fila impressora;

    while(op!=0){
        cout << COLOR_AZUL "\t\tMENU\n" COLOR_RESET;
        cout << COLOR_AZUL "1 - Inserir arquivo para impressao.\n" COLOR_RESET;
        cout << COLOR_AZUL "2 - Imprimir arquivo.\n" COLOR_RESET;
        cout << COLOR_AZUL "3 - Listar arquivos da fila de impressao.\n" COLOR_RESET;
        cout << COLOR_AZUL "4 - Inserir mais folhas na impressora.\n" COLOR_RESET;
        cout << COLOR_AZUL "5 - Total de folhas na impressora\n" COLOR_RESET;
        cout << COLOR_AZUL "Insira a opcao: " COLOR_RESET;
        cin >> op;
        switch (op)
        {
            case 1:
                cout << COLOR_AZUL "Insira o nome do arquivo: " COLOR_VERDE;
                cin >> nomeArquivo;
                cout << COLOR_AZUL "Insira a quantidade de folhas do arquivo: " COLOR_VERDE;
                cin >> qtdFolhas;
                if(impressora.inserir(nomeArquivo,qtdFolhas)){
                    cout << COLOR_VERDE "Impressao inserida com sucesso!\n" COLOR_RESET;
                }else{
                    cout << COLOR_VERMELHO "Sem folhas para realizar a impressao.\n" COLOR_RESET; 
                }
                break;
            case 2:
                result = impressora.imprimir();
                if(result){
                    cout << COLOR_VERDE "Fim da impressao.\n" COLOR_RESET;
                }else{
                    cout << COLOR_VERMELHO "Fila de impressao vazia.\n" COLOR_RESET;
                }
                break;
            case 3:
                retorno = impressora.listar();
                cout << COLOR_VERDE << (retorno == ""?COLOR_VERMELHO "Fila de impressao vazia.\n":retorno) << COLOR_RESET;
                break;
            case 4:
                cout << COLOR_AZUL "Insira a quantidade folhas a ser inseridas: ";
                cin >> qtdFolhas;
                result = impressora.inserirFolhas(qtdFolhas);
                if(result){
                    cout << COLOR_VERDE "Quantidade de folhas: "<< to_string(impressora.listarFolhas());
                    cout << COLOR_RESET "\n";
                }else{
                    cout << COLOR_VERMELHO "Quantidade inserida invalida.\n" COLOR_RESET;
                }
                break;
            case 5:
                cout << COLOR_VERDE << "Total de folhas: " << to_string(impressora.listarFolhas());
                cout << "\n" COLOR_RESET;
                break;
            default:
                break;
        }
    }

    return 0;
}