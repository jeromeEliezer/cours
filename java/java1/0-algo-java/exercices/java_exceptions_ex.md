# Exercices Java exceptions
## Etape 1 : Sécuriser l'application de base de données alimentaire
Reprenez votre application de gestion de base de données alimentaire et ajoutez-y la gestion d'exception pour vous assurer que tous les cas de fonctionnement anormaux sont gérés (si l'utilisateur rentre du texte à la place de nombres, ...)

Reprenez le fichier où sont stockés les aliments et modifiez sa structure. Vérifiez que votre programme renvoie des messages :gb: _user friendly_ :us: et ne renvoie pas de messages illisibles pour vos utilisateur.trice.s.

## Etape 2 : Ajouter une nouvelle fonctionnalité "à risque"
Ajoutez maintenant à votre application une fonction qui permet de choisir en mode console quel est l'emplacement du fichier à utiliser (votre programme doit alors bien réagir si le fichier n'existe pas, s'il est mal formaté, ...).

## Etape 3 : Ajouter de nouvelles fonctionnalités et adapter la gestion
**Note :** Cette étape est un peu plus difficile. Ne paniquez pas si vous n'arrivez pas au bout pendant la journée de formation. C'est un bon exercice à continuer à la maison pour approfondir.

Ajoutez maintenant de nouvelles fonctionnalités permettant :
* de sélectionner plusieurs aliments (par leur nom) afin de composer un "repas". L'utilisateur doit pouvoir spécifier la quantité en grammes (ou millilitres) de chaque aliment (dans le fichier aliments.csv, les valeurs nutritionnelles valent pour 100g ou 100 ml). Une fois que l'utilisateur.trice a fini sa sélection en mode console, le programme donnera un résumé nutritionnel du repas (énergie totale, protéines totales, ...).
* de donner un nombre de convives pour ajuster les valeurs nutritionnelles en fonction du nombre de personnes.
* de rechercher les x aliments les plus / les moins énergétiques d'une catégorie (ou les plus chargés en protéines, ou en lipides, ...). L'utilisateur.trice doit donner la catégorie qui l'intéresse, le nombre d'aliments à afficher, dire par quel paramètre il.elle souhaite trier et dans quel sens.
* de générer aléatoirement un repas avec x ingrédients de catégories différentes.
