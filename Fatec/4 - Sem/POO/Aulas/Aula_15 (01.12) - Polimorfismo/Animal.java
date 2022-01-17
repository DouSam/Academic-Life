import java.text.SimpleDateFormat;
import java.util.Date;

public class Animal {
  private String nome;
  private int idade;
  private float peso;
    
  //gets and sets
  public String getNome() { return this.nome; }
  public void setNome(String Nome) { this.nome = Nome; }
  public int getIdade() { return this.idade; }
  public void setIdade(String Idade) { this.idade = Integer.parseInt(Idade); }
  public float getPeso() { return this.peso; }
  public void setPeso(float Peso) { this.peso = Peso; }   

  public String getId() {
    Date agora = new Date();
    SimpleDateFormat df = new SimpleDateFormat("hhmmss");
    return df.format(agora);
  }

  public String identificar() {
    return "ID" + this.idade + this.nome.toUpperCase();
  }

  public String comunicar() {
    return "Indefinido";
  }
} 