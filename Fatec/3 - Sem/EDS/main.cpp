/*
1-Cadastrar pessoa na agenda de aniversariantes (nome, e-mail, dia, mês e ano de nascimento)
2-Excluir a pessoa a partir do nome
3-Alterar dia, mês ou ano a partir do nome
4-Consultar aniversariantes de uma data
5-Consultar aniversariantes de um dado mês
6-Consultar aniversariantes pela letra inicial do nome
7-Mostrar toda a agenda ordenada pelo nome
8-Mostrar toda a agenda ordenada pelo mês
9-Sair
*/
#include <iostream>
#include <stdio.h>
#include <string>
#include <string.h>

#define NC "\e[0m"
#define RED "\e[0;31m"
#define GRN "\e[0;32m"
#define CYN "\e[0;36m"
#define YWl "\x1b[33m"
#define REDB "\e[41m"

using namespace std;

struct Contato
{
    string nome;
    string email;
    string data;
};

//Verifica contatos e retorna posição caso encontre, -1 caso não encontre
int buscaPosContato(Contato contatos[1000], string nome)
{
    for (int i = 0; i < 1000; i++)
    {
        if (contatos[i].nome == nome)
        {
            return i;
        }
    }
    return -1;
}
//Funcao para cadastrar um contato
void cadastraContato(Contato contatos[1000])
{
    //Variavel para armazenar temporariamente as informacoes
    Contato contatoTemp{};
    //Obtendo as informacoes
    printf(CYN "Insira o nome do contato: " NC);
    cin >> contatoTemp.nome;
    printf(CYN "Insira o email do contato: " NC);
    cin >> contatoTemp.email;
    printf(CYN "Insira a data de aniversario, exemplo: (dd/mm/aaaa) " NC);
    cin >> contatoTemp.data;
    //Verificando posicao sem contato e alvando contato na lista
    int pos = buscaPosContato(contatos, "");
    contatos[pos] = contatoTemp;
}

//Funcao para excluir a pessoa a partir do nome
void excluiContato(Contato contatos[1000])
{
    //Variavel para armazenar o nome
    string nome;
    bool flag = false;
    printf(CYN "Insira o nome do contato para excluir(exatamente o nome): " NC);
    cin >> nome;
    //Verificando se o contato existe
    int pos = buscaPosContato(contatos, nome);
    if (pos != -1)
    {
        printf(GRN "Contato encontrado, realizando exclusão" NC);
        //Trocando os contatos posteriores para preencher o contato excluído
        for (int j = pos++; j < 1000; j++)
        {
            if (contatos[j].nome != "")
            {
                contatos[j - 1] = contatos[j];
                contatos[j] = {};
            }
        }
        printf(YWl "Contato excluído." NC);
        //Trocando flag que informa se o contato foi encontrado ou nao
        flag = true;
    }
    else
    {
        printf(RED "Contato nao encontrado, verifique o nome inserido: %s" NC, nome);
    }
}
//Altera data de nascimento
void alteraData(Contato contatos[1000])
{
    //Variavel apra armazenar o nome temporariamente
    string nome;
    //Variavel para armazenar o contato encontrado
    Contato contatoEnc={};
    printf(CYN "Insira o nome do contato que deseja alterar:" NC);
    cin >> nome;
    //Procurando contato baseado no nome.
    int pos = buscaPosContato(contatos,nome);
    if(pos != -1){
        contatoEnc = contatos[pos];
        cout << YWl "Contato encontrado:\nNome:" << contatoEnc.nome << "\nE-mail:" << contatoEnc.email << "\nData de Nasc.:" << contatoEnc.data << NC << endl;
        printf(CYN "Insira a nova data:(dd/mm/aaa) " NC);
        cin >> contatos[pos].data;
        printf(GRN "Contato alterado com sucesso." NC);
    }else{
        printf(RED "Contato não encontrado!\n" NC);
    }
}
//Consulta contatos aniiversariantes de uma data
void consultaAniData(Contato contatos[1000]){
    //Variavel para armazenar data e dados do contato
    string dataD, nome,email,dataE;
    //Variavel flag para informar se foi encontrado ou nao contato
    bool flag = false;
    printf(CYN "Insira a data que deseja consultar: (dd/mm/aaaa) " NC);
    cin >> dataD;
    for(int i =0;i<1000;i++){
        if(contatos[i].data == dataD){
            flag = true;
            nome = contatos[i].nome;
            email = contatos[i].email;
            dataE = contatos[i].data;
            cout << YWl "Contato " << i++;
            cout << "\nNome: " << nome << "\nE-mail: "<< email << "\nData: " <<dataE << NC;
        }
    }
    if(!flag){
        printf(RED "\nNenhum contato encontrado!\n" NC);
    }else{
        printf(GRN "\nFim dos contatos\n" NC);
    }
}
//Busca contatos com aniversario em um mes
void consultaAniMes(Contato contatos[1000]){
    //Variavel para armazenar o mes inserido e mes apos processar data
    string mes, mesP;
    string delimiter = "/";
    printf(CYN "Insira o mes: (mm)" NC);
    cin >> mes;
    for(int i=0;i<1000;i++){
        if(contatos[i].nome == ""){
            break;
        }else{
            mesP = contatos[i].data.substr(3, contatos[i].data.find(delimiter));
            if(mesP == mes){
                cout << YWl << "\nNome: " << contatos[i].nome << "\nE-mail: " << contatos[i].email << "\nData: " << contatos[i].data << NC;
            }
        }
    }
}
//Busca contatos com a letra inicial igual a informada
void consultaAniIni(Contato contatos[1000]){
    //Variavel para armazenar inicial
    char ini;
    printf("Insira a inicial:(Observe que letra maiuscula e minuscula sao diferenciadas) ");
    scanf("%01s",&ini);
    for (int i = 0; i < 1000; i++)
    {
        if (contatos[i].nome != "" && contatos[i].nome[0] == ini)
        {
            cout << YWl << "\nNome: " << contatos[i].nome << "\nE-mail: " << contatos[i].email << "\nData: " << contatos[i].data << NC << endl;
        }
    }
}
//Mostra a agenda ordenada pelo nome
int mostraOrdNome(Contato contatos[1000]){
    //Posicao de ordenacao
    int pos = 0;
    //Posicao do ultimo contato
    int ultC = buscaPosContato(contatos,"");
    //Posicao do "Menor" nome
    int mNome = 0;
    //Resultado da comparacao
    int resultado;
    //Struct para guardar temporariamente o contato a ser substituido
    struct Contato contatoS
    {
    };
    //Se tiver apenas um contato, ele ja retorna
    if (ultC == 1)
    {
        return 0;
    }
    //Percorrendo agenda ate que pos seja o ultimo contato
    for (pos; pos < ultC; pos++)
    {
        //Verificando se o contato esta ordenado ou nao, percorrendo toda a agenda
        for (int i = pos; i < ultC; i++)
        {
            if (i == pos)
            {
                mNome = i;
            }
            else
            {
                //Usei a biblioteca de comparacao, porem, daria para comparar char por char da string pela tabela ascii
                resultado = strcmp(contatos[mNome].nome.c_str(), contatos[i].nome.c_str());
                if (resultado > 0)
                {
                    mNome = i;
                }
            }
        }
        //Trocando contato da posicao com o menor
        contatoS = contatos[pos];
        contatos[pos] = contatos[mNome];
        contatos[mNome] = contatoS;
    }
    for(int i=0;i<1000;i++){
        if(contatos[i].nome == ""){
            break;
        }
        cout << YWl << "\nNome: " << contatos[i].nome << "\nE-mail: " << contatos[i].email << "\nData: " << contatos[i].data << NC << endl;
    }
}

