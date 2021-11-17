class Se { 
    public static void main(String[] args) {
        // Sem a utilizacao de operador ternario
        int idade =88;

        if(idade >= 18) {
            System.out.println("Voce e de maior.");
        } else {
            System.out.println("Voce e de menor.");
        }

        // Com operador ternario
        System.out.println( (idade >=18) ? "Voce e de maior." : "Voce e de menor." );
    }
}