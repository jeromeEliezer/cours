# Java et les Streams

**Important** : Ce "cours" sur les streams Java n'a pas pour vocation d'être exhaustif. Il présente rapidement quelques exemples pour être capable de lire des données depuis la console ou depuis un fichier. Pour tout comprendre sur les streams : [Les streams expliqués dans la documentation Java Oracle](https://docs.oracle.com/javase/tutorial/essential/io/streams.html), [Le chapitre Streams du cours Java sur Développez.com](https://www.jmdoudoux.fr/java/dej/chap-flux.htm), [Le chapitre Streams du cours Java d'OpenClassrooms](https://openclassrooms.com/courses/apprenez-a-programmer-en-java/les-flux-d-entree-sortie), ...

## What is a Stream?
Si vous cherchez dans le package `java.io` de votre JDK, vous allez voir qu'il contient un paquet de classes qui se terminent par Stream ! `InputStream`, `OutputStream`, `FileInputStream`, `FilterInputStream`, ... Bref il y a de quoi faire.

Ces classes permettent de gérer les **flux** de données (en anglais **stream** signifie **courant** ou **flot**). Les données en question peuvent s'échanger via différent supports :
* les fichiers
* le réseau
* d'autres programmes
* ...

Voici une représentation graphique d'un possible schéma d'échange de données :

![java streams](../presentation/reveal.js/images/streams.png)

Le programme Java lit et écrit des données dans la console et il lit et écrit des données sur le système de fichier de son hôte.

## Les différents types de flux
Pour bien comprendre comment utiliser les différentes librairies qui permettent de travailler avec les flux, il faut distinguer les 2 types de flux :
* Flux d'octets (ils permettent de gérer tout type de donnée : images, vidéos, ...)
* Flux de caractères (ils permettent de gérer uniquement le texte)

Ces 2 types de flux peuvent êtes lus (Input) ou écrits (Output). On récapitule tout ça dans le tableau suivant :

|               | Flux d'octet | Flux de caractères |
|---------------|--------------|--------------------|
| **En entrée** | InputStream  |       Reader
| **En sortie** | OutputStream |       Writer

## Quelques exemples d'application
### Lire depuis la console

```java
public static void main(String[] args) throws IOException {

  // Mini application de gestion de la liste d'apprenants.
  System.out.println("Bonjour et bienvenue dans l'application de gestion des apprenants Simplon !");

  // Création de l'objet Scanner qui permet de lire les entrées clavier depuis la console.
  Scanner scanner = new Scanner(System.in);
  String menuChoice;
  do {
    // Affichage du menu dans la console.
    System.out.println("------------------- Menu -------------------");
    System.out.println("1) Lister tous les apprenants");
    System.out.println("2) Ajouter un apprenant à la liste");
    System.out.println("3) Supprimer un apprenant de la liste");
    System.out.println("0) Quitter l'application");

    // Récupération de l'entrée clavier qui sera utilisée pour définir l'action à faire.
    menuChoice = scanner.nextLine();
      switch (menuChoice) {
    case "1":
      // cas non détaillé pour ne pas surcharger
      printLearners();
      break;
    case "2":
      // cas non détaillé pour ne pas surcharger
      writeNewLearnerToFile();
      break;
    case "3":
      // cas non détaillé pour ne pas surcharger
      removeLearnerFromFile();
      break;
    default:
      break;
    }
  } while (!menuChoice.equals("0"));

  // On ferme l'objet scanner car il ne servira plus (obligatoire pour les objets qui manipulent les Streams).
  scanner.close();
}
```

Dans cet exemple, on utilise un objet `Scanner` qui nous permet de lire les entrées venant de `System.in` qui est l'`InputStream` de la console. `Scanner` nous permet avec sa methode `nextLine()` de lire une nouvelle entrée clavier de la console. En fonction de ce que l'utilisateur rentre au clavier, on choisira une action à faire.

### Écrire dans un fichier
```java
public static void writeNewLearnerToFile(String newLearner) throws IOException {
  // Création de l'objet writer qui écrira dans learners.txt.
  BufferedWriter writer = new BufferedWriter(new FileWriter("learners.txt", true));
  // On écrit la chaîne de caractères passées en argument de la fonction.
  writer.write(newLearner);
  // On ferme notre objet writer.
  writer.close();
}
```
Dans cet exemple, on utilise un objet `FileWriter` qui permet d'écrire dans un fichier (ici le fichier _learners.txt_). Cet objet est **encapsulé** dans un objet `writer` de type `BufferedWriter` qui permet de rendre les opérations d'écriture plus rapides grâce à un buffer. On utilise la méthode `write(String str)` de `writer` qui écrit dans notre fichier _learners.txt_. Une fois l'écriture terminée, on ferme notre objet `writer`

### Lire depuis un fichier

```java
public static void printLearners() {
  String fileContent = "";
  // Création d'un objet Scanner pour lire le fichier learners.txt.
  Scanner scanner = new Scanner(new File("learners.txt"));
  // Tant que l'objet scanner n'est pas à la fin du fichier, on compile les lignes dans la variable fileContent.
  while (scanner.hasNextLine()) {
    fileContent += scanner.nextLine() + "\n";
  }
  // On ferme notre objet scanner car on a fini de lire le fichier.
  scanner.close();
  // On afficher le contenu dans la console.
  System.out.println(fileContent);
}
```
Dans cet exemple, on utilise un objet `Scanner` qui nous permet de lire depuis le fichier _learners.txt_. On utilise la méthode `hasNextLine()` pour vérifier que l'on a pas encore atteint la fin du fichier. Tant que ce n'est pas le cas on utilise la méthode `nextLine()` pour récupérer chaque ligne du fichier. Une fois la lecture du fichier terminée on ferme l'objet `scanner` et on affiche le contenu du fichier dans la console.

## Ce qu'il faut retenir
Un grand nombre de librairies permettent de travailler avec les flux de données en Java. Chaque librairie apporte son lot de fonctionnalités, il faut savoir ce qu'on veut faire pour bien les choisir (lire/écrire des caractères, des octets, en quelle quantité, ...). Pour bien comprendre le sujet : [Les streams expliqués dans la documentation Java Oracle](https://docs.oracle.com/javase/tutorial/essential/io/streams.html), [Le chapitre Streams du cours Java sur Développez.com](https://www.jmdoudoux.fr/java/dej/chap-flux.htm), [Le chapitre Streams du cours Java d'OpenClassrooms](https://openclassrooms.com/courses/apprenez-a-programmer-en-java/les-flux-d-entree-sortie), ...

Quelques conseils :
* Toujours fermer un stream une fois qu'il ne sert plus
* Toujours chercher à utiliser le stream le mieux adapté (utiliser un `FileReader` pour lire un fichier de caractères et non un `FileInputStream`)
