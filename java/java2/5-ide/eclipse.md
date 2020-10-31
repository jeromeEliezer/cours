# Eclipse

## Installation

Vérifier la version de java utilisée.
Installer github. Configurer le dossier git.
Installer sonarlint.
[Installer object aid.](https://www.objectaid.com/install-objectaid)

## Workspace et projets eclipse

Le workspace est l'espace de travail utilisé par eclipse. Il est composé des projets eclipse qui sont des dossiers contenant les sources du code, les classes générées et des fichiers .project, .classpath, ... qui contiennent des informations de configuration sur le projet.

Voici l'architecture de base d'un projet qui s'appelle puissance4 et dans lequel on crée un package puissance4 :
```
bin\
  puissance4\
    Main.class
src\
  puissance4\
    Main.java
.settings\
.classpath
.project
```

On peut remarquer que l’arborescence des packages est dupliquée pour les sources et les classes générées. La compilation est cachée, elle est effectuée à chaque sauvegarde d'un fichier java.

## Perspective et vues

Eclipse contient un ensemble de modules que l'on peut ouvrir et afficher où l'on veut et qui s'appellent les **vues**.

On peut créer des configurations d'ensembles de vues, cela s'appelle des **perspectives**. Il existe plusieurs perspectives par défaut : java, debug, java EE, ...

#### principales vues

- navigator : pour naviguer dans les fichiers
- package explorer : la même chose mais pour les fichiers java
- console : pour afficher la sortie standard
- taches : la liste des TODO du code
- problems : toutes les erreurs et warning, cette liste devrait toujours être vide :)
- outline : pour une vision rapide des attributs et méthodes d'une classe

#### vue package explorer

C'est une des vues principales, elle permet de naviguer efficacement dans un projet java en affichant les informations importantes et bien présentées.

- working set : pour rassembler plusieurs projets
- fichiers exclus : par défaut les classes et les fichiers ressources
- package presentation/flat tree : généralement celle que l'on préfère

## Outils

#### Refactoring

Le refactoring permet d'améliorer la lisibilité et donc la maintenabilité et souvent en cadeau l'efficacité du code. On peut le faire au fur et à mesure, ou à chaque fois que l'on vient de valider une étape, par exemple coder avec succès une nouvelle fonctionnalité.

Cela consiste à donner des bons noms aux variables, séparer les grosses méthodes en plusieurs petites, déplacer du code à un meilleur endroit.

- ctrl+space : forcer l'autocomplétion
- ctrl+shift+f : applique un bon format sur le fichier édite (espaces, positions des accolades, ...)
- alt+shift+r : permet de renommer intelligemment une variable (ou classe, méthode, ...) dans tous les endroits où elle est utilisée.
- refactor/extract method : pour combattre efficacement contre les méthodes trop longues :)
- javadoc : comme sur vscode /** + enter permet de créer l'entête d'une méthode

#### Génération automatique de code

- signature des méthodes
- templates : main, for,... comme dans vscode
- getters/setters
- constructeurs
- toString

#### Recherche/navigation

Eclipse permet de chercher/remplacer du texte comme des editeurs usuels. Il permet aussi de faire des parcours plus propres au java

- texte simple
- éléments java
- opencall hierarchy
- **alt-gauche, alt-droite**
- **entre+click ou f3**

#### Debugger

La perspective debug permet de réaliser cette tache efficacement. Voici 4 vues intéressantes qu'elle ouvre par défaut :

- debug : pour voir où l'on se situe dans la stacktrace
- variables : la liste des variables déclarées
- breakpoints : les endroits où le debugger va s'arrêter
- expressions : permet d'évaluer des morceaux de code java en utilisant le contexte (les variables déclarées)

#### Git/github

Pour gérer la connexion avec git/github, on pourra utiliser les vues suivantes :

- git repositories
- git staging : s'ouvre automatiquement lorsque l'on commit
- compare : s'ouvre automatiquement lorsque l'on clique sur un élément à commiter

#### Object aid

Un soft pratique pour visualiser uml à partir d'un projet existant.
