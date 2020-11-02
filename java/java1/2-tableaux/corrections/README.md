# Proposition de correction des exercices et TP

## Exercice 1 (a, b et c)

### a) Affichage d'un mot à l'endroit

```java

public static void exerciceA(String chaine)
{
	System.out.println(chaine+" : ");
	for(int i=0;i< chaine.length();i++)
	{
		System.out.println(chaine.toCharArray()[i]);
	}
}


```

### b) Affichage d'un mot à l'envers


```java
	/**
	 * Idem que exerciceA mais affiche le mot en commençant par la fin
	 * @param chaine
	 */
	public static void exerciceB(String chaine)
	{
		System.out.println(chaine+" (à l'envers) : ");
		int longueur = chaine.length()-1;
		for(int i=longueur;i>=0;i--)
		{
			System.out.println(chaine.toCharArray()[i]);
		}

	}

```

### Pour lancer les exercices a et b

```java

/**
 * @param args
 */
public static void main(String[] args) {


		String mot = "SIMPLON";
		Exercices.exercice1(mot);
		exercice1bis(mot);
		

    }
}

```

### c) Retourne vrai ou faux si une chaîne est trouvée dans une autre

```java

public static boolean isExiste(String lettres, String mot)
{
if ( (lettres!=null && mot !=null) && mot.indexOf(lettres)>=0) return true;
	return false;
}
// pour tester à mettre dans le main() :
// test méthode isExiste() pour la recherche d'une chaîne dans une autre.
    System.out.print("Recherche d'une chaîne \"it\" dans une autre \"petit\" : ");
    System.out.println(Palindrome.isExiste("it", "petit"));
```

## Exercice 2 : Palindrome

```java

import java.util.Scanner;

public class Palindrome {

/**
* Retourne vrai ou faux et affiche le résultat
* @param mot
* @return
*/
public static boolean isPalindrome(String mot)
{
	String chaine=mot;
	String chaineInversee = "";
	int longueur = chaine.length();  // on stocke la longueur dans une variable 

for ( int i = longueur - 1; i >= 0; i-- )
{
	chaineInversee+= chaine.charAt(i);  
}
System.out.println("valeur de chaine :"+chaine);
System.out.println("valeur de chaine :"+chaineInversee);

// on teste l'égalité entre les deux chaines
if (chaine.equals(chaineInversee))
{
	System.out.println("C'est un palindrome !");
	return true;
}
else  
{
	System.out.println("Ce n'est pas un palindrome !");
	return false;
}
}  

public static void main(String args[])  
{  
    Scanner saisie = new Scanner(System.in); 
    System.out.print("Saisissez une chaine pour voir si c'est un palindrome : ");

    Palindrome.isPalindrome(saisie.nextLine());  // on récupère la chaîne tester avec "Kayak"
}

```

### Exercice 3 : Nombre Hasard

