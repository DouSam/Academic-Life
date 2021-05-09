/*

Utilizando a classe que implementa a pilha:
1.       Desenvolva um método que inverta a ordem dos elementos de uma pilha.
2.       Desenvolva um método que encontre o maior e o menor valor armazenado e calcule a média dos elementos.
3.       Desenvolva uma função que verifique se uma pilha possui mais elementos que uma segunda pilha.
4.       Desenvolva uma função que verifique se duas pilhas são iguais.
5.       Desenvolva um método que retorne apenas os valores ímpares armazenados em uma pilha.
Altere a classe para que ela armazene valores do tipo caractere ao invés de inteiro:
6.       Desenvolva um método que verifique se uma palavra é um palíndromo (palavra que se pode ler, indiferentemente, da esquerda para a direita ou vice-versa, exemplos: anilina, arara, esse, ama).
7.       Desenvolva um método que inverta as letras de cada palavra de um texto, preservando a ordem das palavras. Por exemplo:

- Nao faz verificacoes caso nao tenha memoria suficiente para continuar o processo.

- Melhorias que podem ser feitas na versao 2:
-- Reduzir redundancias das funcoes que constam nas duas classes.
-- Permitir manipular a pilha, removendo apenas um elemento e inserindo apenas um elemento em qualquer momento da execucao.
-- Utilizacao de headers para diminuir o tamanho e organizar melhor a informacao.
-- Ajustar para nao deixar lixo na pilha caso sobre espaco na mesma.

*/

#include <iostream>
#include <string.h>
#include <math.h>

using namespace std;

//Definindo cores para impressão
#define COLOR_VERMELHO     "\x1b[31m"
#define COLOR_VERDE        "\x1b[32m"
#define COLOR_AMARELO      "\x1b[33m"
#define COLOR_RESET        "\x1b[0m"

