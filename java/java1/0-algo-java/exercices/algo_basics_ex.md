# Exercices algorithmiques
Vous pouvez utiliser le logiciel **Flowgorithm** qui permet de visualiser les algorithmes. Cela rendra les exercices plus sympathiques.

## Niveau 1 (la base)
* **Entrée/Sortie** : Ecrire un algorithme qui demande un nom en entrée et qui affiche "Hello " + nom_entrée + " !"
* **Entrée/Sortie** : Ecrire un algorithme qui calcule l'aire d'un triangle en demandant à l'utilisateur de rentrer la base et la hauteur d'un triangle
* **Entrée/Sortie** : Ecrire un algorithme qui calcule le volume d'une sphère en demandant à l'utilisateur de rentrer son rayon.
* **Structure conditionnelle** : Ecrire un mini quizz où le joueur doit répondre à 3 questions questions en mode console. A chaque question le joueur peut gagner 1 point s'il répond correctement. S'il répond faux, donner lui la bonne réponse pour qu'il ne se trompe pas la prochaine fois !
* **Boucle** : Ecrire un algorithme qui demande à l'utilisateur de rentrer un entier qui définira la longueur d'une chaîne de caractères que vous construirez ensuite à base de "#" et que vous afficherez ensuite dans la console. Exemple : si l'utilisateur rentre '6' vous aurez en sortie "######".

## Niveau 2 (on réfléchit un peu)
* **Calcul** : Ecrire un algorithme qui permet à l'utilisateur de convertir un angle en degrés vers un angle en radians et vice versa. Il sera possible à l'utilisateur de choisir 3 fonctionnalités : 1) je convertis de degrés en radians 2) je convertis de radians en degrés 0) Je quitte le programme.

* **Conditions** : 
  -   Écrire une fonction qui affiche si une année est bissextile ou non.
  -   Écrire une fonction qui affiche combien d'années dans un intervalle donné (par exemple \[1980, 2016\[ ) sont bissextiles.

* **Boucle** : Ecrire un algorithme qui permet de calculer le PGCD de deux nombres en utilisant la méthode Euclidienne. Le calcul devra être fait dans une méthode dédiée spécifiquement au calcul.
* **Boucle & Récursivité** : Ecrire un algorithme qui permet de calculer la factorielle d'un nombre que l'utilisateur donne en entrée.
* **Boucle & Récursivité** : Ecrire un algorithme qui permet de calculer le énième nombre de la suite de Fibonacci.

* **Conditions et Boucles** :
  -   Écrire une fonction qui affiche si un nombre est premier ou non.
  -   Écrire une fonction qui affiche tous les nombres premiers inférieurs à un nombre donné.

## Niveau 3 (on se creuse les méninges)
* **Palindrome** : Ecrire un algorithme qui permet de vérifier si un nombre donné en entrée est un palindrome.
* **Calcul** : Ecrire un algorithme qui permet à l'utilisateur de rentrer un nombre et d'avoir en sortie sa racine carrée. Faire la même chose pour la racine n-ième (x tel que x^n= v).
* **Tri & Tableau** : Ecrire l'algorithme du tri à bulle.
* **Répartition** :
  -   Écrire un algorithme qui permette de répartir une charge de K tâches en N batchs (lots) consécutifs. On voudra lisser la charge en faisant en sorte que la différence entre le nombre de tâches entre les lots soit au plus égale à 1. Par exemple, pour la répartition de K= 7 tâches en N= 5 lots:
   ``` 
   1 1 1 2 2
   ```
  -   On voudrait en plus répartir les tâches de façon éviter d'avoir à la fois des lots consécutifs de charge maximale et des lots consécutifs de charge minimale dans une même série (si les charges minimale et maximale sont différentes, évidemment).
  ```
  1  1  2  1  2  
  ```

* **Entrée/Sortie & boucle** : Ecrire un algorithme qui prend en entrée un nombre entier entre 5 et 25 qui désignera la hauteur d'un sapin à dessiner en mode console. Une fonction de création de l'arbre doit être réalisée. Elle prend en paramètre la hauteur de l'arbre et renvoie sous forme d'un tableau de chaînes de caractères les étages du tableau. Une fonction de création de chaque étage de l'arbre doit être créée et être utilisée dans la fonction de création de l'arbre.

```
exemple du sapin de taille 5

    #
   ###
  #####
 #######
#########
   ###
```

* **Variations** :
  -    Écrire une fonction qui affiche une règle graduée de longueur N, avec des graduations '+' tous les 5 segments. La règle commence par un '|' et, seulement si le dernier caractère correspond  une graduation, se termine aussi par un '|'.
  Pour une règle de longueur 12 :
  Le premier '|' est le segment de 0 à 1, le premier '-' est le segment de 1 à 2, le premier '+' est le segment de 5 à 6, le
  deuxième '+' est le segment de 10 à 11 et le dernier '-' est le segment de 11 à 12.
  ```
  |----+----+-
  ```
  -   Écrire une fonction qui affiche une version plus large de la règle graduée, comme ci-dessous (pour les bords supérieurs et inférieurs, toutes les graduations sont indiquées par le même caractère '+') :
  Pour une règle de longueur 12:
  ```
  +----+----+-
  |----+----+-
  +----+----+-
  ```

* **Entrées/Sorties, boucles et conditions** :
Écrire une fonction qui prend en entrée deux nombres entiers x et y ∈ \[ 0, 26 \[  et affiche la ligne entre le point (0,0) et
le point (x,y). On considère le point (0,0) en haut gauche et les abscisses (resp. ordonnées) croissante vers la droite (resp. le bas).
Par exemple, pour x=5, y=3 :

``` {.example}
#     
 ##   
   #  
    ##
```

Pour x=15, y=9 :

``` {.example}
##              
  ##            
    #           
     ##         
       #        
        ##      
          #     
           ##   
             #  
              ##
```

Pour x=6, y=8 :

``` {.example}
#      
 #     
  #    
   #   
    #  
    #  
     # 
      #
      #
```

* **Cryptographie** : Ecrire un algorithme qui permet de chiffrer et déchiffrer un message via le chiffrement de  [César](https://fr.wikipedia.org/wiki/Chiffrement_par_d%C3%A9calage). Vous pouvez limiter l'algorithme aux messages en majuscules. Pour mener à bien cet exercice, vous devrez vous servir des codes ASCII.