```java
package nombrehasard;

import java.util.Random;

/**
 * @author Philippe
 *
 */
public class Hasard {

	private int[] tableau;
	private double moyenne=0;
	private double somme=0;

	/**
	 * Constructeur sans argument
	 */
	public Hasard() {
		this(10);
	}

	/**
	 * Constructeur avec argument dimension
	 * avec exemple de tirage et affectation d'un nombre différent de zéro !
	 */
	public Hasard(int dimension) {

		this.tableau = new int[dimension];
		this.tirage(); // je lance le tirage depuis le constructeur. 

	}
	/**
	 * Méthode de tirage que l'on peut éventuellement mettre dans 
	 * le constructeur. ici j'utilise un do... while() pour éviter 
	 * d'avoir un nombre égal à zéro.
	 * J'ai ajouté un System.out.println() pour afficher les nombres
	 * tirés et donc, il peut y avoir des nombres de valeurs zéro 
	 * qui ne seront pas affectés !
	 */
	private void tirage()
	{
		int nombre=0;
		for (int i=0;i<this.tableau.length;i++)
		{
			do
			{
				nombre = new Random().nextInt(100);
				System.out.println("indice = "+i+" nombre aléatoire = "+nombre); // juste pour vérifier

			}while(nombre==0);

			tableau[i]= nombre;

		}
	}
	/**
	 * méthode pour calculer la moyenne
	 */
	public void moyenne()
	{

		for (int nombre : this.tableau) {

			this.somme+=nombre;

		}
		this.moyenne=this.somme/this.tableau.length;
	}

	/**
	 * Méthode pour afficher la liste des nombres stockés dans le tableau
	 */
	public void afficher()
	{
		System.out.println("Liste des nombres stockés dans le tableau :");
		for (int i : tableau) {

			System.out.println(i);

		}

	}

	/**
	 * Méthode pour afficher la liste des nombres supérieurs à la moyenne
	 */
	public void afficherNombreSupMoyenne()
	{
		System.out.println("Liste des nombres supérieurs à la moyenne ("+this.moyenne+ ") :");
		for (int nombre : tableau) {

			if (nombre > this.moyenne)
			{
				System.out.println(nombre);
			}
		}
	}

	/**
	 * méthode pour ajouter un entier à tous les nombres stockés dans le 
	 * tableau
	 * @param parametre
	 */
	public void ajouterEnPlus(int parametre)
	{
		for(int i=0; i<this.tableau.length-1;i++)
		{
			this.tableau[i]+=parametre;

		}
	}

	/**
	 * Méthode main pour lancer le programme
	 * @param args
	 */
	public static void main(String[] args) {


		Hasard h = new Hasard();		//appel constructeur vide
		h.moyenne();					//appel pour le calcul de la moyenne
		h.afficher();					// appel pour afficher la liste des nombres
		h.afficherNombreSupMoyenne();	// appel pour afficher les nombres sup à la moyenne
		h.ajouterEnPlus(100);			// appel pour ajouter 100 à tous les nombres
		h.afficher();					// appel pour réafficher les nombres avec leurs nouvelles valeurs
	}

}

```


### TP : Analyse d'une chaîne

```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

/**
 * @author Philippe
 *
 */
public class ChaineSimple {


	// Déclaration des variables de la classe chaine

	private String maChaine;
	private int voyelles;
	private int consonnes;
	private int lettres;
	private int mots;
	private int espaces;

	/**
	 * 	Constructeur sans argument
	 */
	public ChaineSimple()

	{
		System.out.println("Donnez une suite de mots puis validez (entrée)");
		{
			try
			{
				InputStreamReader entree=new InputStreamReader(System.in);
				BufferedReader clavier=new BufferedReader(entree);
				this.maChaine=clavier.readLine().trim();
			}

			catch(IOException e)
			{
				System.out.println("Problème de lecture en entrée !");
			}
		}

	}	// fin de méthode constructeur

	/**
	 * méthode d'extraction des caractères de la chaîne saisie au clavier
	 */
	public void extraire()

	{
		char lettre;
		String lettresVoyelles="AEIOUYaeiouyàéîïôûyèâ";
		String speciaux = "*!:;,&#'(-è_çà)=+-_987654321%$";
		// il existe aussi les regex, bien pratique

		for (int i=0;i<this.maChaine.length();i++)
		{

			lettre=this.maChaine.charAt(i);

			if (Character.isLetter(lettre))
			{
				if (lettresVoyelles.indexOf(lettre) >= 0)

				{
					this.voyelles++;
				}
				else
				{
					this.consonnes++;
				}
			}
			else if (Character.isWhitespace(lettre))
			{
				this.espaces++;
			}
			if (speciaux.indexOf(lettre)<0)
			{
				this.lettres++;
			}
		}	// fin de boucle	

		//pour le fun on compte les mots avec une méthode d'une classe bien pratique !
		StringTokenizer chaineAJetons = new StringTokenizer(this.maChaine);
		this.mots=chaineAJetons.countTokens();

	}	// fin de méthode

	@Override
	public String toString() {
		return this.maChaine;
	}

	/**
	 * Méthode qui affiche le résultat dans la console
	 */
	public void affiche(){

		System.out.println("la chaîne est          : "+maChaine);
		System.out.println("le nombre de voyelles  : "+voyelles);
		System.out.println("le nombre de consonnes : "+consonnes);
		System.out.println("le nombre d'espaces    : "+espaces);
		System.out.println("le nombre de lettres   : "+(lettres-espaces));
		System.out.println("le nombre total de mot : "+mots);
	}

	public static void main(String args[])  
	{
		ChaineSimple unechaine = new ChaineSimple();
		unechaine.extraire();
		unechaine.affiche();
	}

}	// fin de classe Chaine

```

