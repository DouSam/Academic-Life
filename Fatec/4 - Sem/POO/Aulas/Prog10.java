import javax.swing.*;

public class Prog10 {
    public static void main(String[] args) {
        
        int temp = 0;
        String msg = "";

        temp = Integer.parseInt(
            JOptionPane.showInputDialog(null,"Insira a temperatura: ")
        );

        if (temp < 5) {
            msg = "Impossivel ser tao baixa.";
        } else if (temp < 50) {
            msg = "Temperatura agradavel.";
        } else {
            msg = "O sistema corre perigo.";
        }

        JOptionPane.showMessageDialog(null, msg);
    }
}
