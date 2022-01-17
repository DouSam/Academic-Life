/*
  file: Calc.java (pt-br version)
  objective: basic match calculator
  author: Prof. Macris, nov-2021, tch.macris@gmail.com
*/

import javax.swing.*;

class Calc {
  public static void main (String args[]) {

    float valor1=0, valor2=0, resultado=0;
    int opcao=0;

    valor1 = Float.parseFloat(JOptionPane.showInputDialog(null, "Informe o primeiro operando:"));
    valor2 = Float.parseFloat(JOptionPane.showInputDialog(null, "Informe o segundo operando:"));
    opcao = Integer.parseInt(JOptionPane.showInputDialog(null, "Informe o operador para \n(1) Adicao\n(2) Subtracao\n(3) Multiplicao\n(4) Divisao"));

    switch (opcao) {
      case 1:
        resultado = valor1 + valor2;
        JOptionPane.showMessageDialog(null,"Adicao: " + resultado);
        break;
      case 2:
        resultado = valor1 - valor2;
        JOptionPane.showMessageDialog(null,"Subtracao: " + resultado);
        break;
      case 3:
        resultado = valor1 * valor2;
        JOptionPane.showMessageDialog(null,"Multiplicacao: " + resultado);
        break;
      case 4:
        resultado = valor1 / valor2;
        JOptionPane.showMessageDialog(null,"Divisao: " + resultado);
        break;
    }
  }
}