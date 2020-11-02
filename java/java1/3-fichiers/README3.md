# Cours Java - Lecture de fichiers

## Découvertes des entrées sorties

Les entrées sorties sont vues par Java comme des flux d'octets ou de caractères. Le package **java.io** fournit les classes chargées des opérations de lecture et écriture. Les lectures et écritures sont indépendantes des supports. On construira un flux en utilisant une ou plusieurs classes.

Remarques :

* Les noms des classes indiquent leurs fonctions.
* Les noms se terminant par **stream** sont à utiliser pour des flux d'octets.
* Les noms se terminant par **er** sont à utiliser pour des flux de caractères.
**Les classes sont en général appairées : *une dédiée à la lecture* et *l'autre à l'écriture*.

Par exemple :

- InputStream / OutputStream pour les **octets**
- Reader / Writer pour les **caractères**

En java, il existe 2 types de flux :

- flux de bytes ou d’octets (8 bits)
- flux de caractères (16 bits Unicode)

>Exemple d’InputStream : **System.in** (entrée standard = le clavier)
Les classes dont le nom contient un nom de ressource ( File, ByteArray, String, ... ) permettent de faire un lien avec ces resources.

Exemples :

- FileInputStream -> FileOutputStream
- ByteArrayInputStream -> ByteArrayOutputStream
- StringReader -> StringWriter

>Les classes dont le nom contient **stream** et **er** servent à la conversion de flux d'octets en flux de caractères.

![](../2-tableaux/images/flux-fichiers.png)

**InputStreamReader** lit des bytes pour les transformer en caractères tandis que **OutputStreamWriter** écrit des caractères dans un flux en sortie, en les transformant en bytes (avec encodage).

>Il existe des classes qui ajoutent des fonctionalités à des flux existants.

Pour la gestion des tampons mémoires, nous avons les classes :

- BufferedReader
- BufferedWriter

Pour l’utilisation de méthodes de lecture / écriture pour des types internes, nous avons :

- DataInputStream
- DataOutputStream

Pour l’écriture et la lecture d'objets, nous avons :

- ObjectInputStream
- ObjectOutputStream

>Remarques : DataInputStream et DataOutputStream permettent une representation binaire portable (indépendante de la plateforme) de types primitives java.
ObjectOutputStream et ObjectInputStream servent à la sérialisation / désérialisation d’objets ou de tableaux. Elles fournissent réciproquement les méthodes **writeObject()** et **readObject()**.

Les méthodes du flux **InputStream**

**InputStream** est une classe abstraite, super-classe de tous les flux d’octets en entrée. Cette classe apporte les méthodes de base pour les sous-classes (exemple : read() ).

Méthodes dédiées à la lecture

octet par octet :

- int read( ) throws IOException; // renvoie l'octet lu ou -1 en fin de flux

par tableau d'octets :

- int read(byte [] tableau ) throws IOException;
- int read(byte [] tableau,int offset,int nb) throws IOException;

>Les opérations de lecture sont blocantes.

Autres méthodes :

- int **available( )**;	// donne le nombre d'octets pouvant être lus sans blocage.
- void **close( )** throws IOException; // ferme le flux de lecture.

Les méthodes du flux OutputStream :

Méthodes dédiées à l'écriture :

octet par octet :

- void write( int c ) throws IOException;
par tableau de bytes :
- void write( byte [] tableau ) throws IOException;
- void write( byte [] tableau,int offset,int nb ) throws IOException;

Autres méthodes :

- void flush( );	// force l'écriture des octets vers le périphérique de sortie
- void close( ) throws IOException;	// ferme le flux de sortie

Fichier vu comme un flux d'octets :

- FileInputStream et FileOutputStream permettent de lire et d'écrire un fichier.

Les constructeurs reçoivent le nom du fichier :

Pour lire :

- FileInputStream( String nom) throws FileNotFoundException;

Pour écrire :

- FileOutputStream( String nom ) throws FileNotFoundException;
Le fichier est créé s'il n'existe pas. Si le fichier existe son contenu initial est perdu.

Ajout en fin de fichier :

- FileOutputStream(String n,boolean a) throws FileNotFoundException;

Exemple de code java avec flux d'octets :

```java
FileInputStream fis = null ; FileOutputStream fos = null ;
try
{
fis = new FileInputStream( "fichier.dat" ) ;
fos = new FileOutputStream( "copie.dat" ) ;
int octet = 0 ;
while( true )
{
octet = fis.read() ;
if( octet == -1 ) break ;
fos.write( octet ) ;
}
fos.close(); fis.close();
}
catch( FileNotFoundException fnfe ) 
{
System.out.println( fnfe.getMessage() ) ;
}
catch( IOException ioe ) {
}
```

