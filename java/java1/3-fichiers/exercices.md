# Exercices sur les entrées/sorties

## Entrées/sorties standard

#### Ex 1

1. Compte à rebours. Développez un programme qui compte à rebours depuis un entier saisi par l'utilisateur jusqu'à 0 (ou bang). Par exemple :

```
Entier de départ : 27

27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 BANG!
 ```

2. En utilisant des tabulations, organisez l'affichage par dizaines, comme ci-dessous :

Entier de départ : 36

```
                  36    35    34    33    32    31    30

29    28    27    26    25    24    23    22    21    20

19    18    17    16    15    14    13    12    11    10

9     8     7     6     5     4     3     2     1     BIM!
```
> Indice : il faut revenir à la ligne lorsque le nombre à afficher est divisible par 10 (pensez au modulo)

> Remarque : vous pouvez aussi rechercher comment utiliser la fonction [`sleep`](https://stackoverflow.com/questions/24104313/how-do-i-make-a-delay-in-java) pour ajouter une temporisation dans le décompte

#### Ex 2

1. Faites un programme qui demande son nom à l'utilisateur, puis son poids, puis sa taille et qui affiche son IMC. (vous pouvez ajouter aussi des if/else pour qu'il affiche des messages personnalisés en fonction de son [imc](https://fr.wikipedia.org/wiki/Indice_de_masse_corporelle#Interpr%C3%A9tation))
2. Faites un programme qui demande la base d'un triangle et sa hauteur, et affiche l'aire du triangle
3. Faites un programme qui demande 5 noms de restaurant, les stocke dans une liste, puis affiche un des restau aléatoirement. On peut s'inspirer de cet exemple (mais les noms des restau doivent être demandés à l'utilisateur) :

```java
import java.text.MessageFormat;
import java.util.Random;

public class RandomItem {
    public static void main(String[] args) {
        String[] promo = {
            "sophie","bastien","nicolas","virgile","maureen","tony",
            "florian","didier","romain","laetitia","francois",
            "cedric","sebastien","camille","elodie","olivier","robert"
        };

        Random randomizer = new Random();
        int randomIndex = randomizer.nextInt(promo.length); // genere un nb aleatoire entre 0 et la taille de la liste

        String winner = promo[randomIndex]; // on accede à la personne qui est a cet index
        System.out.println("And the winner is ... "+winner);
    }
}
```

nb : [exemple de réponse sur stackoverflow](https://stackoverflow.com/questions/12487592/randomly-select-an-item-from-a-list).

#### Ex 3

1. Faites un programme qui écrit dans un fichier la date et l'heure actuelle (il faut chercher comment avoir cette date en java)
2. Faites un programme qui lit les valeurs d'un fichier (par exemple des prénoms), les stocke dans une liste, puis prend une valeur aléatoire qui sera écrite dans un nouveau fichier : **winner.txt**
