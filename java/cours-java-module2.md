# Programmation JAVA (Module 2)

## 1.Approfondissement sur la notion de polymorphisme

- Ecriture invariante quel que soit le type de l&#39;objet.

- Une méthode de la classe de base peut être réécrite dans la classe dérivée.

- Les deux méthodes doivent avoir la même signature.

- La signature comprend :

le domaine de **visibilité**

le **type** de l&#39;objet **renvoyé**

le **nom** de la méthode

la **liste des types des arguments** attendus

_ **Exemple :** _

/\*\*

\ ***@author** pbouget

\*2classes:EmployeetProgrammeur

\*Exempledepolymorphismevialaméthodeprint()

\*

\*/

**public**** class** Employe {

**private** String nom ;

**public** Employe(String nom)

{

**this**.nom=nom;

}

**public**** void** print()

{

System._out_.println(nom);

}

/\*\*

\ ***@param** args

\*/

**public**** static ****void** main(String[] args)

{

// on crée un employé et on appelle la méthode print

Employe e;

e= **new** Employe(&quot;Newman&quot;);

e.print();

// on utilise la même référence en instanciant un Programmeur

e = **new** Programmeur(&quot;Einstein&quot;,&quot;java&quot;);

// quelle méthode print est appelée ici ?

e.print();

}

}

**class** Programmeur **extends** Employe

{

**private** String langage ;

**public** Programmeur(String nom, String langage)

{

**super** (nom);

**this**.langage=langage;

}

**public**** void** print()

{

System._out_.println(&quot;méthode dans programmeur :&quot;);

**super**.print();

System._out_.print(&quot; &quot;+ **this**.langage );

}

}

Employe e;

e= **new** Employe(&quot;Newman&quot;);

e.print();

Une référence de type ancêtre peut agir sur un objet de type dérivé :

// on utilise la même référence en instanciant un Programmeur

e = **new** Programmeur(&quot;Einstein&quot;,&quot;java&quot;);

// quelle méthode print est appelée ici ?

e.print();

Ici, selon vous, quel est la méthode _print_() appelée par_**e.print()**_ **?**

Le type de l&#39;objet indique la méthode qui sera exécutée. Sur une collection d&#39;objets on peut faire appel aux méthodes print() sans avoir à tester le type de chaque objet.

# 2.Modificateur final sur une classe ou une méthode

Une **classe** déclarée avec le modificateur **final** ne peut pas être dérivée.

/\*\*

\ ***@author** pbouget

\*Exempledeclassefinalnondérivée

\*

\*/

**public**** final ****class** Unique {

**private** String nom;

**public** Unique(String nom)

{

**this**.nom=nom;

}

}

Exemple : **final** _class Programmeur extends Employe_

Une **méthode** déclarée avec le modificateur final ne peut pas être réécrite dans une classe dérivée.

public class Employe
 {

**final** public String getNom()
 {

return nom;
 }
 }

# 3.Les classes abstraites

Dans une hiérarchie, on peut mettre en **facteur commun** des _attributs_ et des _méthodes_. La classe _Contour_ ci-dessous servira de classe de base à un ensemble de sous-classes du genre Cercle, Rectangle et autres formes.

class **Contour**
 {

protected int x , y ;
 public void deplace( int x , int y)

{

efface() ;
 this.x = x ;
 this.y = y ;
 dessine() ;

}
 }

**Peut-on écrire les méthodes efface() et dessine() ?**

**Est-il raisonnable de créer un objet Contour ?**

Voici la manière d&#39;interdire l&#39;instanciation de Contour avec l&#39;utilisation du mot-clé **abstract** :

**abstract** class Contour {…}

Il faut dériver la classe Contour pour utiliser **deplace** () et fournir le code des méthodes **efface** () et **dessine** ()

