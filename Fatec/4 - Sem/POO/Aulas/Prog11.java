import javax.swing.*;

public class Prog11 {
    public static void main(String[] args) {
        int dia = 0;
        String msg = "";

        dia = Integer.parseInt(
            JOptionPane.showInputDialog(null,"Insira um dia da semana (0-6)")
        );
        switch(dia) {
            case 0: msg = "Domingo"; break;
            case 1: msg = "Segunda-feira"; break;
            case 2: msg = "Terca-feira"; break;
            case 3: msg = "Quarta-feira"; break;
            case 4: msg = "Quinta-feira"; break;
            case 5: msg = "Sexta-feira"; break;
            case 6: msg = "Sabado"; break;
            default:
                msg = "Insira um dia entre 0 e 6";
                break;
        }
        
        JOptionPane.showMessageDialog(null,msg);
    }
}
