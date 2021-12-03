import javax.swing.*;

class Prog_home7 {
    public static void main(String[] args) {
        float[][] notas = new float[3][5];
        String msg = "";
        int opt = 0;

        for (int cont = 0; cont < 3; cont++) {
            for (int i = 0; i < 4; i++) {
                notas[cont][i] = Float.parseFloat(JOptionPane.showInputDialog(null,
                        "Insira a nota " + (i + 1) + " do aluno " + (cont + 1) + "."));
            }
            // calculando a media
            notas[cont][4] = (notas[cont][0] + notas[cont][1] + notas[cont][2] + notas[cont][3]) / 4;
        };

        opt = JOptionPane.showConfirmDialog(null, "Deseja visualizar totalizado? ");
        byte cont = 1; 

        if (opt == 0) {
            for (float[] aluno : notas) {
                msg += "Aluno " + cont;
                if (aluno[4] >= 7) {
                    msg += " Media: " + aluno[4] + ", APROVADO.\n";
                } else {
                    msg += " Media: " + aluno[4] + ", REPROVADO.\n";
                }
                cont++;
            }
            JOptionPane.showMessageDialog(null, msg);
        } else {
            for (float[] aluno : notas) {
                if (aluno[4] >= 7) {
                    msg = "Aluno " + cont + " Media: " + aluno[4] + ", APROVADO.";
                } else {
                    msg = "Aluno " + cont + " Media: " + aluno[4] + ", REPROVADO.";
                }
                cont++;
                JOptionPane.showMessageDialog(null, msg);
            }
        }
    }
}