int main()
{
    //Variavel para armazenar os contatos durante a execucação
    Contato contatos[1000]{};
    //Variavel para armaenar opcao
    int opt = 0;
    //Obtendo a opção e executando a funcao conforme a mesma
    while (opt != 9)
    {
        printf(GRN "Selecione uma opção:\n");
        printf("1-Cadastrar pessoa na agenda de aniversariantes\n");
        printf("2-Excluir a pessoa a partir do nome\n");
        printf("3-Alterar dia, mês ou ano a partir do nome\n");
        printf("4-Consultar aniversariantes de uma data\n");
        printf("5-Consultar aniversariantes de um dado mês\n");
        printf("6-Consultar aniversariantes pela letra inicial do nome\n");
        printf("7-Mostrar toda a agenda ordenada pelo nome\n");
        printf("8-Mostrar toda a agenda ordenada pelo mês\n");
        printf("9-Sair\n" NC);
        scanf("%d", &opt);
        switch (opt)
        {
        case 1:
            //1-Cadastrar pessoa na agenda de aniversariantes (nome, e-mail, dia, mês e ano de nascimento)
            cadastraContato(contatos);
            printf(YWl "Contato salvo!!\n" NC);
            break;
        case 2:
            //2-Excluir a pessoa a partir do nome
            excluiContato(contatos);
            break;
        case 3:
            //3 - Alterar dia, mês ou ano a partir do nome break
            alteraData(contatos);
        case 4:
            //4 - Consultar aniversariantes de uma data break;
            consultaAniData(contatos);
        case 5:
            //5-Consultar aniversariantes de um dado mês
            consultaAniMes(contatos);
            break;
        case 6:
            //6-Consultar aniversariantes pela letra inicial do nome
            consultaAniIni(contatos);
            break;
        case 7:
            //7-Mostrar toda a agenda ordenada pelo nome
            mostraOrdNome(contatos);
            break;
        case 8:
            /* code */
            break;
        case 9:
            break;
        default:
            printf(RED "Opcao invalida, tente novamente!\n" NC);
            break;
        }
    }
    printf(CYN "Saindo..." NC);
    return 0;
}