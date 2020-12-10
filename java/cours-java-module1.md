# Java (Module 1Bis)

## 1.Présentation générale de Java

**Les programmes Java existent sous 3 formes :**

- **Application**

- **Applet (Navigateur Web)**
- **Servlet (Serveur Web)**

En java, tout code exécutable se trouve dans une classe (_MonFichier_.class).

**Cycle de développement Java ?**

Fichier source : MonFichier.java
 Compilation : **javac** MonFichier.java
 Résultat de la compilation : MonFichier.class (fichier binaire = ByteCode)
 Exécution : **java** Monfichier

**Pour aller plus loin …**

Architecture Client/Serveur « **3 tiers**  » :

![](RackMultipart20201102-4-7b1c1s_html_76ed01b8555dff05.jpg)

Le **Middleware** permet de faire le lien entre le poste client et le Serveur. On peut traduire ce mot par «  **Médiateur** ». Il _assure les connexions entre les serveurs de données et les outils de développement sur les postes clients_. Le **Middleware** est en fait une **couche de logiciels très spécifiques du client-serveur** qui cache les réseaux et les mécanismes de communication associés. Ce service de logiciels se trouve au dessus de la couche dite de « transport » et permet l&#39;échange de requêtes et de réponses entre clients et serveur. Le **Médiateur** assure une _liaison transparente en cachant l&#39;hétérogénéité des composants mis en jeu_ (réseaux, SGBD, langages,…).