//Criando a pilha para armazenamento de double. A quantidade de elemento e limitada a variavel tamanho.
class PilhaInt{
    private:
        int topo;
        int tamanho;
        double *elementos;
        int id;
    public:
        //Construtor da pilha para definir o tamanho do array de elementos.
        void Inicia(int tamanhoI, int idI){
            topo = -1;
            tamanho = tamanhoI;
            //Alocando o total de memoria equivalente ao tamanho inserido
            elementos = (double*) malloc(sizeof(double)*tamanhoI);
            //Id que sera usado posteriormente para operacoes
            id = idI;
        }
        //Metodo para inserir elemento na pilha
        int empilhar(double elem){
            //Verifica se ela ainda possui espaco
            if(topo+1 == tamanho){
                //Caso nao possua, retorna falso
                return 0;
            }else{
                //Se ela possuir espaco, incrementamos o topo
                topo++;
                //E adicionamos o elemento
                elementos[topo] = elem;
            }
            //No final se tudo ocorrer como planejado, retornamos verdadeiro
            return 1;
        }
        //Metodo para imprimir pilha
        void imprimir(){
            cout << COLOR_VERDE "------------ PILHA " << id << "------------\n";
            //Percorre cada elemento da pilha
            for(int i = topo; i >= 0 ;i--){
                cout << elementos[i];
                if(i == topo){
                    //Apenas demosntra qual e o topo
                    cout << " <- TOPO\n";
                }else{
                    cout << endl;
                }
            }
            cout << "--------------------------------\n" COLOR_RESET;
        }
        //Metodo para dsempilhar
        double desempilhar(){
            //Variavel para salvar o numero que esta sendo retirado
            double num = elementos[topo];
            topo--;//Diminuindo o topo
            //Nao e necessario limpar memoria pois o espaco pode ser usado novamente
            return num;
        }
        //Getter da informacao topo
        int getTopo(){
            return topo;
        }
        //Metodo para limpar os elementos da pilha
        void limpar(){
            //Liberando memoria
            free(elementos);
            //Criando novamente o array
            elementos = (double*) malloc(sizeof(double)*tamanho);
        }
        //Metodo para inverter a pilha
        int inverter(){
            //Array auxiliar para salvar a pilha original e topo original
            int topoAux = topo;
            double *auxElem = (double*) malloc(sizeof(double)*(topo+1)); 
            //Copiando os elementos da pilha para auxElem
            for(int i = 0; i <= topoAux;i++){
                auxElem[i] = desempilhar();
            }
            //Inserindo os valores novamente usando a pilha auxiliar
            while(topoAux != topo){
                empilhar(auxElem[topo+1]);
            }
            return 1;
        }
        //Metodo para encontrar o maior numero e menor numero da pilha e calcular a media de todos os elementos.
        int maiorMenorMedia(){
            double menor;
            double maior;
            double soma=0;

            //Array auxiliar para salvar a pilha original
            int topoAux = topo;
            double *auxElem = (double*) malloc(sizeof(double)*(topo+1)); 

            //Percorrendo os elementos da pilha e copiando eles para auxElem
            for(int i = 0; i <= topoAux;i++){
                auxElem[i] = desempilhar();
                //Fazendo a verificacao de qual e o maior valor e o menor valor
                if(i == 0){
                    maior = auxElem[i];
                    menor = auxElem[i];
                }else{
                    if(auxElem[i] > maior)
                    {
                        maior = auxElem[i];
                    }
                    if(auxElem[i] < menor)
                    {
                        menor = auxElem[i];
                    }
                }
                //Somando para o calculo da aritmetica
                soma+=auxElem[i];
            }

            //Retornando os valores para a pilha
            while(topoAux != -1){
                empilhar(auxElem[topoAux]);
                topoAux--;
            }
            //Imprimindo os valores que foram encontrados.
            cout << COLOR_VERDE "Maior valor: " << maior << endl;
            cout << "Menor valor: " << menor << endl;
            cout << "Media dos valores: " << soma/(topo+1) << COLOR_RESET << endl;
            return 1;
        }
        /*Metodo para verificar se uma pilha é maior que outra pilha
        * Para verificar, nao e necessario percorrer a pilha pois temos
        * o identificador do topo da mesma.
        */
        int comparaTamPilha(int tetoPilha2){
            if(tetoPilha2 > topo){
                return 1;
            }else if(tetoPilha2 < topo){
                return 0;
            }else{
                return 2;
            }
        }
        //Metodo para verificar se duas pilhas sao iguais
        int verificaIgualdade(PilhaInt pilha2){
            //Ate entao as pilhas sao consideradas como iguais e retorna verdadeiro
            int iguais = 1;
            /* Esse metodo e chamado por uma pilha auxiliar nunca pela pilha original
            *  e dessa forma, podemos desempilhar ela sem armazenar os valores. Nao
            *  e necessario fazer a verificacao de tamanho por aqui, na funcao main
            *  essa verificacao ja foi realizada antes de chamar a funcao verificaIgualdade.
            */
            while(topo != -1){
                //Desempilho ambas as pilhas e vejo se o valor e igual ate chegarmos no inicio dela
                if(desempilhar() != pilha2.desempilhar()){
                   iguais = 0;
                   //Nao e necessario percorrer o restante da pilha
                   break;
                }
            }
            return iguais;
        }
        //Metodo para retornar os valores impares de uma pilha
        int retornaImpar(){
            //Variavel auxiliar para armazenar o numero retirado do topo
            double auxNum = 0;
            //Flag para sabermos se retornamos algum numero ou se todos sao pares
            int flag = 0;
            //Irei percorrer a pilha desempilhando a mesma
            while(topo != -1)
            {   
                auxNum = desempilhar();
                //Se o valor nao for divisivel por 2, considero ele com par e imprimo ele;
                if(fmod(auxNum,2) != 0){
                    cout << auxNum << "\t";
                    //Altero a flag para informar que encontramos um impar
                    flag++;
                };
            }
            if(!flag){
                cout << COLOR_VERDE "Pilha nao possui numeros pares.\n" COLOR_RESET;
            }
            cout << endl;
            return 1;
        }
};