### Biblio - Livre (TP un peu différent prévu sur les fichiers avec Josselin)

#### Classe Livre

```java
package biblio;

/**
 * @author Philippe
 */
public class Livre {
	
	private Integer iSBN;
	private String titre;
	private float prix;
	
	public Livre() {
		super();
	}
	public Livre(Integer iSBN, String titre, float prix) {
		super();
		this.iSBN = iSBN;
		this.titre = titre;
		this.prix = prix;
	}
		
	public Integer getISBN() {
		return iSBN;
	}
	public void setISBN(Integer iSBN) {
		this.iSBN = iSBN;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	@Override
	public String toString() {
		return "Livre " + iSBN +" "+ titre + " " + prix;
	}
}

```

#### Classe GestionLivres (avec la méthode main())

```java
package biblio;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

/**
 * Découverte de HashMap, Iterator, Map, MapEntry...
 * 
 * @author Philippe
 *
 */
public class GestionLivres {

	// idéal pour faire des recherches par clef ici, Integer = ISBN d'un objet Livre.
	private HashMap<Integer, Livre> biblio;
	
	public GestionLivres() {
		this.biblio = new HashMap<>();
	}

	public Map<Integer, Livre> getBiblio() {
		return biblio;
	}

	public void setBiblio(Map<Integer, Livre> biblio) {
		this.biblio = (HashMap<Integer, Livre>) biblio;
	}

	public void ajouterLivre(Livre livre)
	{
		
		if (livre!=null && !biblio.containsKey(livre.getISBN()))
		{
			biblio.put(livre.getISBN(), livre);	
		
		}
	}
	
	public void supprimer(Livre livre)
	
	{
		if (livre!=null && biblio.containsKey(livre.getISBN()))
		{
			biblio.remove(livre.getISBN());
		}
		
	}
	
	public int getNombreTotalDeLivres()
	{
		return biblio.size();
		
	}
	
	
	
	/**
	 * Retourne le montant total des livres stockés en bibliotèque
	 * Lien vers le fonctionnement d'un HashMap à l'aide d'une autre classe
	 * https://www.geeksforgeeks.org/traverse-through-a-hashmap-in-java/
	 * @return
	 */
	public float getMontantTotal()
	{
		
		float total=0.0f;
		
		// Récupérer un Iterator pour parcourir le tableau 
        Iterator<Entry<Integer, Livre>> it = biblio.entrySet().iterator(); 
  
        // parcours du tableau avec une boucle while
        while (it.hasNext())
        { 
        	   @SuppressWarnings("rawtypes")
        	   Map.Entry mapElement = it.next(); 
        	   Livre livre = (Livre) mapElement.getValue(); // on récupère un objet de type Livre
        	   total+=livre.getPrix(); // on ajoute le prix de chaque livre
        } 
	
		return total; 
	}
	
	/**
	 * Rechercher un livre par un numéro ISBN (réduit)
	 * @param isbn
	 * @return
	 */
	public Livre getLivreParISBN(Integer isbn)
	{
		if (isbn>0 && biblio.get(isbn)!=null)
			{
				return biblio.get(isbn);
			}
		return null;	
	}
	
	/**
	 * utilisation d'une boucle foreach pour lire les éléments et les afficher 
	 * dans la console.
	 * Ici K = la clef pour nous c'est l'iSBN
	 * V = objet Livre (appel automatiquement la méthode toString() définie dans la classe Livre)
	 */
	public void afficherLivres()
	{
		biblio.forEach((cle, valeur) -> System.out.println(cle + " : " + valeur));

	}
	public static void main(String[] args)
	{
		
		Livre l1 = new Livre(1234,"titre1", 12.00f);
		Livre l2 = new Livre(5678,"titre2", 13.00f);
		Livre l3 = new Livre(6789,"titre3", 14.00f);
		
		GestionLivres gestion = new GestionLivres();
		gestion.getBiblio().put(l1.getISBN(),l1);
		gestion.getBiblio().put(l2.getISBN(),l2);
		gestion.getBiblio().put(l3.getISBN(),l3);
		
	 
		System.out.println("1. Recherche du livre 2 avec l'ISBN 5678\n");
		
		System.out.println(gestion.getLivreParISBN(5678));
		
		System.out.println("2. Montant total des livres en biblio = "+ gestion.getMontantTotal()+ " euros");
		
		System.out.println("3. Nombre de livres en biblio = "+ gestion.getNombreTotalDeLivres());
		
		System.out.println("4. Ajout du livre 4 (9876, Titre4, 18.00 euros) ");
		gestion.ajouterLivre(new Livre(9876, "Titre4",18.00f));
		
		System.out.println("5. Liste de tous les livres");
		gestion.afficherLivres();
		
		System.out.println("6. Nouveau montant total des livres en biblio = "+ gestion.getMontantTotal()+ " euros");
		
		System.out.println("7. Nouveau nombre de livres en biblio = "+ gestion.getNombreTotalDeLivres());
		
		System.out.println("8. Liste de tous les livres");		
		gestion.afficherLivres();
		
		System.out.println("9. suppression du livre avec l'ISBN 5678");		
		gestion.supprimer(gestion.getLivreParISBN(5678));
		
		System.out.println("10. Liste de tous les livres");		
		gestion.afficherLivres();
	}

}

```

