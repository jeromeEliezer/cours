import java.util.Scanner;

public class Rebours {
    public static void afficheReboursFor(int nb) {
        for (int i = nb; i > 0; i--) {
            System.out.print(i+" ");
        }
        System.out.println("Bang!");
    }

    public static void afficheReboursTempo(int nb, int millis) throws InterruptedException {
        for (int i = nb; i > 0; i--) {
            System.out.print(i+" ");
            Thread.sleep(millis); // pour la temporisation, le programme dort pdt quelques millisecondes. Il faut gérer l'InterruptedException
        }
        System.out.println("Bang!");
    }

    public static void afficheReboursWhile(int nb) {
        while (nb > 0) {
            System.out.print(nb+" ");
            nb--; // on décremente nb à chaque tour de boucle
        }
        // ici, on est sur nb n'est plus >0 (donc =0) car on est sorti de la boucle
        System.out.println("Bang!");
    }

    public static void afficheReboursEnColonne(int nb) throws InterruptedException{
        int nbTab = 9 - nb % 10;
        for (int i = 0; i < nbTab; i++) {
            System.out.print("\t");
        }

        for (int i = nb; i > 0; i--) {
            System.out.print(i+"\t");

            if (i % 10 == 0) {
                System.out.println();
            }

            Thread.sleep(100);
        }
        System.out.println("BIIM!");
    }

    public static void main(String[] args) throws InterruptedException {
        Scanner sc = new Scanner(System.in);

        System.out.println("Entrez un nb pleaze..");
        int nb = sc.nextInt();

        // afficheReboursFor(nb);
        // afficheReboursWhile(nb);
        // afficheReboursTempo(nb, 100);
        afficheReboursEnColonne(nb);
    }
}