public class Cao extends Animal {
  private String raca;
  private boolean cauda;

  //gets and sets
  public String getRaca() { return this.raca; }
  public void setRaca(String Raca) { this.raca = Raca; }
  public boolean getCauda() { return this.cauda; }
  public void setCauda(String Cauda) { this.cauda = (Cauda.equals("sim")) ? true : false; }   

  public String morder() {
    return "capacidade de morder: sim";
  }

  public String comunicar() {
    return "Latir";
  } 
  
  public String getId() {
    return "C" + super.getId();
  }   
} 