#### Résultats que vous devez obtenir dans votre console

```java
1. Recherche du livre 2 avec ISBN 5678
Livre 5678 titre2 13.0

2. Montant total des livres en biblio = 39.0 euros
3. Nombre de livres en biblio = 3
4. Ajout du livre 4 (9876, Titre4, 18.00 euros) 

5. Liste de tous les livres
1234 : Livre 1234 titre1 12.0
9876 : Livre 9876 Titre4 18.0
6789 : Livre 6789 titre3 14.0
5678 : Livre 5678 titre2 13.0

6. Nouveau montant total des livres en biblio = 57.0 euros
7. Nouveau nombre de livres en biblio = 4

8. Liste de tous les livres
1234 : Livre 1234 titre1 12.0
9876 : Livre 9876 Titre4 18.0
6789 : Livre 6789 titre3 14.0
5678 : Livre 5678 titre2 13.0

9. suppression du livre avec ISBN 5678

10. Liste de tous les livres
1234 : Livre 1234 titre1 12.0
9876 : Livre 9876 Titre4 18.0
6789 : Livre 6789 titre3 14.0

```

### Comptes bancaires

#### Classe Compte

```java
package comptes;
/** =======================================
	TP - Gestion de Comptes Bancaires
	Classes, constructeurs et encapsulation
	Auteur		: Philippe Bouget
	année		: 2019
	Programme	: Compte.java
	========================================
	Objectifs pédagogiques :
		- Création d'une classe
		- Création de variables static (de classes)
		- utilisation d'un compteur (static)
		- Appel d'un constructeur avec this()
*/

public class Compte
{
    // constantes de classe : static final
    private static final String ENSEIGNE = "La Meilleure Banque";
    private static final String DEBUT_RIB = "42212 05666";

    // variables de classe : static
    private static int nombreDeClients;

    // variables d'instance (elles sont propres à l'objet) :  
    private int numero;
    private String titulaire;
    private double solde;

     /**
     * Premier constructeur avec un solde de zéro
     * @param titulaire String
     */
    public Compte(String titulaire)
    {
    	// appel du second constructeur
        this(titulaire,0);  // création d'un compte solde initial à 0
    }

   
    /**
     * Second constructeur avec 2 arguments
     * @param titulaire String
     * @param soldeInitial double
     */
    public Compte(String titulaire, double soldeInitial)
    {
        this.titulaire = titulaire;
        this.solde = soldeInitial;
        
        /* incrémentation de la variable de classe qui ainsi, se met à jour
         * à chaque création d'un objet de type CompteBancaire quelconque
         */
        
        Compte.nombreDeClients++;  // un client en plus !
        /* Récupération du nombre de client pour la création du nouveau
         * numéro de compte bancaire. Ensuite, on appelle une méthode 
         * numeroComplet() pour concaténer le numéro de RIB avec quelques zéros
         * et le numéro mis à jour.
         */
        this.numero = Compte.nombreDeClients;
        System.out.println("Création du compte numéro : " +numeroComplet());
        /*
         * appel d'une méthode pour afficher le solde :
         */
        this.afficheSolde();
    }
    
    /**
     * Méthode pour renvoyer le solde
     * @return double
     */
    public double getSolde()
    {
        return(this.solde);
    }

    /**
     * éthode pour afficher le solde
     */
    public void afficheSolde()
    {
        System.out.println("Solde du compte numéro : " +this.numeroComplet() + " = " + this.solde +" Euros.");
    }

    /**
     * Méthode pour déposer une somme sur un compte en passant
     * le montant en argument
     * @param montant double
     */
    public void depot(double montant)
    {
        System.out.println("Dépot de " + montant
            + " Euros sur le compte numéro : " + numero);
        this.solde+=montant;
        afficheSolde();
    }
    
    /**
     * Méthode pour retirer une somme sur un compte en passant
     * le montant en argument
     * @param montant double
     */
    public void retrait(double montant)
    {
        System.out.println("Retrait de " + montant + " Euros sur le compte numéro : " + this.numero);
        if ((this.solde - montant) >= 0)
        {
            this.solde-=montant;
        }
        else
        {
        	// en temps normal, on gère ceci avec une exception
            System.out.println("Retrait de " + montant + " Euros impossible !!");
            System.out.println("Solde insuffisant, opération annulée");
        }
        this.afficheSolde();
    }
 
    /**
     * Méthode pour construire le numéro de compte.
     * @return String
     */
    public String numeroComplet()
    {
        return(Compte.DEBUT_RIB + "-00000-" + this.numero);
    }

    /**
     * Méthode pour afficher les informations relatives
     * à un objet de type Compte.
     */
    public void afficheCompte()
    {
        System.out.println("\n" + ENSEIGNE);
        System.out.println("Compte numéro : " + numeroComplet());
        System.out.println("Titulaire du compte : " + titulaire);
        System.out.println("Solde = " + solde + " Euros.\n");
    }
	@Override
	public String toString() {
		return "Compte : " + numero + " titulaire: " + titulaire + " solde : " + solde;
	}
}

```

