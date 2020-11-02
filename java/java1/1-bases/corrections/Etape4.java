public class Etape4 {

    public static String periode(int heure) {
        String periode;

        if (heure < 0 || heure > 24) {
            periode = "erreur, l'heure doit être comprise entre 0 et 24.";
        }
        else if(heure < 10) {
            periode = "matinée";
        }
        else if (heure < 18) {
            periode = "après-midi";
        }
        else {
            periode = "soirée";
        }
        return "bonne "+ periode;
    }

    public static void main(String[] args) {
        // tests
        System.out.println(periode(8));
        System.out.println(periode(-5)); // pour les erreurs, il faudra gérer avec des error ou exception (plus tard ..)
        System.out.println(periode(12));
        System.out.println(periode(18));
        System.out.println(periode(23));
        System.out.println(periode(35));

    }
}