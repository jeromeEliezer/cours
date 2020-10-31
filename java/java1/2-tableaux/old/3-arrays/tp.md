# String, Arrays - séance individuelle

## Exercice 1

a. Écrivez une méthode qui affiche toutes les lettres d'un mot, une ligne par lettre.

```
bonjour :
b
o
n
j
o
u
r
```

b. Écrivez une méthode pour renverser un string. Plutôt que d'afficher directement le résultat dans la console, vous utiliserez le mot `return`.

```java
// on écrit string au début pour indiquer le type de l'objet résultat de la méthode
public static String maMethode(String minus){
  String upper = minus.toUpperCase();
  return upper;
}

// voici comment l'utiliser
public static void main (String[] args){
  String unMot = "coucou";
  String resultat = maMethode(unMot); // le res est maintenant dans la variable resultat

  System.out.println(resultat);
}
```

## Exercice 2

1. Écrivez une méthode qui retourne `true` si le mot donné est entièrement composé de deux fois le même mot.

```java
// cette methode renvoie un boolean (true ou false)
public static boolean motDouble(String unMot){
  // TODO
}
```

Exemples :
```
"bébé" : true
"avion" : false
"béAAbé" : false
```

2. (+) Écrivez une méthode palindrome qui indique (true ou false) si un mot peut se lire de la même façon de gauche à droite et de droite à gauche.

Exemples :
```
"kayak" : true
"xanax" : true
"sommes" : false
```

## Exercice 3

Récupérez le fichier [DiversesMethodesSurDesTypesString](./DiversesMethodesSurDesTypesString.java). Ce fichier contient une méthode nbOccurrences qui ne fonctionne pas. Le jeu de test est déjà écrit dans le main (à ne pas toucher). A vous de modifier nbOccurrences pour que les tests fonctionnent :

```java
/*
 * Retourne le nombre d'occurrences de c dans s.
 */
public static int nbOccurrences(String s, char c) {
  int nbOccurrences = 0;
  for (int i = 0 ; i <  s.length() ; i++)
    if (s.charAt(i) == c) {
      nbOccurrences+1;
    }
  return nbOccurrences;
}
```

## Exercice 4

On va commencer à introduire l'objet dans cette exercice. Un objet possède des propriétés et des méthodes.

a. (rien à faire) Récupérez [la classe Etudiant](./Etudiant.java) qui possède un nom et des une liste de notes (propriétés) ainsi que plusieurs méthodes. Pour créer un étudiant, on peut donc coder ainsi :

  ```java
  Etudiant john; // déclaration
  john = new Etudiant("John Abdulla"); // initialisation

  // ou encore
  Etudiant ada = new Etudiant("Ada Lovelace");
  ```


b. Récupérez [la classe de test](./EtudiantTest.java). Compilez cette classe sans la modifier. Exécutez cette classe, vous allez constater une exception. Corrigez la classe **Etudiant** pour que les méthodes **saisieNotes, getNotes, maximum, minimum et moyenne** fonctionnent d'après leur spécification.


## [Une autre séance](./tp2.md)

Sous forme de TDD.
