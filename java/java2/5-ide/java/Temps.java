package menu;

import java.time.LocalDateTime;

import java.time.temporal.ChronoUnit;

/**
 * Cette classe regroupe les fonctions métiers sur le temps.
 * 
 * Toutes les méthodes sont statiques.
 * 
 * @author JT & PB
 *
 */
public class Temps {
	
	private final static LocalDateTime DATE_OF_CERTIF = LocalDateTime.of(2021, 8, 20, 23, 59);
	
	public static LocalDateTime now() {
		return LocalDateTime.now();
	}
	
	/**
	 * Calcule le nombre de secondes restant avant le passage de la certif
	 * @return le nombre de secondes restant avant le passage de la certif
	 */
	public static long secondsToCertif() {
		return now().until(DATE_OF_CERTIF, ChronoUnit.SECONDS );
	}
	
	public static long daysToCertif() {
		return now().until(DATE_OF_CERTIF, ChronoUnit.DAYS );
	}
	

}
