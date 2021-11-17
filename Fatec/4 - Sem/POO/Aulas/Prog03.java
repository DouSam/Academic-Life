import java.util.Scanner;

class Prog03 {

    public static void main(String[] args) {
        float nota1, nota2, media;

        Scanner entrada = new Scanner(System.in);

        System.out.println("Digite a nota 1: ");
        nota1 = Float.parseFloat(entrada.nextLine());

        System.out.println("digite a nota 2: ");
        nota2 = Float.parseFloat(entrada.nextLine());

        media = (nota1 + nota2)/2;

        System.out.println("Media: " + media);
        System.out.println("Fim do programa.");

        entrada.close();
    }
}