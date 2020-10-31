# Projet la fourchette

![img](restau.gif)

On va modéliser une application du type la fourchette qui permet de gérer une liste de restaurant et d'effectuer des recherches par critères, miam miam.

Le projet est à faire en équipe de 2-3 personnes, la [composition des équipes est ici](binomes.md).

Il n'y aura pas de rendu à faire pour ce projet. Vous aurez un corrigé dans la semaine.

## Classe Restaurant.java

1) Récupérer la classe [Restaurant.java](Restaurant.java)   
2) Ajouter un constructeur (qui initialise les attributs)   
3) Ecrire les méthodes `estVeg()`, `estBrasserie()`, etc ... et leur documentation   
4) Ecrire la méthode `toString()`   
5) Ecrire la méthode `getVille()` en utilisant la méthode split()   
6) Tester ces méthodes dans un main (pas la peine de faire tous les tests des méthodes de la question 3)

## Classe Guide.java

1) Un guide possède un nom (par exemple la fourchette) et une liste de restaurants. Créer la classe Guide.java, ses attributs et son constructeur.   
2) Créer les méthodes (n'oubliez pas les commentaires en début de méthode, [vous pouvez vous inspirer de l'api](https://docs.oracle.com/javase/8/docs/api/java/util/List.html#add(E))) :   

```java
public boolean addRestau(Restaurant newRestau) {
// TODO
}

public boolean containsRestau(String restauName) {
// TODO
}
```
> NB : Vous pourrez être amenés à ajouter des getters dans la classe `Restaurant`

3) Créer la méthode `vegList()` qui retourne la liste de tous les restaurants qui sont végétariens.   
4) Créer la méthode `filtreRestau(String gamme, String type, String ville)` qui retourne la liste des restaurants qui vérifient les critères spécifiés.   
5) Créer la méthode `restauAlea()` qui retourne un restaurant (pas un nom de restaurant) aléatoire parmi la liste.   
6) Tester ces méthodes.