#### Classe GereComptes

```java

package comptes;
/**	=======================================
	Classe contenant la méthode de lancement 
	Auteur		: Philippe Bouget
	Programme	: GereComptes.java
	========================================
*/
public class GereComptes
{
    public static void main(String [] args)
    {
        Compte c1 = new Compte("Jonathan");
        c1.depot(1234);
        c1.afficheCompte();

        Compte c2 = new Compte("Josselin",9999);
        c2.depot(2001);
        c2.retrait(1000);
        c2.retrait(200000);
        c2.afficheCompte();
    }
};

```

#### Résultat que vous devez obtenir dans votre console

```java
Création du compte numéro : 42212 05666-00000-1
Solde du compte numéro : 42212 05666-00000-1 = 0.0 Euros.
Dépot de 1234.0 Euros sur le compte numéro : 1
Solde du compte numéro : 42212 05666-00000-1 = 1234.0 Euros.

La Meilleure Banque
Compte numéro : 42212 05666-00000-1
Titulaire du compte : Jonathan
Solde = 1234.0 Euros.

Création du compte numéro : 42212 05666-00000-2
Solde du compte numéro : 42212 05666-00000-2 = 9999.0 Euros.
Dépot de 2001.0 Euros sur le compte numéro : 2
Solde du compte numéro : 42212 05666-00000-2 = 12000.0 Euros.
Retrait de 1000.0 Euros sur le compte numéro : 2
Solde du compte numéro : 42212 05666-00000-2 = 11000.0 Euros.
Retrait de 200000.0 Euros sur le compte numéro : 2
Retrait de 200000.0 Euros impossible !!
Solde insuffisant, opération annulée
Solde du compte numéro : 42212 05666-00000-2 = 11000.0 Euros.

La Meilleure Banque
Compte numéro : 42212 05666-00000-2
Titulaire du compte : Josselin
Solde = 11000.0 Euros.

```

### Exemples de code dans le cours

