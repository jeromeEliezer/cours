# Exercices Java Streams
## Etape 1 : Une mini application base de données alimentaire
Votre mission est de réaliser une application simple en mode console qui permet :
1. De rentrer un aliment dans la console en indiquant son nom, sa catégorie (fruit, légume, viande, ...), sa valeur énergétique (en kcal), son taux de protéines (g/100g), son taux de glucides (g/100g) et son taux de lipides (g/100g)
2. De sauvegarder un aliment rentré en mode console dans un fichier texte
3. De supprimer un aliment du fichier en spécifiant son nom
4. De lister tous les aliments rentrés dans le fichier et de les afficher en mode console

L'utilisateur.trice de votre application doit pouvoir enchaîner les actions tant qu'il.elle ne choisit pas explicitement de quitter l'application.

## Etape 2 : Communication entre applications
Une fois que votre application fonctionne et répond aux exigences de l'étape 1 faites une sauvegarde (copie) de votre projet. Ensuite, échangez vos fichiers "aliments" avec un.e autre apprenant.e et tentez de l'utiliser dans votre application.

* Est-ce fonctionnel ?
* Devez-vous apporter des modifications à votre programme pour que ça marche ? Si oui, faites les.
* Une fois les modifications effectuées, arrivez vous à utiliser votre application avec votre fichier "aliments" de départ ?
* Est-il possible de rendre votre programme compatible avec n'importe quel type de fichier "aliments" en entrée ?

Notez vos conclusions dans un coin de votre PC. Nous aurons l'occasion d'en reparler plus tard pendant la formation.

## Etape 3 : Plus de données !
**Note :** Cette étape est un peu plus difficile. Ne paniquez pas si vous n'arrivez pas au bout pendant la journée de formation. C'est un bon exercice à continuer à la maison pour approfondir.

Si l'étape 2 est remplie, faites à nouveau une sauvegarde (copie) de votre projet et lancez vous dans l'étape 3.

Vous trouverez dans les ressources du cours un fichier [aliments.csv](../resources/java_streams/aliments.csv) qui contient un grand nombre d'aliments. Ce fichier est au format csv (Comma-Separated Values).

Votre première mission est de rendre votre application compatible avec ce fichier.

Votre seconde mission est d'ajouter une fonctionnalité à votre application qui permet à l'utilisateur.trice de chercher dans le fichier aliments.csv des aliments par catégorie. Votre fonctionnalité doit compter tous les aliments qui correspondent à cette catégorie et proposer d'afficher la liste dans la console.

**Exemple :** Je choisis de chercher les aliments de type **fruit**. L'application doit alors chercher dans le fichier tous les aliments dont la catégorie contient **fruit**, me retourner le compte et me proposer de lister tous les aliments qui correspondent.

Afin de mener à bien cette mission, vous allez devoir vérifier chaque catégorie de chaque ligne du fichier. Il peut arriver que le catégorie soit plus spécifique que ce que l'utilisateur.trice a entré en argument. Vous pouvez utiliser des **expressions régulières** pour vérifier que la catégorie d'un aliment contient ou non la catégorie donnée en argument ou utiliser les méthodes de comparaison de la classe `String`.
