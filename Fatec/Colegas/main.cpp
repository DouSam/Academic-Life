#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

#include "Fila.cpp"

//  Implemente um programa que implemente uma fila de impressão. 
//  Para cada arquivo a ser impresso devem ser armazenados: 
//  - id sequencial da impressão (começando em 1)
//  - nome do arquivo
//  - quantidade de folhas
//  Exceto o id sequencial, as outras informações devem ser digitadas pelo 
//  usuário. O programa também deve realizar um controle 
//  da quantidade de papel disponível na impressora, permitindo que o usuário 
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

int main() {
  
  char sair;
  int opMenu, folhas;
  string nome;
  int qtd_folhas, id = 0;
  Fila impressao;

  
  do {
        system("cls");
        cin.ignore();
        cout << "1 - Inserir arquivo a ser impresso\n";
        cout << "2 - Remover um arquivo da Fila de Impressão\n";
        cout << "3 - Listar arquivos na Fila de Impressão\n";
        cout << "4 - Inserir mais folhas na Impressora\n";
        cout << "5 - Mostrar o total de folhas disponíveis na impressora\n";
        cout << "0 - Sair";
        
        cin >> opMenu;
        

        switch (opMenu) {
        case 1:
            cout << "\n * * * * Inserindo Arquivo * * * *\n";
            cout << "\nDigite o nome do arquivo:\n";
            getline(cin >> ws, nome);

            cout << "\nDigite a quantidade de folhas usada:\n";
            cin >> qtd_folhas;
            id++;
            if(impressao.inserir(nome, qtd_folhas, id)){
                cout << "Inserção concluída com sucesso!\n";
            }else{
                cout << "Impossível inserir arquivo\n";
                cout << "Quantidade insuficiente de folhas\n";
            }
            break;

        case 2:
            cout << "\n * * * * Removendo Arquivo * * * *\n";
            if (impressao.remover(nome, qtd_folhas, id)) 
                cout << "\nNome do Arquivo: " << nome << " - Quantidade de Folhas: " << qtd_folhas << " - id: " << id << "\n";
            break;
        case 3:
            cout << "\n * * * * Listando Arquivos da Fila de Impressão * * * *\n";
            cout << impressao.listar() << "\n\n";
            break;

        case 4:
            cout << "\n * * * * Inserindo mais Folhas * * * *\n";
            cout << "Digite a quantidade de folhas que deseja inserir: \n";
            cin >> folhas;
            impressao.inserirFolhas(folhas);
            break;
        
        case 5:
            cout << "\n * * * * Quantidade de Folhas Disponíveis * * * *\n";
            cout << "A quantidade de folhas disponíveis é: " << impressao.listarFolhas();
            break;
        }
        
    }while(opMenu != 0);
}