Flux de caractères avec **Reader**

Méthodes de lecture :

- Caractère par caractère

    - int read() throws IOException;	// Renvoie le caractère lu ou -1 en fin de flux.
- Par tableau de caractères

    - int read( char [] tableau ) throws IOException;
    - int read( char [] tableau, int offset , int nb ) throws IOException; Renvoie le nombre de caractères lus, -1 en fin de flux.

Autres méthodes :

- boolean ready();	// Vrai s'il y a un caractère disponible sans attente.
- void close( ) throws IOException;	// Ferme le flux d'entrée

Flux de caractères avec **Writer** :

Méthodes d'écriture

- Caractère par caractère

    - void write( char c ) throws IOException;

Par tableau de caractères

    - void write( char [] tableau ) throws IOException;
    - void write( char [] tableau, int offset, int nb ) throws IOException;

Autres méthodes :

- void flush();	// Force l'écriture des caractères vers le périphérique de sortie.
- void close( ) throws IOException;	// Ferme le flux de sortie

Les classes de conversion :

Conversion de flux d'octets en flux de caractères.
- InputStreamReader( InputStream is );

Avec spécification du code page à utiliser pour la conversion :

- InputStreamReader( InputStream is , String codepage ) throws UnsupportedEncodingException;

Conversion de flux de caractères en flux d'octets :

- OutputStreamWriter( OutputStream os );
- OutputStreamWriter( OutputStream os, String codepage ) throws UnsupportedEncodingException;

Voici un exemple de quelques **codepage** :

- Cp1252 Windows Latin-1
- Cp437 MS-DOS United States
- Cp850 MS-DOS Latin-1

Les classes filtres :

Ajout de tampon mémoire et de méthode readLine :

- BufferedReader( Reader input );
- String readLine() throws IOException; // Renvoie une chaine de caractères ou null en fin de flux.

Ajout de méthodes print() et println() :

- PrintWriter( OutputStream os ) ;
- PrintWriter( OutputStream os, boolean autoflush ) ;
- PrintWriter( Writer wt ) ;
- PrintWriter( Writer wt , boolean autoflush ) ;

>Les méthodes de PrintWriter ne lancent pas d'exceptions !

- boolean checkError();

Exemple de code avec un flux de caractères :

```java
BufferedReader br = null ;
PrintWriter pw = null ; 
try
{
InputStreamReader rd = new InputStreamReader( System.in );
br = new BufferedReader( rd ) ;
FileWriter fw = new FileWriter( "log.txt" , true ) ;
pw = new PrintWriter( fw ) ;
String s = null ;
while(( s = br.readLine() ) != null )
{
System.out.println( s ) ;
pw.println( s ) ;
} 
pw.close( ); br.close( ) ;
}
catch( IOException ioe )
{
}
```

Voici un exemple de code d’écriture et de lecture d’un flux d’octets :

```java
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

class TestEntreesSorties

{
	public static void main (String[] args)
	
	{	
	
		// lecture / écriture d'un flux d'octets
		// déclaration de 2 types d'objets 
		FileInputStream fis = null;
		FileOutputStream fos = null;
		FileOutputStream fosf = null;
		
		// bloc try
		
		try
		{
			// création des objets de type File :
			fis = new FileInputStream("toto.txt");
			// flux en lecture
			fos = new FileOutputStream("titi.txt");
			// flux en écriture
			fosf = new FileOutputStream("bobo.txt",true);
			// écriture mode ajout
			
			int octet = 0;
			
			while (true)
			{
				octet = fis.read();
 			// lecture du flux d'octets dans toto.txt
				if (octet == -1) break;	// si fin de fichier on sort
				fos.write(octet);		// écriture de l'octet dans titi.txt
				fosf.write(octet);
 			// écriture de l'octet dans bobo.txt en mode ajout
			}
			
			fos.close();	// on ferme le flux d'octets en écriture
			fosf.close();	// idem 
			fis.close();	// idem pour la lecture

		}
		// on attrape l'exception si un fichier n'est pas trouvé !
		catch (FileNotFoundException fnfe)
		{
			System.out.println(fnfe.getMessage());
		}
		catch (IOException ioe)
		{
			System.out.println(ioe.getMessage());
		}
		finally
		{
		
			System.out.println("Opération terminée");
			
			// il ne vous reste plus qu'à aller voir le contenu des
			// fichiers titi, toto et bobo dans votre répertoire.
		}
	
	
	}
}
```
## Classe File

