
# Le langage JAVA (Module 1)

## Syntaxe de base

### 1. Présentation générale de Java

#### Historique

Le langage Java est un langage de programmation informatique orienté objet créé par Sun Microsystems en 1995.

Le langage reprend en grande partie la syntaxe du langage C++, très utilisé par les informaticiens. Néanmoins, Java a été épuré des concepts les plus subtils du C++ et à la fois les plus déroutants, tels que les pointeurs et références, et l&#39;héritage multiple remplacé par l&#39;implémentation des interfaces. Les concepteurs ont privilégié l&#39;approche orientée objet de sorte qu&#39;en Java, tout est objet à l&#39;exception des types primitifs (nombres entiers, nombres à virgule flottante, etc.).

La particularité principale de Java est que les logiciels écrits dans ce langage sont très facilement portables sur plusieurs systèmes d&#39;exploitation tels que UNIX, Windows, Mac OS ou GNU/Linux, avec peu ou pas de modifications. C&#39;est la JVM (Java Virtual Machin), plate-forme d&#39;exécution d&#39;un programme java, qui garantit la portabilité des applications développées en Java.

Autre particularité : Java (c&#39;est-à-dire la JRE - Java Run Time- et le JDK (Development Kit) est un logiciel libre (sous licence GPL) depuis 2008.

En 2009, Oracle fait l&#39;acquisition de Sun Microsystem et prend ainsi les commandes du projet Java.

#### Cycle de développement Java

Fichier source : MonFichier.java
 Compilation : **javac** MonFichier.java =\&gt; MonFichier.class
 Exécution : **java** Monfichier

MonFichier.class est un fichier binaire (ByteCode) qui n&#39;est pas exécutable directement. Pour s&#39;exécuter il nécessite d&#39;être interprété par la Machine Virtuelle Java (JVM).

![](RackMultipart20201102-4-1x55eb_html_6846cfe604ce31c6.png)

La JVM est spécifique à chaque [plate-forme](http://fr.wikipedia.org/wiki/Plate-forme) et permet aux applications [Java](http://fr.wikipedia.org/wiki/Langage_de_programmation_Java) compilées en Bytecode de produire (normalement) les mêmes résultats sur toutes les plateformes pourvues d&#39;une machine virtuelle.

## Performances

Les premières implémentations du langage utilisaient une machine virtuelle interprétée pour obtenir la portabilité. Ces implémentations produisaient des programmes qui s&#39;exécutaient plus lentement que ceux écrits en C ou en C++, si bien que le langage souffrait d&#39;une réputation de faibles performances. Des implémentations plus récentes de la machine virtuelle Java (JVM) produisent des programmes beaucoup plus rapides qu&#39;auparavant, en utilisant différentes techniques.

La première technique est de compiler directement en code natif comme un compilateur traditionnel, supprimant complètement la phase de bytecode. On obtient ainsi de bonnes performances mais aux dépens de la portabilité. Une autre technique appelée compilation juste-à-temps (just in time, JIT) traduit le byte code en code natif durant la phase de lancement du programme. Certaines machines virtuelles plus sophistiquées utilisent une recompilation dynamique durant laquelle la machine virtuelle analyse le comportement du programme et en recompile sélectivement certaines parties. La recompilation dynamique permet d&#39;obtenir de meilleurs résultats que la compilation statique car le processus peut être optimisé en fonction de la connaissance de l&#39;environnement cible et des classes qui sont utilisées. La compilation JIT et la recompilation dynamique permettent à Java de tirer profit de la rapidité du code natif sans perdre la portabilité.

La portabilité est techniquement un objectif difficile à atteindre et le succès de Java en ce domaine est mitigé. Quoiqu&#39;il soit effectivement possible d&#39;écrire des programmes pour la plate-forme Java qui fonctionnent correctement sur beaucoup de machines cibles, le nombre important de plates-formes avec de petites erreurs et des incohérences a abouti à un détournement du slogan de Sun « Write once, run anywhere » (« Écrire une fois, exécuter n&#39;importe où ») en « Write once, debug everywhere » (« Écrire une fois, déboguer partout ») !

L&#39;indépendance de Java vis-à-vis de la plate-forme est cependant un succès avec les applications côté serveur comme les services web, les servlets et le Java Beans aussi bien que les systèmes embarqués utilisant l&#39;environnement Embedded Java.

## Environnements et frameworks

Les programmes Java existent sous plusieurs environnements :

- Application autonome (sur poste client).
- Applet pour Navigateur Web
- Servlet, JSP pour Serveur Web
- Applications mobiles pour SmartPhone.

On retrouve ces distinctions au niveau des frameworks Java :

- JSE : Java Standard Edition. Ce framework est destiné aux applications pour poste de travail. Version actuelle : Java SE 7 update 17 (elle compte 3 777 classes et interfaces).
- JEE : Java Entreprise Edition. Ce framework est spécialisé dans les applications web. Il contient pour ce faire un grand nombre d&#39;API et d&#39;extensions du langage (annotations, XML). Version actuelle : JEE 6.
- JME : Java Micro Edition. Ce framework est spécialisé dans les applications mobiles. En théorie, on doit désormais parler de Java ME ;
- Java Embedded : Java pour system embarqué de manière générale, tels que cartes SIM, téléphone mobile, téléviseur, lecteur Blu-ray, imprimante, distributeur bancaire, lecteur e-book, voitures…etc.
- JavaFx : Framework spécialisé pour les Applications à Interfaces Riches (RIA).

#### Installation

Pour développer des applications Java, vous devez installer le JDK (qui contient le JRE).

Il existe différentes distributions du JDK en fonction de l&#39;OS d&#39;installation et de leur déclinaison en 64-bits :

- Solaris Opeating System
- Windows
- Linux

Pour les instructions spécifiques à chaque OS, reportez-vous ici :

[http://www.oracle.com/technetwork/java/javase/index-137561.html](http://www.oracle.com/technetwork/java/javase/index-137561.html)

  1.
## Installation sous Windows

Télécharger la dernière version du JDK

Ou

Exécuter le fichier : **I:\Tertiaire\Stagiaires\DA1\1.Cours\Informatique\0 - Installations de logiciels\**** jdk-7u3-windows-i586.exe**

  1.
## Modification du PATH

Pour avoir accès aux programmes **java.exe** et **javac.exe** depuis n&#39;importe quel répertoire, il est utile d&#39;ajouter au PATH le chemin suivant :

**C:\Program Files\Java\jdk\_\&lt;version\&gt;\bin**

  1.
## Compilation et exécution

1. Créer un répertoire « hello ».
2. Creér un fichier « HelloWorld.java » dans le répertoire « hello » avec le code suivant :

public class HelloWorld {

public static void main(String[] args) {

JOptionPane.showMessageDialog(null, &quot;Hello World !&quot; );

System.exit( 0 );

}

}

1. Ouvrir une boite de commande MSDOS et se positionner sous le répertoire « hello ».
2. Lancer la compilation : javac HelloWorld.java
3. Lancer l&#39;exécution : java HelloWorld

**Note :**

Le nom de la classe doit être exactement le même que le nom du fichier (casses comprises, ici HelloWorld). Ceci est une règle générale en java : le nom du fichier correspond au nom de la classe PUBLIC qu&#39;il contient.

1. **Premiers Pas**
  1.
## HelloWorld.java

Le plus petit programme réalisable en java pourrait être le suivant :

public class HelloWorld {

public static void main(String[] args) {

System.out.println(&quot;Hello World !&quot;);

}

}

« System.out » représente la sortie standard, ici la console.

Il existe de la même manière « System.in » pour l&#39;entrée standard, c&#39;est-à-dire la lecture du clavier.

Le programme se compose d&#39;une classe « HelloWorld » qui implémente une méthode « main » qui constitue le programme principal à partir duquel seront appelés toutes les autres classes et méthodes de l&#39;application.

Avec des commentaires :

```java
afficher helloworld avec java///////

```

Le package javax.swing contient un ensemble de classes servant à développer des GUI (Graphic User Interface).

La classe **JOptionPane** sert à créer et gérer des boites de dialogues.

La méthode **showMessageDialog** permet l&#39;affichage d&#39;un texte dans une boite de dialogue. Le premier paramètre null permet de centrer automatiquement la boite à l&#39;écran, le reste concerne ce que nous voulons afficher.

Pour terminer une application utilisant une Interface Graphique, il nous faut appeler la méthode **exit** de la classe **System.**

1. **Package**

Un package Java (ou paquetage en bon français) est un mécanisme permettant d&#39;organiser des classes Java dans des espaces de noms.

Les packages Java peuvent être stockés dans des fichiers compressés appelés fichiers JAR, ce qui permet de télécharger plus rapidement les classes en tant que groupe plutôt que un par un.

On utilise généralement des packages pour organiser des classes par thèmes ou pour regrouper toutes les classes d&#39;un projet.

  1.
## Espaces de noms

Les packages sont organisés sous forme de hiérarchies de répertoires et de sous-répertoires.

Un package correspond à un répertoire. Les fichiers .class contenu dans ce répertoire constituent les classes du package.

Le nom d&#39;un package correspond à son chemin d&#39;accès en utilisant le « . » (point) comme séparateur de répertoire.

**Exemple**  :

« java.awt » définit un package situé dans le répertoire « java\awt\ » qui contient une cinquantaine de classes dédiées à la création d&#39;interfaces.

Ce package contient un sous package « java.awt.event » dans le répertoire « java\awt\event » et qui contient les classes dédiées à la gestion des évènements dans les interfaces graphiques.

  1.
## Classpath

Pour que le compilateur puisse trouver les packages utilisés dans un programme, il est essentiel qu&#39;il &quot;connaisse&quot; l&#39;emplacement des packages. Pour cela Java utilise une variable d&#39;environnement (dans le même ordre d&#39;idée que la variable d&#39;environnement PATH) appelée **classpath** donnant la liste des chemins d&#39;accès aux classes.

Par défaut le compilateur (ainsi que la machine virtuelle) recherchent les classes dans le répertoire courant et le répertoire des classes standards.

Sous windows, on définira de façon permanente la variable CLASSPATH en passant par le panneau **Système\&gt;Avancés\&gt;variables d&#39;environnements**

  1.
## Création

Dans un fichier source Java, la package d&#39;appartenance de ce fichier est spécifié en tout début de fichier par le mot clé « package ». Il faut également que le fichier soit stocké dans un répertoire qui porte le même nom que le nom du package.

Exemple :

package monpaquetage ;

  1.
## Utilisation

Pour pouvoir utiliser les classes d&#39;un package, il suffit de mettre bout à bout le nom du package et le nom de la classe que l&#39;on veut utiliser.

Exemple : la classe JOptionPane appartient au package javax.swing

public static void main(String[] args) {

javax.swing.JOptionPane.showMessageDialog(null, &quot;Hello World !&quot; );

System.exit( 0 );

}

Toutefois il s&#39;avère vite lourd d&#39;avoir à écrire constamment le chemin d&#39;une classe, ainsi il est généralement pratique d&#39;utiliser l&#39;instruction **import** en début de fichier.

import java.swing.JOptionPane ;

...//...

JOptionPane.showMessageDialog(null, &quot;Hello World !&quot;);

Il est également possible d&#39;importer l&#39;ensemble des classes d&#39;un package.

import java.swing.\* ;

Contrairement à ce que l&#39;on pourrait croire, l&#39;instruction import java.swing.\* permet de rendre accessible uniquement les classes contenues dans le package MonPackage et non à l&#39;ensemble des sous-packages éventuels.

Exemple :

import java.\* ; //ceci ne permet pas d&#39;accéder au package swing.

  1.
## Visibilité

Les classes d&#39;un package peuvent accéder aux autres classes et membres déclarés « public » ou « protected » ou par défaut (sans rien) de leur package.

  1.
## Packages par défaut

Java définit deux packages par défaut, c&#39;est-à-dire un ensemble de classes auxquelles il est possible de faire référence sans spécifier le chemin d&#39;accès (que ce soit avec une instruction import ou en faisant précéder le nom par la hiérarchie de packages). Ces packages sont :

- Le **package par défaut** : il s&#39;agit de toutes les classes ne faisant pas partie explicitement d&#39;un package et situées dans les répertoires accessibles (par défaut ou dans la variable classpath)
- Le **package java.lang** contenant les classes standards telles que System ou Math.

  1.
## Les packages java

Les packages qui commencent par « java » appartiennent au noyau de java.

Les packages qui commencent par « javax » appartiennent à un paquetage d&#39;extension.

java.lang — Types de bases et fonctions de bases du langage

java.util — Collections, Structures et Classes

java.io — Opérations sur fichiers

java.math — Fonctions mathématiques.

java.nio — Nouveau framework d&#39;entrée/sortie

java.net — Fonctions réseau, sockets et DNS

java.security — Encryptage, génération de clés, décryptage

java.sql — Java Database Connectivity (JDBC) et accès aux bases de données

java.awt — Composants de base des interfaces graphiques

javax.swing — Hiérarchie de packages pour des interfaces graphiques riches

java.applet — Classes pour la création d&#39;applets

1. **Le langage Java : syntaxe de base**
  1.
## L&#39;instruction

La plus petite unité indépendante d&#39;un programme en Java est l&#39;instruction. Comme vous avez pu le constater, _ **chaque instruction doit se terminer par le symbole** _ **point-virgule ;**

En langage naturel, cela correspond à une phrase. L&#39;instruction est constituée **d&#39;identificateurs** et de **symboles**.

Exemple :

int maValeur ;

maValeur = 10 + 45 ;

System.out.println(&quot; La Valeur est : &quot; +maValeur) ;

Les _ **identificateurs** _ servent à donner des noms aux variables, types, constantes, méthodes, ...

Voici la règle à connaître à propos des identificateurs :

Un _ **identificateur** _ doit débuter par une lettre qui peut être suivie d&#39;une séquence de lettres ou de chiffres. **Il ne peut en aucun cas commencer par un chiffre**. Tous les caractères d&#39;un nom de variable sont significatifs, **ainsi que la casse de chaque caractère** (minuscule ou majuscule). La longueur possible d&#39;un nom est théoriquement illimitée.

**Les espacements (white space) :**

Les espacements multiples sont autorisés entre les mots et les opérateurs de la syntaxe Java.
 Le format est libre. Le code peut/doit être décalé pour souligner la logique du programme et faciliter la lecture.

  1.
## Bloc d&#39;instructions

En java, les instructions sont regroupées entre des accolades **{ }**. Le groupe de caractères placé entre ces accolades est appelé bloc d&#39;instructions. C&#39;est, en fait, un ensemble d&#39;instructions. Un bloc peut être imbriqué dans un autre bloc.

**Une instruction :**

i = 42;

**Un bloc d&#39;instructions :**

{

i = 42;
 j = 3;
 k = 0;

}

  1.
## Les Commentaires

**Pour écrire des commentaires dans le code Java :**

- sur une seule ligne : on utilise // suivi du commentaire

- multi-lignes : on utilise /\* les commentaires, … \*/

- pour javadoc : on utilise /\*\* les commentaires pour JAVADOC, ... \*/

Les commentaires en java, comme ceux de la plupart des langages de programmation, n&#39;apparaissent pas dans le programme exécutable. Vous pouvez donc ajouter autant de commentaires que vous le souhaitez sans craindre de gonfler la taille du code compilé.

  1.
## Les types de variables

JAVA est un langage fortement typé, c&#39;est à dire qu&#39;une variable ou un attribut d&#39;une classe aura un type bien défini, contrairement au PHP par exemple, où une variable peut accepter n&#39;importe quelles valeurs quel que soit leur type.

Préciser le type d&#39;une variable permet de coder plus proprement en sachant quel type de données on manipule. Cela permet également de minimiser la place des données occupée en mémoire.

On distingue deux grandes familles de types de données en JAVA :

- Les types primitifs
- Les types objets

  1.
## Les types primitifs

| **Type primitif** | **Signification** | **Place occupée en mémoire** |
| --- | --- | --- |
| byte | Entier très court allant de -128 à +127 | 1 octet |
| short | Entier court allant de -32768 à +32767 | 2 octets |
| int | Entier allant de -2 147 483 648 à +2 147 483 647 | 4 octets |
| long | Entier long allant de -263 à +263 -1 | 8 octets |
| float | Nombre réel allant de -1.4 \* 10-45 à +3.4 \* 1038 | 4 octets |
| double | Nombre réel double précision allant de 4.9 \* 10-324 à +1.7 \* 10308 | 8 octets |
| char | Caractère unicode (65536 caractères possibles) | 2 octets |
| boolean | variable booléenne (valeurs : vrai ou faux) | 1 octet |

**Exemple d&#39;utilisation des types primitifs :**

Entiers

int i = 0;

long l = 2L ; //entier long

int j = 0234 ; //Notation octale = 4 + 3x8 + 2x8²

int k=0XFF6D ; //Notation héxadécimale

Réels

double d = 100.02; //Double par défaut

float t = 2.5f ; //Float

double x = 3.1E12 ; // Notation virgule flottante (mantisse et exposant)

final double PI = 3.14159; //declaration d&#39;une constante

Caractères

char c = &#39;A&#39; ;

char n = &#39;\n&#39; ; //Saut de ligne

  1.
## Le type objet String

_String_ est une classe de base du langage pour les chaînes de caractères. Elle contient des caractères _Unicode_ sur 16 bits. On peut utiliser les opérateurs plus &quot;+&quot; et plus égale &quot;+=&quot; pour la
 concaténation.

String chaineUn = &quot;abcde&quot;;
 String chaineDeux = &quot;fghij&quot;;
 String chaineTrois;
 chaineTrois = chaineUn + chaineDeux;
 chaineTrois += chaineDeux; // chaineTrois = chaineTrois + chaineDeux
 System.out.println(&quot;chaineTrois = &quot; + chaineTrois);

La classe String possède les méthodes suivantes :

**charAt** (int)renvoie le nième caractère de la chaîne

**compareTo** (String)compare la chaîne avec l&#39;argument

**concat** (String)ajoute l&#39;argument à la chaîne et renvoie la nouvelle chaîne

**endsWith** (String)vérifie si la chaîne se termine par l&#39;argument

**equalsIgnoreCase** (String)compare la chaîne sans tenir compte de la casse

**indexOf** (String)renvoie la position de début à laquelle l&#39;argument est contenu dans la chaîne

**lastIndexOf** (String)renvoie la dernière position à laquelle l&#39;argument est contenu dans la chaîne

**length** ()renvoie la longueur de la chaîne

**replace** (char,char)renvoie la chaîne dont les occurrences d&#39;un caractère ont remplacées

**startsWidt** (String int)Vérifie si la chaîne commence par la sous chaîne

**substring** (int,int)renvoie une partie de la chaîne

**toLowCase** ()renvoie la chaîne en minuscule

**toUpperCase** ()renvoie la chaîne en majuscule

**trim** ()enlève les caractères non significatifs de la chaîne

**Exercice**  : Ecrire un programme qui prend comme paramètre d&#39;entrée une chaine de caractère et l&#39;écrit à l&#39;envers en majuscule.

public class TestString {

public static void main(String[] args) {

String s;

s = args[0].toUpperCase();

for(int i = s.length(); i\&gt;0; i--) {

System.out.print(s.charAt(i-1));

}

}

}

  1.
## java.lang.Math

Les méthodes concernant les mathématiques appartiennent à la classe Math, présente dans java.lang. Cette classe fait donc partie des fondements du langage et, par conséquent, aucun import particulier n&#39;est nécessaire pour utiliser la classe Math.

| [http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html) |
| --- |
| static double | [**abs**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#abs(double))(double a)
           Returns the absolute value of a double value. |
| static float | [**abs**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#abs(float))(float a)
           Returns the absolute value of a float value. |
| static int | [**abs**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#abs(int))(int a)
           Returns the absolute value of an int value. |
| static long | [**abs**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#abs(long))(long a)
           Returns the absolute value of a long value. |
| static double | [**acos**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#acos(double))(double a)
           Returns the arc cosine of an angle, in the range of 0.0 through _pi_. |
| static double | [**asin**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#asin(double))(double a)
           Returns the arc sine of an angle, in the range of -_pi_/2 through _pi_/2. |
| static double | [**atan**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#atan(double))(double a)
           Returns the arc tangent of an angle, in the range of -_pi_/2 through _pi_/2. |
| static double | [**atan2**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#atan2(double,%20double))(double y,double x)
           Converts rectangular coordinates (x, y) to polar (r, _theta_). |
| static double | [**ceil**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#ceil(double))(double a)
           Returns the smallest (closest to negative infinity) double value that is not less than the argument and is equal to a mathematical integer. |
| static double | [**cos**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#cos(double))(double a)
           Returns the trigonometric cosine of an angle. |
| static double | [**exp**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#exp(double))(double a)
           Returns Euler&#39;s number _e_ raised to the power of a double value. |
| static double | [**floor**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#floor(double))(double a)
           Returns the largest (closest to positive infinity) double value that is not greater than the argument and is equal to a mathematical integer. |
| static double | [**IEEEremainder**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#IEEEremainder(double,%20double))(double f1,double f2)
           Computes the remainder operation on two arguments as prescribed by the IEEE 754 standard. |
| static double | [**log**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#log(double))(double a)
           Returns the natural logarithm (base _e_) of a double value. |
| static double | [**max**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#max(double,%20double))(double a,double b)
           Returns the greater of two double values. |
| static float | [**max**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#max(float,%20float))(float a,float b)
           Returns the greater of two float values. |
| static int | [**max**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#max(int,%20int))(int a,int b)
           Returns the greater of two int values. |
| static long | [**max**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#max(long,%20long))(long a,long b)
           Returns the greater of two long values. |
| static double | [**min**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#min(double,%20double))(double a,double b)
           Returns the smaller of two double values. |
| static float | [**min**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#min(float,%20float))(float a,float b)
           Returns the smaller of two float values. |
| static int | [**min**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#min(int,%20int))(int a,int b)
           Returns the smaller of two int values. |
| static long | [**min**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#min(long,%20long))(long a,long b)
           Returns the smaller of two long values. |
| static double | [**pow**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#pow(double,%20double))(double a,double b)
           Returns the value of the first argument raised to the power of the second argument. |
| static double | [**random**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#random())()
           Returns a double value with a positive sign, greater than or equal to 0.0 and less than 1.0. |
| static double | [**rint**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#rint(double))(double a)
           Returns the double value that is closest in value to the argument and is equal to a mathematical integer. |
| static long | [**round**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#round(double))(double a)
           Returns the closest long to the argument. |
| static int | [**round**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#round(float))(float a)
           Returns the closest int to the argument. |
| static double | [**sin**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#sin(double))(double a)
           Returns the trigonometric sine of an angle. |
| static double | [**sqrt**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#sqrt(double))(double a)
           Returns the correctly rounded positive square root of a double value. |
| static double | [**tan**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#tan(double))(double a)
           Returns the trigonometric tangent of an angle. |
| static double | [**toDegrees**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#toDegrees(double))(double angrad)
           Converts an angle measured in radians to an approximately equivalent angle measured in degrees. |
| static double | [**toRadians**](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/Math.html#toRadians(double))(double angdeg)
           Converts an angle measured in degrees to an approximately equivalent angle measured in radians. |

Note : une méthode est caractérisée par sa **signature** qui comporte :

- le type retourné
- le nom de la méthode
- le nombre de paramètres
- le type de chaque paramètre

Ainsi, on peut avoir plusieurs méthodes qui portent le même nom du moment que l&#39;un des autres éléments qui compose sa signature est différent.

  1.
## Conversion de types primitifs

La conversion entre types arithmétiques différents est automatique tant qu&#39;on ne perd pas d&#39;information. Si on risque une perte d&#39;information, il faut faire une conversion explicite ( **cast** )
 Une conversion automatique est faite dans les contextes suivants :

- expressions arithmétiques
- évaluation des paramètres des méthodes
- affectations

**Exemples de conversion :**

int i, j, k;
 long x;
 float f;
 double d;
 // ...
 i = j; // aucune conversion nécessaire
 x = i; // OK
 i = x; // KO, on pourrait perdre une info
 i = (int) x; // OK, conversion explicite (cast)
 d = i; // OK
 f = d; // KO

  1.
## Les tableaux

Un tableau est un ensemble ordonné **d&#39;éléments de même type**. Il peut contenir tous les types de données : types primitifs ou objets. La taille peut être fixée dynamiquement à l&#39;allocation et n&#39;est pas modifiable par la suite.

Un tableau se construit en 3 étapes :

1. Déclaration : quel est le type de données que contient le tableau et quel est le nom de la variable ?
2. Allocation : combien d&#39;éléments contient le tableau ?
3. Initialisation : quelles sont les valeurs du tableau ?

L&#39;allocation se fait avec le mot réservé «  **new**  ».

Différentes syntaxes permettent de condenser ces 3 étapes en 2 étapes ou en 1 étape.

**Déclaration et allocation d&#39;un tableau :**

// 1. Déclaration

int[] monTableau ;

//ou

int monTableau[] ;

// 2. Allocation

monTableau = **new** int[10] ; // 10 entiers, les indices allant de 0 à 9

//par défaut, les nombres sont initialisés à 0.

// 3. Initialisation

monTableau[0] = 1;
 monTableau[1] = 2;
 monTableau[2] = 10;

...
 monTableau[9] = 11;

**Regroupement des étapes de création d&#39;un tableau :**

int[] monTableau ;
 monTableau = **new** int[] {1,2,3,4} ;
**...**

**Déclaration, allocation et initialisation regroupées :**

int[] monTableau = {1,2,3,4} ;

**Parcourir un tableau :**

**for** (int index = 0 ; index \&lt; monTableau. **length** ; index++)
 {
 monTableau[index] = index + 1;
 }

int i=0;

for(int valeur : monTableau) {

System.out.println(&quot;La valeur du tableau à l&#39;indice &quot; + i +&quot; est : &quot; + valeur + &quot;\n&quot;);

i++;

}

**Tableaux multi-dimensionnels**

double monTableau[][];

monTableau = new double[5][5] ;

monTableau = { {0,2,4,6,8},{1,3,5,7,9} } ;

//ou en une seule étape

int monTableau[][]= { {0,2,4,6,8},{1,3,5,7,9} };

**Exercice :**

1. Déclarer un tableau de caractères initialisé avec {&#39;H&#39;,&#39;e&#39;,&#39;l&#39;,&#39;l&#39;,&#39;o&#39;,&#39; &#39;,&#39;W&#39;,&#39;o&#39;,&#39;r&#39;,&#39;l&#39;,&#39;d&#39;}.

2. Déclarer un tableau de double de dimensions [2][5].

3. Déclarer un tableau de chaine de caractéres initialisé avec « chaine\_x », x allant de 1 à 100.

public class TestTableau {

public static void main(String[] args) {

char[] tab = {&#39;H&#39;,&#39;e&#39;,&#39;l&#39;,&#39;l&#39;,&#39;o&#39;,&#39; &#39;,&#39;W&#39;,&#39;o&#39;,&#39;r&#39;,&#39;l&#39;,&#39;d&#39;};

for(char c : tab) {

System.out.print(c);

}

System.out.println(&quot;\ntableau à 2 dimensions :&quot;);

double monTableau[][];

monTableau = new double[2][5] ;

for(int i=0; i\&lt;2; i++) {

for(int j=0; j\&lt;5; j++) {

monTableau[i][j]=(i+1)\*j;

System.out.println(monTableau[i][j]);

}

}

String maChaine[] = new String[100];

for (int i = 0; i \&lt; maChaine.length; i++) {

maChaine[i]=&quot;chaine\_&quot; + i;

System.out.println(maChaine[i]);

}

}

}

1. **Le langage Java : structures de contrôles**
  1.
## Portée des variables

En Java on peut déclarer des variables n&#39;importe où dans le code.

**La variable est locale au bloc qui la contient****.**

...
 int i = 4;
 int j = 3;

{

int j = 5; // Erreur : j est déjà déclaré
 int k = 6;

}

i = j + k; // Erreur : k n&#39;est plus connu

  1.
## if … else

**Exemple de code pour illustrer l&#39;utilisation du if … else :**

if ( a \&lt; b )
 c = 2; // une seule instruction pour le chemin Vrai

if ( i == 0 )

{

// début du bloc pour le chemin Vrai
 k = 4;
 m = 2;

}

// fin du bloc pour le chemin Vrai
else // facultatif

{

// début du bloc pour le chemin Faux
 k = 0;
 m = 3;

}

// fin du bloc pour le chemin Faux

Il est possible de renvoyer une valeur parmi 2 en fonction d&#39;un test :

**(**condition**) ?** valeur renvoyée si vrai **:** valeur renvoyée si faux

**Exemple :**

String sx = (unChar == &#39;H&#39;) ? &quot;OK&quot; : &quot;KO&quot;;

  1.
## switch : alternative généralisée

**Exemple de code pour illustrer l&#39;utilisation du switch … case :**

**char** action;
 ...
**switch** (action)

{

**case**&#39;I&#39;:
 // Traitement Insertion
**break** ;
**case**&#39;M&#39;:
 // Traitement Modification
 // Attention, on continue si on ne met pas le break !
**case**&#39;D&#39;:
**case**&#39;S&#39;:
 // Traitement Suppression(D ou S)
**break** ;
**default** :
 // action non valide !

}

  1.
## While : iteration de zéro à n fois

int[] tableau = {1, 2, 3, 4, 5};
 int somme = 0;
 int i = 0;
**while** ( i \&lt; tableau. **length** ) // test en entrée
 {

somme = somme + tableau [i];
 i = i + 1;

}

// affichage dans la console :
**System.out.println** (&quot;somme = &quot; + somme);

  1.
## Do … while : iteration de 1 à n fois

int[]tableau = {1, 2, 3, 4, 5};
 int somme = 0;
 int i = 0;
**do**
 {

somme = somme + tableau [i];
 i = i + 1;

}
**while** ( i \&lt; tableau. **length** ); // test en sortie

**System.out.println** (&quot;somme = &quot; + somme);

  1.
## for : iteration contrôlée par paramètres

int[] a = {1, 2, 3, 4, 5};
 int somme = 0;
**for (int i = 0 ; i \&lt; a.length ; i = i + 1)**
 {

somme = somme + a[i];
 }
**System.out.println** (&quot;somme = &quot; + somme);

  1.
## Sortie de boucle : break, continue

**break** : permet de sortir de la boucle.

**continue** : permet de reboucler directement (sans exécuter les instructions qui suivent).

for(int i = 0; i \&lt; 10; ++i)
 {

for(int k = 0; k \&lt; 20; ++k)

{

if (...) break; // sort de la boucle interne
 // ...
 if (...) continue // Passe directement à la partie incrément de k
 // ...
 } // fin de la boucle interne (sans label)

... // le break vient exécuter cette ligne
 } // fin de la boucle i

  1.
## Opérateurs pour comparer les expressions

| **Opérateur** | **Signification** |
| --- | --- |
| **==** | **Egalité** |
| **\&lt;** | **Inférieur** |
| **\&gt;** | **Supérieur** |
| **\&gt;=** | **Supérieur ou égal** |
| **\&lt;=** | **Inférieur ou égal** |
| **!=** | **différent de** |
| **!** | **Négation (ne pas)** |
| **&amp;&amp;** | **Et** |
| **||** | **Ou inclusif** |
| **|** | **Ou inclusif** |
| **^** | **Ou exclusif** |

**Opérateurs par ordre décroissant de priorité**  :

 Arithmétique : + , - , \* , / , %
 Affectation : =, += , -= , \*= , /= , %= , &amp;= , |= , ^=
 Incrémentation/Décrémentation : ++ , --
 Comparaison  : == , != ,\&lt; , \&lt;= , \&gt; , \&gt;=
 Test unaire   : condition ? expression si vrai : expression si faux
 Logiques &quot;bit à bit&quot; sur booléens : &amp; (ET), | (OU), ^ (OU exclusif)
 Logiques : &amp;&amp;(ET), || (OU)
 instanceof : est de type

1. **Eclipse Juno**

Eclipse est un IDE (Integrated Development Environment) multi-langage et multi-plateforme (pour cause, il est écrit en Java !).

Le principe d&#39;Eclipse est que toutes les fonctionnalités de cet atelier logiciel sont développées en tant que plug-in. On y trouve :

- Un éditeur de code pour pratiquement tous les langages avec une fonction d&#39;assistance à la saisie par auto-complétion.
- La possibilité de compiler des programmes, de les exécuter, de les déboguer.
- …etc.

Plusieurs logiciels commerciaux sont basés sur ce logiciel libre comme par exemple _IBM Lotus Notes 8_, _IBM Symphony_ ou _WebSphere Studio Application Developer_.

  1.
## Installation

L&#39;installation consiste simplement à dézipper le fichier :

  **I:\Tertiaire\Stagiaires\DA1\1.Cours\Informatique\0 - Installations de logiciels\ eclipse-java-juno-SR2-win32.zip**

  1.
## Lancement

Exécuter le fichier **eclipse.exe**. A la première exécution, eclipse va vous demander de créer un répertoire de travail (workspace) qui contiendra vos projets.

  1.
## Utilisation

Commençons par créer un projet java : Fichier -\&gt; Nouveau -\&gt; Projet Java

L&#39;éditeur se compose de 4 fenêtres de base :

1. Editor : située au centre, c&#39;est l&#39;éditeur de code
2. Outline : située à droite, fenêtre de visualisation des classes (package, hiérarchie, classes) d&#39;un projet.
3. Package : à gauche, affiche l&#39;arborescence des fichiers par projet.
4. Console : située en bas, affiche le résultat de l&#39;exécution (et les erreurs).

**Note : Fonctionnalités d&#39;accessibilité dans**** Eclipse**

Eclipse utilise Microsoft Active Accessibility (MSAA) API pour rendre les éléments d&#39;interface utilisateur accessible aux technologies d&#39;assistance.

Vous pouvez utiliser toutes les fonctionnalités en utilisant le clavier à la place de la souris.

[http://help.eclipse.org/galileo/topic/org.eclipse.platform.doc.user/concepts/accessibility/accessmain.htm](http://help.eclipse.org/galileo/topic/org.eclipse.platform.doc.user/concepts/accessibility/accessmain.htm)

Vous pouvez utiliser le logiciel de lecteur d&#39;écran comme JAWS Freedom Scientific TM et d&#39;un synthétiseur vocal pour entendre ce qui est affiché sur l&#39;écran. Vous pouvez également utiliser un logiciel de reconnaissance vocale, telles que IBM ViaVoice TM pour entrer des données et pour naviguer dans l&#39;interface utilisateur.

Vous pouvez agrandir ce qui est affiché sur votre écran dans les vues graphiques.

Les polices et couleurs définies par Eclipse peuvent être réglé dans Général\&gt; Apparence\&gt; Couleurs.

**Quelques raccourcis clavier :**

| **CTRL - F7** | Permet de faire défiler les différentes fenêtres de base. |
| --- | --- |
| **F12** | Accès direct à l&#39;éditeur de code. |
| **CTRL - F6** | Permet de faire défiler les différents fichiers ouverts dans la fenêtre d&#39;édition. |
| **CTRL - F11** | Exécute le fichier actuellement actif dans la fenêtre d&#39;édition. |
| **CTRL - F4** | Ferme le fichier en cours d&#39;édition. |

1. **Exemples**
  1.
## Programme principal

En java, tout est classe. Tous les fichiers java contiennent des classes avec des méthodes qui font appel à d&#39;autres classes.

Pour qu&#39;un programme java s&#39;exécute, il faut qu&#39;une classe du projet possède une méthode spéciale qui est le point de départ du programme : main().

**public**** class** MonProgramme {

**public**** static ****void** main(String[] args) {

System.out.print(″Ceci est le début de MonProgramme″);

}

}

La méthode doit forcément être déclaré « public static void main() »

  1.
## Lecture du clavier

La classe **java.util.Scanner** permet de lire différent systèmes d&#39;entrées (clavier, fichier,…etc).

[http://download.oracle.com/javase/6/docs/api/java/util/Scanner.html](http://download.oracle.com/javase/6/docs/api/java/util/Scanner.html)

**import** java.util.Scanner;

**public**** class** MonProgramme {

**public**** static ****void** main(String[] args) {

//Déclarationduscanner sur l&#39;entrée standard, icileclavier.

Scanner sc= **new** Scanner(System._in_);

//Lecture d&#39;une donnéede type int.

**int** i=sc.nextInt();

//Affichesurlasortie standard, icile console.

System._out_.print(i);

}

}

  1.
## Boite de dialogue

La gestion des boites de dialogue se fait avec la classe **javax.swing.JOptionPane**.

[http://download.oracle.com/javase/1.4.2/docs/api/javax/swing/JOptionPane.html](http://download.oracle.com/javase/1.4.2/docs/api/javax/swing/JOptionPane.html)

**import** javax.swing.JOptionPane;

**public**** class** MonProgramme {

**public**** static ****void** main(String[] args) {

String nom;

nom = (String) JOptionPane._showInputDialog_( **null** , &quot;Entrez votre nom :&quot;, &quot;Ma Boite&quot;, JOptionPane._PLAIN\_MESSAGE_);

JOptionPane._showMessageDialog_( **null** , nom);

System._exit_(0);

}

}

  1.
## Jeu de bluffe

Créer le jeu suivant qui se joue à deux joueurs :

- On commence par demander au 1er joueur de saisir son nom.
- Ensuite on demande au Second joueur de saisir son nom.
- Le jeu se joue en une dizaine de tours.
- A chaque tour, on demande à chaque joueur de saisir un nombre entre 1 et 10. On compare les 2 nombre : celui qui a choisi le nombre le plus grand ajoute son nombre à son score tandis que l&#39;autre ajoute le double de son nombre à son score.
- Le gagnant est le premier à avoir un score de 100 ou plus.

A chaque tour on affichera un récapitulatif des tours précédents et du score.

1. **Les classes Java**

Pour pouvoir manipuler des objets, il est essentiel de définir des classes, c&#39;est-à-dire définir la structure d&#39;un objet. Cette définition avec Java se fait de la manière suivante :

class Nom\_de\_la\_classe {

// Instructions permettant de définir la classe;

}

Un objet est une instance de classe (une classe peut s&#39;apparenter à un moule pour la création d&#39;objet). La création d&#39;un objet s&#39;appelle donc l&#39;_instanciation_. Cette instanciation se fait grâce à l&#39;opérateur _new_ suivi du nom de la classe à instancier et de paramètres éventuels d&#39;initialisation.

Nom\_de\_la\_classe nom\_de\_objet = new Nom\_de\_la\_classe() ;

**Par convention :**

- le nom d&#39;une classe commence par une majuscule.
- Le nom d&#39;une instance de classe (donc un objet) commence par une minuscule.

  1.
## Attributs

Jusqu&#39;ici notre classe est vide (elle est toutefois syntaxiquement correcte), c&#39;est-à-dire qu&#39;elle ne contient ni données (appelées _données membres ou attributs_) ni traitements (fonctions appelées _méthodes_).

Les attributs sont des variables stockées au sein d&#39;une classe. Elles définissent l&#39;état d&#39;un objet. Elles doivent être précédées de leur type et (éventuellement) d&#39;une étiquette précisant leur portée, c&#39;est-à-dire si les autres classes ont le _droit_ d&#39;y accéder.

Ces étiquettes sont au nombre de trois :

- public : accessible par tout le monde.
- private : accessible uniquement à l&#39;intérieur de la classe
- protected : accessible par les classes appartenant au même package et par les classes héritées.
- « vide » : par défaut, les attributs sont protected.

Par convention, le nom d&#39;un attribut commence par une minuscule.

**Exemple**  :

class Voiture {

public char marque[32];

private float vitesse;

protected int prix;

}

  1.
## Méthodes

Les méthodes représentent les traitements qu&#39;il est possible de réaliser dans une classe.

Elles définissent le comportement d&#39;un objet.

La définition d&#39;une méthode se fait en définissant la signature et le corps de la fonction à l&#39;intérieur de la classe.

Rappel : une méthode est caractérisée par sa **signature** qui comporte :

- le type retourné
- le nom de la méthode
- le nombre de paramètres
- le type de chaque paramètre

Il est possible d&#39;avoir plusieurs méthodes qui portent le même nom du moment que leur signature diffère.

Les méthodes suivent les mêmes règles que les attributs pour ce qui est de leur accessibilité depuis une autre classe (public, private, protected).

Par convention, l&#39;identificateur d&#39;une méthode commence par une minuscule.

class Nom\_de\_la\_classe {

// Instructions permettant de définir les données membres de la classe;

...;

// Instructions permettant de définir les méthodes de la classe;

portée type\_de\_valeur\_renvoyée nom\_de\_la\_methode(type\_du\_parametre1 para1, type\_du\_parametre2 para2, ..){

// Instructions du corps de la méthode

}

}

**Remarque** :

- «  **type\_de\_valeur\_renvoyée**  » représente le type primitif ou la classe que la méthode est sensée retourner (char, int, float, String, ArrayList...).
- Si la méthode ne renvoie aucune valeur, on la fait alors précéder du mot-clé «  **void**  ».
- Une méthode doit obligatoirement préciser le type de retour ou « void » (sauf dans le cas des constructeurs).
- Pour renvoyer une valeur par une méthode, on utilise l&#39;instruction « return » suivi de la valeur.

  1.
## Encapsulation

Puisque tout est classe en java, un programme java est une classe qui va instancier des objets d&#39;autres classes qui elles-mêmes instancieront d&#39;autres classes …etc.

Chacun de ses objets pourront ou non faire appel aux attributs et méthodes des autres classes en fonction des droits d&#39;accès qui auront été défini.

Soit A une classe, un membre de cette classe (un attribut ou une méthode) est accessible depuis d&#39;autres classes en fonction de l&#39;étiquette de portée qui l&#39;a définie, à savoir :

- **public**  : le membre est accessible par toutes classes.
- **private**  : le membre est accessible uniquement à l&#39;intérieur de la classe A.
- **protected**  : le membre est accessible par les classes appartenant au même package que la classe A et par les classes dérivées de la classe A.
- « vide » : par défaut, le membre est accessible par les classes appartenant au même package.

  1.
## Constructeur

Dans une classe, il existe une méthode particulière, appelée le constructeur, qui est invoquée au moment de l&#39;instanciation d&#39;un objet avec l&#39;opérateur « new » et qui sert à initialiser un objet.

Un constructeur se définit comme une méthode standard, mais ne renvoie aucune valeur.

- un constructeur porte le même nom que la classe dans laquelle il est défini.
- un constructeur n&#39;a pas de type de retour (même pas _void_).
- un constructeur peut avoir des arguments.
- la définition d&#39;un constructeur n&#39;est pas obligatoire (s&#39;il n&#39;y rien de spécial à faire à l&#39;instanciation d&#39;un objet).
- il est possible d&#39;avoir plusieurs constructeurs (ils doivent différer par leur signature).
- le constructeur doit être déclaré « public » (sinon il est impossible de créer un objet).
- Il existe un constructeur par défaut (implicite) qui ne prend aucun paramètre et qui ne fait rien.

**Exemple**  :

class Personne {

protected int age;

protected char sexe;

protected float taille;

public Personne (int age, char sexe, float taille){

this.age = age;

this.sexe = sexe;

this.taille = taille;

   }

public Personne (){

this(0,null,0); //Appel du constructeur à 3 parametres

   }

}

  1.
## this() dans un constructeur

« this() » , avec éventuellement des paramètres, représente l&#39;appelle d&#39;un constructeur. Son utilisation suit les règles suivantes :

- il apparait obligatoirement dans un constructeur,
- il apparait obligatoirement en première instruction,
- il n&#39;apparait qu&#39;un seule fois par constructeur.

**Note :**

- « this » (sans parenthèse) sert à accéder aux attributs et méthode de la classe.
- « this() » sert à accéder aux constructeurs.

  1.
## Surcharge de méthodes (overload)

Le fait de pouvoir déclarer des méthodes qui portent le même nom à condition que leur signature diffère, s&#39;appelle la surcharge de méthodes (overload). On dit que la méthode est surchargée (overloaded).

  1.
## Exemple

**Exercice**

1. Créer une classe « Hasard » qui possède comme attribut :

- un tableau d&#39;entiers

Et qui possède les méthodes suivantes :

+ Un constructeur sans paramètre qui initialise le tableau avec 10 entiers tirés au hasard.

+ Un constructeur avec comme paramètre d&#39;entrée un entier N, qui initialise le tableau avec N entiers tirés au hasard.

+ Une méthode « somme » qui calcule la somme des entiers du tableau.

+ Une méthode « moyenne » qui calcule la moyenne des entiers du tableau.

2. Créer dans le même package que la classe « Hasard » une classe « Run » qui sera le programme principale (donc qui contient une méthode « main ») et qui effectue les tâches suivantes :

- Demande à l&#39;utilisateur de saisir un nombre N.

- Instancie un objet à partir de la classe Hasard avec N éléments.

- Affiche la somme et la moyenne.

3. Ajouter à la classe Hasard la méthode &quot;Addition&quot; qui possède 2 implémentations :

+ Addition(int x) qui addition l&#39;entier passé en paramètre à chaque élément de &quot;tableau&quot;.

+ Addition(int[] t) qui addition l&#39;élément i du tableau passé en paramètre à l&#39;élément i de &quot;tableau&quot;.

4. Dans le programme principal, créer 2 instances de &quot;Hasard&quot; et faire l&#39;addition des 2.

  1.
## Le mot clé « static »

Le mot clé « static » utilisé devant une variable ou une méthode indique que celle-ci n&#39;appartient pas à une instance particulière de la classe.

Les variables ou méthodes statiques appartiennent à la classe elle-même. On peut ainsi les utiliser sans avoir créé d&#39;instance. On accède directement à ces membres à travers le nom de la classe.

Par exemple la classe Math :

float f = Math.PI ; //attribut PI

f = Math.abs(45) ; //méthode abs()

  1.
## Le mot clé « final »

Le mot clé Java **final** a des sens légèrement différents suivant le contexte, mais en général il signifie « Cela ne peut pas changer ».

Le mot clé final s&#39;applique à 3 types d&#39;élément : les attributs, les méthodes et les classes.

**Final avec un attribut :**

- Si l&#39;attribut est un type primitif alors l&#39;attribut est une constante dont la valeur initiale ne peut être modifiée.
- Si l&#39;attribut est un objet alors c&#39;est la référence qui est constante (ce qui ne correspond à rien de bien précis, on évitera donc de type d&#39;utilisation).

**Final avec une méthode :** la méthode ne peut pas être réécrite (voir l&#39;héritage).

**Final avec une classe :** la classe ne peut pas être héritée par une sous-classe (voir l&#39;héritage).

1. **Héritage**

  1.
## Principe

Le problème classique en programmation est le suivant : on a des structures de données proches sur lesquelles on doit faire des traitements identiques pour certaines données communes et des traitements spécifiques pour quelques données spécifiques.

Les solutions classiques sont souvent peu satisfaisantes :

- Soit on crée deux procédures différentes avec une partie des traitements qui est dupliquée.
- Soit on intègre les traitements dans un même programme et on utilise une structure alternative pour les traitements spécifiques.

Avec la programmation objet où structure de données et traitements sont regroupés dans une classe, il va être possible d&#39;optimiser la solution à ce problème grâce au concept d&#39;héritage.

Il est possible de définir une nouvelle classe à partir d&#39;une classe existante :

- La nouvelle classe hérite des attributs et méthodes de la classe mère.
- La nouvelle classe peut définir de nouveaux attributs et méthodes qui lui sont spécifiques.
- La nouvelle classe peut redéfinir des méthodes héritées de la classe mère.

L&#39;héritage est le troisième des paradigmes de la programmation orientée objet, le 1er étant l&#39;encapsulation, le 2e la structure de classe.

L&#39;emploi de l&#39;héritage conduit à un style de programmation par spécialisation successive et permet une programmation incrémentielle.

L&#39;héritage représente une relation: EST-UN

Exemple:

- Un chat est un animal
- Une moto est un véhicule
- Un cercle est une forme

Note : Les attributs d&#39;une classe représentent la relation: A-UN

- Une voiture a un moteur
- Une personne a un nom

  1.
## Hiérarchisation

**Exemple de hiérarchie de classes :**

classe Animal

classe Herbivore héritée de Animal

classe Lapin héritée de Herbivore

classe Carnivore héritée de Animal

classe Lion héritée de Carnivore

classe Loup héritée de Carnivore

classe Omnivore héritée de Animal

classe Homme héritée de Omnivore

La classe Animal est dite classe de base des classes Herbivores, Carnivores, Omnivores. On parle également de superclasse ou de classe mère.

Les classes obtenues par dérivation d&#39;une classe de base sont dites classes dérivées. Lapin est une classe dérivée de Herbivore qui est une classe dérivée de Animal. On parle également de sous-classes ou de classes filles.

Lors de l&#39;instanciation d&#39;une classe, celle-ci hérite de l&#39;ensemble des propriétés et des méthodes de sa superclasse, qui elle-même hérite d&#39;une éventuelle superclasse, etc.

Le travail principal du programmeur consiste à concevoir une hiérarchie de classe, c&#39;est-à-dire organiser les classes de telles façon que les propriétés et méthodes communes à plusieurs classes soient placées dans une superclasse.

Grâce à ce système organisationnel, il est aisé de réutiliser des composants existants et de leur ajouter un comportement. De plus, la modification de la superclasse implique la modification automatique de toutes les sous-classes.

On répond ainsi à deux problématiques :

- La possibilité de reprendre intégralement tout ce qui a déjà été fait et de pouvoir l&#39;enrichir (vision descendante) : la classe Véhicule étant définie, on peut la reprendre intégralement pour construire les classes Vélo et Voiture.
- La possibilité de regrouper en un seul endroit ce qui est commun à plusieurs structures (vision ascendante) : on regroupe dans une classe Véhicule les caractéristiques communes aux classes Camions et Automobiles.

En java, la superclasse commune à toutes les classes est la classe **Object** (java.lang.Object) qui implémente les méthodes :

- **equals** ()
- **toString** ()
- **clone** ()

  1.
## Syntaxe de l&#39;héritage : extends

**class** Classe\_dérivée **extends** Classe\_de\_base {

//attributs et méthodes spécifiques

}

Exemple :

**public**** class** Vehicule {

**protected**** float**vitesse;

**protected**** int**nombreDePassager;

**public**** void** affichage() {

System._out_.println(&quot;Vitesse max : &quot; + **this**.vitesse);

}

}

**public**** class **Avion** extends** Vehicule{

**protected**** int**nombreDeMoteur;

**public**** void** afficheVitesseParMoteur() {

**this**.affichage();

System._out_.print(&quot;Vitesse par Moteur : &quot; + **this**.vitesse / **this**.nombreDeMoteur);

}

}

Dans la classe dérivée, on accède aux méthodes et aux attributs de la superclasse, comme s&#39;ils faisaient partie de la classe dérivée, avec le mot clé « this ».

  1.
## Constructeur d&#39;une classe dérivée

Les constructeurs ne font pas partie de l&#39;héritage. Or l&#39;instanciation d&#39;un objet à partir d&#39;une classe dérivée doit tenir compte du constructeur de la superclasse (pour construire un Avion, il faut construire d&#39;abord un Véhicule).

On va donc construire un objet dérivé en 2 étapes :

- Construire la partie superclasse de l&#39;objet en faisant appel à un constructeur de la superclasse, en utilisant le mot clé « super() » suivi des paramètres correspondant à la signature du constructeur que l&#39;on veut utiliser.
- Construire la partie dérivée en initialisant les données spécifiques à la classe dérivée.

L&#39;appel à _super()_ doit être la première instruction du constructeur.

**public**** class** Vehicule {

**protected**** float**vitesse;

**protected**** int**nombreDePassager;

**protected** Vehicule( **float** vitesse, **int** nombreDePassager) {

**this**.vitesse = vitesse;

**this**.nombreDePassager = nombreDePassager;

}

}

**public**** class **Avion** extends** Vehicule{

**protected**** int**nombreDeMoteur;

**protected** Avion( **float** vitesse, **int** nombreDePassager) {

**super** (vitesse, nombreDePassager);

**this**.nombreDeMoteur = 1;

}

}

  1.
## Droits d&#39;accès et héritage

Rappel sur la portée des membres d&#39;une classe :

- **public**  : le membre est accessible par toutes classes.
- **private**  : le membre est accessible uniquement à l&#39;intérieur de la classe A.
- **protected**  : le membre est accessible par les classes appartenant au même package que la classe A et par les classes dérivées de la classe A.
- « vide » : par défaut, le membre est accessible par les classes appartenant au même package.

Dans un contexte d&#39;héritage, si les membres de la superclasse sont :

- **public** ou « **rien** » : les membres de la classe dérivée auront accès à ces membres (attributs et méthodes),
- **private** : les membres de la classe dérivée n&#39;auront pas accès aux membres privés de la classe de base.
- **protected :** un membre de la superclasse déclaré protected est accessible à ses classes dérivées ainsi qu&#39;aux classes du même paquetage.

Les classes déclarées « final » ne peuvent pas être dérivées.

  1.
## Réécriture de méthode (override)

Une méthode contenue dans une superclasse peut être réécrite (ou redéfinie) dans une classe dérivée. La méthode de la classe dérivée doit avoir la même signature que celle de la superclasse.

Néanmoins il est possible de faite appel à la méthode de la superclasse en utilisant la syntaxe « super.nom\_de\_la\_méthode() ».

Exemple :

Dans la superclasse « Vehicule », on a définie une méthode void affichage().

Dans la classe dérivée « Avion », on peut réécrire cette méthode comme suit :

**public**** void** affichage () {

**super**.affichage();

System._out_.print(&quot;Nombre de Moteur : &quot; + **this**.nombreDeMoteur);

}

Les méthodes déclarées « final » ne peuvent pas être réécrites.

1. **Concepts avancés**

  1.
## Notion d&#39;interface

**Définition**

Une interface est constituée d&#39;un ensemble de déclarations de méthodes sans implémentation. On n&#39;y trouve uniquement la signature de chaque méthode.

Les interfaces sont définies comme une classe dans un fichier .java mais avec le mot clé **interface** à la place de «  **class**  ».

Une classe peut implémenter une ou plusieurs interface(s) : la définition de la classe comporte alors le mot clé **implements** suivi d&#39;une liste de noms d&#39;interfaces (les noms des interfaces implantées y sont séparés par une virgule). La classe devra alors définir le code de chacune des méthodes de l&#39;interface qu&#39;elle implémente.

**Exemple :**

Une interface définie dans le fichier «  **Normable.java**  » (on ne définit que la signature de la méthode).

publicinterface Normable {

double norme();

}

Une classe qui implémente **Normable** (donc la méthode « norme » doit être totalement implémentée).

**public**** class **Complexe** implements** Normable {

**double** a=0;

**double** b=0;

**protected** Complexe( **double** a, **double** b) {

**this**.a = a;

**this**.b = b;

}

@Override

**public**** double** norme() {

**return** Math._sqrt_(a\*a + b\*b);

}

}

**Utilisation et but**

Une interface représente un ensemble de méthodes qui, une fois implémentées dans une classe, fournies des aptitudes complémentaire à la classe. En général, l&#39;interface porte un nom de type adjectif. Par exemple :

Runnable = capable d&#39;être exécuté

Drawable = capable de s&#39;afficher

Sortable = capable d&#39;être trié

Ceci permet de bien séparer les activités au sein d&#39;une classe et d&#39;améliorer ainsi la lecture du code. En effet, la seule lecture de la déclaration de la classe nous permet de prendre connaissance de l&#39;intégralité des activités de celle-ci. Par exemple une classe, disons &quot;Ensemble&quot; qui implémente l&#39;interface Sortable nous renseigne dès sa déclaration sur la notion d&#39;aptitude au tri qui lui a été attribuée.

  1.
## Classe abstraite

Une classe abstraite est une classe comportant des attributs et des méthodes classiques ainsi qu&#39;une au plusieurs méthodes non implémentées et définies uniquement que par leur signature (on parle de méthodes abstraites).

Une classe abstraite n&#39;est pas instanciable.

**A quoi ça sert ?**

Une classe abstraite a pour vocation d&#39;être héritée par des classes concrètes. Une classe qui hérite d&#39;une classe abstraite doit implémenter les méthodes abstraites.

L&#39;intérêt est de définir les grandes lignes du comportement de toutes les classes filles sans forcer l&#39;implémentation des détails de l&#39;algorithme.

Par rapport à une interface, la classe abstraite permet de définir à la fois des méthodes abstraites, et des attributs et des méthodes concrètes.

**Syntaxe**

/\*\* La classe abstraite employée : \*/

public abstract class Employe {

// bla bla bla

/\*\* définition d&#39;une méthode abstraite

\* on notera qu&#39;il n&#39;y a pas d&#39;instruction et un point-virgule à la fin

\*/

public abstract void licencier();

}

// Class Ouvrier

public class Ouvrier extends Employe {

// définition du code de licencier

public void licencier() {

// on definit le code

System.out.println(&quot;Dehors !&quot;);

}

}

// Class Patron

public class Patron extends Employe {

// définition du code de licencier

public void licencier() {

System.out.println(&quot;Veuillez comprendre que dans la conjoncture actuelle ... !&quot;);

}

}