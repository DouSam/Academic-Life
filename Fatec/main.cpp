#include <iostream>
//Biblioteca para gerar números aleatorios
#include <stdlib.h>

using namespace std;

//RPG SUBA A TORRE.
//Hora Inicio 12:00

//Struc para usar como modelo de monstro
struct monstro 
{
  int num;
  string nome;
};

void combate(int *andar,int *vida,struct monstro *monstros)
{
  cout << "------------------------------\n";
  cout << "ANDAR: " << *andar << endl;
  cout << "MONSTRO: " + monstros[*andar].nome << endl;
  //Variavel para armazenar o numero escolhido
  int escolha = 0;
  //Questionando o número até ele ser um correto para a situação.
  do{
    cout << "Escolha um número de 1 a 10: ";
    cin >> escolha;
  }while(escolha < 1 && escolha > 10 && escolha != -1217 );
  if( escolha == monstros[*andar].num)
  {
    cout << "ANDAR " << *andar << " OBLITERADO\n";
    *andar = *andar + 1;
    cout << "VOCÊ FALA NÚMEROS SEM SENTIDO\n";
    cout << "UM EM ESPECIAL FAZ O MONSTRO VIRAR POEIRA\n";
  }else if (*vida < 0)
  {
    cout << "VOCÊ FOI COLOCADO PARA DORMIR\n";
  }else if (escolha == -1217)
  {
    cout << "ALGUNS NÚMEROS SURGEM NA SUA CABEÇA\n";
    cout << "VOCê SEM QUERER FALA EM VOZ ALTA\n";
    cout << "E É LEVADO PARA O ANDAR FINAL\n";
    *andar = 9;
  }else{
    *vida = *vida - 10;
    cout << "VOCÊ É ATACADO DE COSTAS DE MÃO \n";
    cout << "PERCA 10 DE VIDA\n";
    cout << "VIDA ATUAL: " << *vida << endl;
  };
  cout << "------------------------------\n";
};

int main()
{
  //coletando o nome do jogador
  string nome;
  cout << "Nome do Nobre Guerreiro: ";
  cin >> nome;
  //armazenando a vida do jogador
  int vida = 100;
  cout << nome + " se depara com a gigante torre que exala TERROR.\n";
  cout << "Mesmo assim, " + nome + " não teme a escuridão e adentra a \n";
  cout << "torre, visualizando apenas uma placa: \n";
  cout << "-------------------------------------------\n";
  cout << "| SEJA BEM-VINDO A TORRE TORRE            |\n";
  cout << "| CHEGUE AO TOPO PARA RESGATAR A PRINCESA |\n ";
  cout << "------------------------------------------\n";
  //matriz para armazenar o nome do monstro de cada andar
  //e seu numero fraco especifico.
  monstro monstros[10];
  //Inicializando os 10 monstros de maneira fixa e manual
  monstros[0].nome = "Aranha anha";
  monstros[0].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[1].nome = "Gato Sapato";
  monstros[1].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[2].nome = "Globin Robin";
  monstros[2].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[3].nome = "Parede Ede";
  monstros[3].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[4].nome = "Imortal mortal";
  monstros[4].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[5].nome = "Exterminador com dor";
  monstros[5].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[6].nome = "Mago calado";
  monstros[6].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[7].nome = "Tina a gelatina";
  monstros[7].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[8].nome = "Ado rei dado";
  monstros[8].num = rand() % 10 + 1;
  //-----------------------------------------
  monstros[9].nome = "Bão o Campeão";
  monstros[9].num = 7;
  //Variavel para armazenar o andar
  int andar = 0;
  //Para cada andar, será executada a função combate
  while(andar < 10 && vida > 0)
  {
    combate(&andar,&vida,monstros);
  }

  if(vida <= 0)
  {
    cout << "VOCÊ FOI COLOCADO PARA DORMIR\n";
    cout << "VOLTE NOVAMENTE MAIS TARDE...";
  }else
  {
    cout << "VOCÊ É O REI DO RNG, PARABÉNS\n";
    cout << "Mas a princesa foi embora pela porta do fundo...";
  };
}

/*
As unicas dificuldades que eu sinto, é lembrar da sintaxe da linguagem.
Isso pq utilizo mais javaScript e LSP, acabo perdendo um pouco das particularidades
de cada uma das linguagens.
Hora fim: 13:12
*/