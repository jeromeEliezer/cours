# Restitution du projet java1

## Remarques sur le code
- [X] **respect des consignes**   
mettre les fichiers dans un répertoire nommé en minuscule sans accent ni caractère spéciaux.   
ne pas utiliser de package


- [X] **pas d'erreur à la compilation ou à l’exécution**

- [X] **maîtriser les boucles, les conditions, les bases de la programmation objet (constructeurs, méthodes), l'utilisation des arrayList**   
// TODO utiliser des foreach   
// TODO ces valeurs d'attributs sont des exemples utilisés dans la méthode main, il ne faut pas les mettre par défaut ici   
```java
public class Livre {

    String texte = "Voilà .";
    String titre = "J'ai écrit ce livre en 5 secondes";
    String auteur = "Josselin Tobelem";
    String mot;
```

- [X] **implémenter un algo de parcours de liste, faire un code efficace**   
// TODO attention, méthode peu efficace  
// TODO interrompre la boucle (avec un return) dès que le résultat est trouvé  
// TODO confusion, pas besoin de boucle ici :
```java
for (int i = 0; i < texte.length(); i++)
        {
            if (texte.contains(mot))
            {
                return true;
            }            
        }
        return false;
```


- [x] **commenter des méthodes et du code, utiliser des noms de variables adaptés, écrire un code lisible**   
// TODO les commentaires de méthode s'écrivent avec /** + touche entrée (sous vscode)   
// TODO commentaires méthodes, inspirez-vous des api pour écrire la doc, par ex : https://docs.oracle.com/javase/7/docs/api/java/lang/String.html  
// TODO sauter des lignes pour séparer les groupes   
// TODO nom de variable perfectible   
// TODO ne pas générer tous les getters/setters qui ne sont pas utilisés   
// TODO le bloc suivant pourrait être extrait en une méthode pour améliorer la lisibilité   
// TODO supprimer les TODO ...   
// TODO nettoyer le code mort (commentaires temporaires, code inutilisé, ...)  
// TODO tu peux aussi l'appeler nouvelleListe, la variable précédente n'est visibile que dans l'autre méthode  
// TODO nom de variable peu parlant pour une liste :
```java
List<Livre> startwith = new ArrayList<Livre>();
```

- [X] **savoir faire une recherche (indiquer en commentaire à côté de la méthode utilisée, par ex le split, le lien qui vous a donné une indication)**   
// TODO lien vers le résultat de la recherche (par ex stackoverflow)
```java
String texteChange = texte.replaceAll("[^a-zA-Z]","");
```

- [X] **et aussi tester des méthodes dans un main en attendant un résultat précis.**   
// TODO toutes les méthodes non triviales ajoutées doivent être testées   
// TODO trop complexe pour le test, il faut simplement vérifier que la méthode produit le résultat attendu dans un cas connu   
// TODO pour les tests, il faut couvrir tout le code, et réaliser plusieurs tests   
// TODO quel est le résultat attendu?   
// TODO les variables créées pour les tests doivent être dans le main


## Remarques générales :
Bon travail, projet satisfaisant.
Mes remarques en TODO dans le code.

Sympas les tests :)

Bon algo pour frequenceLettre.

Tests à compléter.

Bonne exigence dans la compréhension (je dis ça par rapport à tes commentaires qui expliquent toutes les étapes du code).

Attention, des corrections à faire dans la classe Livre
