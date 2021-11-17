import javax.swing.*;
import java.text.DecimalFormat;

public class Prog08 {
    public static void main(String[] args) {
        
        DecimalFormat df = new DecimalFormat("#.##");
        float nota1 =0, nota2 = 0, media = 0;
        String msg = "";

        nota1 = Float.parseFloat(
            JOptionPane.showInputDialog(null, "Insira a nota 1: ")
        );

        nota2 = Float.parseFloat(
            JOptionPane.showInputDialog(null, "Insira a nota2: ")
        );

        if(nota1 > 10 || nota2 > 10 || nota1 < 0 || nota2 < 0) {
            msg = "Insira uma nota válida.";
        } else {

            media = (nota1 + nota2) / 2;
            
            if(media >= 7) {
                msg = "Media: " + df.format(media) + ", aprovado.";
            } else {
                msg = "Media: " + df.format(media) + ", reprovado.";
            }
        }

        JOptionPane.showMessageDialog(null, msg);
    }
}