```java

		System.out.println("Exemples avec les méthodes length(), charAt() and getChars() :");
		// méthodes length(), charAt() and getChars()

		String s1 = "bonjour apprenant";
		char[] tableau = new char[7];
		System.out.printf("s1: %s", s1);

		// avec la méthode length()
		System.out.printf("%nLongueur de  s1: %d", s1.length() );

		// parcourir les caracters dans s1 avec charAt et afficher l'inverse
		System.out.printf("%nLa chaîne inversée est : ");

		for (int count = s1.length() - 1; count >= 0; count--)
		{
			System.out.printf("%c ",s1.charAt(count) );
		}
		// copier les caractères dans un tableau de caractères => charArray
		System.out.printf("%nLe tableau de Char est : ");
		// boucle foreach
		for (char c : tableau)
		{
			System.out.print(c);
		}

		// Quelques exemples du cours

	System.out.println("Recherche de caractère en début et fin de chaîne :");

		String[] strings = {"started", "starting", "ended", "ending"};

		// on teste
		for (String string : strings)
		{
			if (string.startsWith("st"))
				System.out.printf("\"%s\" starts with \"st\"%n", string);
		}

		System.out.println();

		// teste methode startsWith starting à la position 2 dans la chaine
		for (String string : strings)
		{
			if (string.startsWith("art", 2))
			{
				System.out.printf("\"%s\" starts with \"art\" at position 2%n", string);
			}

		}

		System.out.println();

		// test method endsWith
		for (String string : strings)
		{
			if (string.endsWith("ed"))
			{
				System.out.printf("\"%s\" ends with \"ed\"%n", string);
			}
		}

			
			// Démo avec la méthode indexOf() de la classe String.
			// Exemple avec les methodes indexOf() and lastIndexOf().
			System.out.println("Démo avec la méthode indexOf() de la classe String");
			String letters = "abcdefghijklmabcdefghijklm";

			// test indexOf to locate a character in a string
			System.out.printf("'c' is located at index %d%n",letters.indexOf('c') );
			System.out.printf("'a' is located at index %d%n",letters.indexOf('a', 1) );
			System.out.printf("'$' is located at index %d%n%n", letters.indexOf('$'));

			// test lastIndexOf to find a character in a string
			System.out.printf("Last 'c' is located at index %d%n", letters.indexOf("def") );
			System.out.printf("Last 'a' is located at index %d%n", letters.indexOf("def", 7));
			System.out.printf("Last '$' is located at index %d%n%n",letters.indexOf("hello") );

			// test indexOf to locate a substring in a string
			System.out.printf("\"def\" is located at index %d%n",letters.lastIndexOf("def") );
			System.out.printf("\"def\" is located at index %d%n",letters.lastIndexOf("def", 25) );
			System.out.printf("\"hello\" is located at index %d%n%n", letters.lastIndexOf("hello"));


			///  Extraire des chaines dans des chaines avec substring()

			String letters2 = "abcdefghijklmabcdefghijklm";

			// teste substring methodes
			System.out.printf("Substring from index 20 to end is \"%s\"%n",letters2.substring(20));
			System.out.printf("%s \"%s\"%n", "Substring from index 3 up to, but not including 6 is",letters2.substring(3, 6));

			/// Concaténation de String avec la méthode concat()


			String ss1 = "Happy ";
			String ss2 = "Birthday";

			System.out.printf("s1 = %s%ns2 = %s%n%n",ss1, ss2);
			System.out.printf("Resultat de  s1.concat(ss2) = %s%n",ss1.concat(ss2) );
			System.out.printf("s1 après concaténation = %s%n", ss1);

			/// autres méthodes (valueOf(), )

			////  Classe StringBuilder (classe modifiable)

			StringBuilder buffer1 = new StringBuilder();
			StringBuilder buffer2 = new StringBuilder(10);
			StringBuilder buffer3 = new StringBuilder("hello");

			System.out.printf("buffer1 = \"%s\"%n", buffer1);
			System.out.printf("buffer2 = \"%s\"%n", buffer2);
			System.out.printf("buffer3 = \"%s\"%n", buffer3);

			// il existe aussi la méthode reverse() pour cette classe.

		}

	}

```