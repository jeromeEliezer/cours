import java.text.DecimalFormat;

public class Etape3{

    /**
     * Calcule l'aire d'un triangle de hauteur et de base spécifiés
     * @param hauteur
     * @param base
     * @return l'aire
     */
    public static double aireTriangle(int hauteur, int base) {
        return base * hauteur / 2.0;
    }

    /**
     * Calcule le volume d'une sphère de rayon spécifié
     * @param rayon
     * @return le volume
     */
    public static double volumeSphere(double rayon) {
        return 4*Math.PI*Math.pow(rayon, 3)/3.0;
    }

    /**
     * Calcule l'imc en fonction de la masse et la taille spécifiées
     * @param poids en kg
     * @param taille en cm
     * @return la valeur de l'imc
     */
    public static double imc(double masse, double taille) {
        double tailleEnM = taille/100;
        return masse / (tailleEnM*tailleEnM);
    }

    /**
     * @param prenom un prenom
     * @param masse en kg
     * @param taille en cm
     * @return un message contenant la valeur de l'imc
     */
    public static String imcMessage(String prenom, double masse, double taille) {
        return prenom + ", ton imc est : "+imc(masse, taille);
    }

    public static void main(String[] args) {
        // tests aire triangle
        System.out.println(aireTriangle(10, 8)); // normalement 40

        // tests volume sphère
        System.out.println(volumeSphere(3)); // normalement 113.1

        DecimalFormat df = new DecimalFormat("#.##");
        System.out.println(df.format(volumeSphere(3))); // normalement 113.1

        // tests imc
        System.out.println(imcMessage("obi1", 95, 181)); // normalement 29.0
    }
}