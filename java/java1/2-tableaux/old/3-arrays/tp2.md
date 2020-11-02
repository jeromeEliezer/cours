# Encore d'autres exercices

Vous programmerez ces fonctions dans un fichier appele [DiversesMethodesSurDesTableaux.java](./DiversesMethodesSurDesTableaux.java). Commencez par les methodes fondamentales, puis aux choix les methodes consolidation ou avancee. Recuperez le fichier de [test](./DiversesMethodesSurDesTableauxTest.java) pour tester.

a. (fondamental) fonction qui retourne le nombre d'occurrences d'un int dans un tableau de int.

```java
static int nbOccurrences (int[] tab, int val)
```





a bis. (consolidation) fonction qui retourne le nombre de valeurs negatives dans un tableau de int.

```java
static int nbNegatifs (int[] tab)
```




b.  (fondamental) fonction qui retourne la somme des valeurs contenues dans un tableau de int.

```java
static int sommeValeurs (int[] tab)
```



c.  (fondamental) fonction qui teste la presence d'une valeur de type int dans un tableau de int (cette fonction retourne un booleen).

```java
static boolean estPresent (int[] tab, int val)
```



c bis. (consolidation) fonction
```java
static boolean tousPositifs (int[] tab)
```

qui retourne vrai si toutes les valeurs d’un tableau de int sont positives ou nulles.



d.  (fondamental) Programmez une methode main permettant de saisir des notes entieres (stockees dans un tableau de int), puis en utilisant les fonctions ci-dessus d’afficher :

        - le nombre de fois où la note 20 a ete donnee

        - la moyenne du groupe

        - si la note zero a ete donnee ou non.

Ne faites pas de jeu de tests pour cette methode main. Faites justes quelques essais pour voir si cela semble fonctionner correctement.



e.  (fondamental) fonction qui retourne l'indice de la premiere occurrence d'un int dans un tableau de int. Si la valeur en question n'apparaît pas dans le tableau, la fonction retourne -1.
```java
static int indicePremOccurrence(int[] tab, int val)
```




e bis.  (fondamental) fonction qui retourne l'indice de la derniere occurrence d'un int dans un tableau de int. Si la valeur en question n'apparaît pas dans le tableau, la fonction retourne -1.
```java

static int indiceDernOccurrence(int[] tab, int val)
```




f. (consolidation) fonction qui retourne le nombre d’occurrences dans un tableau de int de valeurs comprises entre un min et un max inclus (reçus en parametre). Si les min et max ne sont pas coherents (min > max), la fonction retourne -1.
```java

static int nbOccurrences (int[] tab, int min, int max)
```




g. (fondamental) fonction qui retourne la plus grande valeur positive d'un tableau de double. Si le tableau est de longueur 0, ou bien si le tableau ne contient que des negatifs, cette fonction retourne -1.
```java
static double plusGrandPositif (double[] tab)
```




f. (avance) On appelle bigramme une suite de deux caracteres.

Ecrivez une fonction qui retourne le nombre d'occurrences d'un bigramme dans un type String.

Le bigramme est donne sous la forme d'un tableau de caracteres de longueur 2.

```java
static double bigramme (char[] mot, char[] bigramme)
```



g. Programmez un jeu du pendu.
