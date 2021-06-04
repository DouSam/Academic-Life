#include <string>
#include "Lista.h"

Lista::Lista() {
    contador = 0;
    for (int i = 0 ; i < capacidade ; i ++) {
        elementos[i] = 0;
    }
}


bool Lista::vazia() {
    return contador == 0;
}


bool Lista::cheia() {
    return contador == capacidade;
}

string Lista::listar() {
    string ret = "";
    for (int i = 0 ; i < contador ; i ++) {
        ret = ret + "[" + to_string(elementos[i]) + "] ";
    }
    ret = ret;
    return ret;
}

bool Lista::inserir(int p, int x) {
    // Inserção de elemento em determinada posição.
    // Esta posição deve ser um valor entre 1 (primeiro elemento da lista)
    // e último + 1 (após o último elemento da lista).
    // As entradas posteriores ao elemento inserido devem ter suas posições 
    // incrementadas em uma unidade.
    // Seu código aqui

    if(cheia() || (p < 1 || p > contador+1)){
        return false;
    }

    if(contador == (p-1)){
        elementos[contador] = x;
        contador++;
        return true;
    }

    int aux = elementos[p-1];
    for(int i = contador;i>=p;i--){
        elementos[i] = elementos[i-1];
    }
    elementos[p-1] = x;
    contador++;
    return true;
}

bool Lista::remover(int p, int &x) {
    // Remoção de elemento em determinada posição.
    // Esta posição deve ser um valor entre 1 (primeiro elemento da lista)
    // e último (último elemento da lista).
    // As entradas posteriores ao elemento removido devem ter suas posições 
    // decrementadas em uma unidade.
    // Seu código aqui
    if(vazia() || (p < 1 || p > contador)){
        return false;
    }

    x = elementos[p-1];
    if(p != contador){
        for(int i=(p-1);i<contador;i++){
            elementos[i]=elementos[i+1];
        }
    }  
    contador--;
    return true;
}

bool Lista::retornar(int p, int &x) {
    // Retorna elemento armazenado em determinada posição.
    // Esta posição deve ser um valor entre 1 (primeiro elemento da lista)
    // e último (último elemento da lista).
    // Seu código aqui
    if(vazia() || (p < 1 || p > contador)){
        return false;
    }
    x = elementos[p-1];
    return true;
}

bool Lista::substituir(int p, int x) {
    // Substitui elemento armazenado em determinada posição.
    // Esta posição deve ser um valor entre 1 (primeiro elemento da lista)
    // e último (último elemento da lista).
    // Seu código aqui
    if(vazia() || (p < 1 || p > contador)){
        return false;
    }

    elementos[p-1] = x;

    return true;
}
