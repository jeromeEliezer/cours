# Utilisation des fichiers Properties avec Java

## Externalisation des données grâce à **ResourceBundle**

Il est important de pouvoir externaliser des données d'une application dans un fichier texte pour :

- Configurer facilement votre application Desktop ou Web
- Développer des applications en plusieurs langues

>Il est aussi possible d'utiliser l'API bas niveaux des flux que vous connaissez peut-être déjà pour réaliser l'exportation des données. Cependant, cela demande un petit effort alors que la classe **ResourceBundle** est là pour vous faciliter le travail !

### Utilisation de la classe ResourceBundle

Cette classe permet d'exporter des données vers :

- Classe java
- Fichier texte

La classe **java.util.ResourceBundle** supporte le **NLS** (_National Language Support_) et permet de développer facilement des applications multilingues.

**A. Externalisation des données dans un fichier texte**

>Cette méthode est la plus couramment utilisée.

Caractéristiques du fichier **properties** :

- Il doit avoir une extension **.properties**
- Il ne doit contenir que du *texte* (jamais d'objet !)

La structure d'un fichier **init.properties** se présente sous la forme suivante **Cle = valeur** :

```properties
cle1=valeur1
clef2=Valeur deux
clef3=une chaine quelconque
```

Voici 2 exemples de fichiers properties :

- Fichier d'initialisation de l'application :

```properties
#init.properties
#Octobre 2020 Pbouget
url=jdbc:mysql://localhost:3306/banque
pilote=com.mysql.jdbc.Driver
identifiant=root
motdepasse=root
langue=fr
```

- Fichier **IHMGestionCompte_fr.properties** (version français) :

```properties
#IHMGestionCompte_fr.properties
#Octobre 2020 Pbouget
titreParDefaut=Application Bancaire Java Swing sous MySQL - V3.0 PB - 27/10/2020
menuGestion=Gestion
optionAjouter=Ajouter un enregistrement (ALT-G-A)
optionModifier=Modifier un enregistrement (ALT-G-M)
optionSupprimer=Supprimer un enregistrement (ALT-G-S)
optionQuitter=Quitter (ALT-G-Q)
optionAide=Aide sur l'interface graphique (ALT-i)
optionAPropos=A propos de cette application (ALT-P)
numero=Numéro
titulaire=Titulaire
solde=Solde
euros=Euros
valider=Valider
annuler=Abandonner
debut=Début
precedent=Précédent
suivant=Suivant
fin=Fin
```

- Fichier **IHMGestionCompte_en.properties** (version anglaise) :

```properties
#IHMGestionCompte_en.properties
#October 2020 Pbouget
titreParDefaut=Banking Application Java Swing under MySQL - V3.0 PB - 27/10/2020
menuGestion=Management
optionAjouter=To add a record (ALT-G-A)
optionModifier=To modify a record (ALT-G-M)
optionSupprimer=To remove a record (ALT-G-S)
optionQuitter=Exit (ALT-G-Q)
optionAide=Help on the graphic interface (ALT-i)
optionAPropos=About this application (ALT-P)
numero=Number
titulaire=Owner
solde=amount
euros=Euros
valider=Save
annuler=Cancel
debut=Begin
precedent=Previous
suivant=Next
fin=End
```

>Il suffit dans notre application de lire la clef **langue** du fichier **init.properties** pour que notre interface graphique sélectionne le bon fichier.

**B. Externalisation des données dans une classe (plus rarement utilisée)**


> Inconvénient : **Les valeurs sont en dures dans le code Java !**

Les caractéristiques dans l'utilisation d'une classe :

- Doit hériter de la classe **java.util.ListResourceBundle**.
- Définir un tableau d'objets à 2 dimensions constant nommé **contents** qui contient les couples (clé, valeur).
- Définir une méthode **Object[][] getContents()** qui retourne le tableau contents.

Exemple :

```java
public class Resource extends java.util.ListResourceBundle{

static final Object[][] contents = {
  {"cle", "valeur"},
  {"valider", "Save"}
} ;

protected Object[][] getContents()
{
  return contents;
}
```

>Remarques : Cette méthode permet d'externaliser n'importe quel objet. Elle ne convient pas pour la création de fichier de configuration de l'application.

### Récupération des données dans l'application

- Il faut récupérer un objet **ResourceBundle** lié au fichier **properties** avec la méthode **getBundle(String resource)** de la classe ResourceBundle.

- Récupérer les données grâce à la méthode **getString(String maClé)** de l'objet ResourceBundle.

Exemple de code avec l'utilisation d'un fichier **resource.properties** :

```java
ResourceBundle maRessource = ResourceBundle.getBundle("ressource") ;
String valeurDeCle = maRessource.getString("cle");
String valeurDeValider = maRessource.getString("valider");
```

Remarques :

Il ne faut jamais indiquer les extensions :

- " . **properties**  " de la ressource dans un fichier texte.
- " . **class**  " dans le cas d'une classe.

**Comment créer une application multilingue ?**

Il est possible de créer un fichier (ou une classe) de ressources pour chaque langue et pays en ajoutant des indicateurs au nom de celui-ci :

- nom\_langue\_codeDuPays.properties
- nom\_langue\_codeDuPays.class

L'indicateur de langue suit la norme **ISO Language Code**.

Lien : [https://fr.wikipedia.org/wiki/Liste_des_codes_ISO_639-1](https://fr.wikipedia.org/wiki/Liste_des_codes_ISO_639-1)

L'indicateur du pays suit la norme **ISO Country Code**.

Lien : [https://www.iban.com/country-codes](https://www.iban.com/country-codes)

**Exemples :**

**init\_fr.properties** pour le français.

**init\_en.properties** pour l'anglais.

**init\_de.properties** pour l'allemand.

**init\_fr\_FR.properties** pour la France.

**init\_en\_EN.properties** pour l'Angleterre.

**init\_de\_DE.properties** pour l'Allemagne.

>Remarque : l'indicateur pour la langue est en _minuscule_ et en _majuscule_ pour le pays !

### Exemples de code de gestion multilingue

- Fichier TestMultilingue.java  :

```java
import java.util.Enumeration;
import java.util.Locale;
import java.util.ResourceBundle;

public class TestMultilingue{

public static void main( String [] args) throws Exception{

try
{
/*
Récupération des données.
Pour lire le fichier en français, il faudrait écrire ceci :
ResourceBundle init = ResourceBundle.getBundle("init", Locale.FRENCH);
ici on force la lecture du fichier en Anglais : "init\_en.properties";
la langue choisie est donc l'anglais :
*/
ResourceBundle init = ResourceBundle.getBundle("init",Locale.ENGLISH);

// pour information, on affiche la langue par défaut :
System.out.println("Langue par défaut : "+Locale.getDefault());
//ResourceBundle init = ResourceBundle.getBundle("init");
// voici les libellés correspondant aux mots "message" et "annuler" présent dans notre fichier init.properties :
String leMessage = init.getString("message");
String unLibelle = init.getString("annuler");
System.out.println(leMessage);
System.out.println(unLibelle);

// exemple avec d'autres méthodes propre à la classe ResourceBundle :
String clef = "fichier";
if (init.containsKey(clef))
{
  System.out.println("Oui, le fichier contient bien le clef "+clef+" !");}
else
{
  System.out.println("Non, le fichier init ne contient pas la clef "+clef+" !");
}

```

- Autre extrait de code pour lire un tableau (c'est plus rare) :

```java
/*
* Voici un exemple pour récupérer les valeurs d'un tableau stockées de cette manière :
tableau.taille=5
tableau.0=10
tableau.1=20
tableau.2=30
tableau.3=40
tableau.4=50
*/

int taille = Integer.parseInt(init.getString("tableau.taille"));
System.out.println("Afficher les clefs et valeurs du tableau :");
for (int i=0;i<taille;i++)
{
  System.out.println(init.getString("tableau."+String.valueOf(i)));
}
// Utilisation de la méthode getKeys pour lire les clefs du fichier
System.out.println("Avec la méthode getKeys()");
Enumeration maListe = init.getKeys();
while (maListe.hasMoreElements())
    {
      System.out.println(maListe.nextElement());
    }
  }
...

```

- Exemple de code pour modifier la valeur de la clef langue dans le fichier **init.properties** :

```java
Properties unePropriete = new Properties() ;
File fichierProperties = new File("init.properties") ;

// Charge le contenu de ton fichier properties dans un objet Properties
FileInputStream stream = new FileInputStream(fichierProperties) ;
unePropriete.load(stream) ;

// Change la valeur de la clé taCle dans l'objet Properties
String taNouvelleValeur="nouvelle valeur" ;
unePropriete.setProperty("taCle",taNouvelleValeur) ;

// Sauve le contenu de ton objet Properties dans ton fichier properties
FileOutputStream oStream = new FileOutputStream(fichierProperties) ;
unePropriete.store(oStream,"infos") ;
```

- Exemple d'une classe **listener** pour effectuer une détection de la langue choisie et effectuer sa modification en fonction du choix de l'utilisateur.trice.

```java
private class EcouteurOptionChoixLangue implements ItemListener
{
 // Méthode redéfinie de ItemListener
	public void itemStateChanged(ItemEvent evenement)
	{
		FileInputStream fluxEnEntree=null;
		FileOutputStream fluxEnSortie=null;
		String ancienneValeur= init.getString("langue");
		String valeur= new String();

		try
		{
		Properties proprietes = new Properties() ;
		File fichierProperties = new File("init.properties") ;
		fluxEnEntree = new FileInputStream(fichierProperties);
		// chargement du flux en entrée :
		proprietes.load(fluxEnEntree) ;

		if (evenement.getSource() == optionChoixAnglais)
		{
			valeur="en";
		}
		else
		{
			valeur="fr";
		}
// on teste si l'ancienne valeur est différente de la nouvelle sinon
// on ne fait rien
// ceci dans le cas ou la personne clique sur la case à cocher par erreur
		if (!ancienneValeur.equalsIgnoreCase(valeur))
		{
      JOptionPane.showMessageDialog(null,"Vous avez choisi la version "+(valeur.equalsIgnoreCase("en")?"Anglaise":"Française")+"\n pour le prochain lancement");

      proprietes.setProperty("langue",valeur);

    // Sauve la modifcation de l'objet Properties dans le fichier properties
    fluxEnSortie = new FileOutputStream(fichierProperties);
    proprietes.store(fluxEnSortie,"init.properties");
  }

}
	catch (FileNotFoundException e)
 	{
		e.printStackTrace();
	}
catch (IOException e)
{
		e.printStackTrace();
	}
	}
}	// fin de la classe interne privée EcouteurOptionChoixLangue

```

## Mise en pratique 

Reprenez un des travaux pratiques déjà réalisé et ajouter dans une barre de menu des item avec la possibilité de changer la langue pour modifier le nom des étiquettes et des boutons. (Vous avez la possibilité de faire en sorte que la langue soit modifiée au prochain chargement de l'application ou bien en temps réel !)

Conseils : vous devez créer  3 fichiers properties. En fonction de la valeur de l'attribut langue enregistré dans un fichier **init.properties** que vous modifiez manuellement, votre interface graphique se mettra automatiquement dans la bonne langue.

