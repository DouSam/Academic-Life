class User{
  String email;
  String senha;
  String nome;
  String cpf;
  String dtNas;
  String crm;
  String tipUsr;
  String carteirinha;
  String id;
  User(this.email,this.senha, this.nome, this.cpf, this.dtNas, this.crm, this.tipUsr, this.carteirinha, this.id);
  listaUser(){
    print(email);
    print(senha);
    print(nome);
    print(cpf);
    print(dtNas);
    print(crm);
    print(tipUsr);
    print(carteirinha);
    print(id);
  } //utilizada apenas para depurar
  toMap(){
    return {
      'email' : this.email,
      'nome'  : this.nome,
      'cpf'   : this.cpf,
      'dtNas' : this.dtNas,
      'crm'   : this.crm,
      'tipUsr': this.tipUsr,
      'carteirinha': this.carteirinha
    };
  }
  limpar(){
    this.email  = "";
    this.senha  = "";
    this.nome   = "";
    this.cpf    = "";
    this.dtNas  = "";
    this.crm    = "";
    this.tipUsr = "";
    this.carteirinha = "";
    this.id = "";
  }
}

var actualUser;