>La classe **File** fournit un certain nombre de services se rapportant aux fichiers et aux répertoires.

Constructeurs :

- File( String nom );
- File( String parent , String nom );

**nom** représente un nom de fichier ou de répertoire.
**parent** le nom du répertoire en relation avec le fichier.

Les informations sur un fichier :

- boolean canRead() ;
- boolean canWrite() ;
- boolean exists() ;
- String getAbsolutePath() ;
- boolean isDirectory() ;
- boolean isFile() ;
- long lastModified();
- long length() ;

Pour les répertoires :

- boolean createNewFile() throws IOException;	// Crée un fichier s'il n'existe pas déjà.
- boolean delete() ;				// Supprime le fichier du répertoire où il se trouve
- String [] list();					// Donne la liste des noms de fichiers du répertoire.
- File[] listFiles() ;					// Donne une liste de fichiers appartenant au répertoire.
- boolean mkdir() ;				// Crée un répertoire
- boolean renameTo(File f) ;			// Renomme le fichier courant en fichier correspondant à f

Exemple de traitement d’une exception générée par un fichier non trouvé :

```java
// importation des paquetages nécessaires :
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

class FichierInexistant
{
	private String monFichier="titi.txt";

/*	
	public void setMonFichier(String f)
	{
		monFichier=f;
	}
*/
	// constructeur
	public FichierInexistant()
	{
	
	try 
	
	{
		FileInputStream fis = new FileInputStream(monFichier);
		int longueurFichier = fis.available();
		
		// lecture du fichier
		byte[] readBuffer = new byte[longueurFichier];
		fis.read(readBuffer);
		
		// fermeture de fichier
		fis.close();
	}
	
	/* ici, le catch permet d'attraper une erreur (exception)
	   en cas de "fichier non trouvé". Les exceptions sont des
	   classes comme les autres, elles permettent d'instancier
	   à partir de la classe Exception ou des classes dérivées.
	*/
	catch (FileNotFoundException e)
	{
		System.out.println("le Fichier "+monFichier+ " est introuvable !");
		// on pourrait proposer une nouvelle saisie du nom du fichier et 
		// rappeler une méthode ...
	}
	
	catch (IOException e) 
	{
		System.out.println("Erreur de lecture du fichier !");
	}
	
}

}

public class TestDesExceptionsIO

{
	public static void main (String[] args)
	{

		FichierInexistant fi = new FichierInexistant();

	}
}	// fin de la classe TestDesExceptionsIO

```

Exemple de code d’écriture de caractères (phrase) et de lecture d’octets dans un fichier :

```java
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;

public class TestFlux
{
	public static void main(String argv[])
	{
		// Ecriture dans un fichier :
		try
		{	
// déclarer et créer un flux fw de type FileWriter lié à la ressource fichier "sortie.log".
			FileWriter fw = new FileWriter("sortie.log");
// Utilisez le flux fw pour écrire un texte dans le fichier "sortie.log".
			fw.write("Bonjour, cette phrase a bien été enregistrée dans un fichier");
			//Fermez le flux.
			fw.close();
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}

		// lecture de ce que vous avez écrit et affichage dans la console :
		try
		{	
			StringBuffer phrases = new StringBuffer(); 
			FileInputStream fis = new FileInputStream("sortie.log");
			int octet=0;
			while (true)
			{
				octet = fis.read();
				if (octet == -1) break;	// fin de fichier, on sort
		//ici, vous constater un casting en type char pour caractère
				phrases.append((char)octet);

			}
		// on ferme le flux :
			fis.close();
			System.out.println(phrases.toString());
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}


	}
}
```

Autre exemple de saisie en console et sauvegarde d’un message dans un fichier :

```java
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
//La classe suivante permet de tester les flux standards
public class TestFluxStandards
{
	public static void main (String args[])
	{
		// Gérer l'exception IOException.		    	
		try
		{
			String message="";
// Récupérez le flux d'entrée in et ajouter un flux avec tampon (InputStreamReader) de données pour pouvoir lire une ligne entière. 
			BufferedReader entree =new BufferedReader(new InputStreamReader(System.in));
			// Créer flux de sortie vers un fichier "log.txt"
			PrintWriter ecrire= new PrintWriter(new FileOutputStream("log.txt"));

		//  Tant que le message de la console est différent de "q", 
		// Ecrire le message dans le fichier log.txt et à la console.
			message = "---> Entrer votre message svp (q pour quitter): "; 
			System.out.println(message);
			message = entree.readLine ();
			while (!message.equalsIgnoreCase("q"))
			{ 
				System.out.println("votre message : \" " + message + " \"\n\n");
				ecrire.println(message);
				message = "---> Entrer votre message svp (q pour quitter): "; 
				System.out.println(message);
				// utilisation du flux d'entrée
				message = entree.readLine ();
			}        
			// Fermer les flux.
			ecrire.close();
			entree.close();
		}
		catch (IOException e) 
		{
			e.printStackTrace(); 
		}

	}
}
```

