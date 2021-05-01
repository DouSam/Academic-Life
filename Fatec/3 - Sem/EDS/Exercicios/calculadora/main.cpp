/*

Calculadora

Aceita apenas dois operadores e uma operação sem parenteses.

Não trata excessões por falta de operador ou excessão de parenteses.

Limitado as operacoes: Multiplicacao(*), Divisao(/), Adicao(+) e Subtracao(-)

*/
#include <iostream>
#include <string>

using namespace std;

//Struct para salvar as 'contas' realizadas
typedef struct Operacao
{
    string operador1;
    string operador2;
    string tipoOpe;
    string resultado;
} Operacao;
//Funcao para retornar a soma dos operadores
double SUM(double x, double y)
{
    return x + y;
}
//Funcao para retornar a subtracao dos operadores
double SUB(double x, double y)
{
    return x - y;
}
//Funcao para retornar a divisao dos operadores
double DIV(double x, double y)
{
    return x/y;
}
//Funcao para retornar a multiplicacao dos operadores
double MUL(double x, double y)
{
    return x*y;
}
/*Funcao para atualizar o contador de operacoes realizadas
conta somente até 10 que é o limite do histórico.
*/
void atualizaN(int *n)
{
    *n = (*n + 1)%10;
}
//Funcao para exibir o historico de operacoes
void demonstraHist(Operacao hist[],int n) 
{
    cout << "Historico" << endl;
    //Flag para armazenar se alguma operacao foi feita
    int temOp = 0;
    int i=n + 1;
    //Passando pelo array e verificando se existe operacao ou se esta vazio.
    for(i;i != n;)
    {
        if(hist[i].tipoOpe == " ")
        {
            i=(i+1)%10;
            //Se nao possui operacao, atualiza o i e continua o for
            continue;
        }
        //Se possui operacao, troca a flag e demonstra a operacao
        temOp = 1;
        cout << " -> "<< hist[i].operador1 << hist[i].tipoOpe << hist[i].operador2 << "=" << hist[i].resultado;
        cout << endl;
        //Atualizando o i para continuar a percorrer o historico
        i=(i+1)%10;
    }
    //Se nenhuma operacao foi realizada, informando que o historico esta vazio
    if(!temOp)
    {
        cout << "Sem operacoes\n"; 
    }
}

int main()
{
    //definindo um array de "funcoes"
    double (* OPS[6])(double x, double y);
    OPS[0] = *MUL;
    OPS[1] = *SUM;
    OPS[3] = *SUB;
    OPS[5] = *DIV;
    //Definindo fixamente o array do historico de operacoes
    Operacao hist[11];
    //Inicializando o historico como vazio
    for(int i = 0; i < 11; i++)
    {
        hist[i].tipoOpe = " ";
    }

    int n = 0;
    string expressao = "";
    //Enquanto a operacao for diferente de "A"(apenas maisculo) o sistema continua executando
    while(expressao != "A")
    {
        cout << "Digite a expressao para ser calculada ou 'A' para que o sistema encerre ou 'B' para ver o historico: ";
        //Usando getline para considerar os espaços( ) da expressao aritmetica
        getline(cin,expressao);
        //Se for inserido "A", pulamos o restante do codigo para que ele encerre na validacao do while
        if(expressao == "A")
        {
            continue;
        }
        //Se for inserido "B", sera chamada a funcao para demonstrar o historico
        if(expressao == "B"){
            demonstraHist(hist,n);
            //Continue para nao executar o restante do while
            continue;
        }
        //Flag para indicar se o primeiro operador foi retirado da expressao com sucesso
        bool sNum = false;

        double res = 0;
        string x = "";
        string y = "";
        int iOp = 0;
        /** Percorrendo os caracteres da expressao ate encontrar o valor condiscente da tabela ASCII
         *  para "+","-","*" ou "/" */
        for(int i = 0; expressao[i] != '\0'; i++)
        {   
            //Condicao para ignorar os espacos da expressao
            if(expressao[i] == ' ')
            {
                continue;
            }
            /**
             * Verificando se o valor ASCII do caractere esta entre 47 e 58
             * Sendo 47 - "0" ate 58 - "9"
            */
            else if(expressao[i] > 47 && expressao[i] < 58)
            {
                if(sNum)
                {
                    //Segundo numero
                    y+= expressao[i];
                }
                else
                {
                    //Primeiro numero
                    x+= expressao[i];
                }
                
            }
            else
            {
                //Salva o valor da tabela ASCII da operacao
                iOp = i;
                //Informa que o primeiro numero foi encontrado
                sNum = true;
            }
        }
        //Calcula a resposta com base no valor do operador
        res = OPS[expressao[iOp] - 42](stod(x), stod(y));
        //Salva as informacoes no historico
        hist[n].operador1 = x;
        hist[n].operador2 = y;
        hist[n].tipoOpe = expressao[iOp];
        hist[n].resultado = to_string(res);
        //Imprime o resultado
        cout << "Resultado: " << res << endl;
        //Atualiza o "n" para a proxima posicao o array
        atualizaN(&n);
    }

    return 0;
}