//Criando a pilha para armazenamento de char. A quantidade de elemento e limitada a variavel tamanho.
class PilhaCha{
    private:
        int topo;
        int tamanho;
        char *elementos;
        int id;
    public:
        //Construtor da pilha para definir o tamanho do array de elementos.
        void Inicia(int tamanhoI, int idI){
            topo = -1;
            tamanho = tamanhoI;
            elementos = (char*) malloc(sizeof(char)*tamanhoI);
            //O mesmo ID que consta em pilhaInt para as escolhas.
            id = idI;
        }
        //Setter para a variavel topo, somente sera usado em casos de duplicacao de pilha
        int setTopo(int i){
            topo = i;
            return 1;
        }
        //Metodo para inserir elemento na pilha
        int empilhar(char elem){
            //Empilha ate que o topo seja o tamanho
            if((topo+1) == tamanho){
                //Se o topo for o tamanho, a pilha esta cheia e retorna falso
                return 0;
            }else{
                //Se o topo nao for igual, inserimos o valor no topo da pilha
                topo++;
                elementos[topo] = elem;
            }
            return 1;
        }
        //Metodo para imprimir pilha
        void imprimir(){
            cout << COLOR_VERDE "------------ PILHA " << id << "------------\n";
            for(int i = topo; i >= 0 ;i--){
                cout << elementos[i];
                if(i == topo){
                    cout << " <- TOPO\n";
                }else{
                    cout << endl;
                }
            }
            cout << "--------------------------------\n" COLOR_RESET;
        }
        //Metodo para dsempilhar
        char desempilhar(){
            //Variavel para salvar o char que esta sendo retirado
            char cha = elementos[topo];
            topo--;//Diminuindo o topo
            //Nao e necessario limpar memoria pois o espaco pode ser usado novamente
            return cha;
        }
        //Metodo para inverter a pilha
        int inverter(){
            //Array auxiliar para salvar a pilha original
            int topoAux = topo;
            char *auxElem = (char*) malloc(sizeof(char)*(topo+1)); 
            //Copiando os elementos da pilha para auxElem
            for(int i = 0; i <= topoAux;i++){
                auxElem[i] = desempilhar();
            }
            //Inserindo os valores novamente usando a pilha auxiliar
            while(topoAux != topo){
                empilhar(auxElem[topo+1]);
            }
            return *auxElem;
        }
        /*Metodo para verificar se e um palindromo
        * irei usar uma pilha auxiliar e inverter para verificar se 
        * ela persiste a memsa ou se ela e alterada
        */
        int palindromo(){
            PilhaCha aux;
            PilhaCha aux2;
            aux.Inicia(tamanho,-1);
            aux2.Inicia(tamanho,-1);
            //Copia os valores do espaço de memoria que esta a pilha original.
            memcpy(aux.elementos,elementos,sizeof(elementos));
            memcpy(aux2.elementos,elementos,sizeof(elementos));
            //Definindo os topos
            aux.setTopo(topo);
            aux2.setTopo(topo);
            //Invertemos uma pilha
            aux2.inverter();
            //Desempilhamos
            while(aux.topo != -1){
                char a = aux.desempilhar();
                char a2 = aux2.desempilhar();
                if(a != a2){
                    return 0;
                }
            }
            return 1;
        }
        /** Metodo para inverter as palavras mas sem trocar a posicao delas
         * irei salvar os valores em um vetor de char, entao irei percorrer
         * ele ate encontrar o ' '(espaco), irei guardar a posicao do espaco
         * e inverter apenas aquele trecho. Outra forma mais trabalhosa de
         * se fazer esse metodo, seria criando 2 pilhas, uma seria usada para
         * armazenar a palavra e a outra seria usada para temporiariamente 
         * armazenar a frase, assim a cada espaco eu iria inverter a pilha
         * da palavra e depois inserir a palavra na pilha frase.
         */
        int inverteLetras(){
            //Variavel auxiliar para guardar a posicao inicial da palavra
            int inicioP = topo;
            //Variavel auxiliar para armazenar a posicao final da palavra
            int fimP = 0;//Lembrando que na pilha, o fim da palavra acaba sendo o inicio da mesma
            //Variavel para armazenar temporiamente o char para fazer a troca
            char aux = ' ';//32
            //Array auxiliar para salvar a pilha original e topo original
            int topoAux = topo;
            char *auxElem = (char*) malloc(sizeof(char)*(topo+1)); 
            //Copiando os elementos da pilha para auxElem
            for(int i = topoAux; i >= 0;i--){
                //Primeiro eu tiro o elemento do topo
                auxElem[i] = desempilhar();
                //Verifico se e um espaco ou se e o inicio da pilha
                //Ambos os casos significa que eu terminei uma palavra
                if(auxElem[i] == 32 || i == 0){
                    //Caso seja o inicio da pilha, irei inverter desde o inicio
                    //Do contrario, irei inverter do espaco mais um
                    fimP = (i==0)? 0:i+1;
                    while(fimP != inicioP){
                        aux = auxElem[fimP];
                        auxElem[fimP] = auxElem[inicioP];
                        auxElem[inicioP] = aux;
                        fimP++;
                        if(fimP == inicioP){
                            break;
                        }else{
                            inicioP--;
                        }
                    }
                    inicioP = i-1;
                }
            }
            //Inserindo os valores novamente usando a pilha auxiliar
            while(topoAux != topo){
                empilhar(auxElem[topo+1]);
            }
            return 1;
        }
};

