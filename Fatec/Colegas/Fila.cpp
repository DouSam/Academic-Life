#include "Fila.h"

Fila::Fila() {
    qtd_total = 100;
    inicio = NULL;
    fim = NULL;
}

bool Fila::vazia() {
    return (inicio == NULL);
}

bool Fila::cheia() {
    return false;
}

bool Fila::inserir(string x, int y, int i) {
    // Inserir um arquivo na fila de impressão;
    // Altere o método inserir:
    if((qtd_total - i) <= 0){
        return false;
    }else{
        PonteiroElemento p;
        p = new elemento;
        p->nome_arq = x;
        p->folha_usa = y;
        p->id_seq = i;
        qtd_total -= i;

        if (vazia()) {
            inicio = p;
            fim = p;
        } else {
            fim->proximoElemento = p;
            fim = p;
        }
        p->proximoElemento = NULL;
        return true;
    }
}

bool Fila::remover(string &x, int &y, int &i) {
    // Remover um arquivo da fila da impressão (imprimir);
    // Altere o método remover:
    PonteiroElemento p;
    if (vazia())
        return false;

    //auxValor = inicio->valor;

    p = inicio;
    inicio = inicio->proximoElemento;
    delete p;
    if (inicio == NULL)
        fim = NULL;
    return true;
}

string Fila::listar() {
	// Implementar listagem da fila de impressão;
    // Retornar string no formato:
	// <idImpressao1> - <nomeArquivo1> - <folhas1>\n
	// <idImpressao2> - <nomeArquivo2> - <folhas2>\n
	//
	// Seu código aqui	
    Fila auxFila;
    string auxNome;
    int auxPapel;
    int auxId;
    string ret;
    ret = "";
    while (remover(auxNome, auxPapel, auxId)) {
        auxFila.inserir(auxNome, auxPapel, auxId);
        ret = ret + auxNome + " - " +  to_string(auxPapel) + " - Id:" + to_string(auxId) + "\n";
    }

    while (auxFila.remover(auxNome, auxPapel, auxId)) {
        inserir(auxNome, auxPapel, auxId);
    }
    return ret;
}

bool Fila::inserirFolhas(int auxFolhas) {
    // Inserir mais folhas na impressora;
	// Seu código aqui	
    cout << "* * * * Inserindo Folhas * * * */n";
    cout << "Quantidade de folhas disponíveis anteriormente: " << qtd_total;
    qtd_total += auxFolhas;
    cout << "Quantidade de folhas disponíveis: " << qtd_total << endl;
    return true;
}

int Fila::listarFolhas() {
    // Retorna o total de folhas disponíveis na impressora;
	// Seu código aqui
    int aux;
    aux = qtd_total;
    return aux;
}

