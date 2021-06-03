#include <cstdlib>
#include <string>
#include "Fila.h"

Fila::Fila() {
    inicio = NULL;
    fim = NULL;
}

bool Fila::vazia() {
    return (inicio == NULL);
}

bool Fila::cheia() {
    return false;
}

bool Fila::inserir(int x) {
    PonteiroElemento p;
    p = new elemento;
    p->valor = x;
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

bool Fila::remover(int &x) {
    PonteiroElemento p;
    if (vazia())
        return false;
    x = inicio->valor;
    p = inicio;
    inicio = inicio->proximoElemento;
    delete p;
    if (inicio == NULL)
        fim = NULL;
    return true;
}


bool Fila::primeiro(int &x) {
	// caso a lista esteja vazia retornar falso
	// retornar em x o valor do primeiro elemento da lista
	// seu c�digo aqui:
	if(vazia()){
		return false;
	}else{
		//remover(x);
		//inserir(x);
		x = inicio->valor;
		return true;
	}
	
	
}

bool Fila::ultimo(int &x) {
	// caso a lista esteja vazia retornar falso
	// retornar em x o valor do �ltimo elemento da lista
	// seu c�digo aqui:

	if(vazia()){
		return false;
	}

	int y;
	Fila auxFila;
	
	while (remover(y)) {
		auxFila.inserir(y);
	}
	x = y;
	while (auxFila.remover(y)) {
		inserir(y);
	}
	return true;	
}

bool Fila::esvaziar() {
	// caso a lista esteja vazia retornar falso
	// remover todos os elementos da lista
	// seu c�digo aqui:
	if(vazia()){
		return false;
	}
	int y;
	
	while (remover(y)) {};
	return true;
}

int Fila::tamanho() {
	// retornar o tamanho da lista, 0 se estiver vazia
	// seu c�digo aqui:
	if(vazia()){
		return 0;
	}
	int y,tam=0;
	Fila auxFila;
	while (remover(y)) {
		auxFila.inserir(y);
		tam=tam +1;
	}
	while (auxFila.remover(y)) {
		inserir(y);
	}
	return tam;
}

bool Fila::inverter() {
	// caso a lista esteja vazia retornar falso
	// inverter a ordem dos elementos da lista
	// seu c�digo aqui:
	if(vazia()){
		return false;
	}
	int x=0,fim;
	string filaInteira = "",numero;
	while (remover(x)) {
		filaInteira = filaInteira + to_string(x) + ";";
	}
	fim=filaInteira.length()-2;
	for(int i=filaInteira.length()-2;i!=-1;i--){
		if(filaInteira[i] == ';' || i == 0){
			for(int j = (i==0? 0:i+1);j<=fim;j++){
				numero += filaInteira[j];
			}
			inserir(stoi(numero));
			numero="";
			fim = i-1;
		}
	}
	return true;
}

string Fila::listar() {
	// retornar string com todos os elementos da lista separados por ;
	// exemplo: 1 ; 3 ; 5
	// string vazia se a lista estiver vazia
	// seu c�digo aqui:
	if(vazia()){
		return "";
	}
	int y;
	Fila auxFila;
	string retorno = "";
	
	while (remover(y)) {
		retorno = retorno + to_string(y);
		if(!vazia()){
			retorno += " ; ";
		}
		auxFila.inserir(y);
	}
	
	while (auxFila.remover(y)) {
		inserir(y);
	}
	return retorno;
}

bool Fila::estaNaFila(int x) {
	// retornar verdadeiro caso o valor x seja localizado na fila
	// seu c�digo aqui:
	int y;
	bool flag = false;
	Fila auxFila;
	
	while (remover(y)) {
		auxFila.inserir(y);
		if(y==x)
			flag = true;
	}
	
	while (auxFila.remover(y)) {
		inserir(y);
	}
	return flag;
}

Fila Fila::interseccao(Fila auxFila) {
	// retornar objeto Fila contendo a intersec��o com a lista atual
	// elementos em comum com as 2 listas
	// sem repeti��o de elementos
	// seu c�digo aqui:
	Fila inter = {},copia1={},copia2={},copia3={};	

	int x,y,z,flag=1;

	while (remover(x))
	{
		copia1.inserir(x);
		while(auxFila.remover(y)){
			copia2.inserir(y);
			if(x==y){
				while(inter.remover(z)){
					copia3.inserir(z);
					if(z==y){
						flag = 0;
						break;
					}
						
				}
				
				while(copia3.remover(z)){
					inter.inserir(z);
				}
				if(flag){
					inter.inserir(x);
				}
			}
		}
		while(copia2.remover(y)){
			auxFila.inserir(y);
		}
	}
	
	while(copia1.remover(x)){
		inserir(x);
	}
	
	return inter;
}

Fila Fila::uniao(Fila auxFila) {
	// retornar objeto Fila contendo a uni�o com a lista atual
	// elementos das 2 listas
	// sem repeti��o de elementos
	// seu c�digo aqui:

	Fila uni = {},copia1={},copia2={},copia3={};	

	int x,y,z,flag=1;

	while (remover(x))
	{
		copia1.inserir(x);
		while (uni.remover(z))
		{
			copia3.inserir(z);
			if(x==z){
				flag =0;
				break;
			}
		}

		while(copia3.remover(z)){
			uni.inserir(z);
		}
		if(flag){
			uni.inserir(x);
		}
		flag=1;
	}
	
	while(copia1.remover(x)){
		inserir(x);
	}
	
	while (auxFila.remover(y))
	{
		copia2.inserir(y);
		while (uni.remover(z))
		{
			copia3.inserir(z);
			if(y==z){
				flag =0;
				break;
			}
		}

		while(copia3.remover(z)){
			uni.inserir(z);
		}
		if(flag){
			uni.inserir(y);
		}
		flag=1;
	}

	while(copia2.remover(y)){
		auxFila.inserir(y);
	}

	return uni;
	
}




