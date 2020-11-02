public class Etape2{
    public static void main(String[] args) {
        // ex 1
        System.out.println("\n\n>>>> ex1");
        int mystery1 = 8 + 6;
        int mystery2 = 8 - 6;
        System.out.println(mystery2);

        // ex 2
        System.out.println("\n\n>>>> ex2");
        int zebrasInZoo = 8;
        int giraffesInZoo = 4;
        int animalsInZoo = zebrasInZoo + giraffesInZoo;
        System.out.println(animalsInZoo);

        // ex 3
        System.out.println("\n\n>>>> ex3");
        double prixInitial = 1500;
        double tva = 0.20;
        double prixFinal = prixInitial + prixInitial * tva;
        System.out.println(prixFinal);

        // ex 4
        System.out.println("\n\n>>>> ex4 : question 1");
        int nbOeufsParBoite = 6;
        int nbOeufsTotal = 145;

        int nbBoites = nbOeufsTotal / nbOeufsParBoite;
        int nbOeufsRestant = nbOeufsTotal % nbOeufsParBoite;
        System.out.println("Il y a "+nbBoites+" boites et il restera "+nbOeufsRestant+" en dehors.");

        System.out.println("\n\n>>>> ex4 : question 2");
        int carteMystere= 2;
        int numeroCouleur = carteMystere/8;
        int numeroCarte = carteMystere%8;

        String[] couleurs = {"pique", "coeur", "carreau", "trèfle"};
        String[] cartes = {"7", "8", "9"," 10", "valet", "dame", "roi", "as"};

        
        System.out.println("la carte est le "+cartes[numeroCarte]+" de "+couleurs[numeroCouleur]);

        // ex 6
        System.out.println("\n\n>>>> ex6");

        int songsA = 9;
        int songsB = 9;
        int albumLengthA = 41;
        int albumLengthB = 53;

        boolean sameSongs = songsA == songsB;
        boolean sameAlbumLength = albumLengthA == albumLengthB;

        // dans ce cas, la syntaxe if/else avec ? est efficace :) 
        // https://stackoverflow.com/questions/8898590/short-form-for-java-if-statement
        System.out.println("il est "+(sameSongs ? "vrai":"faux")+" que les albums ont le même nombre de chanson.");
        System.out.println("il est "+(sameAlbumLength ? "vrai":"faux")+" que les albums ont la même durée.");
    }
}