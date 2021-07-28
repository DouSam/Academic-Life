#include <iostream>
#include <chrono>
#include <string>

using namespace std;

#include "Recursao.cpp"

int main() {
    // seus testes aqui
    // eles não serão avaliados pelo corretor automático
    Recursao rec;
    cout << "Contagem Crescente: \n";
    cout << rec.contagemCrescente(6) << endl;
    cout << rec.contagemCrescente(1) << endl;
    cout << rec.contagemCrescente(0) << endl;
    cout << "Fatorial: \n";
    cout << rec.fatorial(5) << endl;
    cout << rec.fatorial(4) << endl;
    cout << rec.fatorial(0) << endl;
    cout << "Contagem Decrescente: \n";
    cout << rec.contagemDecrescente(6) << endl;
    cout << rec.contagemDecrescente(1) << endl;
    cout << rec.contagemDecrescente(0) << endl;
    cout << "Intervalo Crescente: \n";
    cout << rec.intervaloCrescente(6, 12) << endl;
    cout << rec.intervaloCrescente(12, 12) << endl;
    cout << rec.intervaloCrescente(13, 12) << endl;
    cout << "Intervalo Decrescente: \n";
    cout << rec.intervaloDecrescente(4, 2) << endl;
    cout << rec.intervaloDecrescente(1, 1) << endl;
    cout << rec.intervaloDecrescente(5, 3) << endl;
    cout << "Pares Crescente: \n";
    cout << rec.paresCrescente(4) << endl;
    cout << rec.paresCrescente(5) << endl;
    cout << rec.paresCrescente(0) << endl;
    cout << rec.paresCrescente(10) << endl;

}
