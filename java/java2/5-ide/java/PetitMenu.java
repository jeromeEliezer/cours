package menu;

import java.text.MessageFormat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

/**
 * Une classe uniquement pour gérer les intéractions avec l'utilisateur.
 *
 * @author JT & PB
 *
 */
public class PetitMenu {

	private Scanner sc;

	/**
	 * Le constructeur initialise son seul attribut.
	 */
	public PetitMenu() {
		this.sc = new Scanner(System.in);
	}

	public void lanceMenu(){
		String menu = "\n"
				+ "Bienvnue dans mon programme!\n"
				+ "1.Pour afficher l'heure\n"
				+ "2.Pour afficher le temps restant avant le peasage du titre!\n"
				+ "0.Pour quitter";

        int choix;

        do {
            System.out.println(menu);
            choix = sc.nextInt();
            if (choix == 1) {
            	LocalDateTime time = Temps.now();
                String timeMsg = MessageFormat.format("Il est {0}, nous sommes le {1}",
                		time.format(DateTimeFormatter.ofPattern("hh:mm")),
                		time.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))
                		);
                System.out.println(timeMsg);
            }
            else if (choix == 2) {
            	long seconds = Temps.secondsToCertif();
            	String timeMsg = MessageFormat.format("Il reste {0} secondes avant le passage du titre", seconds);
                System.out.println(timeMsg);
            }
            else if (choix == 0) {
                System.out.println("bye bye...");
            }
            else {
                System.out.println("tu fais erreur, cette option n'existe pas");
            }
        } while (choix != 0);
	}


}
