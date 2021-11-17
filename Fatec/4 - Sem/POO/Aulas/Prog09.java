import javax.swing.*;

public class Prog09 {
    public static void main(String[] args) {
        int dia = 0;
        String msg = "";

        dia = Integer.parseInt(
            JOptionPane.showInputDialog(null,"Insira um dia da semana (0-6")
        );

        if(dia > 6 || dia < 0) {
            msg = "Insira um dia entre 0 e 6";
        } else {
            if (dia == 0) {
                msg = "Domingo";
            }
            if (dia == 1) {
                msg = "Segunda-feira";
            }
            if (dia == 2) {
                msg = "Terca-feira";
            }
            if (dia == 3) {
                msg = "Quarta-feira";
            }
            if (dia == 4) {
                msg = "Quinta-feira";
            }
            if (dia == 5) {
                msg = "Sexta-feira";
            }
            if (dia == 6) {
                msg = "Sabado";
            }
        }

        JOptionPane.showMessageDialog(null,msg);
    }
}
