# Les entrées/sorties

On voit trois parties qui vont donner de l'interactivité à nos programmes :

1. Entrées/sorties standard

2. Lecture/écriture dans des fichiers

3. Sérialisation


## Entrées/sorties standard

#### Afficher sur la sortie standard

On a déjà vu comment afficher le contenu d'une variable avec `System.out.println()`. On peut aussi utiliser `System.out.print()` si on veut ne pas avoir de retour à la ligne après l'affichage :

```java
System.out.print("hello ");
System.out.print("Dude");
```
Va afficher sur la même ligne :
```
hello Dude
```

Rappel : on peut ajouter des caractères spéciaux (retour à la ligne, tabulations, ...) avec un `\` :

```
\t  Insert a tab in the text at this point.
\b  Insert a backspace in the text at this point.
\n  Insert a newline in the text at this point.
\r  Insert a carriage return in the text at this point.
\f  Insert a formfeed in the text at this point.
\'  Insert a single quote character in the text at this point.
\"  Insert a double quote character in the text at this point.
\\  Insert a backslash character in the text at this point.
```

Tiré de la [documentation oracle](http://docs.oracle.com/javase/tutorial/java/data/characters.html).


#### Afficher proprement

Pour afficher plusieurs variables au milieu du texte, il faut concatener avec plus. On peut aussi utiliser la classe MessageFormat qui donne une syntaxe plus agréable :

```java
int nbPagesLues = 123;
int nbPagesTotal = 1_048;

String titre = "Guerre et paix";

String msg = MessageFormat.format(
    "Déjà lu {0} pages de {2} sur {1} pages, courage...",
    nbPagesLues, nbPagesTotal, titre);
```

> Il faut importer MessageFormat au début du fichier : `import java.text.MessageFormat;`

Ou encore :
```java
int planet = 7;
 String event = "a disturbance in the Force";

 String result = MessageFormat.format(
     "At {1,time} on {1,date}, there was {2} on planet {0,number,integer}.",
     planet, new Date(), event);
```

> Pour cet exemple, il faut aussi importer Date au début du fichier : `import java.util.Date;`

#### Lire sur l'entrée standard

Pour lire sur l'entrée standard `System.in`, on va utiliser la classe `Scanner`. Une fois le scanner crée, on pourra utiliser les méthodes `nextInt()` ou `next()` ou encore `nextLine()` pour lire les prochaines entrées dans l'entrée standard :

```java
import java.text.MessageFormat;
import java.util.Scanner;

public class Lire {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Quelle est votre année de naissance? ");
        int annee = sc.nextInt();
        System.out.print("Quel est votre nom? ");
        String nom = sc.next();

        int age =2019 - annee;
        System.out.println(MessageFormat.format("Félicitations {0}, vous avez {1} ans!", nom, age));
    }
}
```

#### Faire un menu utilisateur

Voici un exemple d'un programme avec un menu très simple qui propose un choix à l'utilisateur (1 ou 2, et 0 pour quitter). Le menu est affiché à nouveau tant que l'utilisateur n'a pas fait 0 pour quitter. Tien, **tant que**, c'est un `while` :)

```java
import java.util.Scanner;

public class PetitMenu {
    public static void main(String[] args) {
        String menu = "\nBienvnue dans mon programme!\n1.Pour afficher ding!\n2.Pour afficher dong!\n0.Pour quitter";

        int choix;
        Scanner sc = new Scanner(System.in);

        do {
            System.out.println(menu);
            choix = sc.nextInt();

            if (choix == 1) {
                System.out.println("ding!");
            }
            else if (choix == 2) {
                System.out.println("dong!");
            }
            else if (choix == 0) {
                System.out.println("bye bye...");
            }
            else {
                System.out.println("tu fais erreur, cette option n'existe pas");
            }
        } while (choix != 0);
    }
}
```

## Lecture/écriture dans un fichier

#### Lecture

Il existe de nombreuses méthodes pour lire des fichiers en java. On peut lire le fichier caractère par caractère, ou bien ligne par ligne. On va voir deux méthodes ici.

Premièrement, on fait comme dans la lecture de l'entrée standard avec un `Scanner` :

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.text.MessageFormat;
import java.util.Scanner;

public class LireFile {
    public static void main(String[] args) throws FileNotFoundException {
        String fileName = "LireFile.java";

        File file = new File(fileName);

        Scanner sc = new Scanner(file);

        while (sc.hasNextLine()) {
            System.out.println(sc.nextLine());
        }
    }
}
```

Deuxièmement, on va utiliser une méthode de la classe utilitaire [`Files`](https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html) (cette classe donne des méthodes static sur les fichiers) qui permet d'obtenir la liste de toutes les lignes :

```java
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

public class LireFile2 {
    public static void main(String[] args) throws IOException {
        String fileName = "LireFile2.java";

        List<String> lines = Files.readAllLines(Paths.get(fileName));

        // on parcourt la liste lines, pour afficher par exemple
        for (String line : lines) {
            System.out.println(line);
        }
    }
}
```

> La deuxième méthode pourra être pratique si on veut garder la liste telle quelle, ou si on aime bien manipuler les listes (qui ont pas mal de méthodes intéressantes).

#### Écriture

On va aussi utiliser la classe Files pour écrire. La méthode `write` permet d'écrire directement une liste dans un fichier. Si le fichier n'existe pas, par défaut il sera crée. Si le fichier existe déjà, alors il sera remplacé :

```java
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.List;

public class Ecrit {
    public static void main(String[] args) throws IOException {
        String fileName = "test.txt";

        List<String> promo = List.of(
            "sophie","bastien","nicolas","virgile","maureen","tony",
            "florian","didier","romain","laetitia","francois",
            "cedric","sebastien","camille","elodie","olivier","robert"
        );

        Files.write(Paths.get(fileName), promo);
    }
}
```

On peut aussi écrire les éléments un par un, mais si on veut que l'appel à `write` ajoute à la fin du fichier (au lieu de remplacer le contenu du fichier), il faut ajouter l'option `StandardOpenOption.APPEND` :

```java
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.List;

public class Ecrit {
    public static void main(String[] args) throws IOException {
        String fileName = "test.txt";

        List<String> promo = List.of(
            "sophie","bastien","nicolas","virgile","maureen","tony",
            "florian","didier","romain","laetitia","francois",
            "cedric","sebastien","camille","elodie","olivier","robert"
        );

        for (String elem : promo) {
            Files.write(Paths.get(fileName), elem.getBytes(), StandardOpenOption.APPEND);
        }
    }
}
```

> Remarque : si on veut avoir un retour à la ligne après chaque élément, il faut aussi écrire "\n"

> Remarque2 : si on appelle plusieurs fois le programme, le fichier va contenir plusieurs fois la liste complète (mode APPEND), on peut donc vouloir supprimer le fichier avant de commencer avec `	deleteIfExists`.


Plus d'infos sur ce [bon tutoriel java](https://www.baeldung.com/java-write-to-file).


## Sérialisation

La sérialisation permet d'écrire des instances d'objet dans des fichiers, ou bien de transporter à distance, par exemple via une api rest.
Il faut distinguer ce mécanisme des exemples précédents dans lesquels on n'écrivait que du texte dans les fichiers. Avec la sérialisation, on écrit directement une représentation d'une instance (avec tous ses attributs).

On retrouvera donc ce mécanisme au moment de voir ce qu'est une api rest, ou vous pouvez aller voir directement [cours-detail](cours-detail.md).
