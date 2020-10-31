package application;

import java.util.ArrayList;

import entites.Apprenant;
import requetes.Requetes;

/**
 * @author Philippe
 *
 */
public class Lancer {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		// 1. Liste de tous les apprenants
		System.out.println("Liste de tous les apprenants de la Promo3 :\n\n");
		ArrayList<Apprenant>  apprenants = Requetes.listeApprenants();
		for(Apprenant apprenant : apprenants)
		{
			System.out.println(apprenant);
		}
		
		// dans cet exemple, la méthode apprenantsParRegion(Region region) fait tout le travail y compris l'affichage des résultats
		// à titre de démonstration car normalement les méthodes métiers se contentent de renvoyer des résultats que la partie vue se
		// charge d'afficher.
		
		// 2. Liste des apprenants d'Ile de France
		System.out.println("\n\nListe des apprenants "+Requetes.libelleRegion(1)+" :\n");
		Requetes.apprenantsParRegion(1);
		
		// 3. Liste des apprenants de Nouvelle Aquitaine
		System.out.println("\n\nListe des apprenants "+Requetes.libelleRegion(2)+" :\n");
		Requetes.apprenantsParRegion(2);
		
		// 4. Liste des apprenants du Pays de Loire
		System.out.println("\n\nListe des apprenants "+Requetes.libelleRegion(3)+" :\n");
		Requetes.apprenantsParRegion(3);
		
		// 5. Liste des 3 régions
		System.out.println(Requetes.libelleRegion(2));
		
		
		
		
	}

}
