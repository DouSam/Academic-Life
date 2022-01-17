public class Pessoa extends Animal {
  private String instrucao;
  private String conjuge;

  //gets and sets
  public String getIntrucao() { return this.instrucao; }
  public void setInstrucao(String Instrucao) { this.instrucao = Instrucao; }
  public String getConjuge() { return this.conjuge; }
  public void setConjuge(String Conjuge) { this.conjuge = Conjuge; }   

  public String raciocinar() {
    return "capacidade de raciocinar: sim";
  }

  public String comunicar() {
    return "Falar";
  } 
  
  public String getId() {
    return "P" + super.getId();
  }  
} 