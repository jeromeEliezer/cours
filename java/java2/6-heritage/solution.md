# Solution TP Héritage - Polymorphisme

## Classe Personne

```java

package heritage;

/**
 * Classe mère
 * @author Philippe
 *
 */
public class Personne {

	private String prenom;
	private int age;

	// ============== 3 constructeurs ============	
	public Personne() {
		super();
	}

	public Personne(String prenom, int age) {
		super();
		this.prenom = prenom;
		this.age = age;
	}

	public Personne(String prenom) {
		this(prenom, 0);
	}

	// ============== méthodes get et set ============

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	// ============ Méthodes spécifiques ==========

	public void bonjour()

	{
		System.out.println("Bonjour,  tu es "+prenom+" et tu as "+age+" ans");

	}

	public void manger(String fruit)

	{
		System.out.println("Miam miam, c'est bon ce fruit, "+fruit+" !");

	}

	public void dormir()

	{
		System.out.println("Rrrrrrr Rrrrrrr");

	}	


	@Override
	public String toString() {
		return this.prenom;
	}
}
```

## Classe Apprenant

```java
package heritage;

/**
 * Classe fille
 * @author Philippe
 *
 */
public class Apprenant extends Personne{

	private String lieuDeTravail ;
	public enum Os {INDEFINI, WINDOWS, MAC, LINUX};
	private Os systeme;


	public Apprenant() {
		super(null,0);
	}

	/**
	 * 	écriture du constructeur d'objet Apprenant devant recevoir les
	arguments prenom et age en tant que Personne plus les attributs
	spécifiques à Apprenant

	 * @param prenom String
	 * @param age int
	 * @param lieuDeTravail String 
	 * @param os String
	 */
	public Apprenant(String prenom, int age, String ville, Os systeme)
	{
		// appel au constructeur de Personne en lui envoyant des paramètres prenom et age
		super(prenom,age); 

		// affectation des attributs spécifiques
		this.lieuDeTravail = ville;
		this.systeme = systeme;
	}

	public void travailler()

	{
		System.out.println("Dur dur Java !");

	}

	public void chomer()

	{
		System.out.println("Ah que j'aime les pauses café ...");

	}

	@Override
	public void bonjour()

	{
		StringBuilder message = new StringBuilder();

		super.bonjour();

		if (systeme == Os.INDEFINI)	{message.append("Tu ne connais pas encore ton OS !");}
		else if(systeme == Os.WINDOWS) {message.append("Tu vas bosser sur Windows ! Super, comme en formation !");}
		else if(systeme == Os.LINUX) {message.append("Tu vas bosser sur Linux ! Tu aimes la liberté !");}
		else {message.append("Tu vas bosser sur Mac ! Ouille ! Mais bon, un linux se cache sous le capot...");}

		message.append("\n Ton lieu de travail est à "+lieuDeTravail);

		System.out.println(message);
	}
}

```

## Résultat que vous devez obtenir dans la console

```java
Bonjour, tu es Philippe et tu as 54 ans
Tu vas bosser sur Windows ! Super, comme en formation !
Ton lieu de travaille est à Montreuil
Dur dur Java !
Miam miam, c'est bon ce fruit, banane !
Ah que j'aime les pauses café ...
Rrrrrrr Rrrrrrr

Bonjour, tu es Josselin et tu as 34 ans
Miam miam, c'est bon ce fruit, pizza !
Rrrrrrr Rrrrrrr

Bonjour, tu es Anissa et tu as 23 ans
Tu vas bosser sur Mac ! Ouille ! Mais bon, un linux se cache sous le capot...
 Ton lieu de travaille est à Montreuil
Miam miam, c'est bon ce fruit, chocolat !
Rrrrrrr Rrrrrrr

```