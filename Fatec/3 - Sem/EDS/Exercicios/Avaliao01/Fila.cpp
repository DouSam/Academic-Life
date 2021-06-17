#include <cstdlib>
#include <string>
#include "Fila.h"
#define COLOR_VERDE        "\x1b[32m"
#define COLOR_RESET        "\x1b[0m"
Fila::Fila() {
    inicio = NULL;
    fim = NULL;
    qtdFolhaImp = 0;
    id = 1;
}

bool Fila::vazia() {
    return (inicio == NULL);
}

bool Fila::cheia() {
    return false;
}

bool Fila::inserir(string nome,int qtdFolhas) {
    // Inserir um arquivo na fila de impressão;
    // Altere o método inserir:
    if(listarFolhas() < qtdFolhas || qtdFolhas < 1)
        return false;
    PonteiroElemento p;
    p = new elemento;
    p->qtdFolha = qtdFolhas;
    p->idImpressao = id;
    p->nomeImpressao = nome;

    if (vazia()) {
        inicio = p;
        fim = p;
    } else {
        fim->proximoElemento = p;
        fim = p;
    }
    p->proximoElemento = NULL;
    id++;
    qtdFolhaImp -= qtdFolhas;
    return true;
}

bool Fila::remover(int &id,string &nome,int &qtdFolhas) {
    // Remover um arquivo da fila da impressão (imprimir);
    // Altere o método remover:
    PonteiroElemento p;
    if (vazia())
        return false;

    id = inicio->idImpressao;
    nome = inicio->nomeImpressao;
    qtdFolhas = inicio->qtdFolha;

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
    if(vazia()){
        return "";
    }

    string ret = "",nomeAux;
    Fila aux;

    int idAux,qtdFolhaAux;

    while(!vazia()){
        ret += to_string(inicio->idImpressao) + " - " + inicio->nomeImpressao + " - " + to_string(inicio->qtdFolha) + "\n";
        remover(idAux,nomeAux,qtdFolhaAux);
        aux.id = idAux;
        aux.inserirFolhas(qtdFolhaAux+1);
        aux.inserir(nomeAux,qtdFolhaAux);
    }

    while(!aux.vazia()){
        aux.remover(idAux,nomeAux,qtdFolhaAux);
        id = idAux;
        inserirFolhas(qtdFolhaAux);
        inserir(nomeAux,qtdFolhaAux);
    }
    return ret;
}

bool Fila::imprimir(){
    int id, qtdFolha;
    string nome;
    if(vazia())
        return false;
    
    remover(id,nome,qtdFolha);
    // <idImpressao2> - <nomeArquivo2> - <folhas2>\n
    cout << COLOR_VERDE + to_string(id) + " - " + nome + " - " + to_string(qtdFolha) + COLOR_RESET;
    cout << endl;
    return true;
}

bool Fila::inserirFolhas(int auxFolhas) {
    // Inserir mais folhas na impressora;
	// Seu código aqui	
    if(auxFolhas < 1){
        return false;
    }
    qtdFolhaImp += auxFolhas;
    return true;
}

int Fila::listarFolhas() {
    // Retorna o total de folhas disponíveis na impressora;
	// Seu código aqui
   return qtdFolhaImp;
}

