import javax.swing.*;

public class Prog06 {
    public static void main(String[] args) {
        float nota1 = 0, nota2 = 0, media = 0;
        String msg = "\t Resultado\n";

        nota1 = Float.parseFloat(
            JOptionPane.showInputDialog(null,"Informe a nota 1: ")
        );

        nota2 = Float.parseFloat(
            JOptionPane.showInputDialog(null,"Informe a nota2: ")
        );

        media = (nota1 + nota2)/2;

        if(media > 7) {
            msg += "Media: " + media + "\nAprovado";
        }

        JOptionPane.showMessageDialog(null, msg);
    }
}