class Cercle extends Contour
 {

public void efface()
 { // Le code pour effacer un Cercle}
 public void dessine()
 { // Le code pour dessiner un Cercle à la position x,y}
 }

Dans la classe Contour on ne peut pas écrire le code des méthodes efface() et dessine().

**Comment faire figurer les signatures des méthodes dans la classe Contour sans fournir de code ?**

Il suffit de les déclarer abstraites avec **abstract**  :

abstract class Contour
 {

abstract public void efface();
 abstract public void dessine();
 }

La classe dérivée de Contour devra **fournir le corps** des méthodes efface() et dessine().

abstract class Contour
 {

protected int x , y ;
 public void deplace( int x , int y )
 {

efface() ;
 this.x = x ; this.y = y ;
 dessine() ;

}

abstract public void efface( ) ;
 abstract public void dessine( ) ;

}

class Cercle extends Contour
 {

public void efface( )
 {

// Le code pour effacer le Cercle en x , y
 }
 public void dessine( )
 {

// Le code pour dessiner le Cercle à la position x,y
 }
 }

**En résumé, une classe abstraite peut contenir :**

- des méthodes qui fournissent un mécanisme (exemple : deplace())
- des méthodes abstraites : on ne décrit que la signature des méthodes qui devront **obligatoirement** être implémentées dans les sous-classes.
- Si l&#39;on déclare une méthode abstraite dans une classe, cette classe doit être déclarée abstraite.

**Voici les règles de codification des méthodes abstraites :**

- On ajoute le mot-clef **abstract** dans la déclaration de la méthode.
- On définit le niveau de visibilité, le type renvoyé, le nom et la signature.
- On termine la déclaration de la méthode par un point virgule.
- On ne met pas de code exécutable (aucune accolade).
- Les méthodes abstraites doivent être implémentées dans les sous-classes.

# 4.Les interfaces

Une interface est une classe abstraite dont toutes les méthodes sont abstraites. Elle permet de définir un **contrat** entre les classes. Une classe va appeler les méthodes définies dans l&#39;interface. Une autre classe devra écrire le code pour les méthodes définies dans l&#39;interface. L&#39;interface est un type au même titre que la classe.

Il existe plusieurs dérfinitions du mot interface :

- Interface Graphique Utilisateur
- Interface publique d&#39;une classe
- Interface, genre particulier d&#39;une classe abstraite.

Une interface constitue un type. On peut déclarer une référence du type de l&#39;interface.

Pour déclarer une Interface, on remplace le mot **class** par **interface** , **toutes les méthodes sont abstraites** dans une interface.

interface Executable
 {

public void execute( );
 }

La classe qui fournit le code est dérivée de l&#39;interface en utilisant le mot clef **implements**

La classe doit fournir le code pour les méthodes définies dans l&#39;interface comme ceci :

class Traitement **implements** Executable
 {

public void execute( )
 {

// Le code à exécuter
 }
 }

La classe qui va utiliser le code aura une **méthode**** attendant un objet ****du type de l&#39;interface**.

classe Gestionnaire
 {

public void aFaire( Executable tache )
 {
 // Appel du code écrit dans la classe Traitement
 tache.execute( ) ;
 }
 }
 Gestionnaire g = new Gestionnaire( );
 Traitement t = new Traitement( );
 g.aFaire( t );

La classe Gestionnaire ne connaît que l&#39;interface Executable.

  1.
## Comparable et TreeSet

Dans cet exemple, nous allons voir l&#39;utilisation de l&#39;interface **Comparable** (java.lang.Comparable) qui permet de déterminer par programmation le classement d&#39;une série d&#39;objets stocké dans un tableau de type TreeSet.

L&#39;implémentation de cette interface nous oblige à redéfinir une méthode compareTo() qui sera automatiquement appelée par notre tableau TreeSet lors de l&#39;affichage des objets présents.

**public**** int** compareTo(Object objet)

La valeur retournée est :

\&lt;0 si objet en cours (this) \&lt; paramètre (objet passé en argument)

=0 si objet en cours (this) = paramètre (idem)

\&gt;0 si objet en cours (this) \&gt; paramètre (idem)

Voici la classe Voiture qui implémente notre interface Comparable :

**package** interfaceComparableEtTreeSet;

/\*\*

\*Utilisationdel&#39;interfacejava.lang.Comparable

\*Quipermetdecomparerdeuxobjetsenfonction

\*decritèredéfinisparleprogrammeur.

\*/

**public**** class **Voiture** implements** Comparable\&lt;Object\&gt;

{

// Déclaration des attributs

**public** String numero;

**public** String modele;

// Constructeur

**public** Voiture (String numero, String modele)

{

**this**.numero = numero;

**this**.modele = modele;

}

/\*\*

\*affichagedesdonnées

\*/

**public** String toString()

{

**return**&quot;Voiture numero : &quot; + numero + &quot; est un modèle : &quot; + modele ;

}

/\*

Implémenter la méthode public int compareTo(Object param)

de l&#39;interface java.lang.Comparable et comparer les objets

en effectuant la concaténation des textes modele+numero

\*/

**public**** int** compareTo(Object objet)

{

// on stocke la référence de l&#39;objet Voiture

Voiture objetAComparer = (Voiture)objet;

/\* on concatène modèle et numéro de l&#39;objet en cours (this).

Nous allons utiliser cette chaine concaténée pour effectuer

notre classement

\*/

String voitureGauche = **this**.modele+ **this**.numero ;

// on fait de même avec l&#39;objet passé en paramètre

String voitureDroite = objetAComparer.modele+objetAComparer.numero;

// renvoi la position

**return** voitureGauche.compareTo(voitureDroite);

}

}

Voici la classe TreeSet qui va nous permettre de stocker les objets de type Voiture :

**package** interfaceComparableEtTreeSet;

**import** java.util.Iterator;

**import** java.util.TreeSet;

//importez le package ou se trouve la classe TreeSet.

/\*\*

\*

\*UtilisationdelaclasseVoiturequiimplémente

\*l&#39;interfaceComparable.

\*/

**public**** class** TestTreeSet

{

**public** TestTreeSet()

{

// Déclarez et initialisez la variable locale de type TreeSet

TreeSet treeSet = **new** TreeSet();

// Ajoutez 2 instances de la classe Voiture à treeSet :

//(&quot;California 2345&quot;,&quot;Megane&quot;) et (&quot;VV 7 CF 4&quot;,&quot;XM&quot;).

treeSet.add( **new** Voiture( &quot;468 BHY 75&quot;,&quot;Peugeot&quot; ));

treeSet.add( **new** Voiture( &quot;315 VV 78&quot;,&quot;Renault&quot; ));

// Affichez le contenu du treeSet

affiche(treeSet);

affiche(&quot;=============&quot;);

// Ajoutez une instance de la classe Voiture : (&quot;952 POI 95&quot;,&quot;Volvo&quot;).

treeSet.add( **new** Voiture(&quot;201 ABC 22&quot;,&quot;Audit&quot;));

// Affichez le contenu de treeSet

affiche(treeSet) ;

affiche(&quot;=============&quot;);

/\* Remarques :

La voiture &quot;201 ABC 22 est un modèle : Audit&quot; a été placée en

première position alors que nous l&#39;avons ajouté en dernier. Ceci

grâce à la méthode compareTo() que nous avons défini dans la classe

Voiture qui implémente l&#39;interface Comparable.

\*/

}

**public**** static ****void** main (String[] arg)

{

**new** TestTreeSet();

}

**public**** void** affiche(TreeSet\&lt;Voiture\&gt; t)

{

Iterator\&lt;Voiture\&gt; it = t.iterator();

**while** ( it.hasNext() )

{

System._out_.println( it.next() ) ;

}

}

**public**** void** affiche(String msg)

{

**if** ( msg != **null** )

{

System._out_.println( msg ) ;

}

}

}

Exécutez ce programme et vérifiez l&#39;ordre d&#39;affichage des objets Voiture dans la console.

## Serializable : Personnalisation de la sauvegarde des objets

Pour bien comprendre ce chapitre sur l&#39;utilisation de l&#39;interface Serializable et de la possibilité de personnalisation de l&#39;écriture et de la lecture d&#39;objets dans un fichier, il vous faudra faire un tour au chapitre 10 sur la manipulation des fichiers et des objets. Dans l&#39;exemple présenté ci-dessous, on personnalise la sauvegarde d&#39;un objet de type Personne en redéfinissant 2 méthodes :

**private void writeObject(objectOutputStream out) throws IOException, ClassNotFoundException**

**private void readObject(objectInputStream in) throws IOException, ClassNotFoundException**

En redéfinissant ces 2 méthodes, on choisit les attributs d&#39;un objet à sauvegarder et la forme de la sauvegarde.

Voici la classe Personne :

**package** personnalisationSerialisation;

/\*\*

\*Exempledeclassequiredéfinisdesméthodes

\*pourmodifierleschampsquiserontsauvegardés

\*vialeprocessusdesérialisation

\*/

**import** java.io.IOException;

**import** java.io.ObjectInputStream;

**import** java.io.ObjectInputStream.GetField;

**import** java.io.ObjectOutputStream;

**import** java.io.ObjectStreamField;

**import** java.io.Serializable;

**import** java.io.ObjectOutputStream.PutField;

**import** java.util.Calendar;

**public**** class **Personne** implements** Serializable

{

/\* Déclarer les attributs :

Un tableau nommé FONCTIONS qui stocke 3 chaînes :

indice 0 : développement (par défaut)

indice 1 : administration

indice 2 : directeur

\*/

**private**** static ****final** String [] _FONCTIONS_ = {&quot;developpeur&quot;,&quot;administratif&quot;,&quot;directeur&quot; };

**private** String nom;

**private**** int**age;

**private** String fonction;

// Identifiant de la classe.

**static**** final ****long** _serialVersionUID_ = 7173573940148970246L;

/\* création d&#39;un tableau serialPersistentFields permettant de définir

la structure des champs persistants différents des attributs :

Quel est l&#39;intérêt de stocker plutôt la date de naissance que l&#39;âge ?

Et bien, si vous reliser un objet Personne au dela d&#39;une année, l&#39;age

sera toujours à jour grace au calcul de la date de naissance plutot

qu&#39;au simple stockage de l&#39;age lui-même !

\*/

**private**** static ****final** ObjectStreamField [] _serialPersistentFields_ =

{

**new** ObjectStreamField( &quot;nom&quot;,String. **class** ),

**new** ObjectStreamField( &quot;anneeDeNaissance&quot;,String. **class** ),

**new** ObjectStreamField( &quot;fonction&quot;,String. **class** )

};

// Constructeur qui définit les attributs :

**public** Personne (String nom, **int** age, String fonction)

{

**this**.nom = nom;

**this**.age = age;

**this**.fonction = controleFonction(fonction);

}

// Redéfinission de la méthode public String toString()

**public** String toString()

{

**return**&quot;M. &quot; + nom + &quot; age=&quot; + age + &quot; fonction : &quot; + fonction;

}

/\*\*

\*Retournelafonctionsousformedechaîneaprèsavoir

\*controlésonexistence

\ ***@param** fonction

\ ***@return**

\*/

**public** String controleFonction(String fonction)

{

**if** (fonction== **null** ) **return** _FONCTIONS_[0];

**for** ( **int** i=0; i\&lt;_FONCTIONS_.length;i++)

**if** (fonction.equals(_FONCTIONS_[i]) ) **return** fonction;

**return** _FONCTIONS_[0];

}

/\*\*

\*Personnalisationdelasérialisation

\*/

**private**** void**writeObject (ObjectOutputStream out )**throws** IOException, ClassNotFoundException

{

PutField champs = out.putFields();

// ajout du nom :

champs.put( &quot;nom&quot; , nom );

// ajout de l&#39;age :

**int** anneeActuelle = Calendar._getInstance_().get(Calendar._YEAR_ );

String anneeDeNaissance = &quot;&quot; + (anneeActuelle - age);

System._out_.println(&quot;année de naissance sauvegardée = &quot;+anneeDeNaissance);

champs.put(&quot;anneeDeNaissance&quot; , anneeDeNaissance );

// ajout de la fonction :

champs.put( &quot;fonction&quot; , fonction );

// écriture des champs sérialisés :

out.writeFields();

}

/\*\*

\*Personnalisezlaréintanciation

\*/

**private**** void**readObject (ObjectInputStream in )**throws** IOException, ClassNotFoundException

{

GetField champs = in.readFields();

// récupération du nom :

nom = (String) champs.get(&quot;nom&quot;,&quot;inconnu&quot;);

// récupération de l&#39;age :

String anneeDeNaissance = (String) champs.get( &quot;anneeDeNaissance&quot; , &quot;&quot; );

**int** anneeActuelle = Calendar._getInstance_().get(Calendar._YEAR_ );

age = anneeActuelle - Integer._parseInt_(anneeDeNaissance);

// Récupération de la fonction :

fonction = controleFonction((String) champs.get( &quot;fonction&quot; , &quot;&quot; ));

}

}

Voici les classes d&#39;écriture et de lecture des objets Personnes :

La sauvegarde sous forme d&#39;objet (ou sérialisation) :

**package** personnalisationSerialisation;

//Importez les packages

**import** java.io.FileOutputStream;

**import** java.io.IOException;

**import** java.io.ObjectOutputStream;

//Créez la classe TestSerialisation.

**public**** class** TestSerialisation

{

// méthode main() :

**public**** static ****void** main (String args[]) **throws** IOException, ClassNotFoundException

{

// Instanciez deux objets la classe Personne :

Personne dupond = **new** Personne(&quot;Dupond&quot;, 30, &quot;xxxx&quot;);

Personne durand = **new** Personne(&quot;Durand&quot;, 43, &quot;administratif&quot;);

// Instanciez le flux ObjectOutputStream lié au fichier &quot;personne.ser&quot;.

ObjectOutputStream fluxSortie = **new** ObjectOutputStream ( **new** FileOutputStream(&quot;personne.ser&quot;));

// Sérialisez les objets dans le flux :

fluxSortie.writeObject(dupond);

fluxSortie.writeObject(durand);

// Fermez le flux.

fluxSortie.close();

System._out_.println(&quot;Serialisation effectuee&quot;);

}

}

La lecture (ou réinstanciation) :

**package** personnalisationSerialisation;

//Importez le package de java.io.

**import** java.io.FileInputStream;

**import** java.io.FileNotFoundException;

**import** java.io.IOException;

**import** java.io.ObjectInputStream;

//Créez la classe TestReinstanciation.

**public**** class** TestReinstanciation

{

// méthode main() :

**public**** static ****void** main(String args[]) **throws** FileNotFoundException, ClassNotFoundException

{

// Instanciez le flux ObjectInputStream lié au fichier &quot;personne.ser&quot;.

**try**

{

ObjectInputStream fluxEntree= **null** ;

fluxEntree = **new** ObjectInputStream ( **new** FileInputStream(&quot;personne.ser&quot;));

// Réinstanciez les objets trouvés :

**while** ( **true** )

{

Personne monsieurX;

monsieurX = (Personne) fluxEntree.readObject();

System._out_.println(monsieurX.toString());

}

} **catch** (IOException e)

{

System._out_.println(&quot;Reinstanciation effectuee&quot;);

}

}

}

# 5.Packages

En java, les classes sont placées dans des unités logiques appelées packages. Les packages sont analogues à des répertoires.

**Quel est l&#39;intérêt d&#39;utiliser des packages ?**

Dans des applications complexes, les packages permettent d&#39;organiser les fonctions des différentes parties d&#39;un programme. Par exemple dans une application java ou dans une servlet, il peut y avoir une partie réservée à l&#39;accès aux données, une partie correspondant à l&#39;interface graphique et une autre partie de gestion du réseau. **Chaque partie peut avoir son propre package**. Vous avez certainement remarqué que les packages étaient souvent distribués en tant que programme réutilisables, pouvant être incorporés dans d&#39;autres programmes.

Les packages permettent **d&#39;éviter des conflits de nom** avec d&#39;autres packages. Il est fréquent que le nom du package s&#39;appuie sur l&#39;identifiant internet pour garantir l&#39;unicité.

Les packages permettent aussi de controler la façon dont les autres classes peuvent accèder à vos classes. Le principe repose sur l&#39;utilisation de modificateurs d&#39;accès.

**Comment ajouter une classe dans un package ?**

Pour ajouter la classe **Employe** dans le package **paie.info** , il nous faut utiliser le mot clef package :

**Package** paie.info;

Ainsi, un package se crée par **l&#39;instruction package au tout début du fichier java** (première ligne du fichier). L&#39;organisation des packages est analogue à celle des répertoires. Le **point** (.) est utilisé comme séparateur de package. Dans la ligne précédente, il existe un package paie (un répertoire) et un package info (un sous-répertoire du package paie) dans lequel il y aura des fichier compilés au format « .class».

**Notion d&#39;unités de compilation**

Les classes sont définies dans une unité de compilation (un fichier .java). Une unité de compilation peut contenir plusieurs classes, avec au plus une classe ou interface déclarée public. Si une unité de compilation déclare une classe public NomDeClasse, le fichier doit être nommé NomDeClasse.java. S&#39;il y a plusieurs classes dans une unité de compilation, il y aura plusieurs fichiers .class après compilation.

# 6.Création d&#39;un JAR exécutable

Pour exécuter un fichier JAR il faut obligatoirement une JVM, une machine java virtuelle installée sur la machine. Un **JAR** signifie **Java ARchive** et contient les classes de votre application ainsi qu&#39;un fichier nommé **manifest.MF** contenant les librairies et classpath nécessaires pour lancer votre application java.

Exemple du contenu d&#39;un fichier Manifest.MF :

Manifest-Version : 1.0
 Main-Class : package.ClassDuMain
 Class-Path : chemin ou ressource

(Ici saut de ligne)

Ce fichier est placé sous le répertoire META-INF :

En fonction de la version d&#39;Eclipse que vous utilisez, la création d&#39;un JAR exécutable sera différente. Généralement, il faut choisir « Export » puis « Fichier JAR » et renseigner les zones. Sinon, vous pouvez le faire manuellement de la façon suivante :

Jar cvfm cheminDuJar cheminDuManifest

# 7.Instruction import

Si vous voulez utiliser la classe Employé depuis un autre package, vous devez référencer la classe à l&#39;aide de la notation complète suivante :

paie.info.Employe unEmploye = new paie.info.Employe() ;

Il est aussi possible de rendre la classe Employe visible en utilisant l&#39;instruction **import**. _L&#39;instruction_ _ **import** _ _doit être placée après l&#39;instruction package_.

**Remarques :**

Si vous importez un package avec « import paie.info.\* ; », les sous-répertoires ne seront pas accessibles. Par exemple, un package « paie.info.interimaire » ne sera pas importé.

Le seul package que vous ne devez pas importer est le **« java.lang**  ».

**Voici un exemple de code avec l&#39;instruction import :**

// Rend visible seulement la classe Employe
 import paie.info.Employe;

// Rend visibles toutes les classes du
 // package paie.info
 import paie.info.\*;
 public class Xxx
 {

Employe e1; // possibilité d&#39;utiliser le nom court grâce à l&#39;import
 ...
 }

# 8.Modificateurs d&#39;accès

En règle générale, on contrôle la **visibilité** des membres d&#39;une classe (attributs et méthodes) à travers l&#39;utilisation des mots clé **private** , **public** et **protected**. Il existe aussi un autre niveau de visibilité nommé **package** , mais celui-ci est défini par l&#39;absence de mot clé.

**Rappel sur les Visibilités affectées aux objets :**

**PUBLIC**

Une variable, une méthode ou une classe déclarée en **PUBLIC** sera visible par toutes les autres méthodes à l&#39;intérieur de l&#39;objet ou à l&#39;extérieur.

**PROTECTED**

Une variable ou une méthode **PROTECTED** sera visible depuis le même package ou les sous-classes.

**PACKAGE**

Les membres sont accessibles depuis les classes du même package. Cette visibilité est la valeur par défaut.

**PRIVATE**

Une variable ou une méthode déclarée **PRIVATE** sera visible uniquement dans sa classe.

**Autres modificateurs de visibilité :**

**STATIC**

Ce mot-clé permet de _ **partager** _ une variable de classes entre entre plusieurs instances.

**FINAL**

Ce mot-clé permet de définir une **constante**.

public static final float PI = 3.14f;

**SYNCHRONIZED**

Ce mot-clé permet de gérer la **synchronisation** des processus ( **threads** ).

**TRANSIENT**

Ce mot-clé permet de ne pas sauvegarder un attribut d&#39;objet dans le cas de la sérialisation.

# 9.Exceptions

**Qu&#39;est ce qu&#39;une Exception ?**

Les Exceptions sont instanciées, lorsque la JVM détecte des conditions anormales.

![](RackMultipart20201102-4-17yaceu_html_9306f69fdcda8124.jpg)

Exception hérite de Throwable
 Error hérite de Throwable
 Throwable hérite de Object
 RuntimeException hérite de Exception
 Exceptions controlées (personnalisées) hérite de Exception

**Explications ** :

Une exception est la conséquence de toute condition anormale. Java étant un langage objet, les exceptions sont représentées par des sous-classes de la classe java.lang.Exception. Java fournit un modèle grâce auquel la gestion des exceptions se fait par la compréhension de la hiérarchie de la classe Exception.

Exemples d&#39;exceptions diverses :

- Une erreur matériel (disque dur plein, ports série inutilisables, …)
- Utilisateur saisit des informations erronées.
- Erreurs de programmation (tentative d&#39;accès en dehors des limites d&#39;un tableau, …)

**La Classe Error**  :

Une erreur est une condition qui empêche le programme de se terminer. Les erreurs surviennent à l&#39;exécution et ne sont généralement pas gérées par le mécanisme d&#39;interception des exceptions. Les erreurs provoquent la fin du programme et généralement les programmeurs ont très peu de moyens de contrôle sur elles. Par exemple : **OutOfMemoryException** , **StackOverflowError** , **UnknownError**.

Il existe 2 types (sous-classes) d&#39;Exceptions : _ **RuntimeException** _ et les _ **exceptions contrôlées** _.

**RuntimeException**  :

RuntimeException est une classe abstraite qui définit un ensemble de conditions pouvant survenir n&#39;importe où dans un programme. Par exemple :

- **ArithmeticException** (résultat d&#39;une division par zéro),
- **ClassCastException** (tentative de conversion illégale),
- **IndexArrayOutOfBoundsException** (tentative d&#39;accès à l&#39;élément 22 d&#39;un tableau de 15 éléments),
- **NullPointerException** (tentative d&#39;accès à un élément dont la référence est nulle), …

Le compilateur java (javac) ne force pas la gestion des RuntimeException dans le programme (vous pouvez les ignorer !). C&#39;est la raison pour laquelle on en parle comme étant des Exceptions non contrôlées. Bien que ce type d&#39;Exception peut être évité par une programmation correcte, on peut l&#39;intercepter comme toutes les autres Exceptions.

**Exceptions contrôlées**  :

Les autres Exceptions peuvent se trouver dans tous les package java. Certaines sont définies dans le package java.lang, comme la classe **InterruptedException** utilisée par les Thread en veille. D&#39;autres sont définies dans les package java.net ou java.io et sont générées lors de problèmes de connection réseau, de tentative d&#39;accès à un fichier indisponible. Vous pouvez aussi créer vos propres Exceptions et utiliser les mêmes mécanismes d&#39;interception. Il suffit de créer une classe qui hérite de la classe Exception et de créer les constructeurs adéquats.

Mécanisme des Exceptions

Une erreur détectée à l&#39;exécution provoque la génération d&#39;un objet de type Exception. L&#39;exécution se débranche de son déroulement normal et l&#39;objet Exception remonte à travers la pile des méthodes appelantes, jusqu&#39;à la rencontre d&#39;une portion de code pouvant l&#39;intercepter.

Nous avons ensuite 2 possibilités :

- soit cette portion de code existe, le traitement prévu par le développeur est alors exécuté.
- Soit cette portion de code n&#39;existe pas, un message d&#39;erreur standard est affiché par la machine vituelle java. Ce deuxième cas ne peut s&#39;appliquer qu&#39;aux Exceptions de type RuntimeException.

**Illustration**  :

![](RackMultipart20201102-4-17yaceu_html_6b3b639defaa95f4.jpg)

**Les différents traitements d&#39;une Exception ** :

Il y a 4 possibilités :

- Ignorer l&#39;exception s&#39;il s&#39;agit d&#39;une exception de type RuntimeException
- Intercepter l&#39;exception à l&#39;aide d&#39;un bloc try/catch
- Propager l&#39;exception à la méthode appelante avec le mot clé **throw**
- Intercepter l&#39;exception et la repropager à la méthode appelante

**Ignorer l&#39;Exception**  :

![](RackMultipart20201102-4-17yaceu_html_d7f7f4037c444318.png)

Une RuntimeException peut tout simplement être ignorée. Sans action spécifique, la méthode dans laquelle survient une exception, s&#39;arrête immédiatement. Elle propage ensuite l&#39;erreur à la méthode appelante. Si cette méthode appelante ignore l&#39;Exception, cette dernière est remontée à travers la pile des différentes méthodes appelantes, jusqu&#39;à ce que le programme s&#39;arrête en affichant un message d&#39;erreur standard. On peut éviter cela par une programmation soignée.

**Intercepter l&#39;Exception**  :

Si une méthode est susceptible d&#39;intercepter une Exception contrôlée, cela est indiqué explicitement par la déclaration **throws**. Par exemple, la méthode read() de la classe FileInputStream est déclarée comme ceci :

public int read(byte[] b) throws IOException

Cette déclaration indique au compilateur et à l&#39;utilisateur de cette méthode qu&#39;elle est susceptible de lever une exception IOException. Cette exception entre dans la catégorie des exceptions contrôlées et ne peut être ignorée.

il faut :

- Soit **l&#39;intercepter**
- Soit la **propager** au niveau appelant.

Pour intercepter une exception, il suffit de placer le code susceptible de lever cette exception (généralement l&#39;appel d&#39;une méthode possèdant une clause **throws** ) dans un **bloc try/catch** comme dans l&#39;exemple ci-dessous :

String nomFichier = &quot;ficli.txt&quot;;
 try
 {

// code succeptible de lever une Exception
 FileInputStream f1 = new FileInputStream(nomFichier);
 int longueurFichier = f1.available();
 // lecture du fichier
 byte[] readBuffer = new byte[longueurFichier];
 f1.read(readBuffer);
 // fermeture du fichier
 f1.close();
 ...
 }
 catch(IOException e)
 { // action à mener si une Exception survient
 System.out.println(&quot;Erreur lors de la lecture du fichier&quot;);
 }

Le rôle du bloc try/catch est d&#39;intercepter une exception et de la corriger afin qu&#39;elle n&#39;interfère pas au bon déroulement du programme. Une exception peut potentiellement surgir à l&#39;intérieur du bloc try. Dans ce cas, le contrôle est immédiatement passé au bloc catch qui gère l&#39;exception.

**Intercepter des Exceptions multiples :**

Vous pouvez mettre en place l&#39;interception de différents types d&#39;exception. Dans ce cas, il suffit **d&#39;ajouter plusieurs bloc catch** , chacun de ces blocs traitant une exception spécifique.

Chaque bloc catch interceptera les exceptions de la classe spécificée en paramètre, ainsi que des sous-classes. S&#39;il existe une relation d&#39;héritage entre les 2 types d&#39;exception à capturer, il faut placer en priorité le bloc catch le plus spécialisé avant le bloc catch le plus général.

Voici un exemple de code ci-dessous :

String nomFichier = &quot;ficli.txt&quot;;
 try
 {
 FileInputStream f1 = new FileInputStream(nomFichier);
 int longueurFichier = f1.available();
 byte[] readBuffer = new byte[longueurFichier];
 f1.read(readBuffer);
 ...
 }
 catch(FileNotFoundException e)
 {
 System.out.println(&quot;Fichier &quot; + nomFichier + &quot; non trouvé !&quot;);
 }
 catch(IOException e)
 {
 System.out.println(&quot;Erreur lors de la lecture du fichier&quot;);
 }

**Utilisation du bloc finally :**

Dans un bloc try, si aucune exception n&#39;est levée, toutes les instructions du bloc try sont exécutées. Par contre, si une instruction génère une exception, les lignes de codes suivantes ne seront pas exécutées.

Le bloc finally permet d&#39;écrire du code, qui doit être exécuté dans tous les cas, qu&#39;il y ait ou non génération d&#39;exception dans le bloc try. Les 2 scénari les plus courants utilisant le bloc finally sont :

A ) La méthode propage toutes les exceptions, par exemple parce qu&#39;elle n&#39;a pas de bloc catch. Dans ce cas, le traitement standard est proprement séparé de la gestion des exceptions.

Voici un exemple de code :

try {

}
 finally { // exemple : fermeture de fichiers}

B ) La méthode gère l&#39;exception et la repropagation

try {

}
 catch (ExceptionA e) {
 throw new ExceptionB()
 }

finally{
 // exemple : fermeture de fichiers
 }

Note : le seul cas dans lequel le bloc **finally** n&#39;est pas exécuté est lorsque la méthode **System.exit()** est exécutée au préalable.

**Propager l&#39;exception à la méthode appelante :**

Illustration :

![](RackMultipart20201102-4-17yaceu_html_f1939521dcdb4d19.jpg)

**Explication du graphique ci-dessus :**

Lors de l&#39;exécution de la méthode3(), il y a instanciation d&#39;un objet de classe d&#39;ExceptionA.

La directive throw va déclencher le mécanisme d&#39;exception : remontée de l&#39;objet ExceptionA dans la pile des méthodes appelantes, jusqu&#39;à la rencontre d&#39;un bloc try/catch.

La méthode3() et la méthode2() ne contiennent pas de bloc try/catch permettant d&#39;intercepter l&#39;ExceptionA. Leur déclaration doit uniquement contenir une directive throws, pour signaler qu&#39;elles sont susceptibles de lancer l&#39;ExceptionA. C&#39;est au niveau de la méthode1(), que l&#39;interception de l&#39;ExceptionA sera effectuée.

Le regroupement du code de gestion des exceptions en un lieu précis (exemple : dans la méthode1()) permet d&#39;avoir du code plus propre.

**Intercepter et repropager une Exception :**

Il est possible d&#39;intercepter une exception dans un bloc try/catch, puis de la repropager. La syntaxe de cette technique est montrée ci-dessous. Avec ce code, vous pouvez distribuer votre gestion d&#39;exceptions. Il peut y avoir un premier niveau de traitement en première instance, puis transmission à un niveau d&#39;appel supérieur pour une poursuite du traitement de l&#39;exception.

public uneMethode() throws UneException
 {

try

{

// code pouvant propager UneException

}
 catch(UneException e)
 {

// Code de gestion d&#39;une Exception
 throw e;

}

}

**Créer votre propre Exception :**

La possibilité de créer vos propres exceptions est un point fort du langage java. Généralement vous créez une exception controlée. Pour cela, il suffit d&#39;étendre la classe Exception :

public class MonException extends Exception
 {

public MonException(String message)
 { // laissons tout le travail à la classe Exception
 super(message);
 }
 public MonException()
 { // Il est possible de juste définir un message par défaut
 super(&quot;Une Exception \&quot;MonException\&quot; vient de survenir ...&quot;);
 }

}

Au final, votre exception affiche un message approprié lorsque survient un problème. Les constructeurs de la classe Exception sont prévus pour permettre l&#39;affichage d&#39;un message lorsque l&#39;exception survient. Cependant, il faut savoir se souvenir que les constructeurs ne sont pas hérités, vous devez donc utiliser l&#39;instruction **super()** dans le constructeur de votre classe MonException pour bénéficier de cette caractéristique.

**Propager votre Exception :**

Nous avons vu que la directive throw permet de déclencher le mécanisme d&#39;exception. Remontée de l&#39;objet MonException dans la pile des méthodes appelantes, jusqu&#39;à la rencontre d&#39;un bloc try/catch pour la traiter.

public class MaClasse
 { // méthode succeptible de lever une exception MonException

public void methode()
 throws MonException
 { ...// traitement
 ...
 // on teste si condition anormale et on lève une exception
 // si nécessaire
 if (codeErreur != 0)
 throw new MonException();
 }

}

**Exceptions et redéfinition des méthodes :**

Une méthode redéfinie peut propager :

- aucune exception
- les mêmes exceptions
- des exceptions qui sont des sous-classes des exceptions propagées par la méthodes qui est redéfinie.

public void test() throws ExceptionB  redéfinit  public void test() throws ExceptionA

ExceptionB  extends  ExceptionA

Résumé de la découverte des exceptions :

2 types d&#39;Exceptions :

- RuntimeException
- Exception contrôlée

4 traitements possibles d&#39;une Exception :

- Ignorer s&#39;il s&#39;agit d&#39;une RuntimeException
- Intercepter (try/catch, finally)
- Propager à la méthode appelante (throw)
- Intercepter et repropager

Création d&#39;une Exception spécifique, sous-classe de la classe Exception

Les Exceptions et la redéfinition des méthodes

# 10.Découvertes des entrées sorties

Les entrées sorties sont vues par Java comme des flux d&#39;octets ou de caractères. Le package java.io fournit les classes chargées des opérations de lecture et écriture. Les lectures et écritures sont indépendantes des supports. On construira un flux en utilisant une ou plusieurs classes.

Remarques :

Les noms des classes indiquent leurs fonctions.

Les noms se terminant par **stream** sont à utiliser pour des flux d&#39;octets.

Les noms se terminant par **er** sont à utiliser pour des flux de caractères.

Les classes sont en général appairées : **une dédiée à la lecture et l&#39;autre à l&#39;écriture**.

Par exemple :

- InputStream / OutputStream : octets
- Reader / Writer : caractères

En java, il existe 2 types de flux :

- flux de bytes ou d&#39;octets (8 bits)
- flux de caractères (16 bits Unicode)

Exemple d&#39;InputStream : System.in (entrée standard = le clavier)

Les classes dont le nom contient un nom de ressource ( File, ByteArray, String, ... ) permettent de faire un lien avec ces resources.

**Exemples :**

_FileInputStream FileOutputStream
 ByteArrayInputStream ByteArrayOutputStream
 StringReader StringWriter_

Les classes dont le nom contient stream et er servent à la conversion de flux d&#39;octets en flux de caractères.

![](RackMultipart20201102-4-17yaceu_html_b6978c744f000d10.jpg)

InputStreamReader lit des bytes pour les transformer en caractères

OutputStreamWriter écrit des caractères dans un flux en sortie, en les transformant en bytes (avec encodage).

**Il existe des classes qui ajoutent des fonctionalités à des flux existants.**

Pour la gestion des tampons mémoires, nous avons les classes :

**BufferedReader** et **BufferedWriter**

Pour l&#39;utilisation de méthodes de lecture / écriture pour des types internes, nous avons :

**DataInputStream** et **DataOutputStream**

Pour l&#39;écriture et la lecture d&#39;objets, nous avons :

**ObjectInputStream** et **ObjectOutputStream**

**Remarques :**

**DataInputStream** et **DataOutputStream** permettent une representation binaire portable (indépendante de la plateforme) de types primitives java.

**ObjectOutputStream** et **ObjectInputStream** servent à la _sérialisation / désérialisation_ d&#39;objets ou de tableaux. Elles fournissent réciproquement les méthodes **writeObject()** et **readObject()**.

**Les méthodes du flux InputStream :**

InputStream est une classe abstraite, super-classe de tous les flux d&#39;octets en entrée. Cette classe apporte les méthodes de base pour les sous-classes (exemple : read() ).

Méthodes dédiées à la lecture :

octet par octet :

int read( ) throws IOException; // renvoie l&#39;octet lu ou -1 en fin de flux

par tableau d&#39;octets :

int read(byte [] tableau ) throws IOException;
 int read(byte [] tableau,int offset,int nb) throws IOException;

Les opérations de lecture sont blocantes.

Autres méthodes :

int available( ); // donne le nombre d&#39;octets pouvant être lus sans blocage.
 void close( ) throws IOException; // ferme le flux de lecture.

**Les méthodes du flux OutputStream :**

Méthodes dédiées à l&#39;écriture :

octet par octet :

void write( int c ) throws IOException;

par tableau de bytes :

void write( byte [] tableau ) throws IOException;
 void write( byte [] tableau,int offset,int nb ) throws IOException;

Autres méthodes :

void flush( ); // force l&#39;écriture des octets vers le périphérique de sortie

void close( ) throws IOException; // ferme le flux de sortie

**Fichier vu comme un flux d&#39;octets :**

**FileInputStream** et **FileOutputStream** permettent de lire et d&#39;écrire un fichier.

Les constructeurs reçoivent le nom du fichier :

Pour lire :

FileInputStream( String nom) throws FileNotFoundException;

Pour écrire :

FileOutputStream( String nom ) throws FileNotFoundException;

Le fichier est créé s&#39;il n&#39;existe pas. Si le fichier existe son contenu initial est perdu.

Ajout en fin de fichier :

FileOutputStream(String n,boolean a) throws FileNotFoundException;

Exemple de flux d&#39;octets :

FileInputStream fis = null ; FileOutputStream fos = null ;
 try
 {
 fis = new FileInputStream( &quot;fichier.dat&quot; ) ;
 fos = new FileOutputStream( &quot;copie.dat&quot; ) ;
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

**Flux de caractères Reader :**

Méthodes de lecture :

Caractère par caractère :

int read() throws IOException; // Renvoie le caractère lu ou -1 en fin de flux.

Par tableau de caractères :

int read( char [] tableau ) throws IOException;
 int read( char [] tableau, int offset , int nb ) throws IOException;

Renvoie le nombre de caractères lus, -1 en fin de flux.

Autres méthodes :

boolean ready(); // Vrai s&#39;il y a un caractère disponible sans attente.

void close( ) throws IOException; // Ferme le flux d&#39;entrée

**Flux de caractères Writer :**

Méthodes d&#39;écriture :

Caractère par caractère :

void write( char c ) throws IOException;

Par tableau de caractères :

void write( char [] tableau ) throws IOException;
 void write( char [] tableau, int offset, int nb ) throws IOException;

Autres méthodes :

void flush(); // Force l&#39;écriture des caractères vers le périphérique de sortie.
 void close( ) throws IOException; // Ferme le flux de sortie

**Les classes de conversion :**

Conversion de flux d&#39;octets en flux de caractères.

InputStreamReader( InputStream is );

Avec spécification du code page à utiliser pour la conversion :

InputStreamReader( InputStream is , String codepage ) throws UnsupportedEncodingException;

Conversion de flux de caractères en flux d&#39;octets :

OutputStreamWriter( OutputStream os );
 OutputStreamWriter( OutputStream os, String codepage ) throws UnsupportedEncodingException;

Quelques code page :

Cp1252 Windows Latin-1
 Cp437 MS-DOS United States
 Cp850 MS-DOS Latin-1

**Les classes filtres :**

Ajout de tampon mémoire et de méthode readLine :

BufferedReader( Reader input );
 String readLine() throws IOException; // Renvoie une chaine de caractères ou null en fin de flux.

Ajout de méthodes print() et println() :

PrintWriter( OutputStream os ) ;
 PrintWriter( OutputStream os, boolean autoflush ) ;
 PrintWriter( Writer wt ) ;
 PrintWriter( Writer wt , boolean autoflush ) ;

Les méthodes de PrintWriter ne lancent pas d&#39;exceptions :

boolean checkError();

**Exemple de flux de caractères :**

BufferedReader br = null ;
 PrintWriter pw = null ;
 try
 {
 InputStreamReader rd = new InputStreamReader( System.in );
 br = new BufferedReader( rd ) ;
 FileWriter fw = new FileWriter( &quot;log.txt&quot; , true ) ;
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

Voici un exemple de code d&#39;écriture et de lecture d&#39;un flux d&#39; **octets**  :

**import** java.io.FileInputStream;

**import** java.io.FileNotFoundException;

**import** java.io.FileOutputStream;

**import** java.io.IOException;

**class** TestEntreesSorties

{

**public**** static ****void** main (String[] args)

{

// lecture / écriture d&#39;un flux d&#39;octets

// déclaration de 2 types d&#39;objets

FileInputStream fis = **null** ;

FileOutputStream fos = **null** ;

FileOutputStream fosf = **null** ;

// bloc try

**try**

{

// création des objets de type File :

fis = **new** FileInputStream(&quot;toto.txt&quot;);
// flux en lecture

fos = **new** FileOutputStream(&quot;titi.txt&quot;);
// flux en écriture

fosf = **new** FileOutputStream(&quot;bobo.txt&quot;, **true** );
// écriture mode ajout

**int** octet = 0;

**while** ( **true** )

{

octet = fis.read();
// lecture du flux d&#39;octets dans toto.txt

**if** (octet == -1) **break** ; // si fin de fichier on sort

fos.write(octet); // écriture de l&#39;octet dans titi.txt

fosf.write(octet);
// écriture de l&#39;octet dans bobo.txt en mode ajout

}

fos.close(); // on ferme le flux d&#39;octets en écriture

fosf.close(); // idem

fis.close(); // idem pour la lecture

}

// on attrape l&#39;exception si un fichier n&#39;est pas trouvé !

**catch** (FileNotFoundException fnfe)

{

System._out_.println(fnfe.getMessage());

}

**catch** (IOException ioe)

{

System._out_.println(ioe.getMessage());

}

**finally**

{

System._out_.println(&quot;Opération terminée&quot;);

// il ne vous reste plus qu&#39;à aller voir le contenu des

// fichiers titi, toto et bobo dans votre répertoire.

}

}

}

# 11.La classe File

Une classe dite de service.

La classe **File** fournit un certain nombre de services se rapportant aux fichiers et aux répertoires.

File( String nom );
 File( String parent , String nom ) ;

nom représente un nom de fichier ou de répertoire.
 parent le nom du répertoire en relation avec le fichier.

Les informations sur un fichier :

boolean canRead() ;
 boolean canWrite() ;
 boolean exists() ;
 String getAbsolutePath() ;
 boolean isDirectory() ;
 boolean isFile() ;
 long lastModified();
 long length() ;

Pour les répertoires :

boolean createNewFile() throws IOException; // Crée un fichier s&#39;il n&#39;existe pas déjà.
 boolean delete() ; // Supprime le fichier du répertoire où il se trouve
 String [] list(); // Donne la liste des noms de fichiers du répertoire.
 File[] listFiles() ; // Donne une liste de fichiers appartenant au répertoire.
 boolean mkdir() ; // Crée un répertoire
 boolean renameTo(File f) ; // Renomme le fichier courant en fichier correspondant à f

Exemple de traitement d&#39;une exception générée par un fichier non trouvé :

// importation des paquetages nécessaires :

**import** java.io.FileInputStream;

**import** java.io.FileNotFoundException;

**import** java.io.IOException;

// classe FichierInexistant

**class** FichierInexistant

{

// attributs

**private** String monFichier=&quot;titi.txt&quot;;

/\*

public void setMonFichier(String f)

{

monFichier=f;

}

\*/

// constructeur

**public** FichierInexistant()

{

**try**

{

FileInputStream fis = **new** FileInputStream(monFichier);

**int** longueurFichier = fis.available();

// lecture du fichier

**byte** [] readBuffer = **new**** byte**[longueurFichier];

fis.read(readBuffer);

// fermeture de fichier

fis.close();

}

/\* ici, le catch permet d&#39;attraper une erreur (exception)

en cas de &quot;fichier non trouvée&quot;. Les exceptions sont des

classes comme les autres, elles permettent d&#39;instancier

à partir de la classe Exception ou des classes dérivées.

\*/

**catch** (FileNotFoundException e)

{

System._out_.println(&quot;le Fichier &quot;+monFichier+ &quot; est introuvable !&quot;);

// on pourrait proposer une nouvelle saisie du nom du fichier et

// rappeler une méthode ...

}

**catch** (IOException e)

{

System._out_.println(&quot;Erreur de lecture du fichier !&quot;);

}

}

}

**public**** class** TestDesExceptionsIO

{

**public**** static ****void** main (String[] args)

{

FichierInexistant fi = **new** FichierInexistant();

}

} // fin de la classe TestDesExceptionsIO

Exemple de code d&#39;écriture de caractères ( **phrase** ) et de lecture d&#39;octets dans un fichier :

**import** java.io.FileInputStream;

**import** java.io.FileWriter;

**import** java.io.IOException;

**public**** class** TestFlux

{

**public**** static ****void** main(String argv[])

{

// Ecriture dans un fichier :

**try**

{

// déclarer et créer un flux fw de type FileWriter lié à la ressource fichier &quot;sortie.log&quot;.

FileWriter fw = **new** FileWriter(&quot;sortie.log&quot;);

// Utilisez le flux fw pour écrire un texte dans le fichier &quot;sortie.log&quot;.

fw.write(&quot;Bonjour, cette phrase a bien été enregistrée dans un fichier&quot;);

//Fermez le flux.

fw.close();

}

**catch** (IOException e)

{

e.printStackTrace();

}

// lecture de ce que vous avez écrit et affichage dans la console :

**try**

{

StringBuffer phrases = **new** StringBuffer();

FileInputStream fis = **new** FileInputStream(&quot;sortie.log&quot;);

**int** octet=0;

**while** ( **true** )

{

octet = fis.read();

**if** (octet == -1) **break** ; // fin de fichier, on sort

//ici, vous constater un casting en type char pour caractère

phrases.append(( **char** )octet);

}

// on ferme le flux :

fis.close();

System._out_.println(phrases.toString());

}

**catch** (IOException e)

{

e.printStackTrace();

}

}

}

Autre exemple de saisie en console et sauvegarde d&#39;un message dans un fichier :

**import** java.io.BufferedReader;

**import** java.io.FileOutputStream;

**import** java.io.IOException;

**import** java.io.InputStreamReader;

**import** java.io.PrintWriter;

//La classe suivante permet de tester les flux standards

**public**** class** TestFluxStandards

{

**public**** static ****void** main (String args[])

{

// Gérer l&#39;exception IOException.

**try**

{

String message=&quot;&quot;;

// Récupérez le flux d&#39;entrée in et ajouter un flux avec tampon (InputStreamReader)

//de données pour pouvoir lire une ligne entière.

BufferedReader entree = **new** BufferedReader( **new** InputStreamReader(System._in_));

// Créer flux de sortie vers un fichier &quot;log.txt&quot;

PrintWriter ecrire= **new** PrintWriter( **new** FileOutputStream(&quot;log.txt&quot;));

// Tant que le message de la console est différent de &quot;q&quot;,

// Ecrire le message dans le fichier log.txt et à la console.

message = &quot;---\&gt; Entrer votre message svp (q pour quitter): &quot;;

System._out_.println(message);

message = entree.readLine ();

**while** (!message.equalsIgnoreCase(&quot;q&quot;))

{

System._out_.println(&quot;votre message : \&quot; &quot; + message + &quot; \&quot;\n\n&quot;);

ecrire.println(message);

message = &quot;---\&gt; Entrer votre message svp (q pour quitter): &quot;;

System._out_.println(message);

// utilisation du flux d&#39;entrée

message = entree.readLine ();

}

// Fermer les flux.

ecrire.close();

entree.close();

}

**catch** (IOException e)

{

e.printStackTrace();

}

}

}

Exemple d&#39;écriture et de lecture des objets de type **Chat** dans un fichier :

**package** enregistrerDesObjetsChats;

**import** java.io.Serializable;

/\*\*

\*Projet: **TravauxPratiquesModule1et2**

\*Classe: **Chat.java**

\ ***@author** :PhilippeBouget

\*Date: **19** févr.08

\*/

**public**** class **Chat** implements** Serializable {

**private** String petitNom;

**private**** int**age;

**public** Chat(String p, **int** a)

{

**this**.petitNom=p;

**this**.age=a;

}

/\*\*

\ ***@return** lepetitNom

\*/

**public** String getPetitNom() {

**return** petitNom;

}

/\*\*

\ ***@param** petitNomlepetitNomàinitialiser

\*/

**public**** void** setPetitNom(String petitNom) {

**this**.petitNom = petitNom;

}

/\*\*

\ ***@return** leage

\*/

**public**** int** getAge() {

**return** age;

}

/\*\*

\ ***@param** ageleageàinitialiser

\*/

**public**** void**setAge(**int** age) {

**this**.age = age;

}

**public** String toString()

{

**return**&quot;Chat : :&quot;+petitNom+&quot; &quot;+age+&quot; ans&quot;;

}

**public**** void** afficher()

{

System._out_.println(&quot;Chat : :&quot;+petitNom+&quot; &quot;+age+&quot; ans&quot;);

}

}

Comme vous pouvez le constater dans la déclaration de la classe **Chat** , on implémente l&#39;interface Serializable de la manière suivante :

public class Chat _ **implements Serializable** _

Cela suffit pour rendre l&#39;écriture, la transmission via un réseau et la lecture d&#39;objets possible.

Exemple d&#39;écriture des objets :

**package** enregistrerDesObjetsChats;

**import** java.io.FileOutputStream;

**import** java.io.IOException;

**import** java.io.ObjectOutputStream;

/\*\*============================================

Ecritured&#39;objetdansunFichiertexte

Gestiondesfluxentrée/sortie

Auteur:PhilippeBouget

Année:2008

NomProgramme:EcrireObjet.java

==============================================

\*/

**public**** class** EcrireObjet

{

**public**** static ****void** main (String args[])

{

// on créer des références à des objets Chat

Chat minou = **new** Chat(&quot;Youpi&quot;,3);

Chat poupou = **new** Chat(&quot;Poupou&quot;,4);

Chat propret = **new** Chat(&quot;Propret&quot;,7);

Chat pounette = **new** Chat(&quot;Pounette&quot;,8);

**try**

{

FileOutputStream fichierDObjets = **new** FileOutputStream(&quot;ChatObj.txt&quot;);

ObjectOutputStream fluxDObjets = **new** ObjectOutputStream(fichierDObjets);

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

System._out_.println(&quot;Fin de la copie du fichier&quot;);

}

**catch** (IOException e) {e.getMessage();}

}

}

Pour l&#39;écriture des objets on déclare un objet du type **ObjectOutputStream** qui nous permet de faire appel à la méthode **writeObject** () pour sauvegarder un objet. Il faut bien entendu effectuer un **flush** () puis un **close** () du flux en sortie.

Exemple de lecture des objets depuis un fichier :

**package** enregistrerDesObjetsChats;

/\*\*============================================

Lectured&#39;objetdansunFichiertexte

Gestiondesfluxentrée/sortie

Auteur:PhilippeBouget

Année:2008

NomProgramme:LireObjet.java

==============================================

\*/

**import** java.io.FileInputStream;

**import** java.io.IOException;

**import** java.io.ObjectInputStream;

**public**** class** LireObjet

{

**public**** static ****void** main (String args[])

{

**try**

{

FileInputStream fichierDObjets = **new** FileInputStream(&quot;ChatObj.txt&quot;);

ObjectInputStream fluxDObjets = **new** ObjectInputStream(fichierDObjets);

**while** ( **true** ) // tant qu&#39;il y a des objets

{

Object o = fluxDObjets.readObject();

**if** (o **instanceof** Chat)

{

((Chat)o).afficher();

}

**else**

{

System._out_.println(&quot;Objet Non Identifié !&quot;);

}

}

}

**catch** (ClassNotFoundException e) {e.getMessage();}

**catch** (IOException e) {e.getMessage();}

System._out_.println(&quot;Fin de la lecture&quot;);

}

}

Pour la lecture des objets on déclare un objet du type **ObjectInputStream** qui nous permet de faire appel à la méthode **readObject** () pour sauvegarder un objet.

# 12.Interfaces avec AWT (Abstract Windowing Toolkit) et SWING

Voir le cours très bien écrit du labo-sun.com. En attendant l&#39;écriture d&#39;un cours simplifié sur les composants et la présentation. Il y a aussi un cours AFPA sur Swing que j&#39;ai mis sur le réseau.

# 13.La gestion des événements : le modèle par délégation

Ce chapitre permet de découvrir le modèle de gestion des événements par délégation. Nous apprendrons à créer un « _veilleur_ » appelé généralement **listener** , ce qui permettra de concevoir des programmes évolués.

Nous allons étudier les points suivants :

- Expliquer les concepts du modèle de gestion des événements par délégation
- Créer des classes &quot;écouteurs&quot; (Listener) pour répondre aux événements
- Enregistrer les classes Listener auprès de composants sources
- Capturer les événements et effectuer les traitements appropriés

La gestion des événements est la faculté pour votre programme de réagir à son environnement. La plus séduisante des interfaces graphiques est inutilisable si l&#39;utilisateur ne peut pas interagir avec elle.

**Qu&#39;est-ce qu&#39;un événement ?**

Un **événement** est quelque chose qui survient dans votre ordinateur. Cette définition peut paraître un peu simpliste, mais elle est réaliste. Parmi les exemples que l&#39;on peut citer, il y a le «  **clic**  » souris, l&#39;utilisation du **clavier** , la **sélection** d&#39;un bouton ou d&#39;une zone de saisie. Un événement peut aussi être généré par une application ou le système d&#39;exploitation, par exemple lors d&#39;une connexion réseau. Java, comme de nombreux langages informatiques, est capable d&#39;interpréter de tels événements. L&#39;autre façon de voir un événement, est de considérer qu&#39;il s&#39;agit d&#39;une action que votre code est capable de recevoir et à laquelle il sait répondre.

**Pour décrire un événement avec lequel Java puisse travailler, il faut se poser les questions suivantes :**

• Qu&#39;est-ce qui a causé l&#39;événement ? Etait-ce un Bouton (Button), un Champ texte (TextField), ou l&#39;appui sur une touche du clavier ?

• Quelle est la nature précise de l&#39;événement ? Est-ce l&#39;appui du bouton de la souris, ou son relâchement ? La souris a-t-elle été cliquée une fois ou est-ce un double clic ?

• Y a-t-il d&#39;autres informations concernant cet événement ? Si l&#39;on a cliqué, à quelles coordonnées ? S&#39;il s&#39;agit d&#39;une saisie clavier, une autre touche était-elle appuyée en même temps (touche ALT, CTRL ...) ?

Lorsque survient un événement, du fait qu&#39;il s&#39;agit d&#39;un langage Orienté Objet, **la JVM crée un objet Evénement (de classe xxEvent**). Cet objet contient toutes les informations nécessaires pour gérer correctement cet événement :

• la **source de l&#39;événement** (le Composant qui a généré l&#39;objet événement)

• **l&#39;identifiant de l&#39;événement** (ex : mouseDown ou MouseUp), qui permet de distinguer les événements les uns des autres.

• d&#39;autres informations qui dépendent de la **nature de l&#39;événement** (ex : le libellé du bouton qui a généré l&#39;événement).

![](RackMultipart20201102-4-17yaceu_html_ea108f8b0d4730c3.jpg)

Le modèle d&#39;événement par délégation :

Le modèle par délégation s&#39;appuie sur le concept de sources d&#39;événements et de listeners (écouteurs, veilleurs, handleursd&#39;événements ...). Les sources d&#39;événements sont les objets (Component) qui générent les événements. Les Listener sont des classes qui sont à l&#39;écoute et qui traitent les événements générés par les sources d&#39;événements. Ces classes doivent implémenter des interfaces &quot;Listener&#39;. Il est nécessaire de bien comprendre la façon dont les objets sources d&#39;événements et les Listeners interagissent dans le modèle par délégation.

Ci-dessous, vous trouverez quelques références sur les Composants, les objets Event, les Listeners, qui sont utilisés dans le modèle par délégation. Voici certaines des questions à se poser par rapport au modèle par délégation :

• Comment la source de l&#39;événement génère l&#39;objet événement ?

• Comment la source de l&#39;événement sait où envoyer l&#39;objet événement ?

• Comment un Listener se prépare t-il à recevoir l&#39;événement ?

• Que fait le Listener, une fois l&#39;événement reçu ?

Les paragraphes suivants vont répondre de façon systèmatique à ces différentes questions.

**Génération de l&#39;objet événement :**

_L&#39;objet événement est généré automatiquement_. Quand on clique sur un Button, un objet événement est potentiellement instancié. Quand on déplace la souris, un événement est aussi potentiellement généré. Bien que vous puissiez générer vos propres événements cela n&#39;est pas nécessaire avec les Composants AWT.

Le modèle par délégation génère différents types d&#39;événements, en fonction de la source. Par exemple les fenêtres génèrent des WindowEvents et les Button génèrent des ActionEvents.

Quand vous savez quels objets génèrent quels événements, vous vous posez la question suivante :

Comment la source de l&#39;événement sait où envoyer l&#39;instance de l&#39;événement, afin d&#39;exécuter le traitement approprié ?

**Envoi de l&#39;objet événement au Listener :**

L&#39;objet événement créé par l&#39;objet source doit être envoyé à un objet Listener. Comment sait-il à quel Listener envoyer l&#39;objet événement ? Ensuite, que se passe t-il, si plusieurs Listeners sont disponibles ? La source de l&#39;événement doit s&#39;abonner auprès du Listener auquel elle souhaite confier la gestion des événements. Ce schéma se retrouve finalement fréquemment dans la vie courante. Regardez l&#39;exemple suivant, dans lequel vous jouez le rôle d&#39;un &quot;veilleur&quot; (Listener), en train d&#39;attendre un certain événement :

Exemple :

Si vous (l&#39;écouteur), souhaitez recevoir régulièrement un magazine (qui dans notre exemple représente l&#39;événement), que devez-vous faire ? Vous demanderez à l&#39;éditeur de vous enregistrer dans son mailing. En langage Java, vous devez vous enregistrer auprès de la source. Ensuite, lorsque l&#39;éditeur publie un nouveau numéro du magazine, vous en recevez automatiquement une copie. Java gère ce processus de la même manière.

Vous devez cependant comprendre, que cette analogie n&#39;est pas aussi stricte que ne l&#39;est Java. En effet, notre éditeur est prêt à envoyer son magazine à toute personne qui accepte de le payer. Java n&#39;est pas aussi libéral, puisqu&#39;il ne peut envoyer ces objets événements qu&#39;à des Listeners spécifiquement conçus pour des événements bien précis.

**Préparation du Listener à recevoir des événements :**

La classe destinée a recevoir les événements doit adhérer à un contrat très stricte. La façon d&#39;imposer ce contrat consiste à implémenter des interfaces: Rappelez-vous qu&#39; **une interface permet d&#39;imposer un contrat entre cette interface et la classe qui l&#39;implémente**. Elle **permet de s&#39;assurer de la présence de toutes les méthodes définies dans l&#39;interface**.

Dans l&#39;exemple suivant, nous verrons comment appliquer nos connaissances sur les interfaces :

![](RackMultipart20201102-4-17yaceu_html_cc6ece95e3b895a3.png)

Vous avez remarqué que lorsqu&#39;on crée une Frame, cette dernière ne se ferme pas si l&#39;on clique sur la case de fermeture. Il est possible de résoudre ce problème en se posant les questions suivantes :

- **Quelle est la source de l&#39;événement ?**

Si vous tentez de fermer une fenêtre et qu&#39;il s&#39;agit d&#39;un objet de classe Frame, la source de l&#39;événement est donc une _Frame_.

- **Quel est le type de l&#39;événement généré ?**

On peut essayer de deviner, mais le mieux est de consulter l&#39;API. D&#39;après la documentation, la classe Frame crée des événements de type _WindowEvent_.

- **Quels sont les types d&#39;objets capables de recevoir les WindowEvents ?**

Souvenez-vous que WindowListener est une des nombreuses interfaces capables de recevoir certains événements. D&#39;après la documentation de l&#39;API Java les objets qui implémentent l&#39;interface _WindowListener_, sont capables de recevoir les événements WindowEvent.

Voici la solution :

Après avoir répondu aux questions précédentes, nous avons toutes les informations nécessaires à la conception de notre classe Listener :

import java.awt.event.\*;

public class MonEcouteur implements WindowListener {

public void window0pened(WindowEvent e) {}

public void windowClosing(WindowEvent e)

{

Frame f (Frame) e. getSource(); // étape 1
 f.setVisible(false); // étape 2
 f.dispose() ; // étape 3
 System.exit(0); // étape 4

}

public void windowClosed(WindowEvent e) {}

public void windowIconified(WindowEvent e) {}

public void windowDeiconified(WindowEvent e){}

public void windowActivated(WindowEvent e){}

public void windowDeactivated(WindowEvent e) {}

}

**Remarques :**

• L&#39;implémentaion d&#39;une interface oblige à implémenter toutes les méthodes de cette interface, même si elles ne font rien.

• Les 4 instructions précédentes sont communément utilisées comme façon de fermer une fenêtre et son application. Voici une explication détaillée de ces différentes étapes :

_Etape 1 :_

Frame f e.getSource() : L&#39;une des informations contenue dans l&#39;objet événement est l&#39;objet source de cet événement (La référence de l&#39;objet Frame).

_Etape 2 :_

setVisible(false) : La fenêtre en cours étant visible, cette instruction permet d&#39;enlever la fenêtre de l&#39;écran.

_Etape 3 :_

Dispose() : Bien que la fenêtre soit maintenant invisible, celle-ci est toujours référencée dans la JVM. Cette instruction permet donc de supprimer la référence de la fenêtre.

_Etape 4 :_

System.exit(0) : Permet d&#39;arrêter la JVM. Soyez certain de bien vouloir cela.

Maintenant qu&#39;un Listener est prêt à répondre correctement aux événements WindowEvent, il faut encore enregistrer ce Listener auprès de la source des événements.

![](RackMultipart20201102-4-17yaceu_html_171b90975386e6ee.jpg)

Maintenant qu&#39;une Frame est affichée, il faut enregistrer l&#39;instance du Listener auprès de l&#39;instance de la fenêtre MaFenetre (la source). Notez la méthode utilisée pour cet enregistrement. Cette technique est utilisée à chaque fois que l&#39;on ajoute un Listener. Si vous deviez créer un Listener devant recevoir les événements de type WindowEvent, celui-ci devrait implémenter l&#39;interface WindowListener. La méthode permettant d&#39;enregistrer le Listener auprès de la source serait alors addWindowListener().

Il s&#39;agit d&#39;une des nombreuses méthodes d&#39;enregistrement des Listener auprès des sources d&#39;événements. **Ces méthodes sont toujours de la forme addXxxxListener().**

Exemple de code :

public class MaFenetre extends Frame

{

MonEcouteur ecouteur;

MaFenetre()

{

preparelnterface();

}

public static void main(String[] args)

{

MaFenetre f1 = new MaFenetre ();

}

private void preparelnterface()

{

ecouteur = new MonEcouteur();

addWindowListener(ecouteur);

setSize(200,200);

setVisible(true);

}

}

Résumé et illustration de la gestion des événements :

![](RackMultipart20201102-4-17yaceu_html_4d66652f09035d6.jpg)

_Première étape :_

Dans un premier temps il faut prévoir un Listener. En fonction du type de source pour les événements, on choisit l&#39;interface que la classe Listener devra implémenter. Par exemple, pour un Bouton, le type d&#39;événement attendu est ActionEvent, l&#39;interface fournie par Sun se nomme ActionListener. Cette interface définit une méthode, qu&#39;il faut implémenter dans le Listener.

_Deuxième étape :_

Dans cette étape, il faut enregistrer le Listener auprès de la source de l&#39;événement (le bouton). On peut dire aussi que le Listener s&#39;enregistre auprès de la source de l&#39;événement.

_Troisième étape :_

On provoque un événement en cliquant sur le bouton

_Quatrième étape :_

La source de l&#39;événement instancie un objet xxEvent (ici un ActionEvent). Cet objet contient toutes les informations nécessaires concernant l&#39;événement.

_Cinquième étape :_

Cet événement est transmis au Listener auquel la source de l&#39;événement est abonnée. Ensuite la méthode qui correspond à l&#39;événement est automatiquement exécutée.

Dans ce sous-chapitre, nous avonsétudié les modèles utilisés par Java pour la gestion d&#39;événements. Nous avons présenté le modèle par délégation et détaillé toutes les étapes de sa mise en oeuvre. Nous avons vu que le Listener pouvait exister dans une classe séparée. Dans la suite du cours, nous verrons comment implémenter directement le Listener à l&#39;intérieur de la classe dans laquelle on l&#39;utilise.

Classes Adapters et classe internes

Nous allons voir comment :

- Gérer les événements liés aux fenêtres
- Utiliser les classes &quot;Adapter&quot; pour la gestion des événements
- Utiliser les classes locales pour la gestion des événements

Capturer les événements WindowEvent :

L&#39;écouteur qui gère les événements WindowEvent doit implémenter toutes les méthodes de l&#39;interface WindowListener :

Exemple de code :

public class MonEcouteur implements java.awt.event.WindowListener
 {
 public void windowClosing (WindowEvent we)
 {
 traitementEvenement();
 }
 public void windowOpened
 (WindowEvent we) {}
 public void windowClosed
 (WindowEvent we) {}
 public void windowIconified
 (WindowEvent we) {}
 public void windowDeiconified
 (WindowEvent we) {}
 public void windowActivated
 (WindowEvent we) {}
 public void windowDeactivated
 (WindowEvent we) {}
 }

L&#39;interface **ActionListener** ne définit que la méthode **actionPerformed** (). L&#39;interface **WindowListener** définit **7 méthodes** , dont une seule nous est utile. Cependant notre écouteur doit obligatoirement implémenter ces 7 méthodes. Bien que ce ne soit pas très difficile d&#39;implémenter les 6 méthodes qui ne font rien, cela n&#39;est pas très élégant. Si en plus on devait récupérer des événements KeyEvent et MouseEvent, il faudrait ajouter les méthodes des interfaces KeyListener et MouseListener, dont certaines seraient tout aussi inutiles. Les outils de développement un peu évolués sont bien entendu capables de générer automatiquement ces méthodes vides.

**Utilisation d&#39;une classe Adapter :**

Une classe peut être conçue pour gérer les événements liés aux fenêtres (WindowEvent), par exemple en étendant la classe WindowAdapter.

La classe ci-dessous hérite du type WindowListener ainsi que des méthodes &quot;vides&quot; de la classe WindowAdapter. Seule la méthode qui nous intéresse (windowClosing()) est redéfinie :

public class MonEcouteur extends WindowAdapter
 {
 public void windowClosing (WindowEvent we)
 {

System.exit(0);

}
 }

Comme vous pouvez le constater dans le code ci-dessus, la classe MonEcouteur hérite de la classe WindowAdapter qui permet de redéfinir que les méthodes dont nous avons besoin sans devoir redéfinir systématiquement toutes les autres méthodes si nous avions implémenter l&#39;interface windowsListener.

Remarques :

Java fournit une série de classes « Adapter » : WindowAdapter, MouseAdapter, KeyAdapter, …

• Ces classes contiennent toutes les méthodes vides de l&#39;interface Listener correspondante

• Elles implémentent le type nécessaire, par exemple par l&#39;instruction :

**implements WindowListener**.

Les classes Adapters, sont une alternative intéressante lorsque les Listeners sont implémentés dans des classes séparées du programme principal. Il est possible de passer des informations utiles au moment de la fermeture à la classe « MonEcouteur » (ex : le message à afficher au moment de quitter), ou il se peut que le Listener « MonEcouteur » ait besoin d&#39;appeler la méthode finTraitement() de l&#39;application.

Dans la classe de notre application, il faudra écrire l&#39;abonnement au Listener « MonEcouteur ».

Voici comment implémenter cette solution :

MonEcouteur ve = new MonEcouteur(this);

addWindowListener(ve);

Il sera nécessaire de passer au veilleur une référence sur l&#39;application. La façon de procéder consiste à prévoir un constructeur à la classe « MonEcouteur », qui puisse recevoir sous forme de paramètre des données de l&#39;application, ainsi qu&#39;une variable d&#39;instance pour mémoriser ces informations.

Exemple de code :

public class MonEcouteur extends WindowAdapter

{

MaFenetre maReferenceDeFenetre;

public MonEcouteur(MaFenetre fen)

{

maReferenceDeFenetre = fen;

}

public void windowClosing(WindowEvent we)

{

// ici on appelle une méthode accessible via l&#39;adresse de l&#39;objet MaFenetre :

maReferenceDeFenetre.traitementFinal();

}

}

**Utiliser une classe interne :**

Il y a une autre solution dans la gestion des événements. Elle consiste à définir le Listener dans une classe interne, comme ci-dessous :

addWindowListener
 (

new WindowAdapter()

// début de la classe locale

{

public void windowClosing(WindowEvent we)

{

finTraitement();
 }

}

// fin de la classe locale

);

// fin du addWindowListener()

Dans les exemples précédents, le modificateur d&#39;accès de la méthode finTraitement() avait dû être modifié de private à protected, afin que cette méthode puisse être appelée depuis la classe « MonEcouteur ». Si l&#39;on utilise une classe interne, la méthode finTraitement() peut à nouveau être déclarée private. Elle est accessible depuis les classes internes de la classe « MaFenetre ».

Cette sorte de classe interne, connue sous le nom de classe «  **anonyme**  » interne, parraît difficile à comprendre au premier abord. **ll n&#39;y a pas l&#39;instruction de déclaration de la classe et donc pas de nom de classe**. La classe WindowAdapter est la classe « parente » de la classe interne anonyme (si l&#39;on avait mis le nom de l&#39;interface au lieu d&#39;un nom de classe, la classe interne aurait dû implémenter cette interface). La classe interne se reconnait par l&#39;accolade ouvrante {, là où l&#39;on attendait un &quot;);&quot; après le « new WindowAdapter() ». Le code de la classe interne se trouve ensuite entre les 2 accolades.

Le mot clé new provoque l&#39;instanciation de la classe interne au moment de l&#39;exécution et sa référence est renvoyée comme paramètre de la méthode addWindowListener(). Au moment de la compilation un fichier nommé « MaFenetre$1.class » est créé pour cette classe interne. Si l&#39;on a une autre classe interne dans la même classe, son fichier se nommera &quot;MaFenetre$2.class&quot;.

Une fois encore un objet séparé est enregistré pour recevoir les WindowEvents, notre classe « MaFenetre » (l&#39;application) ne déclare pas qu&#39;elle implémente WindowListener. Elle n&#39;implémente aucune des méthodes de l&#39;interface WindowListener, ce rôle est tenu par la classe interne.

Résumé de ce chapitre :

Dans ce chapitre nous avons présenté trois conceptions d&#39;interception des événements de l&#39;interface graphique utilisateur :

1. interface xxxListener
2. classes xxxAdapter
3. classes internes

# 14.Découverte du multiprocessus (nos amis les Threads)

Dans ce chapitre, nous allons aborder une fonctionnalité intéressante du langage java : la gestion multi-tâche dite multi-processus.

Pour comprendre cette spécificité, voici un exemple bien concret :

Imaginez que vous deviez lire 3 livres en même temps. Vous commencez par lire quelques lignes du premier, puis vous prenez le second, vous lisez quelques lignes, vous passez au troisième, vous lisez quelques lignes, enfin vous revenez au premier, vous lisez quelques lignes et ainsi de suite. J&#39;arrête là, sinon ça va devenir fastidieux !

Pour passer d&#39;un livre à l&#39;autre en conservant en mémoire l&#39;histoire de chacun des livres, cela demande des compétences particulières. L&#39;utilisation des « Threads » ou multi-processus en java permet d&#39;effectuer ce type d&#39;activité au sein d&#39;une application sans passant d&#39;un livre à l&#39;autre de manière « presque » simultanée !

En fait, le processeur alloue du temps à chacun des Threads qui sont des objets java. L&#39;exemple le plus marquant concerne le téléchargement d&#39;une vidéo via internet et la visualisation en temps réel. Ici, il y a 2 tâches, 2 processus qui s&#39;exécutent en « même temps ».

Pour résumer :

- Un Thread est un PROCESSUS autonome qui s&#39;exécute au sein d&#39;une application. Il est représenté par un OBJET.
- Un programme avec plusieurs THREAD est dit MULTI-TACHES ou MULTI-THREADS.
- Java supporte le développement d&#39;application multi-threads.
- Attention : ne pas confondre l&#39;objet &quot;thread&quot; et le processus qui est le thread. Ces 2 entités sont liées mais différentes.
- Les Threads se partagent le code et la mémoire au sein d&#39;une application.

Dans quel package trouve t-on les **Thread**?

Dans le package **java.lang** , donc inutile d&#39;importer quoi que ce soit !

Pour comprendre comment cela fonctionne, nous allons utiliser les classes et interface suivantes :

- **Thread**

- **ThreadGroup**

- **Runnable** (interface)

Comment faire ?

- Créer une classe qui représente le **Thread** (donc qui hérite de la classe Thread)
- instancier un objet de cette classe et lancer le processus avec **start** ().

Remarques :

Un objet qui représente un Thread doit être un objet de type Thread (obligatoire !)

Un objet ne permet de lancer qu&#39;un et un seul Thread.

Exemple avec héritage de la classe Thread

Classe ThreadSimple :

**public**** class **ThreadSimple** extends** Thread

{

**private** String message ;

**private**** int**count ;

/\*\*

\*Constructeurà2arguments

\ ***@param** message

\ ***@param** combien

\*/

**public** ThreadSimple( String message , **int** combien )

{

**this**.message = message ;

count = combien ;

}

/\*\*

\*MéthodedelaclasseThreadredéfinie

\*/

**public**** void** run()

{

**for** ( **int** i = 0 ; i \&lt; count ; i++ )

{

System._out_.println( message ) ;

}

}

}

Classe de TestThread :

/\*\*

\*Exempledel&#39;utilisationduThreadSimple

Créationde2instancesdelaclasseThreadSimple.

LeconstructeurdeThreadSimpleattendsunechaine(message)

etunentierindiquantlenombredefoisoulemessagedoitêtreaffiché.

\*/

**public**** class** TestThread

{

**public**** static ****void** main(String args[])

{

ThreadSimple t1 = **new** ThreadSimple(&quot;piff&quot;, 10);

ThreadSimple t2 = **new** ThreadSimple(&quot;paff&quot;, 10);

// Exécution des 2 threads avec l&#39;appel de la méthode start() :

t1.start();

t2.start();

}

}

Exécutez et voyez ce qui s&#39;affiche dans la console !

Exemple avec l&#39;utilisation de l&#39;interface Runnable et de la méthode yield()

Classe ThreadSimpleRunnable :

/\*\*

\*

\*Projet: **@ThreadTestYield**

\*Classe: **@ThreadSimpleRunnable.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*Cetteclasseimplementsl&#39;interfaceRunnable

\*/

**public**** class **ThreadSimpleRunnable** implements** Runnable

{

// Attributs :

**private** Object message;

**private**** int**nombreDePassages;

/\*\*

\*Constructeur1argument

\ ***@param** message

\*/

**public** ThreadSimpleRunnable(Object message)

{

**this** (message, 1);

}

/\*\*

\*Constructeur2arguments

\ ***@param** message

\ ***@param** nombreDePassages

\*/

**public** ThreadSimpleRunnable(Object message, **int** nombreDePassages )

{

**this**.message = message;

**this**.nombreDePassages = nombreDePassages;

}

/\*\*

\*Méthoderun()redéfinie

\*QuefaitleThread?

\*/

**public**** void** run()

{

**for** ( **int** i = 0 ; i\&lt;nombreDePassages; i++)

{

/\*

\* La méthode yield() permet l&#39;exécution en simultanée

\* Elle renvoie le Thread actif dans le groupe des Threads prêts.

\* Un autre Thread prêt peut donc devenir actif !

\*/

Thread._yield_();

System._out_.println(message);

}

}

}

Classe de TestThead :

/\*\*

\*

\*Projet: **@ThreadTestYield**

\*Classe: **@TestThread.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*Utilisationd&#39;unThreadquiimplémenteRunnable

\*etutiliselaméthodeyield()

\*/

**public**** class** TestThread

{

**public**** static ****void** main(String argv[])

{

/\* Création de 2 instances de la classe ThreadSimpleRunnable :

Remarquez la syntaxe différente par rapport au premier exemple !

Notre classe ThreadSimpleRunnable qui implémente l&#39;interface

Runnable est instanciée dans le constructeur du Thread.

\*/

Thread threadSimple = **new** Thread( **new** ThreadSimpleRunnable(&quot;Bingo !&quot;,5));

Thread threadSimple2 = **new** Thread( **new** ThreadSimpleRunnable(&quot;Pouet pouet&quot;,5));

// Exécution des 2 threads :

threadSimple.start();

threadSimple2.start();

}

}

Lancez et constatez les résultats affichés dans votre console !

Observez la syntaxe particulière :

Thread threadSimple = **new** Thread( **new** ThreadSimpleRunnable(&quot;Bingo !&quot;,5));

Le fait que la classe **ThreadSimpleRunnable** implémente l&#39;interface **Runnable** nous oblige à encapsuler l&#39;instance de cette classe (donc l&#39;objet créé avec new()) dans un objet de la classe Thread.

L&#39;interface Runnable nous oblige à implémenter la méthode **run** () pour exprimer ce que doit faire ce processus !

Ensuite, la méthode **start** () est toujours appelée pour lancer chacun des processus. Cette méthode appelle elle-même la méthode **run** ().

Exemple avec la méthode sleep(millisecondes)

Classe ThreadSimpleSleep :

/\*\*

\*

\*Projet: **@TestThreadSleep**

\*Classe: **@ThreadSimpleSleep.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*Démonstrationdel&#39;utilisationdelaméthode

\*sleep()pourendormirunprocessus

\*/

**public**** class **ThreadSimpleSleep** implements** Runnable

{

// Attributs :

**private** Object message;

**private**** int**nombreDePassages;

/\*\*

\*Constructeur

\ ***@param** message

\*/

**public** ThreadSimpleSleep(Object message)

{

**this** (message, 1);

}

/\*\*

\*constructeur

\ ***@param** message

\ ***@param** nombreDePassages

\*/

**public** ThreadSimpleSleep(Object message, **int** nombreDePassages )

{

**this**.message = message;

**this**.nombreDePassages = nombreDePassages;

}

/\*\*

\*Méthoderedéfinie

\*/

**public**** void** run()

{

**for** ( **int** i = 0 ; i\&lt;nombreDePassages; i++)

{

**try**

{

/\*

\* Appel de la méthode sleep pour endormir le

\* processus en cours pendant 1000 millisecondes

\*/

Thread._sleep_(1000); // dort pendant 1 seconde

} **catch** (InterruptedException e) {}

System._out_.println(message);

}

}

}

Ici, vous constatez que nous appelons la méthode sleep() en lui passant en paramètres 1000 millisecondes, soit un peu dodo d&#39;une seconde pour le Thread en cours. La syntaxe est la suivante :

Thread._sleep_(1000);

On utilise le nom de la classe **Thread** pour appeler la méthode **sleep** (), on ne passe pas par la référence de l&#39;objet.

Classe TestThread :

**public**** class** TestThread

{

**public**** static ****void** main(String argv[])

{

// Création de 2 instances de la classe ThreadSimpleSleep :

Thread threadSimple = **new** Thread( **new** ThreadSimpleSleep(&quot;Baffe&quot;,5));

Thread threadSimple2 = **new** Thread( **new** ThreadSimpleSleep(&quot;Prout&quot;,5));

//Thread threadSimple3 = new Thread(new ThreadSimpleSleep(&quot;Bling&quot;,5));

//Exécution des 2 threads.

threadSimple.start();

**try**

{

// un petit dodo pour le Thread en cours (0.5 seconde)

Thread._sleep_(500);

} **catch** (InterruptedException e) {}

// on lance le second :

threadSimple2.start();

//threadSimple3.start();

}

}

Ici, on demande au premier Thread de dormir pendant 1 demi-seconde.

Comment peut-on tuer un Thread ?

Ce n&#39;est pas gentil, mais il faut savoir le faire !

La méthode **stop** () est obsolète et ne doit plus être utilisée. Vous devez définir un attribut booléen à vrai par défaut. Il vous suffit d&#39;ajouter ce dernier dans votre méthode **run** () sous la forme d&#39;une boucle while() dans laquelle vous allez mettre vos instructions. Le changement d&#39;état du booléen permettra d&#39;arrêter le processus pour le Thread concerné. Ce principe ne fonctionne apparemment pas avec une implémentation de l&#39;interface Runnable.

Exemple de code :

private booleanrun = true;

...

publicvoid run()

{

while(run)

{

// vos instructions

}

}

Exemple de Threads non synchronisés :

Classe Compteur :

/\*\*

\*Projet: **@ThreadNonSynchronise**

\*Classe: **@Compteur.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*/

**public**** class** Compteur

{

**int** nbBillet=0;

**long** somme=0;

**public**** void** compte()

{

**long** somme=0;

**for** (nbBillet=0; nbBillet\&lt;20000000;nbBillet++) somme= somme + 50;

System._out_.println(Integer._toString_(nbBillet) + &quot; billets de 50 Euro font: &quot; + Long._toString_(somme) + &quot; Euros&quot;);

}

}

Classe Caissier :

/\*\*

\*Projet: **@ThreadNonSynchronise**

\*Classe: **@Caissier.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*/

**public**** class **Caissier** extends** Thread

{

Compteur compteur;

**public** Caissier(Compteur compteur)

{

**this**.compteur = compteur;

}

**public**** void** run()

{

// appel de la méthode de la classe Compteur qui

// effectue le traitement

compteur.compte();

}

}

Classe Banque :

/\*\*

\*Projet: **@ThreadNonSynchronise**

\*Classe: **@Banque.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*ExempledeThreadnonsynchronisé

\*/

**public**** class** Banque

{

**public**** static ****void** main(String[] argv)

{

// on instancie un objet Compteur

Compteur compteurCommun= **new** Compteur();

// Les threads qui comptent avec le même compteur :

Caissier jojo= **new** Caissier(compteurCommun);

Caissier riri= **new** Caissier(compteurCommun);

jojo.start();

riri.start();

System._out_.println(&quot;jojo et riri n&#39;arrivent pas au même résultat !&quot;);

}

}

Voici le genre de résultat que vous allez obtenir :

20000000 billets de 50 Euro font: 648081950 Euros

20000001 billets de 50 Euro font: 679653550 Euros

jojo et riri n&#39;arrivent pas au même résultat !

Comment faire pour que les résultats soient justes ?

Il suffit d&#39;ajouter la méthode **synchronized** (){} de la manière suivante :

publicvoid run()

{

// appel de la méthode de la classe Compteur qui

// effectue le traitement ici avec Synchronisation

synchronized(compteur)

{

compteur.compte();

}

}

et voici le résultat obtenu, jojo et riri savent enfin compter !

20000000 billets de 50 Euro font: 1000000000 Euros

20000000 billets de 50 Euro font: 1000000000 Euros

On aurait pu aussi ajouter tout simplement un modificateur synchronized à la méthode compte() de la classe Compteur de la manière suivante :

public synchronized void compte()

Ce mot-clé permet de poser un verrou pour bloquer l&#39;accès à un objet si 2 threads doivent accèder à ce dernier. Sinon, contastez vous-même les résultats incohérents du précédent test.

Exemple d&#39;interaction entre Threads

Trois méthodes de base de la classe Thread permettent de gérer l&#39;interaction entre les processus :

- **wait** () : permet de faire attendre le Thread qui l&#39;invoque sur une pile de l&#39;objet. Le thread qui s&#39;exécute se met en attente dans une pile.

- **notify** () : libère un des threads de la pile de l&#39;objet. Ce thread passe à l&#39;état prêt.

- **notifyAll** () : libère tous les threads de la pile de l&#39;objet. Les threads passent à l&#39;état prêts.

Remarque : ces méthodes sont toujours appelées dans des méthodes synchronisées par le modificateur **synchronized**.

Classe Maitre :

/\*\*

\*Projet: **@ThreadWaitNotify**

\*Classe: **@ThreadMaitre.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*ExempledeThreadMaitreetEsclave.

\*/

**public**** class **ThreadMaitre** extends** Thread

{

**public**** void** run()

{

**try**

{

//Dans une boucle for dont l&#39;indice va de 0 à 5 :

**for** ( **int** i = 0; i \&lt; 5; i++ )

{

// Endormir le thread pendant 0,1 seconde.

delay(10) ;

// Demander au threadEsclave de se mettre en attente

Direction._threadEsclave_.attendre() ;

// Endormir le thread pendant 0,1 seconde.

delay(10) ;

// Demander au threadEsclave de reprendre.

Direction._threadEsclave_.reprendre() ;

System._out_.println( &quot;cycle : &quot; + (i + 1) ) ;

}

// Arrêter le processus threadEsclave.

Direction._threadEsclave_.terminer() ;

}

**catch** (Exception e)

{

e.printStackTrace();

}

}

/\*\*

\*Uneattentedetmillisecondes

\ ***@param** tdelaid&#39;attenteenmillisecondes

\*/

**public**** void**delay(**long** t )

{

**try**

{

Thread._sleep_( t ) ;

}

**catch** ( Exception e )

{

System._out_.println( &quot;delay() : &quot; + e ) ;

}

}

}

Classe Esclave :

/\*\*

\*Projet: **@ThreadWaitNotify**

\*Classe: **@ThreadEsclave.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*/

**public**** class **ThreadEsclave** extends** Thread

{

// Déclarer et initialisez les attributs :

// (boolean actif) qui représente les états &quot;vie/mort&quot; du thread.

// (boolean suspendu) qui représente les états &quot;en attente/prêt&quot; du thread.

**private**** boolean **actif =** true** ;

**private**** boolean **suspendu =** false** ;

/\*\*

\*méthoderun()

\*/

**public**** void** run()

{

**try**

{

// Tant que le thread est à l&#39;état &quot;vie&quot; :

**while** ( actif )

{

// Endormez le thread pendant 0,01 seconde

delay( 10 ) ;

System._out_.println(&quot;le thread esclave est actif &quot; );

// Tester l&#39;état &quot;en attente/prêt&quot; et conformez le thread à cet état.

**if** ( suspendu ) suspendre();

}

System._out_.println(&quot;le thread esclave se termine&quot; );

}

**catch** (Exception e)

{

e.printStackTrace();

}

}

/\*\*

\*Changel&#39;état&quot;enattente/prêt&quot;à&quot;enattente&quot;.

\*/

**public**** void** attendre()

{

suspendu = **true** ;

System._out_.println(&quot;le thread esclave reçoit l&#39;ordre d&#39;attendre&quot; );

}

/\*\*

\*Provoquel&#39;attenteduthreaddanslapiledel&#39;objetcourant.

\*icisynchronisationsurlaméthode.

\*/

**synchronized**** private ****void** suspendre() **throws** InterruptedException

{

System._out_.println(&quot;le thread esclave se met en attente&quot; );

wait();

}

/\*\*

\*Activeunthreadenattentedanslapiledel&#39;objetcourant.

\*/

**synchronized**** public ****void** reprendre()

{

System._out_.println(&quot;le thread esclave quitte l&#39;attente&quot; );

suspendu = **false** ;

notify();

}

/\*\*

\*Changel&#39;état&quot;vie/mort&quot;à&quot;mort&quot;.

\*/

**public**** void** terminer()

{

System._out_.println(&quot;le thread esclave reçoit l&#39;ordre de terminer&quot; );

actif = **false** ;

}

**public**** void**delay(**long** t )

{

**try**

{

Thread._sleep_( t ) ;

}

**catch** ( Exception e )

{

System._out_.println( &quot;delay() : &quot; + e ) ;

}

}

}

Classe Direction pour tester cet exemple :

/\*\*

\*Projet: **@ThreadWaitNotify**

\*Classe: **@Direction.java**

\ ***@author** :PhilippeBouget

\*Date: **@5** mars08

\*/

**public**** class** Direction

{

// Déclarer les attributs static suivant :

// ThreadMaitre threadMaitre et ThreadEsclave threadEsclave

**public**** static** ThreadEsclave _threadEsclave_ ;

**public**** static** ThreadMaitre _threadMaitre_ ;

/\*\*

\*méthodemain()

\ ***@param** argv

\*/

**public**** static ****void** main(String[] argv)

{

// Intancier les classes ThreadMaitre et ThreadEsclave.

_threadMaitre_ = **new** ThreadMaitre();

_threadEsclave_ = **new** ThreadEsclave() ;

// Exécuter les 2 threads.

_threadMaitre_.start() ;

_threadEsclave_.start();

}

}

Exemple avec les Groupes de Thread

On peut regrouper les Threads en utilisant la classe **ThreadGroup**.

Exemple de syntaxe :

ThreadGroup les2Roues = new ThreadGroup(&quot;Les 2 Roues&quot;);

Thread monThread = new Thread(les2Roues,&quot;monThread&quot;);

A quoi cela sert-il ?

Et bien chaque membre du groupe pourra interroger son groupe pour connaître les autres threads membres de ce même groupe.

Exemple :

public void run

{

Thread[] threadsCopains = new Thread[5] ;

// remplit le tableau threadsCopains avec les threads du même groupe.

Enumerate(threadsCopains);

}

Voici un exemple complet simulant une course entre un vélo, une moto et une Ferrari.

Question  : quel véhicule va remporter les course ?

Réponse : lancer le programme et lisez la console.

Classe TestThread :

**package** lesThreads.demo3DeThreads;

**import** java.io.BufferedReader;

**import** java.io.IOException;

**import** java.io.InputStreamReader;

//teste les groupes de threads

**public**** class** TestThread

{

**public**** static ****void** main(String argv[])

{

//Création du threadGroup

ThreadGroup groupe = **new** ThreadGroup(&quot;Les amis Threads et compagnie&quot;);

//création du thread

MoyenDeTransport velo= **new** MoyenDeTransport(groupe, 1, &quot;Le vélo&quot;);

MoyenDeTransport moto = **new** MoyenDeTransport(groupe,5, &quot;La moto&quot;);

MoyenDeTransport ferrari = **new** MoyenDeTransport(groupe,45, &quot;La Ferrari&quot;);

Controle controle= **new** Controle(groupe);

//Lancement des threads.

controle.start(); //==\&gt; th[0]

velo.start(); //==\&gt; th[1]

moto.start(); //==\&gt; th[2]

ferrari.start(); //==\&gt; th[3]

}

**public**** static ****void** sortie (String message)

{

System._out_.println(message);

}

}

**class** MoyenDeTransport **extends** Thread

{

**boolean** stop = **false** ;

**int** vitesse; // vitesse du véhicule

String type; // type de véhicule

**int** distance =50; // distance à parcourir

//Constructeur.

**public** MoyenDeTransport(ThreadGroup groupe, **int** vitesse, String type)

{

**super** (groupe,&quot;MoyenDeTransport&quot;);

**this**.vitesse = vitesse;

**this**.type=type;

}

//Redéfinition de la méthode run()

**public**** void** run()

{

**for** ( **int** i=0; i\&lt;distance; i+=vitesse)

{

TestThread._sortie_( type + &quot; a pacouru &quot; + i\*100/distance + &quot; % de la distance &quot;);

_yield_();

**if** (stop) **break** ;

}

**if** (!stop)

TestThread._sortie_(type + &quot; est arrivé(e)&quot;);

**else**

TestThread._sortie_(type + &quot; est arreté(e)&quot;);

}

**public**** void** arret()

{

stop= **true** ;

}

}

**class** Controle **extends** Thread

{

/\*Ce thread permet d&#39;arreter les autres threads du groupe

de threads &quot;groupe&quot; en entrant la lettre &quot;s&quot; au clavier.

\*/

//Constructeur.

**public** Controle(ThreadGroup groupe)

{

**super** (groupe,&quot;Controle&quot;);

}

//Redéfinition de la méthode run().

**public**** void** run()

{

**boolean** lire= **true** ;

String rep=&quot;&quot;;

Thread th[] = **new** Thread[4];

//Récupération des threads du groupe de threads &quot;groupe&quot;.

_enumerate_(th);

// flux d&#39;entrée avec tampon de données pour pouvoir lire une ligne entière.

BufferedReader inTampon = **new** BufferedReader ( **new** InputStreamReader(System._in_));

**while** (lire)

{

**try**

{

**while** (rep==&quot;&quot;)

{

rep = inTampon.readLine (); // utilisation du flux

}

}

**catch** (IOException e){System._out_.println(&quot;erreur lecture clavier&quot;);}

**if** (rep.equalsIgnoreCase(&quot;s&quot;)) lire= **false** ;

**else** rep=&quot;&quot;;

}

**try**

{

inTampon.close();

}

**catch** (IOException e){}

System._out_.println(&quot;------------------------ arret -------\&gt;&quot;);

}

}

Bien entendu, c&#39;est la Ferrari qui remporte la course, c&#39;est normal !

Dans ce programme, on stoppe le thread Contrôle correspondant au groupe ce qui fait que tous les threads qui appartiennent à au même groupe sont arrêtés ! ça évite de gérer des arrêts pour chacun des processus. Cela dit, ils terminent tous, lièvres et tortue !

Les Démons : daemon n&#39;est pas un objet maléfique !

Un démon est un **processus qui s&#39;exécute en arrière plan**. Contrairement à un thread, un démon qui attend une requête client ou autre chose ne bloque pas l&#39;application. Un démon reste en mémoire tant qu&#39;il reste un thread vivant !

La méthode **setDaemon** (_boolean_ b) permet de transformer un processus en démon.

Exemple :

UnThread demon = new UnThread() ;
 demon.setDaemon(true);

Remarque : un thread doit être déclaré comme démon lorsqu&#39;il est à l&#39;état «  **vivant mais non fonctionnel ** », c&#39;est-à-dire que la méthode **start** () n&#39;a pas encore été appelé.

# 15.Découverte des Applets

Les applets constituent des petites applications java exécutées dans le cadre d&#39;une page HTML. Une applet est aussi un composant graphique ( **Component** ) et plus précisément un «  **Panel**  ». La classe Applet définit un certain nombre de méthodes spécifiques qui sont appelées à des moments précis du **cycle de vie** d&#39;un objet Applet. Les Applets sont soumises à des **règles de sécurité** qui permettent de contrôler leurs actions.

Dans ce chapitre nous allons voir comment :

- Comparer les Applets aux programmes autonomes
- Comprendre et implémenter le cycle de vie d&#39;une Applet à travers ses méthodes héritées
- Intégrer une Applet dans un document HTML
- Passer des paramètres à une Applet depuis un document HTML
- Comprendre les restrictions de sécurité d&#39;une Applet

**Comparaison entre Applet et programme Java :**

La méthode public static void main(String[] args) est le point d&#39;entrée d&#39;un programme autonome

_Pas besoin de méthode main() pour une Applet_

Une Applet s&#39;exécute dans le cadre d&#39;une page HTML et sous le contrôle d&#39;un navigateur

Des méthodes définies dans la classe Applet sont exécutées à des moments précis de la vie de l&#39;Applet : _init(), start(), stop(), destroy()_ ...

Une Applet est un _composant graphique_ (classe Component).

La méthode qui dessine le contenu de l&#39;Applet est la méthode _paint()_ héritée de la classe Component.

Nous avons vu précédemment que le point d&#39;entrée d&#39;un programme autonome était la méthode main(). Nous verrons par la suite que ce n&#39;est pas le cas pour une Applet. Une Applet est une portion de code Java qui s&#39;exécute sous le contrôle d&#39;un navigateur.

La présence d&#39;une balise \&lt;APPLET\&gt; dans le document HTML traité par le navigateur, provoque le téléchargement des classes de l&#39;Applet, à partir du serveur HTTP.

Le navigateur exécute ensuite, certaines méthodes de la classe Applet, dans un ordre précis, qui constitue ce qu&#39;on appelle le cycle de vie de l&#39;Applet.

L&#39;Applet est aussi une classe dérivant de la classe Component. Comme tout composant graphique, c&#39;est la méthode paint(Graphics) qui sera appelée par le système à chaque fois que nécessaire, pour redessiner son contenu. C&#39;est cette méthode que vous devrez redéfinir, si votre Applet est sensée dessiner dans la page HTML.

**Lancement d&#39;une applet :**

![](RackMultipart20201102-4-17yaceu_html_c77873c2aa8e5579.jpg)

Voici le détail de l&#39;illustration ci-dessus :

1. Au départ, l&#39;utilisateur demande l&#39;affichage d&#39;une page HTML, en saisissant une URL dans son navigateur, par exemple : [http://serveur/unepage.html](http://serveur/unepage.html).
2. Le serveur renvoie un document HTML. Ce document contient des commandes permettant au navigateur de formater l&#39;affichage de la page. Le HTML est un langage de balises (Hyper Text Markup Language) et à ce titre, il utilise des balises, par exemple : \&lt;HTML\&gt;, \&lt;HEAD\&gt;, \&lt;BODY\&gt;, \&lt;Hl\&gt;.
3. Si le document contient une balise \&lt;APPLET\&gt; , le navigateur télécharge les classes de l&#39;Applet depuis le serveur. La balise \&lt;APPLET\&gt; spécifie un rectangle au sein duquel l&#39;Applet pourra dessiner dans la page HTML.

Une fois l&#39;Applet téléchargée, le navigateur exécute certaines de ses méthodes, sous le contrôle d&#39;une JVM (machine virtuelle de java).

**Balise APPLET**

Exemple de code utilisant la balise \&lt;APPLET\&gt; :

\&lt;HTML\&gt;

\&lt;HEAD\&gt;

\&lt;TITLE\&gt;Démonstration\&lt;/TITLE\&gt;

\&lt;/HEAD\&gt;
 \&lt;BODY\&gt;

\&lt;APPLET CODE=MonApplet.class WIDTH=300 HEIGHT=200\&gt;

\&lt;/APPLET\&gt;

\&lt;/BODY\&gt;

\&lt;/HTML\&gt;

**Les paramètres obligatoires de la balise \&lt;APPLET\&gt; sont les suivants :**

• CODE= MonApplet.class : spécifie le nom de la classe compilée à télécharger depuis le serveur.

• WIDTH= 300 : spécifie en pixels, la largeur du rectangle, dans lequel l&#39;Applet peut dessiner.

• HEIGHT= 200 : spécifie en pixels, la hauteur du rectangle, dans lequel l&#39;Applet peut dessiner.

**Autres paramètres facultatifs dans la balise \&lt;APPLET\&gt; :**

• **archive** =listeArchives : permet de spécifier une liste de fichiers jar contenant des classes Java et éventuellement des ressources (fichiers images, sons etc ...) nécessaires à l&#39;exécution de l&#39;Applet.

• **codebase** =URLcodeBase : spécifie le répertoire de l&#39;Applet sur le serveur, s&#39;il est différent du répertoire du document HTML

• **alt** = texteAlternatif : spécifie un texte s&#39;affichant dans le rectangle réservé à l&#39;Applet en cas de problème (JVM désactivée dans le navigateur, Applet non trouvée sur le serveur, etc.)

• **name** =nominstance : utile dans le cas où dans une page HTML, plusieurs Applets doivent communiquer les unes avec les autres.

• **align** =typeAlignement : spécifie l&#39;alignement de l&#39;Applet au sein de la page HTML, par rapport aux objets voisins (en haut, en bas, à gauche, etc.)

• **vspace** = pixels : spécifie une marge verticale entre l&#39;Applet et les objets voisins dans la page HTML.

• **hspace** = pixels : spécifie une marge horizontale entre l&#39;Applet et les objets voisins dans la page HTML.

Exemple de code avec les différentes balises non obligatoires :

\&lt;APPLET

[archive=listeArchives]
 code=&quot;package.nomApplet.class&quot;
 width=pixels height=pixels
 [codebase=URLcodeBase]
 [alt=texteAlternatif]
 [name=nomInstance]
 [align=typeAlignement]
 [vspace=pixels] [hspace=pixels]

\&gt;

[\&lt;PARAM name=&quot;nom1Param&quot; value=&quot;valeur1&quot;\&gt;
 [\&lt;PARAM name=&quot;nom2Param&quot; value=&quot;valeur2&quot;\&gt;

\&lt;/APPLET\&gt;

**Applet et sécurité :**

Une Applet chargée à partir du réseau a les restrictions suivantes :

- Les Applets **ne peuvent pas lancer de programme** sur la machine locale.

- Les Applets **ne peuvent ni lire, ni écrire d&#39;informations sur le disque de la machine locale**.

- Les Applets **ne peuvent établir de connexion réseau qu&#39;avec le serveur** depuis lequel elles ont été téléchargées.

- Toutes les **fenêtres ouvertes par une Applet affichent un message de mise en garde** , pour que l&#39;utilisateur ne saisisse pas d&#39;informations sensibles.

##### On parle de &quot;Bac à sable&quot; ou &quot;Sand box&quot;

Lorsqu&#39;un utilisateur demande l&#39;affichage d&#39;une page HTML, il ne peut savoir d&#39;avance si une Applet sera exécutée ou non. Pour des raisons de sécurité, l&#39;Applet sera soumise à un certain nombre de contraintes l&#39;empêchant de nuire à l&#39;intégrité du poste client.

L&#39;Applet est chargée par un **ClassLoader** particulier, différent de celui utilisé pour un programme autonome. Cela permet de créer un contexte d&#39;exécution associant l&#39;Applet au serveur dont elle provient.

Si les classes existent localement, elles sont utilisées en priorité par l&#39;Applet (ex : les classes du noyau Java). Dans le cas contraire, elles sont téléchargées depuis le serveur. Pour éviter que des classes distantes n&#39;effectuent des actions non désirées sur le poste client, les Applets sont soumises à des règles de sécurité beaucoup plus sévères qu&#39;un programme autonome. On parle de bac à sable (sandbox anglais), qui délimite les droits de l&#39;Applet.

**Voici un exemple des restrictions appliquées aux Applets :**

• L&#39;Applet ne peut obtenir que des renseignements simples sur le système où elle s&#39;exécute (ex : nom de l&#39;OS)

• L&#39;Applet ne peut pas accéder au système de fichiers du poste client (lecture ou écriture impossible sur le disque dur)

• L&#39;Applet ne peut lancer de programme sur le poste client.

• L&#39;Applet ne peut établir des communications socket qu&#39;avec son site d&#39;origine

Depuis la version 2 de java, il est possible d&#39;assouplir ces contraintes de sécurité, en utilisant par exemple des Applets authentifiées grâce au mécansime des certificats.

**La hiérarchie des classes**

Comme illustrer dans le graphique ci-dessous, la classe Applet hérite de Panel qui hérite de Container qui hérite de Component qui hérite de la classe Object.

![](RackMultipart20201102-4-17yaceu_html_517bd842b694ba6b.jpg)

L&#39;examen du schéma ci-dessus montre qu&#39;une Applet appartient à la famille des composants graphiques :

Une Applet est un **Component**. A ce titre, elle hérite de méthodes comme setVisible(boolean), paint(Graphics), setSize(...), setBounds(...). Si votre Applet doit dessiner dans la page HTML, il faudra redéfinir la méthode paint(Graphics).

Une Applet est aussi un **Container**. On peut donc placer sous le contrôle de l&#39;Applet, d&#39;autres composants graphiques. L&#39;Applet hérite de la méthode add(Component) de la classe Container. Comme tout Container, on peut lui associer un gestionnaire de présentation (LayoutManager). Celui-ci est chargé de gérer automatiquement la disposition des composants qui sont sous son contrôle, évitant ainsi au programmeur de calculer leur position au pixel près. Ce sujet est détaillé dans le chapitre sur l&#39;Interface Graphique Utilisateur AWT.

Une Applet est aussi un **Panel**. Il s&#39;agit d&#39;un simple panneau rectangulaire.

**L&#39;Applet et ses méthodes :**

Une Applet est un Component. Elle hérite ainsi des méthodes graphiques de cette classe :

repaint(),
 update(Graphics),
 paint(Graphics), ...

Des méthodes spécifiques à la classe Applet sont appelées par le navigateur à des moments spécifiques du cycle de vie de l&#39;Applet :

init(),
 start(),
 stop(),
 destroy()

D&#39;autres méthodes spécifiques à la classe Applet lui permettent d&#39;obtenir des informations sur l&#39;environnement ou d&#39;accéder à des ressources :

getDocumentBase(),
 getCodeBase(),
 getParameter(),
 getImage(),
 getAudioClip()

**Méthodes graphiques de l&#39;Applet :**

![](RackMultipart20201102-4-17yaceu_html_4cbd54a717e547b3.png)

Explication des méthodes :

• **repaint** () : cette méthode demande un rafraichissement de la zone graphique. L&#39;exécution se fait de façon asynchrone. C&#39;est cette méthode que votre programme appelle pour mettre à jour les données affichées (ex : cas d&#39;une animation). En réalité cette méthode fait appel à la méthode update(Graphics).

• **update** (Graphics) : cette méthode efface la zone et fait appel à la méthode paint(Graphics).

• **paint** (Graphics) : cette méthode dessine le contenu du composant graphique (ici l&#39;Applet). Vous devez donc redéfinir cette méthode pour dessiner dans le rectangle réservé à l&#39;Applet. Le système appelle automatiquement cette méthode quand c&#39;est nécessaire, par exemple lorsqu&#39;une partie de l&#39;Applet qui était cachée redevient visible. **Vous ne devez jamais appeler directement la méthode paint()**.

**Les méthodes du cycle de vie de l&#39;Applet :**

![](RackMultipart20201102-4-17yaceu_html_f8ea18d1dfb9524f.jpg)

Explication de l&#39;illustration ci-dessus :

• Après avoir téléchargé l&#39;Applet, le navigateur crée une instance de celle-ci. Ensuite le navigateur lui fait exécuter dans l&#39;ordre les méthodes suivantes :

- **init** ()
- **start** ()
- **paint** (Graphics).

A chaque fois qu&#39;il est nécessaire de dessiner le contenu de l&#39;Applet, la méthode paint(Graphics) est à nouveau appelée. Si l&#39;utilisateur décide de visiter une autre page HTML, le navigateur appelle la méthode **stop** (), puis éventuellement **destroy()**.

L&#39;exécution des méthodes **init** (), **start** (), **stop** (), puis **destroy** () constitue ce qu&#39;on appelle le cycle de vie de l&#39;Applet.

• **init** () : Cette méthode est appelée lorsque l&#39;Applet est chargée la première fois en mémoire. Vous pouvez redéfinir cette méthode pour initialiser des variables ou charger des ressources en mémoire : fichiers sons, images etc .

• **start** () : Cette méthode est appelée pour « activer » l&#39;Applet. Vous pouvez utiliser cette méthode, par exemple, pour démarrer un son ou une animation.

• **stop** () : Cette méthode est appelée pour « désactiver » l&#39;Applet, par exemple lorsque l&#39;utilisateur va visiter une autre page HTML. Dans ce cas, elle peut servir à arrêter un son. Certains navigateurs exécutent ensuite la méthode destroy().

• **destroy** () : Cette méthode est exécutée avant de vider l&#39;Applet de la mémoire. Avec certains navigateurs, elle s&#39;exécute dès que l&#39;utilisateur ouvre une nouvelle page HTML. Cette méthode s&#39;exécute après la méthode stop(). Si l&#39;utilisateur revient sur la page d&#39;origine de l&#39;Applet, un nouveau cycle recommence : ini(), start() ... .

**L&#39;Applet et ses méthodes d&#39;accès aux ressources :**

![](RackMultipart20201102-4-17yaceu_html_24c51fed0e619196.jpg)

L&#39;illustration ci-dessus montre une applet qui charge un logo.jpg et un son cuicui.au.

Voici le code en exemple :

\&lt;HTML\&gt;
 \&lt;BODY\&gt;
 \&lt;APPLET ....\&gt;
 \&lt;PARAM NAME=&quot;image&quot; VALUE=&quot;logo.jpg&quot;\&gt;
 \&lt;PARAM NAME=&quot;son&quot; VALUE=&quot;cuicui.au&quot;\&gt;
 \&lt;/APPLET\&gt;
 \&lt;/BODY\&gt;
 \&lt;/HTML\&gt;

Méthodes :

• getDocumentBase() : cette méthode renvoie l&#39;URL du document HTML de la page courante.

• getCodeBase() : cette méthode renvoie l&#39;URL de l&#39;Applet.

• getParameter() : cette méthode permet de récupérer des paramètres spécifiés dans la balise \&lt;APPLET\&gt; de la page HTML.

• getlmage(...) : renvoie une instance de la classe Image.

• getAudioClip(...) : renvoie une instance de la classe AudioClip. Il s&#39;agit d&#39;un fichier son .wav, .aiff, .au ou midi

**Passage de paramètres à l&#39;Applet :**

Comme pour un programme autonome, il est possible de passer des paramètres à une Applet. Ce passage de paramètres se fait par la commande :

\&lt;param name=«NomDuParamètre» value=«ValeurDuParamètre» \&gt; située dans la balise \&lt; APPLET\&gt;

On peut passer autant de paramètres que nécessaire. Les paramètres seront récupérés par l&#39;Applet sous forme de String. Cela permet par exemple, de passer des noms de fichiers à l&#39;Applet : images, sons etc..

Dans le cas où un nom de fichier change, il suffit de modifier la pageHTML et il n&#39;y a pas besoin de recompiler l&#39;Applet.

Exemple de code :

\&lt;BODY\&gt;
 \&lt;APPLET
 CODE=&quot;MonApplet.class&quot; WIDTH=300 HEIGHT=200\&gt;
 \&lt;PARAM NAME=&quot;image&quot; VALUE=&quot;logo.jpg&quot;\&gt;
 \&lt;PARAM NAME=&quot;son&quot; VALUE=&quot;cuicui.au&quot;\&gt;
 \&lt;/APPLET\&gt;
 \&lt;/BODY\&gt;

**Lecture des paramètres de l&#39;applet :**

C&#39;est par la méthode _public__String_ **getParameter** (_String nomDuParamètre_) que l&#39;Applet peut lire les paramètres spécifiés dans la page HTML. Dans l&#39;exemple ci-dessus, l&#39;Applet récupère dans la variable nomImage de type String, la valeur spécifiée dans le paramètre nommé image.

Si l&#39;on regarde le source HTML de la page précédente, on peut prévoir que la valeur récupérée dans image, sera la chaine de caractères « Iogo.jpg ».

Exemple de code de récupération des valeurs des paramètres :

public void init()
 {
 String nomImage = getParameter(&quot;image&quot;);

String nomSon = getParameter(&quot;son&quot;);

}

**Démonstration avec le code d&#39;une applet complète :**

![](RackMultipart20201102-4-17yaceu_html_3a3ec3096cfd9b97.jpg)

**Sources de la page HTML ci-dessus :**

\&lt;HTML\&gt;

\&lt;HEAD\&gt;

\&lt;TITLE\&gt;Démonstration d&#39;une applet\&lt;/TITLE\&gt;

\&lt;/HEAD\&gt;

\&lt;BODY\&gt;

\&lt;H1\&gt;Bienvenue chez IBM learning Services !\&lt;/H1\&gt;

\&lt;APPLET CODE=&quot;MonApplet.class&quot; WIDTH=600 HEIGHT=200

alt=&quot;Cette page nécessite Java pour s&#39;afficher correctement !&quot;\&gt;

\&lt;PARAM NAME=&quot;image1&quot; VALUE=&quot;javalogo.gif&quot;\&gt;

\&lt;PARAM NAME=&quot;image2&quot; VALUE=&quot;balloon.jpg&quot;\&gt;

\&lt;PARAM NAME=&quot;son&quot; VALUE=&quot;petitsZoizos.au&quot;\&gt;

\&lt;/APPLET\&gt;

\&lt;/BODY\&gt;

\&lt;/HTML\&gt;

**Source de l&#39;Applet :**

// Applet de démonstration

// import permettant d&#39;accéder à la classe java.applet.Applet

import java.applet.\*-

// import permettant d&#39;accéder à la classe java.awt.Graphics

// et les autres classes du package java.awt

import java.awt.\*;

// Pour créer une Applet on crée une classe qui hérite de

// classe java.awt.Applet

public class MonApplet extends java.applet.Applet

{

// variables d&#39;instance

java.awt.Image imgl;

java.awt.Image img2;

java.applet.AudioClip son;

int compteurDePaint;

// Redéfinition de la méthode init() héritée de la classe Applet

// Si elle est redéfinie, cette méthode est appelée 1 fois au

// chargement de la classe en mémoire. On pourra s&#39;en servir pour

// charger des ressources qui seront utilisées ensuite, par exemple

// des images, des sons etc.

public void init()

{

// affichage d&#39;un message sur la console Java du navigateur

System.out.println(&quot;Execution de init()&quot;);

// Chargement de la première image

// Récupération du nom de l&#39;image à partir du paramètre &quot;imagel&quot;

// spécifié dans la page HTML

String nomImgl = this.getParameter(&quot;imagel&quot;);

// on charge l&#39;image à partir du serveur depuis le même

// répertoire que la page HTML

if (nomImgl != null)

imgl = getImage(this.getDocumentBase O ,nomImgl);

// Chargement de la seconde image

// Récupération du nom de l&#39;image à partir du paramètre &quot;imagel&quot;

// spécifié dans la page HTML

String nomlmg2 = this.getParameter(&quot;imagel&quot;);

// on charge l&#39;image à partir du serveur depuis

// répertoire que 1&#39;Applet

if (nomlmg2 != null)

img2 = getlmage(this.getCodeBase(),nomlmg2);

// Chargement du son, le nom du fichier est spécifié

// dans le maramètre &quot;son&quot; de la page HTML

String nomSon = this.getParameter(&quot;son&quot;);

// on charge le son à partir du serveur depuis le même

// répertoire que l&#39;Applet

if (nomSon != null)

son = getAudio&#39;Clip(this.getCodeBaseO,nomSon);

}

// Redéfinition de la méthode start() héritée de la classe Applet

// Cette méthode est exécutée avant le premier affichage, puis à

// chaque fois que l&#39;on revient sur la page HTML

public void start()

{

System.out.println(&quot;Execution de start()&quot;);

// C&#39;est ici que l&#39;on peut par exemple démarrer le son

if (son != null)

son .loop O ; // permet de jouer le son en boucle, on peut aussi

// utiliser la méthode play() pour ne jouer qu&#39;une

// fois le son

}

// Redéfinition de la méthode stop() héritée de la classe Applet

// Cette méthode est exécutée quand l&#39;utilisateur décide d&#39;aller

// visiter une autre page HTML. Certains navigateurs appelent

// ensuite la méthode destroy().

public void stop()

{

System.out.println(&quot;Execution de stop()&quot;);

// C&#39;est ici que l&#39;on arrête le son que l&#39;on a lancé en boucle !

if (son != null)

son. stop O ;

}

// Redéfinition de la méthode destroy() héritée de la classe

// Applet. Cette méthode est exécutée avant le déchargement

// mémoire de l&#39;Applet. Certains navigateurs appellent cette

// méthode dès que l&#39;utilisateur visite une autre page HTML,

// dans ce cas, en revenant ensuite sur la même page, il

// y aura appel de finit O , puis start().

public void destroy()

{

System.out.println(&quot;Execution de destroy()&quot;);

}

// Redéfinition de la méthode paint() héritée de la classe Component

// Cette méthode est appelée automatiquement à chaque fois que le contenu de l&#39;Applet doit être

// redessiné

public void paint(Graphics g)

{

System.out.println(&quot;Execution de paint() &quot; + ++this.compteurDePaint

Affichage des 2 images chargées dans la méthode init()

if (imgl != Hull&#39;)

g. drawlmage(imgl,5, 5, this),

if (img2 ! nuil)

g. drawlmage(img2, 490, 5, this);

//Affichage d&#39;un texte

g.drawString(&quot;Affichez la console Java SVP !&quot;, 80, 30),

g.drawString(&quot;Affichez aussi le source de la page HTML SVP !&quot;, 80, 60);

// Changement de couleur

g.setColor(java.awt.Color.blue);

// Création d&#39;une police

java.awt.Font police = new Font(&quot;Serif&quot;, Font.BOLD+Font.ITALIC, 24);

// Changement de police

g. setFont(police);

// Affichage d&#39;un texte

g.drawString(&quot;Police \&quot;Serif\&quot;, italique + gras, taille=18&quot;, 80, 100);

// Changement de couleur

g. setColor(Color.cyan);

// On dessine un rectangle plein

g.fillRect(100, 120, 350, 60); // x,y,l,h

// On dessine un cadre noir

g. setColor(Color.black),

g.drawRect(100, 120,350, 60);

// on écrit dans le rectangle

g.setColor(Color.red);

police = new Font(&quot;Dialog&quot;, Font.BOLD, 18);

g. setFont(police);

g.drawString(&quot;Démonstration terminée&quot;,160,155);

}

}

**L&#39;Applet et les navigateurs :**

Règle N° 1 : L&#39;Applet n&#39;a pas besoin de méthode main().

Règle N° 2 : L&#39;Applet a un cycle de vie supporté par l&#39;intermédiaire des méthodes suivantes :

- public void init()
- public void start()
- public void stop()
- public void destroy()

Règle N° 3 : L&#39;Applet est démarrée depuis les pages HTML, elle peut recevoir des informations depuis cette page ou depuis le serveur à l&#39;origine de cette page.

Règle N° 4 : L&#39;Applet contient du code exécutable, il ne faut pas lui faire confiance. Elle est limitée dans ses tentatives d&#39;accès aux ressources du système.

# 16.Introspection d&#39;objet : utilisation dynamique

Voici un exemple de code java permettant d&#39;effectuer une introspection sur un objet pour retrouver et exécuter dynamiquement une méthode appartenant à la classe de l&#39;objet.

On utilise la méthode **getClass()** qui retourne un objet de type **Class** , un tableau permettant de stocker des objets de types **Method** ainsi que la classe **getDeclaredMethods()** qui retourne les méthodes de la classe concernée. Ensuite il suffira de lire le tableau contenant la ou les méthodes de la classe et d&#39;invoquer la méthode en précisant l&#39;objet avec la syntaxe ci-dessous :

methodes[i]. **invoke** (_monObjet_) ;

cette ligne suffit pour exécuter la méthode. Pour comprendre cette syntaxe, il faut la lire en sens inverse. Elle correspond à l&#39;écriture habituelle **monObjet.nomDeMaMéthode()** ;

**import** java.lang.reflect.Field;

**import** java.lang.reflect.InvocationTargetException;

**import** java.lang.reflect.Method;

/\*\*

\ ***@author** pbouget

\*Exempled&#39;invocationdynamiquedeméthodes!

\*

\*/

**public**** class** Test

{

/\*\*

\ ***@param** args

\*/

**public**** static ****void** main(String[] args)

{

// ici on instancie un objet nommé monObjet

Dynamique objet = **new** Dynamique();

// là, on récupère le type de l&#39;objet, sa classe

Class classe = objet.getClass();

// on stocke les méthodes dans un tableau de type Method

Method[] methodes =classe.getDeclaredMethods();

// on peut aussi récupérer le nom des attributs de la classe

Field[] attributs = classe.getDeclaredFields();

// on parcours le tableau contenant les atributs :

**for** ( **int** i=0; i\&lt;attributs.length;i++)

{

System._out_.println(&quot;attribut trouvé : &quot;+attributs[i].getName());

}

// on parcours le tableau contenant les méthodes :

**for** ( **int** i=0; i\&lt;methodes.length;i++)

{

System._out_.println(&quot;méthode trouvée : &quot;+methodes[i].getName());

// pour le fun, on recherche un nom précis de méthode

**if** ((methodes[i].getName()).equals(&quot;getPrenom02&quot;))

{

System._out_.println(&quot;méthode exécutée : &quot;+methodes[i].getName());

**try** {

// on affiche dans la console java

System._out_.println(methodes[i].invoke(objet));

// on exécute la méthode

methodes[i].invoke(objet);

} **catch** (IllegalArgumentException e) {

e.printStackTrace();

} **catch** (IllegalAccessException e) {

e.printStackTrace();

} **catch** (InvocationTargetException e) {

// **TODO** Auto-generated catch block

e.printStackTrace();

}

}

}

}

}

/\*\*

\*Classepoureffectuerletest

\*contient4méthodespublic

\*/

**class** Dynamique

{

// attributs :

**private** String adresse;

**private** String cP;

**public** String getPrenom01()

{

**return**&quot;Pilou01&quot;;

}

**public** String getNom03()

{

**return**&quot;Boubou03&quot;;

}

**public** String getPrenom02()

{

**return**&quot;Albert02&quot;;

}

**public** String getNom04()

{

**return**&quot;Glandu04&quot;;

}

**private**** int** getAge()

{

**return** 32;

}

}

# 17.Annexe 1 : Evénements par composant

| **Composant** | **Evénements** |
| --- | --- |
| Adjustable | AdjustmentEvent |
| Applet | ContainerEvent, FocusEvent, KeyEvent, MouseEvent,ComponentEvent |
| Button | ActionEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Canvas | FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Checkbox | ItemEvent, FocusEvent, KeyEvent, MouseEvent,ComponentEvent |
| CheckboxMenultem | ActionEvent, ItemEvent |
| Choice | ItemEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Component | FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Container | ContainerEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Dialog | ContainerEvent, WindowEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| FileDialog | ContainerEvent, WindowEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Frame | ContainerEvent, WindowEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Label | FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| List | ActionEvent, FocusEvent, KeyEvent, MouseEvent, ItemEvent, ComponentEvent |
| Menu | ActionEvent |
| Menultem | ActionEvent |
| Panel | ContainerEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| PopupMenu | ActionEvent |
| ScrollBar | AdjustmentEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| ScrollPane | ContainerEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| TextArea | TextEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| TextComponent | TextEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| TextField | ActionEvent, TextEvent, FocusEvent, KeyEvent, MouseEvent, ComponentEvent |
| Window | ContainerEvent,WindowEvent,FocusEvent KeyEvent,MouseEvent, ComponentEvent |

90

Philippe Bouget Version du 02/11/2020