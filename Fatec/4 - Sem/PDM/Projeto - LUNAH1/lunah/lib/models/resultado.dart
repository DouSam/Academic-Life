
class Resultado {
  String paciente;
  String dtNas;
  String carteirinha;
  String medico;
  String laudo;
  String dtEnvio;
  String dtLaudo;
  String dtPrevi;
  bool prioritario;
  Resultado(this.paciente,this.medico,this.dtEnvio,this.dtLaudo,this.laudo, this.dtPrevi, this.prioritario,this.carteirinha,this.dtNas);
  map(){
    return {
      'paciente'    : this.paciente,
      'medico'      : this.medico,
      'laudo'       : this.laudo,
      'dtEnvio'     : this.dtEnvio,
      'dtLaudo'     : this.dtLaudo,
      'dtPrevi'     : this.dtPrevi,
      'prioritario' : this.prioritario,
      'dtNas'       : this.dtNas,
      'carteirinha' : this.carteirinha
    };
  }
}