Exemple d’écriture et de lecture des objets de type Chat (animal) dans un fichier :

```java
package enregistrerDesObjetsChats;
import java.io.Serializable;
/**
 * Projet 	:	TP-exemple
 * Classe	:	Chat.java
 * @author 	:	Philippe Bouget
 * Date	:	03/10/2019	
 */
public class Chat implements Serializable {

	private String petitNom;
	private int age;

	public Chat(String p, int a)
	{
		this.petitNom=p;
		this.age=a;
	}

	/**
	 * @return le petitNom
	 */
	public String getPetitNom() {
		return petitNom;
	}

	/**
	 * @param petitNom le petitNom à initialiser
	 */
	public void setPetitNom(String petitNom) {
		this.petitNom = petitNom;
	}

	/**
	 * @return le age
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age le age à initialiser
	 */
	public void setAge(int age) {
		this.age = age;
	}
	public String toString()
	{
		return "Chat : :"+petitNom+" "+age+" ans";
	}
	public void afficher()
	{
		System.out.println("Chat : :"+petitNom+" "+age+" ans");
	}
}
```

Comme vous pouvez le constater dans la déclaration de la classe **Chat**, on implémente l’interface **Serializable** de la manière suivante :

- *public class Chat **implements** Serializable*

Cela suffit pour rendre l’écriture, la transmission via un réseau et la lecture d’objets possible.

Exemple d’écriture des objets :

```java
package enregistrerDesObjetsChats;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
/**============================================
	Ecriture d'objet dans un Fichier texte
	Gestion des flux entrée / sortie
	Auteur  : Philippe Bouget
	Année	: 2019
	Nom Programme	: EcrireObjet.java
==============================================
 */
public class EcrireObjet

{
	public static void main (String args[])
	{
		// on créer des références à des objets Chat
		Chat minou = new Chat("Youpi",3);
		Chat poupou = new Chat("Poupou",4);
		Chat propret = new Chat("Propret",7);
		Chat pounette = new Chat("Pounette",8);
		try
		{
FileOutputStream fichierDObjets = new FileOutputStream("ChatObj.txt");
ObjectOutputStream fluxDObjets = new ObjectOutputStream(fichierDObjets);

			minou.afficher();
			fluxDObjets.writeObject(minou);

			poupou.afficher();
			fluxDObjets.writeObject(poupou);

			propret.afficher();
			fluxDObjets.writeObject(propret);

			pounette.afficher();
			fluxDObjets.writeObject(pounette);
			// on vide le tampon
			fluxDObjets.flush();
			// on ferme la fichier
			fluxDObjets.close();
			fichierDObjets.close();
			System.out.println("Fin de la copie du fichier");		
		}
		catch (IOException e) {e.getMessage();}

	}
}
```

>Pour l’écriture des objets on déclare un objet du type **ObjectOutputStream** qui nous permet de faire appel à la méthode **writeObject()** pour sauvegarder un objet. Il faut bien entendu effectuer un flush() puis un close() du flux en sortie.

Exemple de lecture des objets depuis un fichier :

```java
package enregistrerDesObjetsChats;
/**============================================
	Lecture d'objet dans un Fichier texte
	Gestion des flux entrée / sortie
	Auteur 			: Philippe Bouget
	Année			  : 2019
	Nom Programme	: LireObjet.java
==============================================
 */
import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
public class LireObjet
{
	public static void main (String args[])
	{
		try
		{
			FileInputStream fichierDObjets = new FileInputStream("ChatObj.txt");
			ObjectInputStream fluxDObjets = new ObjectInputStream(fichierDObjets);
			while(true)	// tant qu'il y a des objets
			{
				Object o = fluxDObjets.readObject();
				if (o instanceof Chat)
				{
					((Chat)o).afficher(); 
				}
				else
				{
					System.out.println("Objet Non Identifié !");
				}
			}
		}
		catch (ClassNotFoundException e) {e.getMessage();}
		catch (IOException e) {e.getMessage();}
		System.out.println("Fin de la lecture");
	}
}
```

>Pour la lecture des objets on déclare un objet du type ObjectInputStream qui nous permet de faire appel à la méthode readObject() pour sauvegarder un objet.

## Support de cours

## Atelier groupe

## Exercices individuels

## Restitution
