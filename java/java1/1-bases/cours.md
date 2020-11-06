# Hello World
Bienvenu dans le monde de java. C'est un langage de programmation orienté objet crée en 1995. Il est actuellement détenu par la société Oracle qui le distribue gratuitement ([est-ce toujours le cas? article](https://blog.invivoo.com/java-va-t-il-devenir-payant/)).

Une de ses caractéristiques principales est la jvm : java virtual machine. C'est une couche qui permet à un même programme java de tourner sur différents systèmes d'exploitation. Pour exécuter un programme java, il suffit d'installer la jre (java runtime environment).

![img](jvm.webp)

Lorsqu'un développeur (vous!) souhaite installer java sur sa machine, il installe la jse (java standard edition). Cette installation comprend la jre, la jdk (toutes les librairies java+outils de programmation tels que le compilateur) et jsr (java specification request). La dernière version de la JSE est la 13. ([plus de détail sur les versions](https://fr.wikipedia.org/wiki/Java_%28langage%29#Contenu_et_%C3%A9volutions)).

Java est un langage à la fois robuste (grâce à des règles de compilation strictes, vous en ferez vite l'expérience) et sa syntaxe permet d'implémenter des concepts élaborés (plus simplement qu'en c++). C'est un langage très largement répandu, je n'ai pas trouvé à combien de [sloc](https://en.wikipedia.org/wiki/Source_lines_of_code#Example) il était estimé. Ainsi java possède une large communauté d'utilisateurs et de nombreux programmes déjà écrits, si bien qu'une solution existe souvent pour un besoin donné.

Voici les tendances sur le site [stackoverflow](https://stackoverflow.com/) pour quelques langages choisis : ![tendances](trends.png).
On voit l'apparition de scala et kotlin, notamment depuis 2017 ([explication](https://fr.wikipedia.org/wiki/Kotlin_(langage))) qui sont totalement compatibles avec java et la jvm mais font évoluer sa syntaxe en s'inspirant des bonnes trouvailles des autres langages.

Voici à quoi ressemble un programme java :
```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello evrybody!");
  }
}
```
Le nom du fichier est le nom de la classe (ici HelloWorld) avec l'extension .java. Comme on peut le voir, ce fichier est écrit de façon _compréhensible_. Il va ensuite être compilé en bytecode (écrit en octets) qui sera interprété par la jvm : java est donc un langage compilé et interprété.

## Tester des instructions avec jshell

Depuis Java 1.8, on peut simplement tester du code java en lançant jshell :
```
jshell> System.out.println("Hello World!");
Hello World!
```


## Commenter le code

Avant toute chose, il convient de parler des commentaires ! C'est certainement une des choses les plus importantes que l'on écrit lorsque l'on code. Ce sont des lignes de code qui ne seront pas interprétées mais qui donnent des indications primordiales pour les programmeurs qui liront le code (y compris vous dans quelques mois / années).

```java
// Voici comment j'écris un commentaire en java : en démarrant ma ligne de code par //
// C'est vraiment très important de documenter son code en mettant des bons commentaires pour les futurs développeur•euse•s
// J'espère que vous le ferez !
```

On peut aussi regrouper plusieurs lignes de commentaires ainsi :
```java
/*
Je peux dire n'importe quoi, le compilateur ne le lira pas (par contre les autres développeurs, si :)
*/
```

> Question : quelle est votre priorité en tant que développeur?
- [ ] que votre code fonctionne?
- [x] que votre code soit maintenable? (eh oui!)

---

## 1. Variables et types de données
Les variables en java permettent de stocker des données en mémoire pour pouvoir les utiliser ensuite. Les variables sont typées (type nombre, mot, ...) et sont créées en deux phases :
- déclaration
- initialisation

```java
int unNombre; // on déclare que le type de la variable est 'int'
unNombre = 17;
```

On peut rassembler ces deux phases en une seule instruction :
```java
int unNombre = 17;
```

Une fois qu'une variable est déclarée, on ne peut pas changer son type. On peut cependant lui affecter de nouvelles valeurs.
```java
int unNombre = 17;
unNombre = 13; // ok
unNombre = "abc"; // no!
```

En java, les types des variables sont soit des primitives, soit des classes. Les primitives sont les types de base (nombres, caractères, booléens, ...) et les classes sont toutes les classes qui viennent dans la jse ([liste des classes](https://docs.oracle.com/javase/10/docs/api/index.html?overview-summary.html)) + toutes celles que vous développez pour vous-même.

```java
int unNombre = 17; // primitives en minuscules
char initiale = 'b';
double monSouvenirDePi = 3.1415;
boolean simplonAMontreuil = true;

String unMotOuUnTexte = "hey jude, don't make it bad"; // String n'est pas un type primitif : commence par une majuscule
```

> Remarque, lire du java n'est pas forcément évident, il est donc important de respecter les conventions de nommage. Pour le nom des variables, les noms des classes, etc.., on utilise la convention camelCase. Les classes doivent commencer par une majuscule, et les variables par une minuscule :

![convention](convention.png)

Pour afficher le contenu d'une variable, on utilise `System.out.println` :
```java
int unNombre = 17;
int unAutre = 23;
int total = unNombre + unAutre;
System.out.println(total);
```

### Les booléens

Le type de données élémentaire à connaître qui est à la base de l'informatique d'aujourd'hui est le booléen. Il s'agit d'un type de données qui n'a que deux valeurs possibles : `true`ou `false`. Cela correspond au `0` et au `1` du binaire (le yi et le yang de l'informaticien). Nous l'utiliserons beaucoup lorsque nous aborderons les conditions.

```java
// Une vérité
boolean jeTravailleASimplon = true;

// Un mensonge
boolean jeSuisPlusRicheQueBillGates = false;
```

### Les nombres

Deux grand types de nombre nous seront utiles : les `int` qui représentent les nombres entiers et les `double` qui représentent les nombres décimaux.

```java
int monAge = 30;
int ageMatusalem = 1_042; // le tiret du bas peut être utilisé pour rendre visuellement les nb plus faciles à lire

// Ma taille en cm
double taille = 184.5;
```
> Remarque : il existe d'autres types de nombres entiers : byte, short, long et d'autres types de décimaux : float. Mais ils sont utilisés plutôt pour des questions d’optimisation de programme.

On peut **caster** (=convertir) des types en d'autres, mais attention au résultat :
```java
int a = 10.0; // a = 10, rien à faire
a = (int)3.14; // a = 3, il faut faire le cast
```


Pour plus de détails : [La documentation officielle de java](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)

### Les caractères
```java
char initialeMajuscule = 'J';
char dernierLettre = 'n';
char unNombreOuBien = '1';  // c'est bien le caractère 1, et pas un nombre sur lequel on peut faire des opérations
```

### Les chaînes de caractères

Afin de stocker du texte (un prénom, un nom, une phrase, ...) nous utiliserons les `String` qui représentent les chaînes de caractères :

```java
String prenom1 = "Josselin";
String prenom2 = "Philippe";
String starP3 = "Jean Michel Doudoux"
```

On peut utiliser un certain nombre de caractère spéciaux qui n’apparaîtront pas en les **échappant** avec un backslash :

```java
String menu = "Faites votre choix :\n1-Pour démarrer\n2-Pour quitter";
System.out.println(menu);
```

Qui s'affichera ainsi :
```
Faites votre choix :
1-Pour démarrer
2-Pour quitter
```

Pour plus de détails : [La documentation officielle de java](https://docs.oracle.com/javase/tutorial/java/data/strings.html)

---

## 2. Opérateurs

### Opérations de base sur des nombres

On peut utiliser les 4 opérations sur des nombres. Les résultats obtenus sont sans surprise.

```java
int soldeCompte = 150;
int retrait = 20;

int nouveauSolde = soldeCompte - retrait;

int depot = 105;
nouveauSolde = soldeCompte + depot;
```

Les opérations `+,-,*,/` sur des nombres entiers donnent des nombres entiers.
Les opérations `+,-,*,/` sur au moins un nombre double donnent des nombres double.

```java
int soldeCompte = 150;
double depot = 10.0;

double nouveauSolde = soldeCompte + depot;

double pourcentage = 0.3;
nouveauSolde = soldeCompte * 0.3;
```

Pour la division, attention au cas des nombres entiers :

```java
int nbPartPizza = 4;
int nbPersonne = 2;

int nbPart = nbPartPizza/nbPersonne; // 2 bien sur

nbPartPizza = 5;
nbPart = nbPartPizza/nbPersonne; // 5/2 = 2, attention
```

> Pour avoir le résultat de la division précédente exact, on **caste** un des deux nombres `int` en `double` :

```java
int a = 4;
int b = 2;
double exact = a/(double)b;
```


Les priorités de calcul sont les priorités habituelles, on peut utiliser des parenthèses.
```java
int a = (2+4)*3; // 18
int b = 2+4*3; // ?
```


### Division entière

On utilise souvent en informatique la division entière qui donne deux résultats : le reste et le quotient.

```java
int etudiants = 26;
int nbGroupes = 3;

int etudiantsParGroupe = 26 / 3; // un résultat entier
int etudiantsRestant = 26 % 3; // on dit 26 modulo 3
```

### Comparaison

Les relations d'ordre produisent des booleans.

```java
18 < 22; // true
3*5 < 10; // false
2*3 <= 6; // true
2 < 4 < 8; // erreur, l'encadrement ne fonctionne pas en java, il faut utiliser &&
2 < 4 && 4 < 8; // true
"la ligne rouge" < "apocalypse now"; // erreur, il faut comparer des nb
```
On peut bien sur les stocker dans des variables :

```java
int unNombre = 17;
double unAutre = 8.4;

boolean estPlusGrand = (unNombre > unAutre); // true
```

### Egalité

On compare des variables avec `==`, puisque le `=` est déjà utilisé pour l'affectation. Cela produit aussi un boolean. Le signe différent est `!=`.

```java
line1 = "Nah nah nah nah nah nah nah nah nah yeah";
line2 = "Nah nah nah nah nah nah, nah nah nah, hey Jude";
line3 = "Nah nah nah nah nah nah, nah nah nah, hey Jude";

line1 == line2
line2 == line3

isDifferent = line1 != line3 // il est vrai que ces lignes ne sont pas égales!
```

### Opérations avec les booleans

[L'algèbre de Boole](https://fr.wikipedia.org/wiki/Alg%C3%A8bre_de_Boole_(logique)) (c'est à dire les calculs sur les booléens) est à la base de l’électronique. On la retrouve aussi dans les langages de programmation, notamment pour exprimer des conditions (voir plus loin : branchements, et aussi boucles).

Il y a trois opérations importantes à connaître : **et**, **ou**, **non** qui s'écrivent : `&&`, `||`, `!`
```java
int revenu = 26_000;
int seuil1 = 16_000;
int seuil2 = 38_000;

boolean exonere = revenu < seuil1;
boolean doitPaye = !exonere; // on doit payer si on n'est pas exonéré

boolean payeTranche1 = revenu > seuil1 && revenu < seuil2; // si le revenu est compris entre seuil1 et seuil2
```

Un autre exemple avec **ou** :
```java
int note = 12;
boolean noteInvalide = note < 0 || note >20;
```

### Opérations avec des chaînes

On peut concaténer (mettre bout à bout) des chaînes de caractères avec l'opérateur +.

```java
String nom = "Odile";
int age = 34;

String presentation = "Bonjour, je m'appelle "+nom+ " et j'ai "+age+ " ans";
```


---
## 3. POO
Dans cette partie, nous allons aborder les concepts de base de la programmation orientée objet, à savoir les **classes**, les **attributs** et les **méthodes**.

En effet, en plus des librairies java de base qui contiennent beaucoup de classes (pour représenter des listes, des fichiers, des images, ...), on peut se construire ses propres classes. Une classe est composée d'attributs et de méthodes, elle sert à fabriquer des objets.

Par exemple si je travaille sur des mails, il est plus simple de créer une classe mail qui regroupe toutes les variables de chaque mail :

```java
String objet1 = "ton compte";
String destinataire1 = "toto@yopmail.com";
String message1 = "bonjour, votre compte a été désactivé. Au revoir.";

String objet2 = "salut";
String destinataire2 = "pipou@yopmail.com";
String message2 = "Salut, ça va?";
```

Version avec une **classe** Mail :
```java
Mail mail1 = new Mail("ton compte", "toto@yopmail.com", "bonjour, votre compte a été désactivé. Au revoir.");
Mail mail2 = new Mail("salut","pipou@yopmail.com","Salut, ça va?");
```

Voici comment définir la classe Mail :

```java
public class Mail {
  String message; // les attributs de la classe, ici il y en a 3
  String destinataire;
  String sujet;

  // ceci est le constructeur, qui va permettre d'initialiser les attributs
  public Mail(String monMessage, String monDestinataire,  String monSujet) {
    this.message = monMessage;
    this.destinataire = monDestinataire;
    this.sujet = monSujet;
  }

  public static void main(String[] args) {

  }
}
```
Une classe permet de créer des objets (ou instances). Ainsi mail1 et mail2 sont des **instances** de la **classe** Mail.

La classe est comme un moule qui permet de fabriquer toujours les même sortes d'objet.

Le mot clé `this` à l'intérieur de la classe permet de désigner l'instance sur laquelle on travaille.


### Méthodes

Une classe permet aussi de définir des méthodes (le main et le constructeur sont des méthodes). Les méthodes sont des actions que l'on peut effectuer sur des objets.

Une méthode possède une portée (public, private, protected), un nom, un type de retour (ou void si elle ne donne aucun résultat) et des paramètres.

```java
public class Mail {
  String message; // les attributs de la classe, ici il y en a 3
  String destinataire;
  String sujet;

  public Mail(String monMessage, String monDestinataire,  String monSujet) { // ceci est le constructeur, qui va permettre d'initialiser les attributs
    this.message = monMessage;
    this.destinataire = monDestinataire;
    this.sujet = monSujet;
  }

  public void envoyer(){
    System.out.println("votre message a bien été envoyé à "+this.destinataire);
  }

  public static void main(String[] args) {

  }
}
```

On peut ajouter des paramètres à notre méthode :
```java
public class Mail {
  String message; // les attributs de la classe, ici il y en a 3
  String destinataire;
  String sujet;

  public Mail(String monMessage, String monDestinataire,  String monSujet) { // ceci est le constructeur, qui va permettre d'initialiser les attributs
    this.message = monMessage;
    this.destinataire = monDestinataire;
    this.sujet = monSujet;
  }

  public void envoyer(){
    System.out.println("votre message a bien été envoyé à "+this.destinataire);
  }

  public void envoyerDansXHeures(int nbHeures){
    System.out.println("votre message sera envoyé à "+this.destinataire+" dans "+nbHeures+" heures.");
  }

  public static void main(String[] args) {
    Mail mail1 = new Mail("ton compte", "toto@yopmail.com", "bonjour, votre compte a été désactivé. Au revoir.");
    Mail mail2 = new Mail("salut","pipou@yopmail.com","Salut, ça va?");

    mail1.envoyer();
    mail2.envoyer();
  }
}
```

### Modification des attributs d'un objet

Méthodes get et set...


### Méthodes statiques

Dans le cas où l'on veut créer des fonctions qui n'ont pas besoin de s'appliquer sur des objets, par exemple une classe qui contient plusieurs fonctions de calculs mathématiques, alors on donne le caractère `static` aux méthodes :

```java
public class Calculs {    

    /**
     * Calcule la moyenne de deux nombres entiers
     * @param a : le 1er nombre
     * @param b : le second nombre
     * @return : la moyenne
     */
    public static double moyenne(int a, int b) {
        double resultat = (a+b)/2.0; // on divise par un double pour que le résultat soit décimal
        return resultat;
    }

    // on utilise la méthode main pour tester
    public static void main(String[] args) {
        // quelques tests pour la fonction moyenne
        System.out.println(moyenne(10, 12)); // 11 normalement
        System.out.println(moyenne(10, 11)); // 11.5 normalement
    }
}
```


> Ce qu'il faut retenir : une classe permet de structurer des données (les attributs). Une classe permet aussi de définir des actions pour des objets, ce sont les méthodes.

> Si les méthodes n'ont pas besoin d'être propres à un objet, alors elles sont static

Pour plus de détails : [La documentation officielle de java](https://docs.oracle.com/javase/tutorial/java/concepts/index.html)


## 4. Conditions et branchements conditionnels

### Branchements

Pour effectuer un bloc d'instructions si une condition est vraie, on utilise le mot-clé `if`. Pour délimiter la taille du bloc d'instructions, on utilise des accolades (et de fortement recommandée : une indentation).

```java
int temperature = 10;
String vetement = "teeshirt";

if (temperature < 15) { // on délimite le bloc avec des accolades
  System.out.println("c'est deja l'automne"); // toutes les lignes du bloc sont indentées
  vetement = "pull";
}

System.out.println(vetement);

```
Si la condition est vraie, on exécute les instructions du blocs. Sinon on saute le bloc.

On peut ajouter un bloc à exécuter seulement si la condition est fausse avec `else`.

```java
int temperature = 10;
String vetement = "teeshirt";

if (temperature < 15) { // on délimite le bloc avec des accolades
  System.out.println("c'est deja l'automne");
  vetement = "pull";
}
else  { // un autre bloc : accolades + indentation
  System.out.println("vive le rechauffement");
  // pas la peine de changer de vetement
}

System.out.println(vetement);

```

On peut aussi ajouter d'autres conditions intermédiaires avec `else if`, a exécuter seulement si les précédentes sont fausses.


```java
int age = 2;

if (age < 0) {
  System.out.println("merci d'entrer un age valide (positif)");
}

else if (age < 3) {// on ne rentre pas ici si on est déjà entré dans le cas d'avant
  System.out.println("tarif : gratuit");
}

else if (age < 18){
  System.out.println("tarif : réduit");
}

else if (age > 65) {
  System.out.println("tarif : réduit");
}

else {// dans tous les autres cas
  System.out.println("tarif : normal");
}
```

### Conditions

Dans le cas précédent, on obtient un tarif réduit si l'âge est inférieur à 18 **ou** supérieur à 65. On peut rassembler les deux cas.

```java
int age = 2;

if (age < 0) {
  System.out.println("merci d'entrer un age valide (positif)");
}

else if (age < 3) {// on ne rentre pas ici si on est déjà entré dans le cas d'avant
  System.out.println("tarif : gratuit");
}

else if (age < 18 || age > 65) {
  System.out.println("tarif : réduit");
}

else {// dans tous les autres cas
  System.out.println("tarif : normal");
}
```

Une erreur classique est d'utiliser un **or** lorsqu'il faudrait un **and** ou inversement. Ici par exemple, un age qui est inférieur à 18 **et** supérieur à 65 n'existe pas, il fallait bien utiliser **ou**.

```
brocoli = 4
aubergine = 6
concombre = 5
radis = 2
pomme = 3
mure = 9
```
> quelle condition sur les prix pour ne sélectionner que :
```
brocoli = 4
radis = 2
pomme = 3
mure = 9
```
question tirée du concours [castor informatique 2016](http://concours.castor-informatique.fr)

Pour plus de détails : [La documentation officielle de java](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/if.html)