/* Caso seja necessario verificar o tipo da pilha, util se fosse combinar as opcoes
Por exemplo: Permitir inverter ambas as pilhas
bool a = typeid(pilha).name() == typeid(PilhaInt).name();
bool b = typeid(pilha2).name() == typeid(PilhaInt).name();
*/

//Imprime todas as pilhas
void imprimePilhasInt(int idPilhaInt, int* arrInt[]){
    //Imprimindo todas as pilhas de inteiros
    for(int i = 0; i < idPilhaInt;i++){
        PilhaInt *_pilha = (PilhaInt *) arrInt[i];
        _pilha->imprimir();
    }
}

//Imprime todas as pilhas
void imprimePilhasCha(int idPilhaCha, int* arrCha[]){
    //Imprimindo todas as pilhas de inteiros
    for(int i = 0; i < idPilhaCha;i++){
        PilhaCha *_pilha = (PilhaCha *) arrCha[i];
        _pilha->imprimir();
    }
}

int main()
{
    //Flag para determinar o momento fim da execucao
    int flag = 1;
    //Variavel para determinar se já foi criada alguma pilha
    int idPilhaInt = 0;
    int idPilhaCha = 0;
    //Variavel para armazenar se sera criada uma pilha de inteiro ou caracteres
    int tipPilha = 0;
    /** Variaveis para armazenar os enderecos das pilhas.
     * Nao e possivel, nativamente, armazenar um objeto que seja dinamico
     * isso pois cada um possui seu tamanho e quantidade de elementos e a linguagem
     * nao possui suporte para encontrar o inicio e o fim dele, deixando a informacao
     * incompleta.
    */
    int **arrInt = NULL;
    int arrIntSize = 0;
    int **arrCha = NULL;
    int arrChaSize = 0;
    //Variavel para escolha de pilha em algumas opcoes
    int idEscolha = 0;
    //Variavel para segunda escolha em comparacoes
    int idEscolha2 = 0;
    int tam = 0;
    //variavel para armazenamento de respostas dos metodos
    int res = 0;
    while(flag){
        if(idPilhaInt||idPilhaCha){
            cout << COLOR_AMARELO "------------------------------------ OPCOES ------------------------------------\n\n";
            cout << "1 - Criar uma nova pilha.\n";
            cout << "2 - Inverter pilha.\n";
            cout << "3 - Encontrar o maior e o menor valor, calcular a media de todos os elementos.\n";
            cout << "4 - Comparar se uma pilha possui mais elementos que outra.\n";
            cout << "5 - Verificar se duas pilhas sao iguais.\n";
            cout << "6 - Retornar valores impares de uma pilha.\n";
            cout << "7 - Verificar se uma palavra é um palíndromo.\n";
            cout << "8 - Inverter letras de uma frase sem interferir na ordem das palavras\n";
            cout << "9 - Imprimir pilha de inteiros\n";
            cout << "10 - Imprimir pilha de caracteres\n";
            cout << "0 - Sair\n";
            cout << "OBS: Opcoes 2|-|6 apenas para pilhas inteiras, 7 e 8 pilhas de caracteres\n";
        }else{
            cout << COLOR_AMARELO "------------------------------------ OPCOES ------------------------------------\n\n";
            cout << "1 - Criar uma nova pilha.\n";
            cout << "0 - Sair\n";
        }
        cin >> flag;
        switch (flag)
        {
        case 1:
            cout << "Deseja criar uma pilha de inteiros(1) ou uma pilha de caracteres(2)?: ";
            cin >> tipPilha;
            cout << "Qual o tamanho da pilha?\n" COLOR_RESET;
            cin >> tam;
            if(tam < 1 ){
                cout << COLOR_VERMELHO "Tamanho inserido invalido\n" COLOR_RESET;
                break;
            }
            if(tipPilha == 1){
                //Criando as variaveis da pilha auxiliar
                PilhaInt *aux = (PilhaInt *) malloc(sizeof(PilhaInt));
                double elem = 0;
                aux->Inicia(tam,idPilhaInt);
                //Inserindo elementos na pilha
                for(int i = 0; i<tam;i++){
                    cout << COLOR_AMARELO "Insira o elemento " << i+1 << " da pilha: " COLOR_RESET;
                    cin >> elem;
                    aux->empilhar(elem);
                }
                //Pilha criada com sucesso
                aux->imprimir();
                //Realocando o array de pilhas inteiras para inserir mais um endereco
                arrIntSize++;
                arrInt = (int**) realloc(arrInt, sizeof(int**)*arrIntSize); // + posição
                //Inserindo o endereco da pilha no array
                arrInt[idPilhaInt] = (int *) aux;
                idPilhaInt++;
            }
            else if(tipPilha == 2){
                //Criando as variaveis da pilha auxiliar
                PilhaCha *aux = (PilhaCha *) malloc(sizeof(PilhaCha));
                string elem ="";
                aux->Inicia(tam,idPilhaCha);
                cout << COLOR_AMARELO "Insira os elementos da pilha: " COLOR_RESET;
                //cin >> elem;
                cin.ignore();
                getline(cin,elem);
                //Inserindo elementos na pilha
                for(int i = 0; i<tam;i++){
                    aux->empilhar(elem[i]);
                }
                //Pilha criada com sucesso
                aux->imprimir();
                //Realocando o array de pilhas inteiras para inserir mais um endereco
                arrChaSize++;
                arrCha = (int**) realloc(arrCha, sizeof(int**)*arrChaSize); // + posição
                //Inserindo pilha no array
                arrCha[idPilhaCha] = (int *) aux;
                idPilhaCha++;
            }
            else{
                cout << COLOR_VERMELHO "Tipo invalido, insira novamente.\n" COLOR_RESET;
            }
            break;
        case 2:
            imprimePilhasInt(idPilhaInt,arrInt);
            cout << COLOR_AMARELO "Escolha qual pilha deseja inverter, insira o ID:\n" COLOR_RESET;
            cin >> idEscolha;
            //Verificando se a escolha e valida
            if(idEscolha > idPilhaInt || idEscolha < 0){
                cout << COLOR_VERMELHO "ID invalido\n" COLOR_RESET;
            }else{
                PilhaInt *_pilha = (PilhaInt *) arrInt[idEscolha];
                _pilha->inverter();
                cout << COLOR_VERDE "Pilha invertida:\n" COLOR_RESET;
                _pilha->imprimir();
            }
            break;
        case 3:
            imprimePilhasInt(idPilhaInt,arrInt);
            cout << COLOR_AMARELO "Escolha qual pilha deseja saber o maior/menor valor e a media aritmetica, insira o ID:\n" COLOR_RESET;
            cin >> idEscolha;
            //Verificando se a escolha e valida
            if(idEscolha > idPilhaInt || idEscolha < 0){
                cout << COLOR_VERMELHO "ID invalido\n" COLOR_RESET;
            }else{
                PilhaInt *_pilha = (PilhaInt *) arrInt[idEscolha];
                _pilha->maiorMenorMedia();
            }
            break;
        case 4:
            imprimePilhasInt(idPilhaInt,arrInt);
            cout << COLOR_AMARELO "Escolha a primeira pilha a ser comparada: ";
            cin >> idEscolha;
            cout << "Escolha a segunda pilha a ser comparada: " COLOR_RESET;
            cin >> idEscolha2;
            if(idEscolha > idPilhaInt || idEscolha < 0){
                cout << COLOR_VERMELHO "ID invalido\n" COLOR_RESET;
            }else{
                PilhaInt *_pilha  = (PilhaInt *) arrInt[idEscolha];
                PilhaInt *_pilha2 = (PilhaInt *) arrInt[idEscolha2];
                res = _pilha->comparaTamPilha(_pilha2->getTopo());
                if(res && res != 2){
                    cout << COLOR_VERDE "Segunda pilha possui mais elementos.\n" COLOR_RESET;
                }else if(!res && res != 2){
                    cout << COLOR_VERDE "Primeira pilha possui mais elementos.\n" COLOR_RESET;
                }else{
                    cout << COLOR_VERDE "As duas pilhas possuem o mesmo tamanho.\n" COLOR_RESET;
                }
            }
            break;
        case 5:
            {
                imprimePilhasInt(idPilhaInt,arrInt);
                cout << COLOR_AMARELO "Escolha a primeira pilha a ser comparada: ";
                cin >> idEscolha;
                cout << "Escolha a segunda pilha a ser comparada: " COLOR_RESET;
                cin >> idEscolha2;
                //Irei verificar primeiro se os topos das pilhas sao iguais
                PilhaInt *_pilha  = (PilhaInt *) arrInt[idEscolha];
                PilhaInt *_pilha2 = (PilhaInt *) arrInt[idEscolha2];
                res = _pilha->comparaTamPilha(_pilha2->getTopo());
                if(res != 2){
                    cout << COLOR_VERDE "As pilhas sao diferentes\n" COLOR_RESET;
                }else{
                    //Criando as pilhas auxiliares para nao perder o valor da pilha
                    PilhaInt aux1 = *_pilha;
                    PilhaInt aux2 = *_pilha2;
                    //Irei chamar o metodo na primeira pilha passando por valor
                    res = aux1.verificaIgualdade(aux2);
                    if(res){
                        cout << COLOR_VERDE "As pilha sao iguais.\n" COLOR_RESET;
                    }else{
                        cout << COLOR_VERDE "As pilhas nao sao iguais.\n" COLOR_RESET;
                    }
                }
                break;
            }
        case 6:
            {
                imprimePilhasInt(idPilhaInt,arrInt);
                cout << COLOR_AMARELO "Qual pilha deseja consultar os valores impares? " COLOR_RESET;
                cin >> idEscolha;
                PilhaInt *_pilha  = (PilhaInt *) arrInt[idEscolha];
                //Realizando copia da pilha para nao alterar os valores.
                PilhaInt aux = *_pilha;
                aux.retornaImpar();
            }
            break;
        case 7:
            {
                imprimePilhasCha(idPilhaCha,arrCha);
                cout << COLOR_AMARELO "Qual pilha deseja verificar se e um palindromo? " COLOR_RESET;
                cin >> idEscolha;
                PilhaCha *_pilha = (PilhaCha *) arrCha[idEscolha]; 
                res = _pilha->palindromo();
                if(res){
                    cout << COLOR_VERDE "E um palindromo!\n" COLOR_RESET;
                }else{
                    cout << COLOR_VERDE "Nao e um palindromo.\n" COLOR_RESET;
                }
            }
            break;
        case 8:
            {
                imprimePilhasCha(idPilhaCha,arrCha);
                cout << COLOR_AMARELO "Qual pilha deseja inverter? " COLOR_RESET;
                cin >> idEscolha;
                //Faz a conversao do espaco de memoria e salva o endereco da pilha no ponteiro
                PilhaCha *_pilha = (PilhaCha *) arrCha[idEscolha]; 
                _pilha->inverteLetras();
                _pilha->imprimir();
            }
            break;
        case 9:
            imprimePilhasInt(idPilhaInt,arrInt);
            break;
        case 10:
            imprimePilhasCha(idPilhaCha,arrCha);
            break;
        case 0:
            break;
        default:
            cout<< COLOR_VERMELHO "Opcao nao identificada, selecione novamente!\n" COLOR_RESET;
            break;
        }
    }
    
    cout << COLOR_VERMELHO "Saindo..." COLOR_RESET;

    return 0;
}