Exemples de Middleware : [EAI](http://fr.wikipedia.org/wiki/Int%C3%A9gration_d&#39;applications_d&#39;entreprise), [ETL](http://fr.wikipedia.org/wiki/Extract_Transform_Load), [CORBA](http://fr.wikipedia.org/wiki/CORBA), [HLA](http://fr.wikipedia.org/wiki/HLA), [File d&#39;attente de message](http://fr.wikipedia.org/wiki/File_d&#39;attente_de_message), [ODBC](http://fr.wikipedia.org/wiki/ODBC).

Le middleware se situe « au-dessous » de l&#39;applicatif, « au-dessus » du système d&#39;exploitation et « entre » deux logiciels ayant besoin de communiquer entre eux.

Par exemple, le couple **SQL\*Net et ODBC** forme un Middleware. Il y a 3 catégories de Middleware :

- « Orientés objets ou composants distribués » : ce sont les ORB ou [Object Request Broker](http://fr.wikipedia.org/wiki/Object_Request_Broker).
- « Transactionnels » : ce sont les [moniteurs transactionnels](http://fr.wikipedia.org/w/index.php?title=Moniteur_transactionnel&amp;action=edit) (comme CICS d&#39;IBM, Tuxedo de BEA, MTS de Microsoft, JTS de Sun, TopEnd de NCR ou encore Jaguar de Sybase, ...)
- « Orientés messages » : ce sont les [MOM](http://fr.wikipedia.org/wiki/MOM) (comme MQ Series d&#39;IBM, [JMS](http://fr.wikipedia.org/wiki/JMS) de Sun, MSMQ de Microsoft).

Architecture Client/Serveur « **Multi-tiers**  » :

![](RackMultipart20201102-4-7b1c1s_html_57f84777dc1ca822.jpg)

Le traitement est distribué au travers d&#39;Internet. Le client Web (navigateur) demande des pages HTML au serveur Web. Les traitements relatifs aux pages Web sont faits sur le serveur d&#39;applications. Les données sont stockées sur le serveur de données. Java peut tourner sur toutes ces machines.

# 2.Qu&#39;est-ce que JAVA ?

Un langage de programmation Orienté Objet développé par **Sun microsystems**.

Un _ensemble de bibliothèques standardisées_ (classes regroupées en packages) qui supportent entre autres :

- La création d&#39;interfaces graphiques (GUI)
- Les communications sur les réseaux
- Le contrôle de données multimédia,

Et puis, une machine virtuelle …

# 3.Qu&#39;est-ce que la Machine Virtuelle JAVA ?

Une _Machine Virtuelle_ (JVM pour Java Virtual Machine) est une [machine virtuelle](http://fr.wikipedia.org/wiki/Machine_virtuelle) permettant d&#39;interpréter et d&#39;exécuter le [bytecode Java](http://fr.wikipedia.org/wiki/Bytecode_Java).

![](RackMultipart20201102-4-7b1c1s_html_6846cfe604ce31c6.png)

Le programme généré est spécifique à chaque [plate-forme](http://fr.wikipedia.org/wiki/Plate-forme) et permet aux applications [Java](http://fr.wikipedia.org/wiki/Langage_de_programmation_Java) compilées en Bytecode de produire (normalement) les mêmes résultats sur toutes les plateformes pourvues d&#39;une machine virtuelle. Celle de [Sun Microsystems](http://fr.wikipedia.org/wiki/Sun_Microsystems) est la plus utilisée car elle est gratuite et libre. Le 11 novembre 2006, Sun a publié les sources de sa machine virtuelle HotSpot et de son compilateur javac sous licence OpenSource GPL.

La machine virtuelle Java garantit la portabilité. Voici les 3 formes de programmes Java quelque soit l&#39;Operating System (OS).

**-** _**Application - JVM – OS
 - Navigateur Web - Applet - OS – JVM
 - Serveur d&#39;applications - Servlet - JVM - Serveur Web – OS**_

# 4.Qu&#39;est-ce que le compilateur JIT ?

Bien que Java soit interprété, des compilateurs _Just-In-Time_ permettent la compilation dans la JVM du byte-code en code machine (instructions binaires natives).

Ceci permet :

- Une amélioration des performances
- Une meilleure adaptation aux spécificités du matériel

# 5.Que sont les packages (paquetages) de Java ?

Un package est une _archive comprenant les fichiers informatiques_ utilisés par un logiciel ou un système d&#39;exploitation.

Interfaces graphiques (GUI signifie Graphic User Interface) :

- Bibliothèque complète de classes de fenêtres
- Facilité de construction de l&#39;interface graphique

Support du réseau :

- Accès standards aux fichiers, images, ... via URL
- Support complet des « [Stream](http://fr.wikipedia.org/wiki/Stream) sockets » donnant accès à tous les services Internet.
- Chargement dynamique de classes au travers du réseau

Images et audio :

- Création d&#39;objets Image à partir de _.gif, .jpg_, etc.
- Interfaces pour manipulations d&#39;images (« filtres »)
- Les Applets peuvent jouer des fichiers audio

Lien vers le site de Sun pour la documentation **J2SE 1.4.2** avec toutes les Classes :

[http://java.sun.com/j2se/1.4.2/docs/api/](http://java.sun.com/j2se/1.4.2/docs/api/)

Lien vers le site de Sun pour la documentation **J2SE 1.5.0** avec toutes les Classes :

[http://java.sun.com/j2se/1.5.0/docs/api/](http://java.sun.com/j2se/1.5.0/docs/api/)

Lien vers le site de Sun pour la documentation **Java 6** avec toutes les Classes :

[http://java.sun.com/javase/6/docs/api/](http://java.sun.com/javase/6/docs/api/)

Lien vers la documentation de la société **ETEK** sur le langage Java (pas forcément mis à jour) :

[http://www.eteks.com/coursjava/tdm.html#LangageJava](http://www.eteks.com/coursjava/tdm.html#LangageJava)

# 6.Quelles sont les entités logiciels apparues avec Java ?

- JavaBean ([lien vers le web](http://fr.wikipedia.org/wiki/Java_bean))
- Applet ([lien vers le web](http://fr.wikipedia.org/wiki/Applet))
- Servlet ([lien vers le web](http://fr.wikipedia.org/wiki/Servlet))
- JSP ([Java Server Page](http://fr.wikipedia.org/wiki/JavaServer_Pages))
- EJB ([Enterprise JavaBean](http://fr.wikipedia.org/wiki/EJB)s)

Pour information, les classes java auparavant dites « javaBean » sont de plus en plus appelées **POJO** (Plain Old Java Object). Cela pour éviter toute confusion avec les classes EJB « Enterprise JavaBean » que nous étudierons l&#39;année prochaine en vue du cours JEE5 plus connue sous le nom de J2EE.

# 7.Quels sont les atouts de JAVA ?

Java a été développé pour répondre à plusieurs besoins mal couverts par les langages précédents. Tous les principes suivants ont été pris en compte lors de son développement :

- Orientation Objet ([définition](http://fr.wikipedia.org/wiki/Orient%C3%A9_objet))
- Portabilité ([définition](http://fr.wikipedia.org/wiki/Portabilit%C3%A9_(informatique)))
- Performance
- Sécurité
- Internationalisation
- Traitements distribués
- Systèmes dynamiques

# 8.Comment est structuré un programme traditionnel ?

Le programme principal (appelé généralement _main_) contient des données, une procédure principale et des procédures fonctionnelles (dites sous-routines) avec ou sans données locales. Un sous-programme est structuré comme un programme principal. On passe des données entre les programmes. Les sous-programmes sont souvent réutilisés, mais pas les programmes « main ».

# 9.Comment est structuré une application Java ?

Les applications Java sont constituées d&#39; **objets** , pas de programmes. _Chaque objet possède ses données et exécute des traitements sur ces données_. Chaque objet est une **instance** d&#39;une **classe** :

La classe contient la définition des données d&#39;une instance et les traitements pertinents sur ces données. Des classes bien conçues peuvent être ré-utilisées par de nombreuses applications. Le taux de réutilisation du code est très important.

# 10.Quels sont les outils de développement actuel pour Java ?

L&#39;environnement de développement de base est le Java2 Software Development Kit (SDK). Dans les versions précédentes on parlait de Java Development Kit (JDK).

Il existe d&#39;autres environnements plus sophistiqués pour développer en Java, en particulier :

- VisualAge for Java – IBM
- Visual J++ - Microsoft
- JBuilder - Borland/Inprise
- VisualCafé - Symantec/WebGain
- Les produits WebSphere d&#39;IBM, basés entre autres sur Java, permettent de développer des sites Webs complets. WSAD 6.0
- Eclipse 3, Lomboz WTP, MyEclipse 6.0
- NetBeans 6.0 (de Sun)

# 11.Quelles sont les versions de Java ?

1995 (mai) : premier lancement commercial 1996
 1996 (janvier) : JDK 1.0
 1996 (septembre) : lancement du JDC
 1997 (février) : JDK 1.1
 1998 (décembre) : lancement de J2SE et du JCP
 1999 (décembre) : lancement J2EE
 2000 (mai) : J2SE 1.3
 2002 : J2SE 1.4
 2004 : J2SE 5.0

2006 : Java 6.0 (Mustang)

Sun fourni gratuitement un ensemble d&#39;outils et _d&#39;API_ pour permettre le développement de programmes avec Java. Ce kit, nommé _JDK_, est librement téléchargeable sur le site web de Sun [http://java.sun.com](http://java.sun.com/) ou par FTP [ftp://java.sun.com/pub/](ftp://java.sun.com/pub/).

Le _JRE_ (Java Runtime Environment) contient uniquement l&#39;environnement d&#39;exécution de programmes Java.

Le _JDK_ contient lui même le _JRE_. Seul le _JRE_ doit être installé sur les machines où des applications Java doivent être exécutées.

Depuis sa version 1.2, Java a été renommé Java 2. Les numéros de version 1.2 et 2 désignent donc la même version. Le JDK a été renommé J2SDK ( **Java 2 Software Development Kit** ) mais la dénomination JDK reste encore largement utilisée, à tel point que la dénomination JDK est reprise dans la version 5.0. Le JRE a été renommé J2RE ( **Java 2 Runtime Environment** ).

Trois éditions de Java existent :

**J2ME** : Java 2 Micro Edition ([définition](http://fr.wikipedia.org/wiki/Java_2_Micro_Edition))

**J2SE** : Java 2 Standard Edition ([définition](http://fr.wikipedia.org/wiki/J2SE))

**J2EE** : Java 2 Entreprise Edition ([définition](http://fr.wikipedia.org/wiki/J2EE)) Renommé depuis peu JEE 5 relatif à la nouvelle version.

Sun fourni le JDK, à partir de la version 1.2, sous les plate-formes _Windows_, _Solaris_ et _Linux_.

La version 1.3 de Java est désignée sous le nom Java 2 version 1.3.

La version 1.5 de Java est désignée officiellement sous le nom _J2SE version 5.0_.

La documentation au format HTML des API de Java est fournie séparément. Malgré sa taille imposante, cette documentation est indispensable pour obtenir des informations complètes sur toutes les classes fournies.

# 12.Utilisation de l&#39;IDE Eclipse d&#39;IBM (Interface de développement)

### Installation :

Le logiciel **Eclipse** est installé sur votre machine. Nous allons utiliser cette interface de développement tout au long des cours Java.

#### Eclipse va nous permettre :

D&#39;éditer les programmes sous Microsoft windows

De les sauvegarder et de les charger

De les compiler

De les exécuter

De visualiser les classes, de déboguer…

Dernière minute : Nous utiliserons Eclipse (logiciel libre) en version Française de la société IBM pour programmer en JAVA. Il sera / est installé sur vos machines ainsi que le J2SE de Sun.

#### Présentation de l&#39;éditeur et configuration :

##### L

Barre d&#39;outils

 ![](RackMultipart20201102-4-7b1c1s_html_340e9ff12553fbaa.gif) &#39;éditeur Eclipse

![](RackMultipart20201102-4-7b1c1s_html_153a3c2598ace1cc.png)

Fenetre de visualisation des classes

 ![](RackMultipart20201102-4-7b1c1s_html_75c2ef8ac6878ab0.gif)

Fenetre de visualisation d&#39;exécution

 ![](RackMultipart20201102-4-7b1c1s_html_fdafb13afb0060ef.gif) ![](RackMultipart20201102-4-7b1c1s_html_73515d1e64d7d99.gif)

Editeur de programmation

### Un éditeur Java se compose généralement de 3 fenêtres de base :

Visualisation des classes (package, hiérarchie, classes) par projet.

Editeur de programme (écriture de la classe)

Visualisation du résultat de l&#39;exécution et saisie des données (tâches, …) en console

#### La configuration :

Pour réaliser des compilations et des exécutions, il faut que l&#39;éditeur connaisse les adresses du compilateur et du runtime (interpréteur de code).

Vous pouvez également éditer votre texte avec **NOTEPAD** ou **EDIT** si vous ne voulez pas utiliser un EDI Java. N&#39;oubliez pas de sauvegarder vos fichiers avec l&#39;extension «  **.java ».**

**Voici quelques raccourcis d&#39;Eclipse :**

**CTRL-F7** Permet d&#39;ouvrir une fenêtre puis en maintenant les touches CTRL et F7 enfoncées, sélectionner à l&#39;aide de la flèche bas la fenêtre sur laquelle vous voulez vous positionner.

**F1** Lance la fenêtre d&#39;aide d&#39;Eclipse.

**F4** Accès à la fenêtre des hiérarchies des classes objets existantes dans le projet.

**F3** Ouvre la classe sélectionnée dans la hiérarchie.

**CTRL-F3** Ouvre toutes les classes du projet avec les composants.

**CTRL-F4** Ferme la fenêtre en cours.

**ALT- R** puis N pour lancer l&#39;exécution du programme en cours.

appuyez sur la touche Entrée

positionnez-vous sur la class main de votre projet si ce n&#39;est pas le cas !

**ALT- R**  : pour lancer l&#39;exécution.

**F12** Accès à l&#39;éditeur de code java s&#39;il est ouvert.

# 13.Découverte de la syntaxe et de la structure d&#39;un programme

Le plus petit programme réalisable en java pourrait être le suivant :

/\* =================================

Exemple 2.1.1 (PetitProgramme.java)

Affichage d&#39;un texte à l&#39;écran

dans la fenêtre en mode commande

Cours Java - Guinot

\*/ =================================

// Définition d&#39;une classe appelée petitprogramme

**class** PetitProgramme

// accolade de début de la classe petitprogramme

{

// Définition de la méthode MAIN pour exécuter le programme JAVA

public static void main (String args[])

{ // accolade de début de la méthode MAIN

// Syntaxe pour afficher une ligne de texte

**System.out.println** (« Mon petit programme en Java »);

} // accolade de fin de la méthode MAIN

} // accolade de fin de la classe petitprogramme

Après compilation et exécution, le programme affiche « _Mon petit programme en Java »_ dans la console java d&#39;Eclipse.

##### Voici le même programme que le précédent avec une gestion graphique :

// Voici une ligne de commentaires

/\* Voici un début de plusieurs lignes de commentaires comme en C

Exemple 2.1.2 (petitProgramme2.java)

Affichage d&#39;un texte dans une boite de dialogue

avec javax.swing.JOptionPane (Gestion des boites de dialogue)

Cours Java - Guinot

importation du paquetage d&#39;extension de Java pour l&#39;affichage. Vous devez toujours importer vos paquetages (packages en anglais) en début de programme. Les paquetages ou packages sont des catégories de classes que les programmeurs peuvent utiliser sans réinventer la roue !

Le nom du package commence par java s&#39;il appartient au noyau de java

Le nom du package commence par javax s&#39;il appartient à un paquetage d&#39;extension.

Le package Javax.swing propose des classes pour créer des GUI Graphical User Interface (interfaces utilisateur graphiques).

La méthode showMessageDialog requiert 2 arguments ou plus séparés par une virgule.

\*/

// importer la classe JOptionPane

import javax.swing.JOptionPane;

// Définition d&#39;une classe appelée petitprogramme2

**class** PetitProgramme2

// accolade de début de la classe petitprogramme

{

// Définition de la méthode MAIN pour exécuter le programme JAVA

public static void main (String args[])

// accolade de début de la méthode MAIN

{

/\* méthode permettant l&#39;affichage d&#39;un texte dans une boite de dialogue.

le premier null permet de centrer automatiquement la boite à l&#39;écran, le reste concerne ce que nous voulons afficher.

la syntaxe est _NomClasse.NomMéthode_(liste des arguments)

\*/

**JOptionPane.showMessageDialog** (null, « Mon deuxième petit programme en Java » );

**System.exit** ( 0 );

/\*

pour terminer une application GUI, il nous faut appeler la méthode exit de la classe System.

\*/

} // accolade de fin de la méthode MAIN

} // accolade de fin de la classe petitprogramme2

# 14.Notions d&#39;instruction

La plus petite unité indépendante d&#39;un programme en Java est l&#39;instruction. Comme vous avez pu le constater, _ **chaque instruction doit se terminer par le symbole** _ **point-virgule ;**

En langage naturel, cela correspond à une phrase. L&#39;instruction est constituée **d&#39;identificateurs** et de **symboles**.

Exemple :

Int maValeur ;

maValeur = 10 + 45 ;

System.out.println(«  La Valeur est : «  +maValeur) ;

Les _ **identificateurs** _ servent à donner des noms aux variables, types, constantes, méthodes, ...

Voici la règle à connaître à propos des identificateurs :

Un _ **identificateur** _ doit débuter par une lettre qui peut être suivie d&#39;une séquence de lettres ou de chiffres. **Il ne peut en aucun cas commencer par un chiffre**. De plus, il ne peut pas contenir de caractère de ponctuation ni d&#39;espace. Remarquez que le sens des termes « _lettres_ » et « _chiffres_ » est plus large en Java que dans beaucoup d&#39;autres langages. Une lettre est définie comme l&#39;un des caractères A . . . z , a . . . z , &#39; \_&#39; ou n&#39;importe quel caractère _ **Unicode** _ représentant une lettre dans une langue quelconque. Par exemple, un utilisateur français ou allemand peut employer des caractères accentués tels que « _ **à** _ » ou « _ **é** _ », dans un nom de variable. De même, les lecteurs grecs peuvent utiliser _ **µ** _. Tous les caractères d&#39;un nom de variable sont significatifs, **ainsi que la casse de chaque caractère** (minuscule ou majuscule). La longueur possible d&#39;un nom est théoriquement illimitée.

**Les espacements (white space) :**

Les espacements multiples sont autorisés entre les mots et les opérateurs de la syntaxe Java.
 Le format est libre. Le code peut/doit être décalé pour souligner la logique du programme et faciliter la lecture.

## Bloc d&#39;instruction

En java, les instructions sont regroupées entre des accolades **{ }**. Le groupe de caractères placé entre ces accolades est appelé bloc d&#39;instructions. C&#39;est, en fait, un ensemble d&#39;instructions. Un bloc peut être imbriqué dans un autre bloc.

**Une instruction :**

i = 42;

**Un bloc d&#39;instructions :**

{

i = 42;
 j = 3;
 k = 0;

}

## Les Commentaires

**Comment écrire des commentaires dans le code Java ?**

- sur une seule ligne : on utilise // suivi du commentaire

- multi-lignes : on utilise /\* les commentaires, … \*/

- pour javadoc : on utilise /\*\* les commentaires pour JAVADOC, ... \*/

Les commentaires en java, comme ceux de la plupart des langages de programmation, n&#39;apparaissent pas dans le programme exécutable. Vous pouvez donc ajouter autant de commentaires que vous le souhaitez sans craindre de gonfler la taille du code compilé. Java propose trois types de commentaires. Le plus courant est double slache **//** qui débute un commentaire allant jusqu&#39;à la fin de ligne.

Pour les commentaires sur plusieurs lignes, il est plus courant d&#39;employer slache -étoile **/\***** au début **et étoile- slache** \*/ en fin**.

# 15.Compilation, édition de liens et exécution

#### Avec Eclipse 3.3

Si vous disposez d&#39;Eclipse, Vous devez recompiler le projet en passant par les commandes du Menu **Projet** (ATL- P) puis de choisir **Recompiler Tout**.

#### Sans EDI

Sous MSDOS et dans le répertoire où se trouve le programme avec l&#39;extension **.java** tapez :

##### Javac petitProgramme.java

Une fois la compilation terminée, le programme **petitProgramme.class** sera crée.

#### Exécution du programme :

Le compilateur Java édité par Sun est un compilateur qui ne permet pas la gestion complète du projet comme en turbo pascal ou en turbo C. L&#39;exécution se fera par l&#39;intermédiaire d&#39;un **runtime,** une JVM, c&#39;est ce qui explique la lenteur au démarrage d&#39;une application Java :

#### Avec Eclipse

Il vous suffit d&#39;aller sur le menu **Exécuter** (ALT-x) puis de Taper **x (ou choisir Exécuter)**. Ensuite une fenêtre pour le choix du projet s&#39;ouvre. Appuyez sur la touche **Entrée** pour vous positionner sur la classe main de votre projet. Ensuite lancer l&#39;exécution avec la combinaison de touche **ALT-U.**

#### Sans IDE

Sous MSDOS et dans le répertoire où est sauvegardé votre programme tapez la ligne suivante :

#### Javac.exe PetitProgramme2

# 16.Types primitifs

Nous avons déjà vu que java est un langage **FORTEMENT TYPE.** On doit toujours déclarer le **TYPE** d&#39;une **VARIABLE**.

**Quels sont les types utilisés ?**

**Type Précision Valeur par défaut**
 byte 8 bits 0
 short 16 bits 0
 int 32 bits 0
 long 64 bits 0
 char 16 bits \u0000
 float 32 bits +0.0f
 double 64 bits +0.0d
 boolean N/A false

**Exemples d&#39;expressions de valeurs littérales :**

**Entiers**
 2 (int par défaut)
 2L (long)
 0777 (octal)
 0Xa5fd (hexadécimal)

**Réels**
 3.14 (double par défaut)
 3.1E12
 2e12
 2.0d
 2.0F

**Booléen**
 true
 false

**Caractère**
 &#39;a&#39;
 &#39;\n&#39;
 &#39;\udddd&#39;

**String**
  « abcde »

**Type objet**

Null

#### Exemple d&#39;Utilisation des types de base :

Déclaration d&#39;un _entier_ **i** initialisé à zéro :

int i = 0;

Déclaration d&#39;un _entier_ **k** initialisé à 4 :

int k = 4;

Déclaration d&#39;un _double_ **d** initialisé à 100.02 :

double d = 100.02;

Déclaration d&#39;un nombre _flottant_ **f** initialisé à 2.5 :

float f = 2.5_f_;

Déclaration d&#39;une _constante_ de type double **PI** initialisé à 3,14159 :

final double PI = 3.14159;

**Chaîne de caractères : String**

_String_ est une classe de base du langage pour les chaînes de caractères variables. Elle contient des caractères _Unicode_ sur 16 bits. On peut utiliser les opérateurs plus « + » et plus égale « += » pour la
[concaténation](http://fr.wikipedia.org/wiki/Concat%C3%A9nation) :

String chaineUn = &quot;abcde&quot;;
 String chaineDeux = &quot;fghij&quot;;
 String chaineTrois;
 chaineTrois = chaineUn + chaineDeux;
 chaineTrois += chaineDeux; // chaineTrois = chaineTrois + chaineDeux
 System.out.println(&quot;chaineTrois = &quot; + chaineTrois);

# 17.Qu&#39;est-ce qu&#39;un tableau, comment le déclarer ?

C&#39;est un ensemble ordonné d&#39;éléments de même type ( **collection** ). Il peut contenir tous les types de données : types _primitifs_ ou _objets_. _La taille peut être fixée dynamiquement à l&#39;allocation et n&#39;est pas modifiable par la suite_. Après sa _déclaration_ il doit être _alloué_, puis _initialisé_ : _sa déclaration n&#39;est donc qu&#39;une référence_. Cas particulier, l&#39;initialisation statique condense ces 3 actions sur une même ligne. On peut créer facilement des tableaux à _n_ dimensions.

**Déclaration et allocation d&#39;un tableau :**

**Déclaration :**

int[] monTableau ; // ou int monTableau[] ;

**Allocation :**

monTableau = **new** int[10] ;

(i) (c)

Soit : 0 0
 1 0
 2 0
 3 0
 4 0
 5 0
 6 0
 7 0
 8 0
 9 0

( c ) = contenu

( i ) = index du tableau

**Initialisation d&#39;un tableau (élément par élément) :**

monTableau[0] = 1;
 monTableau[1] = 2;
 monTableau[2] = 10;
 monTableau[3] = 11;
**...**

#### Initialisation d&#39;un tableauavec une boucle for :

**for** (int index = 0 ; index \&lt; monTableau. **length** ; index++)
 {
 monTableau[index] = index + 1;
 }

(i) (c)

Soit : 0 1
 1 2
 2 3
 3 4

( c ) = contenu

( i ) = index du tableau

**Regroupement des étapes de création d&#39;un tableau :**

**Allocation et initialisation regroupées :**

int[] monTableau ;
 monTableau = new int[] {1,2,3,4} ;
**...**

**Déclaration, allocation et initialisation regroupées :**

int[] monTableau = {1,2,3,4} ;

(i) (c)

Soit : 0 1
 1 2
 2 3
 3 4

( c ) = contenu

( i ) = index du tableau

# 18.Portée des variables

En Java on peut déclarer des variables n&#39;importe où dans le code.
_La variable est locale au bloc qui la contient_.

...
 int i = 4;
 int j = 3;

{

int j = 5; // Erreur : j est déjà déclaré
 int k = 6;

}

i = j + k; // Erreur : k n&#39;est plus connu

# 19.if … else : Alternative à 2 chemins

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

# 20.switch : alternative généralisée

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

# 21.While : iteration de zéro à n fois

int[] tableau = {1, 2, 3, 4, 5};
 int somme = 0;
 int i = 0;
**while** ( i \&lt; tableau. **length** ) // test en entrée
 {

somme = somme + tableau [i];
 i = i + 1;

}

// affichage dans la console :
**System.out.println** (« somme = «  + somme);

# 22.Do … while : iteration de 1 à n fois

int[]tableau = {1, 2, 3, 4, 5};
 int somme = 0;
 int i = 0;
**do**
 {

somme = somme + tableau [i];
 i = i + 1;

}
**while** ( i \&lt; tableau. **length** ); // test en sortie

**System.out.println** (« somme = «  + somme);

# 23.for : iteration contrôlée par paramètres

int[] a = {1, 2, 3, 4, 5};
 int somme = 0;
**for (int i = 0 ; i \&lt; a.length ; i = i + 1)**
 {

somme = somme + a[i];
 }
**System.out.println** (« somme = «  + somme);

# 24.Sortie de boucle : break, continue

**break** : permet de sortir de la boucle
**continue** :permet de reboucler sans exécuter en séquence
**break et continue** :peuvent être suivis d&#39;un label (étiquette) :

- Sans label  : ils agissent sur la boucle qui les contient
- Avec un label  : ils peuvent agir sur une boucle de niveau supérieur

**boucle1** : for(int i = 0; i \&lt; 10; ++i)
 {

for(int k = 0; k \&lt; 20; ++k)

{

// ...

if (...) break; // sort de la boucle interne
 // ...
 if (...) continue **boucle1** ; // Passe directement à la partie incrément de boucle1 ++i
 // ...

} // fin de la boucle interne (sans label)

... // le break vient exécuter cette ligne
 } // fin de la boucle externe boucle1

# 25.Opérateurs pour comparer les expressions

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
 Logiques « bit à bit » sur booléens : &amp; (ET) , | (OU) , ^ (OU exclusif)
 Logiques : &amp;&amp;(ET), || (OU)
 instanceof : est de type

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

# 26.Utilisation de classes existantes

**Objectifs :**

- Comprendre la relation entre les objets et les classes
- Comprendre et manipuler les références d&#39;objets
- Connaître les conventions pour dénommer les classes et les variables
- Savoir instancier les objets et appeler leurs méthodes
- Se familiariser avec les classes _String_, _Vector_ et &#39;wrapper&#39; dites « enveloppes »

**Découvertes des Objets :**

- le monde réel est composé d&#39;objets.
- Certains de ces objets peuvent être traités sur ordinateur.
- La représentation informatique d&#39;un objet du monde réel s&#39;appelle **objet** ou **instance**.
- Un objet contient des données appelées **variables**.
- Un objet contient aussi la définition des traitements qu&#39;on peut effectuer sur ses données : il s&#39;agit des **méthodes**.

# 27.Qu&#39;est-ce qu&#39;un Objet ?

- Si les données ou attributs d&#39;un objet ne sont modifiables que par des méthodes, on parle d&#39; **encapsulation**.
- Les attributs constituent **l&#39;état de l&#39;objet**
- Les méthodes définissent le «  **comportement**  » de l&#39;objet.
- Certains objets sont des représentations du monde réel
- D&#39;autres sont des représentations abstraites ou internes

**Voici un exemple d&#39;objet :**

_Un client d&#39;une société peut être géré dans un objet_

Nom de la _classe_ : Client

Référence de _l&#39;objet_ : trucMuche

_Attributs :_

Mr. Jean TrucMuche
 12, Rue du figuier
 30140 - Anduze

_Méthodes_ (comportement) :

getNom() : Retourne le nom d&#39;un objet de type Client
 setNom() : Initialise le nom d&#39;un objet de type Client
 envoyerRelance() : Réalise un comportement (action)

![](RackMultipart20201102-4-7b1c1s_html_4d11e08791429655.jpg)

### Peut-on parler d&#39;objet ?

- compte bancaire
- employé
- une fraction
- un âge

# 28.Distinction entre objet et Classe

Voici 3 objets :

Attributs : Mr. Jean TrucMuche 12, Rue du figuier 30140 – Anduze
 Méthodes  : getNom(), setNom(), envoyerRelance()

Attributs : Mme Magali Vergne 2, Rue des arbouses 34510 - Florensac
 Méthodes  : getNom(), setNom(), envoyerRelance()

Attributs : Mr. Marc Pignon Chemin du muscat 34400 - Lunel
 Méthodes  : getNom(), setNom(), envoyerRelance()

**On a bien 3 objets différents mais ce sont toujours TROIS Clients****.**
**La valeur des attributs (données) est spécifique à chacun****.**
**Les opérations à réaliser sur ces données sont les mêmes****.**

On dit que ces 3 objets sont des **instances** de la même **classe.**

**Instance** et **Objet** sont synonymes.

# 29.La Classe : type de données abstrait

## La classe est un MOULE ou un MODELE pour créer des objets.

En Java chaque objet est **l&#39;instance** d&#39;une classe. Sans classe, il ne peut pas y avoir d&#39;objet !

Toutes les instances d&#39;une classe partagent les mêmes structures de données et les mêmes méthodes. La valeur des données est spécifique à chaque instance. La classe permet une **représentation abstraite** d&#39;objets concrêts (exemple : Client) ou d&#39;objets abstraits (ex : pile, action, compte bancaire, portefeuille d&#39;action, commande, …).

Un diagramme de classe (que nous étudierons en UML) spécifie :

- le nom de la classe
- la définition de ses variables (attributs)
- la définition de ses opérations (méthodes).

#### Exemple de description d&#39;une classe java :

_Nom de la classe : Client_

_Liste des attributs :_

_prenom : String
 nom : String
 age : int_

_Liste des méthodes :
 getAge()
 setAge(int)_

**Voici ci-dessous une représentation sous forme graphique :**

![](RackMultipart20201102-4-7b1c1s_html_f7033e7442b152a8.jpg)

**Comme nous le verrons dans la pratique, Java propose un grand nombre de classes :**

**String** : sert à stocker des mots ou des phrases

**Vector** : ressemble à un tableau, mais avec beaucoup plus de fonctionnalités.

**Wrappers** : classes qui permettent de traiter des types primitifs comme des objets, en
 élargissant ainsi les possibilités de traitements.

**Déclaration des variables avec les types primitifs :**

int i;
 char c;
 float f = 0.0F;

**Déclaration avec des classes existantes :**

String s1;
 Vector v;
 String s2 = null;

**Attention** _ **s1** _ **,** _ **v** _ **et** _ **s2** _ **ne sont que des références d&#39;objets, pas des objets !**

# 30.Méthodes d&#39;instance : comportement des objets

Chaque objet contenant des données peut subir des opérations (traitements). Les opérations sont faites en utilisant les **méthodes** qui recoivent des paramètres et peuvent renvoyer un résultat unique. Les méthodes utilisables sont définies dans la classe.

Une méthode d&#39;instance traduit le **comportement** des objets de la classe à laquelle appartient cette méthode.

Une méthode est constituée :

- d&#39;une _Signature_ (nom de la méthode, type renvoyé et liste des paramètres)
- d&#39;un _Corps_ (implémentation de la méthode entre accolades)

**Pour la classe String voici quelques méthodes avec leur fonctionnalité :**

**Nom de la méthode Explication de son rôle**

**charAt** (int)renvoie le nième caractère de la chaîne

**compareTo** (String)compare la chaîne avec l&#39;argument

**concat** (String)ajoute l&#39;argument à la chaîne et renvoie la nouvelle chaîne

**endsWith** (String)vérifie si la chaîne se termine par l&#39;argument

**equalsIgnoreCase** (String)compare la chaîne sans tenir compte de la casse

**indexOf** (String)renvoie la position de début à laquelle l&#39;argument est contenu dans la chaîne

**lastIndexOf** (String)renvoie la dernière position à laquelle l&#39;argument est contenu dans la chaîne

**lenght** ()renvoie la longueur de la chaîne

**replace** (char,char)renvoie la chaîne dont les occurrences d&#39;un caractère ont remplacées

**startsWidt** (String int)Vérifie si la chaîne commence par la sous chaîne

**substring** (int,int)renvoie une partie de la chaîne

**toLowCase** ()renvoie la chaîne en minuscule

**toUpperCase** ()renvoie la chaîne en majuscule

**trim** ()enlève les caractères non significatifs de la chaîne

# 31.Instanciation d&#39;un objet : création avec le mot clé NEW()

##### Nom de la classe : Client

_Liste des attributs :_

_prenom : String
 nom : String
 age : int_

_Liste des méthodes :
 getAge()
 setAge(int)_

![](RackMultipart20201102-4-7b1c1s_html_f7033e7442b152a8.jpg) ![](RackMultipart20201102-4-7b1c1s_html_6593b7cbba4e9035.gif)

![](RackMultipart20201102-4-7b1c1s_html_4d11e08791429655.jpg)

**L&#39;instanciation consiste à créer un objet, à partir d&#39;une classe (avec le mot clé**  **NEW**** ) :**

Client _trucMuche_ = **new** Client(« jean », »Trucmuche », « 12 rue du figuier », 30140, « Anduze »);

# 32.Comment utiliser une méthode ?

**INVOQUER** une méthode d&#39;instance correspond à la demande d&#39;un service à **l&#39;OBJET** , à l&#39;envoi d&#39;un **MESSAGE**. Nous allons prendre 2 méthodes :

_setNom()
 getNom()_

**La structure est toujours la suivante**  :

MaRéférenceObjet **POINT** MaMéthode **PARENTHESE** Liste des Paramètres **PARENTHESE**

**Voici un appel de la méthode setNom()** :

MonObjetEmploye.setNom(« Zouzou ») ;

**La structure de cet appel est la suivante :**

Référence objet **POINT** nom de méthode (« valeur du paramètre ») ;

**Voici un appel de la méthode getNom()** :

String NomRécupéré = MaRéférenceObjet.getNom();

**La structure de cet appel est la suivante :**

Variable locale = référence objet POINT nom de méthode ;

**D&#39;abord il faut créer un objet :**

String réponse = **new** String(« Oui »);

**Ensuite on peut appeler (invoquer) ses méthodes :**

…
 boolean ditOui = false;
 if ( **reponse.length** () == 1)
 {

if ( **reponse.equalsIgnoreCase** (&quot;o&quot;))
 {

ditOui = true;
 }

}
 else
 {

String mot = reponse.trim();
 if ( **mot.equalsIgnoreCase** (« Oui »))

{

ditOui = true;
 }

}

# 33.Syntaxe spécifique pour les Strings

L&#39;utilisation des _Strings_ est fondamentale en informatique. Le langage Java a créé quelques fonctionnalités spécifiques pour cette classe :

**L&#39;instanciation est automatique (pas forcément besoin d&#39;utiliser new()) :**

Constructeur explicite du String :

String MaChaine = new String(&quot;MaChaine est un objet&quot;);

Constructeur implicite du String :

String MaChaine = &quot;MaChaine est considérée comme un objet avec cette écriture&quot;;

String s = « Hello »;

**Concaténation :**

String chaîneUn = « Bernard »;
 String chaîneDeux = « Martin »;
 String s3 = chaîneUn + «  «  + chaîneDeux;

#### Comparaison de Strings :

La classe _String_ donne des méthodes pour comparer 2 _chaînes_ :

- int **compareTo** (String autreString)
- int **compareToIgnoreCase** (String autreString)
- boolean **equalsIgnoreCase** (String autreString)

Ces 3 méthodes permettent de comparer le contenu d&#39;un _String_ avec le contenu d&#39;un autre _String._

**Les Objets String ne sont pas modifiables**.

Voici une illustration :

Etape 1 : on écrit _**s1 = new String(&quot;Bonjour&quot;);**_
Etape 2 : on écrit _**s1 = new String(&quot;Au revoir&quot;);**_
Etape 3 : on écrit _**s2 = new String(&quot;Au revoir&quot;);**_
Etape 4 : on utilise la fonction de comparaison de Chaînes : _**s1.equals(s2)**_

**Que se passe t-il ?**

Lors de l&#39;étape 2, s1 pointe vers l&#39;objet String Au revoir, tandis que l&#39;objet String Bonjour auparavant référencé est candidat à la poubelle (garbage Collector). Donc, maintenant, S1 pointe vers Au revoir. Lors de l&#39;étape 4, la fonction de comparaison retournera VRAI car s1 et s2 pointent vers des chaînes identiques.

**Attention au piège de la comparaison directe !**

boolean stringsIdentiques = false;
 String s1 = « Texte »;
 String s2 = « Texte »;
**if** ( **s1 == s2** )
 {

**stringsIdentiques = true;**

}

**L&#39;opérateur &#39;==&#39; compare les références, pas les objets !**

# 34.Vector, ArrayList et Tableau

**Java permet de définir des tableaux de primitives ou d&#39;objets :**

int[] tableauDEntier;
 String[] tableauDeChaînes;
 Client[] tableauDObjetsClient ;

Mais ...

- un tableau, une fois créé a un **nombre fixe de postes**
- un tableau ne peut contenir qu&#39;un seul type de données

Mieux vaut utiliser les classes _Vector_ ou _ArrayList_ plus souples :

Par exemple, avec la classe Vector (obsolète), il existe de nombreuses methodes :

- addElement(o:Object)
- capacity():int
- elementAt(i:int):Object
- removeAllElements()
- remove(o:Object):Boolean
- toString():String
- ...

Un _Vector_ peut être agrandi ou réduit suivant le besoin.
 Un _Vector_ peut contenir des références à divers objets, mais il **ne peut contenir de types primitifs**.
 Un _Vector_ peut renvoyer la référence d&#39;un objet si on lui donne un rang (position).
 Quand on enlève un élément d&#39;un _Vector,_ il y a tassage automatique du _Vector._
 La méthode _toString()_ d&#39;un _Vector_ appelle la méthode _toString()_ pour chacun de ses éléments.

**Quelques exemples sur des tableaux simples et des Vectors :**

String[] s = new String[7];
 Vector v = new Vector();

 String jour = « Lundi »;
 s[0] = jour;
 v.add(jour); // ou v.addElement(jour)

 jour = « Mardi »;
 s[1] = jour;
 v.add(jour);

 //...
 String aujourdhui = s[numJour];
 //...ou bien ...
 String aujourdhui = v.elementAt(numJour);

# 35.Utilisation des Wrappers (Classes enveloppes)

Problème : On veut stocker directement un type primitif (par exemple un _int_) dans un _Vector._

**Impossible !!!**

Solution : Utiliser un « wrapper » qui permettra de stocker la référence au type primitif. A chaque type primitif correspond une classe, qu&#39;on nomme wrapper (attention à la majuscule !) : par exemple _Boolean_ est le wrapper du type _boolean._

Attention aux exceptions : _Integer_ et _Character._

Le wrapper stocke simplement une référence au type primitif, ce qui permet plus de possiblités de traitement.

La classe _ **Integer** __ _:

**Elle possède deux constructeurs :**

Integer(String s);
 Integer(int i);

**Il est facile de passer du type primitif à la classe et réciproquement :**

int i = 4;
 Integer objInt = new Integer(i);
 int j = objInt.intValue();

**Détail de la classe présentée dans le graphique de la page suivante :**

**Integer
 Attributs :**
 -value:int

**Méthodes :**
**compareTo** (i:Integer):int
**byteValue** ():byte
**shortValue** ():short
**intValue** ():int
**longValue** ():long
**floatValue** ():float
**doubleValue** ():double
**toString** ():String
 ...

![](RackMultipart20201102-4-7b1c1s_html_9a7df89803154bd6.jpg)

**Tableau des correspondances :**

| **Type origine (primitif)** | **Classe Enveloppe** |
| --- | --- |
| boolean | Boolean |
| integer | Integer |
| long | Long |
| float | Float |
| double | Double |
| char | Character |

# 36.Pourquoi devez-vous utiliser des Package ?

Toute classe appartient à un _ **package** _. Si on ne le spécifie pas explicitement, la classe appartient au package par défaut. Trois raisons pour utiliser les packages :

- **regrouper** des classes pour des raisons d&#39;organisation
- **contrôler** les accès à des données encapsulées
- **éviter** les problèmes de noms de classe identiques

Pour affecter une classe à un package, on utilise la clause _package,_ **obligatoirement en première instruction** :

package paie.info;
 public class ...
 { ... }

**Il existe de nombreux packages de base en Java :**

java.lang
 java.awt
 java.io
 java.math
 java.net
 java.text
 java.util
 ...

Exemple d&#39;importation de package
 import java.util.Vector; // référence explicite à une classe
 import java.text.\*; // référence à toutes les classes d&#39;un package

public class ExempleImport
 {

public static void main(String[] args)
 {
 DateFormat df =DateFormat.getDateInstance(DateFormat.SHORT);
 Vector v = new Vector();
 v.add(df.parse(« 22/03/00 »));
 }

}

# 37.Création de nouvelles classes : Abstraction

**Objectifs :**

Comprendre **l&#39;encapsulation**
 Comprendre **l&#39;agrégation**
 Ecrire des définitions de classe
 Comprendre et utiliser les **méthodes**
 Comprendre et utiliser les **constructeurs**
 Utiliser efficacement les variables

Les classes de base Java sont très utiles pour écrire les programmes mais ne couvrent pas les domaines spécifiques de l&#39;entreprise. **Il faut pouvoir définir et utiliser ses propres classes** , par exemple un _ **Client** __,_ un _ **Compte**__ ,_ une _ **Adresse** __._ Ces objets du monde réel doivent donc être « modélisés » en classes. Ils seront ainsi plus faciles à manipuler.

**On peut supposer qu&#39;un Client est caractérisé par :**

un nom
 une adresse
 une taille
 un poids
 une couleur de cheveux
 un sexe
 un age
 une profession
 des parents
 des amis
 des hobbies, …

**Principe d&#39;Encapsulation**

##
 Quelques éléments de l&#39;objet peuvent être publics, d&#39;autres peuvent être privés.
 En règle générale les données d&#39;un objet sont privées.
 En règle générale les méthodes d&#39;un objet sont publiques.

**Formalisme UML (graphique) pour la classe Client** :

![](RackMultipart20201102-4-7b1c1s_html_757c0b8e562c615f.png)

**Détail du graphisme UML :**

Nom de la classe : Client
**Liste des attributs :**

-nom : String
 -Adresse : Adresse
 -age : int
 -sexe : char
 ...

**Liste des méthodes publiques :**

+setNom()

Ici le symbole moins (-) placé devant les attributs signifie que les attributs sont privés.
 Le symbole plus (+) placé devant la méthode signifie qu&#39;elle doit être déclarées publiques.

# 38.Agrégation

Un objet contient des données dont certaines peuvent elles-même être contenues dans d&#39;autres objets. Les données d&#39;un objet sont souvent **l&#39;agrégation** (la réunion) des données contenues dans d&#39;autres objets.

![](RackMultipart20201102-4-7b1c1s_html_769ff2e3d1d936ae.jpg)

Client Mme Magali Vergne

Adresse : 2 Rue des arbouses Florensac France

Dans cet exemple peu représentatif de la réalité, nous avons un objet Client qui contient lui-même 2 références d&#39;objets Nom et Adresse. L&#39;objet Adresse contient lui-même 4 références différentes d&#39;objets Ligne1, Ligne2, ligne3 et codePostal. Il évident que cet exemple n&#39;a d&#39;utilité que pour illustrer le principe de l&#39;agrégation, il est rare que nous ayons besoin de détailler autant.

# 39.Les méthodes

Une classe contient aussi des méthodes :

Par exemple : _envoiRelance()_

**Exemple avec le formalisme UML :**

![](RackMultipart20201102-4-7b1c1s_html_66dac15693f55426.png)

**Détail du graphisme UML ci-dessus :**

Classe : Client

**Liste des Attributs :**

-taille : int

**Liste des méthodes :**

 +getTaille():int
 +setTaille(t:int)
 +envoiRelance()
 +Client(name:String)
 ...

# 40.Variables d&#39;instance

Une variable d&#39;instance est généralement déclarée privée (_ **private** _) pour assurer l&#39;encapsulation.
 Elle peut contenir une valeur de type primitif ou une référence d&#39;objet. On peut l&#39;initialiser, sinon elle prend la valeur par défaut liée à son type.

private int age;
 private String nom;

Chaque objet (instance) possède ses propres valeurs pour les variables d&#39;instance.

# 41.Méthodes d&#39;instance

Une méthode est l&#39;équivalent d&#39;une fonction effectuant un traitement spécifique pour une classe.
 Comme une fonction, une méthode peut recevoir plusieurs arguments et peut retourner un seul résultat. Une méthode d&#39;instance peut accéder à toutes les variables d&#39;instance de la classe.

**public** String getNom()
 {
 String nom = prenom.trim();
 nom += &#39; &#39;;
 nom += nomFamille.trim();
 return nom;
 }

**Les paramètres des méthodes :**

La définition de la méthode indique le type et le nom des paramètres attendus. A l&#39;appel de la méthode, les valeurs des paramètres sont reçues dans des variables locales. Si une méthode ne renvoit pas de résultat, elle est définie de type _ **void** _et le _ **return** _ est facultatif.

public void setTaille(int t)
 {

taille = t;
 }

# 42.La référence _this_

_ **this** _ représente la référence de l&#39;objet courant. Dans cet exemple, _ **this** _ permet de lever une ambiguïté de nommage entre le nom du paramètre et la variable d&#39;instance :

public void setTaille(int taille)
 {

this.taille = taille;
 }

# 43.Utilisation du mot clé THIS dans un constructeur

...
 private int matricule;
 private String diplome;

Employe(int leMatricule) // premier constructeur
 {

this( leMatricule,&quot;Non défini&quot;);

}

Employe(int leMatricule, String leDiplome) // second constructeur
 {

matricule = leMatricule;
 diplome = leDiplome;

}
 ...

Exemple d&#39;instanciation dans lequel on appelle le premier constructeur qui lui-même appelle le second constructeur grâce au mot clé THIS. Ceci évite de réécrire les mêmes instructions :

new **Employe** (41113);

# 44.Variables locales

Les valeurs des paramètres sont stockées dans des variables locales. On peut définir ses propres variables locales qui peuvent être des types primitifs ou des références d&#39;objets. Une variable locale doit être déclarée et initialisée avant d&#39;être utilisée. Les variables locales sont détruites en fin d&#39;exécution de la méthode. En Java, on doit tenir compte de deux points importants lorsqu&#39;on veut partager des données par paramètres :

Tous les paramètres sont passés par valeur :

## Quand une méthode se termine, toutes ses variables locales sont détruites.

Question : Peut-on permuter deux entiers en appelant une méthode Java ?

Le passage de paramètres en Java :

**Passer par valeur des valeurs ?**

class Swap
 {
 public static void main( String[] args )
 {
 int i = 3, j = 4;
 swap( i, j );
 System.out.println( i + «  et «  + j );
 }
 public static void swap( int x, int y )
 {
 int temp = x;
 x = y;
 y = temp;
 }
 }
 ??? on affiche =\&gt; 3 et 4

**Passer par valeur des références ?**

class Swap2
 {
 public static void main( String[] args )
 {
 Integer i = new Integer( 3 );
 Integer j = new Integer( 4 );
 swap( i, j );
 System.out.println( i + «  et «  + j );
 }
 public static void swap(Integer x, Integer y)
 {
 Integer temp = x;
 x = y;
 y = temp;
 }
 }
 ??? on affiche toujours =\&gt; 3 et 4

**Illustration par l&#39;exemple : Variables d&#39;instance, de classe et locale**

public class Employe

{

// **variable d&#39;instance**
 private String nom;
 private int matricule;

 // **variable de classe ou statique** :
 private static int memoDernierMatricule;

public void setNom(String nom);
 {

// **variable locale** :
 String prefixe = &quot;FI&quot;;
 this.nom = prefixe + nom ;

}
 }

# 45.Surcharge des méthodes

Quand on définit deux ou plusieurs _méthodes de même nom_, on dit que la méthode est «  **surchargée**  » (overloaded). **Ce n&#39;est possible que si les méthodes différent entre elles par le nombre et/ou le type des paramètres**. Par exemple la classe _String_ possède une méthode **substring** _()_ qui est surchargée :

String **substring** (int _indexDebut_)
 String **substring** (int _indexDebut_, int _indexFin_)

# 46.Utilisation des Constructeurs

Instanciation d&#39;une classe par l&#39;instruction **new** _._ L&#39;instruction new invoque un _constructeur._ Toute classe possède un constructeur par défaut, sans paramètres. Si le développeur écrit un constructeur avec des paramètres, le constructeur par défaut n&#39;existe plus. Les initialisations, implicites ou explicites, sont effectuées avant l&#39;exécution des constructeurs.

## Un _constructeur_ est une méthode qui porte le même nom que la classe, il n&#39;est pas typé et ne doit pas être déclaré _void_

Exemple :

Client unClient = new Client(« Martin »); // appel extérieur du constructeur
 ...
 public class Client
 {
 private String nom;
 ...

// Définition d&#39;un conctructeur recevant le nom en argument
 public Client(String n) // réception de l&#39;argument dans une
 // variable locale n
 {

// initialisation de la variable d&#39;instance nom
 nom = n;
 }
 ...
 }

# 47.Surcharge des constructeurs

Déclaration possible de plusieurs constructeurs dans une même classe, de signatures différentes :

Client c = new Client(); // par défaut
 Client c = new Client(«Martin »); // nom
 Client c = new Client(«Martin», 47); // nom et age
 Client c = new Client(6002372); // numéro

En l&#39;absence de déclaration explicite d&#39;un constructeur, le compilateur en crée un par défaut (sans paramètres). A partir d&#39;un constructeur il est possible d&#39;en appeler un autre de la même classe avec l&#39;instruction **this** (_listeDesArguments_) :

public class Client
 {

String nom;
 int age;

public Client(String nom)
 {

_this(nom, 0)_ ; // appel du constructeur à 2 arguments
 ...
 }

public Client(String nom, int age)
 {

this.nom = nom ;
 this.age = age ;

}

}

**Diagramme d&#39;une classe Compte :**

![](RackMultipart20201102-4-7b1c1s_html_4965b7c4219d5736.jpg)

**Code Java de la classe Compte :**

public class Compte
 {
 private int solde;
 public Compte(int depotOuverture)
 {
 solde = depotOuverture;
 }
 public Compte()
 {
 solde = 0;
 }
 public int getSolde()
 {
 return solde;
 }
 public void setSolde(int nouveauSolde)
 {
 solde = nouveauSolde;
 }
 public void depot(int depot)
 {
 setSolde(getSolde() + depot);
 }
 public void retrait(int retrait)
 {
 setSolde(getSolde() - retrait);
 }
 }

**Après avoir écrit et compilé la classe Compte, on peut l&#39;utiliser :**

Compte c1 = new Compte();
 Compte c2 = new Compte(3250);
 c1.depot(25000);
 c2.retrait(1250);
 int total = c1.getSolde() + c2.getSolde();

**Petit Résumé**

##
 Les classes sont des types abstraits.
 La définition d&#39;une classe comprend la description des variables et le code des méthodes.
 Les classes définies par le programmeur sont utilisées de la même façon que les classes de base de Java.
 Les constructeurs sont utilisés pour initialiser les objets.
 Tous les paramètres des méthodes sont passés par valeur, donc ils ne sont pas modifiables directement par la méthode appelée.

# 48.Méthodes et variables de classe

Il faut faire la différence entre _membres de classe_ et _membres d&#39;instance (d&#39;objet)._

 Les méthodes et variables définies au niveau d&#39;une classe sont appelées méthodes et variables _de classe (statiques_). La variable de classe est un moyen d&#39; **ECHANGER** des informations entre les différents **OBJETS** d&#39;une même classe. Une variable de classe est déclarée **STATIQUE** avec le mot-clé anglais **STATIC.** Cette variable **STATIQUE** est **PARTAGEE** par toutes les instances de la classe.

**Classe Client :**

**Attributs**  :

prochainNumClient :int {static}
 numClient :int

**Méthodes**  :

setProchainNumClient(i:int)
 {static}
 setNumClient(i:int)

**Classe Client sous forme de Diagramme :**

![](RackMultipart20201102-4-7b1c1s_html_a26b8ff050be18f0.jpg)

## Les membres de classe, s&#39;utilisent sans avoir besoin d&#39;instancier la classe.

Les variables de classe sont initialisées au chargement de la classe. Une variable de classe n&#39;existe qu&#39;en un seul exemplaire.

**Exemples d&#39;utilisation d&#39;une variable de classe :**

public class Employe
 {

private int matricule;
 private **STATIC** int dernierMatricule;

public Employe()

{

matricule = ++dernierMatricule;
 }

}

// déclaration
 public class Tarif
 {
 public static double TVA\_1= 5.5;
 }
 ...
 // utilisation

double montantTVA = prixHt \* Tarif.TVA\_1;
 ...

Exemple avec une variable de classe fournie par Sun :

double circonference = 2 \* rayon \* Math.PI;

**Les méthodes de classe sont utilisables sans instanciation préalable de la classe :**

// appel de la méthode parseInt() de la classe Integer
 int rayon = Integer.parseInt(« 41113 »);
 // appel de la méthode sin de la classe Math
 double sinusAngle = Math.sin(3.14159);

Les méthodes de classe ne peuvent pas accéder aux membres d&#39;instance (variables ou méthodes)
 Les méthodes de classe sont l&#39;équivalent des « librairies » utilitaires du langage C ou d&#39;autres langages.

Les membres de classes permettent de définir :

- des méthodes _main()_ pour démarrer ...

public static static void main(String[] args)
 {

Compte compte1 = new Compte();
 Compte compte2 = new Compte(1234);

}

- des librairies de fonctions

double racineD = Math.sqrt(d);

- des constantes &#39;globales&#39;

double surface = Math.PI
 Math.PI \* Math.pow(rayon,2);

Les membres de classe peuvent aussi être utilisés pour des variables globales à toutes les instances de la classe.

**Exemple :**

public class Client
 {
 private static int prochainNumClient = 1;
 private int numClient;
 public Client() // constructeur
 {
 numClient = prochainNumClient;
 prochainNumClient++;
 }
 }

# 49.Les constantes

Le modificateur **FINAL** permet de créer des constantes. La constante est toujours écrite en MAJUSCULE et est non modifiable.

public final static int VALEUR\_MAX = 100;

public final static int VALEUR\_MIN = 10;

# 50.Découverte de la classe Math

Elle offre des fonctions et des constantes telles que :

public static final double E = 2.718281828459045;
 public static final double PI = 3.141592653589793;
 public static double pow(double a, double b);
 public static double random();

Exemples d&#39;utilisation :

// Choix aléatoire de 6 chiffres de loto (de 1 à 49)
 // Version simplifiée sans vérification entre les 6 numéros...
 // Merci de compléter cet algorithme classique en exercice...

int[] grille = new int[6];
 int nbNum = 0;
 while (nbNum \&lt; 6)
 {
 int n = ((int)(Math.random() \* 49) + 1);
 grille[nbNum] = n;
 nbNum++;
 System.out.println(n);
 }

Pour résumer, une méthode de classe est toujours déclarée **STATIQUE**. Elle correspond a un **SERVICE** directement rendu par la **CLASSE**. Dans cette méthode, l&#39;accès aux membres de la classe est impossible.

Exemple de déclaration de la méthode **SIN** () de la classe **MATH :**

public class **Math**
 {

public static
**static** double **sin** (double angle)
 {
 ...
 return ...;
 }

}

Exemple d&#39;invocation de la méthode **SIN** () :

double sinus = Math.sin(3.14);

_ **Que remarquez vous dans cette écriture ?** _

L&#39;appel de la méthode statique **SIN** () se fait directement à partir du nom de la classe **MATH** , soit **Math.sin** () suffit. Vous n&#39;avez pas besoin d&#39;instancier un objet de la classe Math pour invoquer la méthode **SIN** (). Il en est ainsi pour toutes les méthodes de classe.

# 51.Formatage de dates et de nombres

Java fournit des techniques intéressantes pour formater les dates et les nombres.
 Il faut pour cela :

Instancier _DateFormat_ ou _NumberFormat_ ensuite appeler la méthode sur l&#39;instance en lui passant la donnée. La méthode renvoie la donnée formatée.

DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
 Date d = df.parse(« 22/03/98 »);
 ...
 String dateAffichage = df.format(d);

**Remarques sur les membres de classe :**

##
 Les membres déclarés en _static_ sont partagés par toutes les instances de la classe.
 On utilise indifféremment les termes variables de classe ou variables statiques.
 Même remarque pour les méthodes.
 Une méthode de classe peut être appelée même s&#39;il n&#39;existe aucune instance de la classe.
 Les méthodes de classe n&#39;ont pas accès à _this_, qui référence l&#39;instance « courante ».

**Résumé**

##
 Les membres statiques existent indépendamment de toute instance d&#39;une classe.
 Les variables statiques sont intéressantes pour les constantes.
 Les méthodes statiques sont utiles pour des fonctions de base communes.
 Chaque application doit avoir une méthode _main_ statique qui lui permet de démarrer.

# 52.Notion sur l&#39;Héritage et le polymorphisme

**La réutilisation avant l&#39;objet**...

Un problème classique en programmation : sur des structures de données « similaires » on doit faire des traitements identiques pour certaines données communes et des traitements spécifiques pour un
 certain nombre de données spécifiques. On s&#39;oriente alors trop souvent vers deux types de solutions qui vont bafouer les principes de base de la programmation.

Soit on intègre les traitements dans un même programme et on utilise une structure alternative pour les traitements spécifiques. On aboutit ainsi à un « mégalithe ».

Soit on duplique le code commun dans des programmes différents et on aboutit à plusieurs « monolithes » contenant la logique commune dupliquée.

**Les SGBD montrent la voie**...

Les SGBD montrent la voie. Chaque donnée élémentaire est gérée dans son Entité, « au bon endroit et à un seul endroit » et le SGBD est capable (plus ou moins facilement) de retrouver les liens entre les entités. On évite ainsi les redondances.

**Et si on pouvait appliquer le même principe aux traitements ?**

Données + Traitements = Classes d&#39;objets

Une solution =\&gt; organisation hiérarchique des classes

Un exemple simple d&#39;héritage

![](RackMultipart20201102-4-7b1c1s_html_667b8411a5c4b17d.jpg)

Dans une application de santé publique, représentons l&#39;objet Individu et Patient :

Classe : **Individu**
 Attributs :
 -nom : String
 -prenom : String

Méthodes :
 +getNom() :String
 +getPrenom() :String

Classe : **Patient**
 Attributs :
 -nom : String
 -prenom : String
 -numeroSecu :String

Méthodes :
 +getNom() :String
 +getPrenom() :String
 +getNumeroSecu():String

**La relation d&#39;héritage avec UML**  :

![](RackMultipart20201102-4-7b1c1s_html_63f3dbefd09f650f.jpg)

L&#39;héritage en Java donne le code suivant :

class **Individu**
 {
 private String nom ;
 private String prenom ;
 public String getNom()
 {
 return nom ;
 }
 public String getPrenom()
 {
 return prenom ;
 }
 }
 class **Patient extends Individu**
 {
 private String numeroSecu;

 public String getNumeroSecu()
 {
 return numeroSecu ;
 }
 }

Terminologie de l&#39;héritage :

![](RackMultipart20201102-4-7b1c1s_html_9adcdf44bec7164f.jpg)

Individu est appelé : Classe de base, Ancêtre, Super classe, Classe mère, Racine

Patient est appelé : Classe dérivée, Sous classe, Classe fille

Le lien entre Individu et Patient est appelé : Héritage, Dérivation, Sous classement.

Héritage sur plusieurs niveaux :

![](RackMultipart20201102-4-7b1c1s_html_bea00dcfda4094af.png)

Consultant hérite de Patient
 Hospitalise hérite de Patient
 Cadre hérite de Employé
 NonCadre hérite de Employé
 Patient hérite de Individu
 Employe hérite de Individu

# 53.L&#39;ancêtre commun à toutes les classes

Toutes les classes sont rattachées directement ou indirectement à la classe **Object** (_java.lang.Object_) de Java. Comme nous l&#39;avons vu plus haut, les classes sont organisées de manière hiérarchique. Toutes les classe ont un ancêtre et un seul.

**java.lang.Object -\&gt; Employe -\&gt; Programmeur**

Ici, la classe _ **Programmeur** _ hérite de la classe _ **Employé** _ qui elle-même hérite comme tous les objets Java, de la classe **OBJECT** du paquetage **Java.lang.Object**. Les termes utilisés pour exprimer le principe de l&#39;héritage sont multiples :

  - _Dérivation_
  - _Héritage_
  - _Spécialisation_
  - _Enrichissement_
  - _Sous-classement_

Dans notre exemple, la classe Employé est dite :

  - _Ancêtre_
  - _Mère_
  - _Super-Classe_

La classe Programmeur est dite :

  - _Classe dérivée_
  - _Fille_
  - _Sous-classe_

Toutes les classes (sauf la classe **OBJECT** ) ont **UN ANCETRE ET UN SEUL**.

Pour écrire que la classe Programmeur hérite de la classe Employé, on utilise le mot-clé : **EXTENDS** qui signifie _ **étendre** _ :

Exemple : _Class Programmeur_ _ **extends** _ _Employé_

Nous n&#39;avons pas besoin de préciser que la classe Employé est dérivée de la classe **OBJECT** du langage Java, ceci se fait implicitement.

C&#39;est l&#39;ancêtre commun (Root) de toutes les classes Java. Il propose des méthodes de base pour tous les comportements généraux comme :

**equals** ()
**toString** ()
**clone** ()

Ces méthodes de base peuvent être utilisées directement sur tous les objets Java.

# 54.Composition d&#39;un objet

Un objet issu d&#39;une classe dérivée est composé de deux parties :

Partie issue de la (ou des ...) classe(s) ancêtre(s)
 Partie propre à la classe dérivée

Toutes les méthodes publiques de la classe ancêtre sont « héritées », donc utilisables à partir de la classe dérivée.

Dans un langage OO, c&#39;est l&#39;héritage des méthodes qui va considérablement augmenter le taux de réutilisation du code. Les constructeurs ne font pas partie de l&#39;héritage.

# 55.Les opérateurs _this_ et _super_

![](RackMultipart20201102-4-7b1c1s_html_e1ea445296642dcb.png)

**Détail du graphique ci-dessus :**

**super** désigne la partie ancêtre :

super classe
 ( ancêtre )
 - attributs d&#39;Individu
 - méthodes d&#39;Individu

**this** désigne l&#39;objet courant :

La partie précédente accessible par Super et :

sous classe
 ( dérivée )
 - attributs de Patient
 - méthodes de Patient

**Illustration :**

class Programmeur extends Employé
 {

private String langage ;

// constructeur 1
 public Programmeur( String nom , String langue )
 {

super( nom );

this.langage = langue;
 }

// constructeur 2
 public Programmeur( String nom )
 {

this( nom , &quot;Cobol&quot; ) ;
 }

}

Voici les règles dans l&#39;utilisation du mot-clé **This**  :

## Obligatoirement dans un CONSTRUCTEUR

## TOUJOURS en PREMIERE INSTRUCTION

## UNE SEULE FOIS par constructeur.

# 56.Héritage et constructeurs

**Quelques règles à savoir :**

## Les constructeurs ne font pas partie de l&#39;héritage.

Si la classe ancêtre ne possède pas de constructeur sans argument, le constructeur de la classe dérivée doit appeler le constructeur de son ancêtre.

A la création d&#39;un objet d&#39;une classe dérivée on peut écrire un constructeur pour initaliser les données
 spécifiques à la classe dérivée.

**Comment faire pour construire la partie ancêtre de la classe dérivée ?**

On peut dans le constructeur de la classe dérivée appeler par _super()_ un constructeur de la super classe en respectant la signature du constructeur. Cet appel à _super()_ doit être la première instruction du constructeur.

class Patient extends Individu
 {
 private String numeroSecu;

 public Patient (String n, String p, String num)
 {

 super ( n , p) ;
 numeroSecu = num ;
 }
 ...
 }
 class Individu
 {
 private String nom ;
 private String prenom ;
 public Individu (String n, String p)
 {
 nom = n ;
 prenom = p ;
 }
 ...
 }

**Quelques règles sur les constructeurs d&#39;une même classe**  :

## Une classe peut avoir plusieurs constructeurs
Un constructeur peut faire appel à un autre de la même classe en utilisant this()

# 57.Constructeur avec _super_

**Réécriture d&#39;une méthode**

Une méthode contenue dans une classe ancêtre peut être réécrite (on dit aussi redéfinie) dans une classe dérivée. La méthode de la classe dérivée doit avoir la même signature que celle de la classe ancêtre, elle va « surcharger » (override) cette méthode ancêtre. C&#39;est toujours la méthode la plus
 interne qui sera exécutée. Par exemple si on a défini une méthode _print()_ pour la classe Individu, on pourra écrire un _print()_ spécifique pour la classe Patient. Mais dans le _print()_ de Patient on pourra aussi utiliser, grâce à _super()_, le _print()_ d&#39;Individu, puis compléter ...

Exemple de réécriture de méthode :

class Individu
 {
 private String nom ;
 private String prenom ;
 public void print()
 print()
 {
 ... // formate et imprime nom et prénom
 }
 ...
 }

class Patient extends Individu
 {
 private String numeroSecu;
 public void print()
 {

 super.print() // appel du print() de la super classe
 ... // impression spécique à la classe dérivée
 }

 ...
 }

**Voici les règles dans l&#39;utilisation du mot-clé super :**

## Obligatoirement dans un CONSTRUCTEUR
 TOUJOURS en PREMIERE INSTRUCTION
 UNE SEULE FOIS par constructeur.

La référence **super** () permet d&#39;appeler le constructeur de l&#39;ancêtre. Le constructeur de la classe dérivée doit fournir les valeurs nécessaires au constructeur de l&#39;ancêtre comme dans l&#39;exemple ci-dessous :

public Programmeur( String unNom )
 {

super( unNom ) ; // Appel du constructeur de l&#39;ancêtre
 }

**Exemple avec l&#39;utilisation de super :**

public Employe( String n)
 {

...
 }
 public Programmeur( String n)
 {

super(n) ;
 ...

}

on tape la commande : **new Programmeur(&quot;Vincent&quot;);**

 1 – appel du constructeur Programmeur
 2 – appel par SUPER du constructeur Employé avec passage de n
 3 – retour après le mot-clé super du constructeur Programmeur pour exécuter la suite.

# 58.Le polymorphisme

C&#39;est la capacité d&#39;envoyer un même message à des objets de classes différentes, mais d&#39;activer en fait une méthode spécifique à chaque classe.

Le polymorphisme est intéressant dans un contexte d&#39;héritage. Le même message peut être envoyé à divers objets de la hiérarchie mais il activera la méthode approprié en fonction de la nature de l&#39;objet récepteur.

Exemple : si on a mis dans un _Vector_ des objets _Individu, Patient,__Employe_ ... on activera la méthode _print()_ de la même façon sur tous les éléments du _Vector,_ sans se soucier de leur spécificité.

# 59.L&#39;opérateur _instanceof_

Il permet de comparer une instance d&#39;objet à une classe Java. Il renvoie vrai si le nom de la classe fait partie des classes dont l&#39;objet référencé est issu.

patient1 = new Patient(...)
 if (patient1 instanceof Patient) // Vrai
 if (patient1 instanceof Individu) // Vrai aussi
 ind1 = new Individu(...)
 if (ind1 instanceof Individu)
 // Vrai
 if (ind1 instanceof Patient)
 // Faux

# 60.Héritage et Agrégation

Utiliser l&#39;héritage quand il y a vraie filiation, spécialisation : un patient est un cas particulier d&#39;individu, c&#39;est normal et souhaitable qu&#39;il hérite de toutes ses méthodes.

Utiliser l&#39;agrégation quand on a une relation de contenu à contenant. Une chaudière est un composant d&#39;une maison, mais son comportement est très spécifique.

Exemple :

![](RackMultipart20201102-4-7b1c1s_html_eb9eb4b29dc4694b.jpg)

**Patient** est un **Individu**
**Chaudière** fait partie de **Maison**

**Résumé**

##
 L&#39;héritage est la base de la réutilisation en Orienté Objet
 Les classes dérivées permettent d&#39;étendre _(extends)_ les fonctionnalités d&#39;une classe mère.
 Un classe dérivée hérite de toutes les méthodes publiques des classes ancêtres.
 Toute classe en Java est dérivée de la classe Object.
 Le polymorphisme permet d&#39;utiliser un même nom de méthode sans préciser la nature de l&#39;objet récepteur.
 L&#39;héritage et l&#39;agrégation répondent à des cas de figure différents et sont complémentaires.


Philippe Bouget Version ancienne en cours de réécriture...