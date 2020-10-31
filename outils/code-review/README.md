# Code review


#### Comment mener une revue de code :

[what-to-look-for-in-java-8-code](https://blog.jetbrains.com/upsource/2016/08/03/what-to-look-for-in-java-8-code/)   
[code-review-best-practices](https://blog.jetbrains.com/upsource/2018/08/30/code-review-best-practices/)   


  *Code reviews can be difficult for code authors, as we developers can be attached to our code.
  It’s a nice idea to also leave positive feedback on the reviews as well as noting changes that need to be made.
  This might not seem like an important step in terms of getting great code out of the review, but it is an important step in order to motivate developers and perhaps overcome some of the fear or dislike that some people feel towards code reviews.*


#### How to
- 2h par apprenant/jour
- Placer des commentaires dans le code à l'endroit où ils sont pertinents : // TODO JT

#### A vérifier en premier
- compilation
- liste des warnings (eclipse ou ij)
- [sonarlint](https://www.sonarlint.org/)
- les tests runnent
- le projet démarre sans erreur back
- le projet démarre sans erreur front

#### Installation
- maven/gradle
- bd
- gitignore

#### Forme
- pas de code mort
- pas de répétition
- pas de répétition
- pas de répétition
- longueur des méthodes (5-10 lignes)
- longueur des classes
- longueur des packages
- nommage des variables : ni trop court, ni trop long
- nommage des variables : consistance (toujours la même convention : langue, séparation des mots)
- commentaires pour chaque méthode non triviale (un get est trivial)
- commentaires à l’intérieur des méthodes pour les endroits peu clairs

#### Tests
- couverture (toutes les méthodes d'un controleur, d'un service, d'un repo)
- pertinence

#### Dépendances
- dépendances supplémentaires front(material, primeng)
- dépendances supplémentaires back

#### Algorithmes, éléments remarquables
- identifier un endroit algorithmique du code, évaluer son efficacité
- observer les librairies utilisées (hashmap, logger, ...)
- observer les syntaxes utilisées (lambda en java8)
- observer les mécanismes utilisés (validator)
