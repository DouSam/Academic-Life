using namespace std;
class Fila {
    private:
        struct elemento {
            int qtdFolha;
            int idImpressao;
            string nomeImpressao;
            elemento *proximoElemento;
        };
        typedef elemento *PonteiroElemento;
        PonteiroElemento inicio;
        PonteiroElemento fim;
        int qtdFolhaImp;
        int id;
    public:
        Fila();
        bool vazia();
        bool cheia();
        // alterar
        bool inserir(string nome,int qtdFolhas);
        bool remover(int &id,string &nome,int &qtdFolhas);
        // implementar
        string listar();
        int listarFolhas();
        bool inserirFolhas(int auxFolhas);
        bool imprimir();
};