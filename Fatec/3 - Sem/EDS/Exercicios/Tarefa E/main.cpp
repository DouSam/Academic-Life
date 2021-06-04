#include <iostream>
#include <cstdlib>
#include <string.h>

using namespace std;

#define MAX 5

#include "Lista.cpp"

int main() {

    Lista minhaLista;

    if (minhaLista.inserir(2, 3))        
        cout << minhaLista.listar() << endl;
    else
        cout << "Não inseriu!\n";

    if (minhaLista.inserir(-1, 3))        
        cout << minhaLista.listar() << endl;
    else
        cout << "Não inseriu!\n";

    if (minhaLista.inserir(1, 3))        
        cout << minhaLista.listar() << endl;
    else
        cout << "Não inseriu!\n";

    if (minhaLista.inserir(0, 3))        
        cout << minhaLista.listar() << endl;
    else
        cout << "Não inseriu!\n";

    cout << "\n";
}