package co.simplon.bnppf;

import java.util.Scanner;

/*
 * ce qui est spécifique à chaque instance de TestItem :
 * - question : String 
 * - réponse : String 
 * - nb de points : int
 * Ce qui est commun à tous les TestItem (s) :
 * - nb d' essais : int
 * 
 *
 */
public class TestItem {
	private final String question;
	private final String answer;
	private final int nbPoints;
	
	private static Scanner in = new Scanner(System.in);	
	private static final int NB_RETRIES= 3;
	
	public TestItem(String question, String answer, int nbPoints) {
		this.question= question;
		this.answer= answer;
		this.nbPoints= nbPoints;
	}
	
	public int attempt() {
		int result=0;
		System.out.println(question);
		String answer = in.nextLine();
		if (answer.equalsIgnoreCase(this.answer)) {
			result= nbPoints;
		}
		return result;
	}
	
	public int getNbPoints() {
		return nbPoints;
	}
}