class Fila {
    private:
        int qtd_total;
        struct elemento {
            string nome_arq;
            int folha_usa;
            int id_seq;
            elemento *proximoElemento;
        };
        typedef elemento *PonteiroElemento;
        PonteiroElemento inicio;
        PonteiroElemento fim;
    public:
        Fila();
        bool vazia();
        bool cheia();
        // alterar
        bool inserir(string x, int y, int i);
        bool remover(string &x, int &y, int &i);
        // implementar
        string listar();
        int listarFolhas();
        bool inserirFolhas(int auxFolhas);
        bool imprimir();
};