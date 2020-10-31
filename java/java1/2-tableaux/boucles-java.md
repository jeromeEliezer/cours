# Boucles en Java

Voici les 4 types de boucle que vous aurez l'occasion d'utiliser en java.

## for (iteration contrôlée par paramètres)

```java
int[] tableau = {1, 2, 3, 4, 5};
int somme = 0;
for (int i = 0 ; i < tableau.length ; i = i + 1)
{
    somme = somme + tableau[i];
}
System.out.println(" somme = "  + somme);
```

## Foreach (très pratique et plus simple que la précédente)

```java
int[] tableau = {1, 2, 3, 4, 5};
int somme = 0;
for (int i : tableau)
{
    somme+=i;
    // ou cette syntaxe : somme = somme + i;
}
System.out.println(" somme = "  + somme);
```

## Sortie de boucle : break, continue

- break : permet de sortir de la boucle 
- continue : permet de reboucler sans exécuter en séquence
- break et continue : peuvent être suivis d’un label (étiquette) :

Sans label : ils agissent sur la boucle qui les contient   
Avec un label : ils peuvent agir sur une boucle de niveau supérieur

```java
boucle1: for(int i = 0; i < 10; ++i)
{
    for(int k = 0; k < 20; ++k) 
    {
        // ...
        if (...) break; // sort de la boucle interne
        // ...
        if (...) continue boucle1; 	// Passe directement à la partie incrément de boucle1 ++i
        // ...
    } // fin de la boucle interne (sans label)
... // le break vient exécuter cette ligne
} // fin de la boucle externe boucle1
```

## While (iteration de zéro à n fois)

```java
int[] tableau = {1, 2, 3, 4, 5};
int somme = 0;
int i = 0;
while ( i < tableau.length ) // test en entrée
{
    somme = somme + tableau [i];
    i = i + 1;
}
// affichage dans la console :
System.out.println(" somme = "  + somme);
```

## Do … while (iteration de 1 à n fois)

```java
int[]tableau = {1, 2, 3, 4, 5};
int somme = 0;
int i = 0;
do 
{
    somme = somme + tableau [i];
    i = i + 1; // ou i++
}
while ( i < tableau.length ); // test en sortie

System.out.println("somme = "  + somme);
```

## Documentation Java sur les bases en java

[bases de java avec JMDoudoux](https://www.jmdoudoux.fr/java/dej/indexavecframes.htm)