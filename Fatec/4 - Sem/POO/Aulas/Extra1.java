import javax.swing.*;

class Extra1 {
    public static void main(String args[]) {
        String msg = "";
        int[] idade = new int[5];
        // armazenamento
        for (int cont = 0; cont < idade.length; cont++) {
            idade[cont] = Integer.parseInt(JOptionPane.showInputDialog("Entre com a idade do paciente " + (cont + 1)));
        }
        // listagem
        msg = "Listagem das idades\n";
        for (int temp : idade) {
            msg += temp + "\n";
        }

        JOptionPane.showMessageDialog(null, msg);
    }
}