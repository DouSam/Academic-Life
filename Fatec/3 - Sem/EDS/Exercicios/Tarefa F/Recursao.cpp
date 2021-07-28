#include "Recursao.h"

string Recursao::contagemCrescente(int p) {
    // Receba um valor N e retorne os valores de 1 até N em ordem crescente;
    // No formato:
    // -4-3-2-1-
    // Seu código aqui
    if (p <= 0)
        return "-";
    return contagemCrescente(p-1) + to_string(p) +"-";
}

int Recursao::fatorial(int p) {
    // Receba um valor N e efetue o cálculo de seu fatorial;
    // Seu código aqui
    if(p == 0 || p ==1)
        return 1;
    return p * fatorial(p-1);
}

string Recursao::contagemDecrescente(int p) {
    // Receba um valor N e retorne os valores de N até 1 (decrescente);
    // No formato:
    // -4-3-2-1-
    // Seu código aqui
    if(p < 1)
        return "-";
    if(p == 1)
        return "-1-";
    return "-" + to_string(p) + contagemDecrescente(p-1);
}


string Recursao::intervaloCrescente(int p, int q) {
    // Receba 2 valores e retorne os valores entre eles em ordem crescente;
    // No formato:
    // -4-3-2-1-
    // Seu código aqui
    if (p > q)
        return "-";
    return "-" + to_string(p) + intervaloCrescente(p+1,q);
}

string Recursao::intervaloDecrescente(int p, int q) {
    // Receba 2 valores e retorne os valores entre eles em ordem decrescente;
    // No formato:
    // -4-3-2-1-
    // Seu código aqui
    if (p+1 >= q)
        return "-";
    return intervaloDecrescente(p+1,q) + to_string(p+1) + "-";
}

string Recursao::paresCrescente(int p) {
    // Receba um valor N par e retorne todos os números pares entre 0 e N em ordem crescente;
    // No formato:
    // -4-3-2-1-
    // Seu código aqui
    if(p < 0)
        return "-";
    if(p == 0)
        return "-0-";
    if(p%2 == 0)
        return paresCrescente(p-1) + to_string(p) +"-";
    return paresCrescente(p-1);
}

