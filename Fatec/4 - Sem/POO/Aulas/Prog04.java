import javax.swing.*;

class Prog04 {
    public static void main (String args[]) {
        int dia=0, mes=0, ano=0;

        String aux1 = JOptionPane.showInputDialog(null, "Informe o dia (ex: 31): ");
        String aux2 = JOptionPane.showInputDialog(null, "Informe o mes (ex: 02): ");
        String aux3 = JOptionPane.showInputDialog(null, "Informe o ano (ex: 2021): ");

        dia = Integer.parseInt(aux1);
        mes = Integer.parseInt(aux2);
        ano = Integer.parseInt(aux3);

        JOptionPane.showMessageDialog(null, dia + "/" + mes + "/" + ano);
    }
}