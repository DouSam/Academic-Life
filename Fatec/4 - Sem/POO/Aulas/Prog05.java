import javax.swing.*;

class Prog05 {
    public static void main(String[] args) {
        String text = "Analise e Desenvolvimento de Sistemas - FTC";
        String text2 = text.replace("FTC", "FATEC");
        String msg = "";

        msg = "Tamanho: " + text.length() + "\n" +
            "Maiusculo: " + text.toUpperCase() + "\n" +
            "Posicao de 'Sistemas': " + text.indexOf("Sistemas") + "\n" +
            "Nova string: " + text2;
            
        JOptionPane.showMessageDialog(null, msg.concat("\n\nFim da mensagem"));
    }
}