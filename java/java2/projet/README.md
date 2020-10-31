# Projet

Le but de l'application est d'afficher des informations stockées dans une base de données. L'application devra aussi faire appel à une api rest externe en rapport avec les objets choisis (par exemple pour ajouter de nouveaux objets en base).

## En groupe de 3-4 personnes

- 15 minutes pour vous mettre d'accord sur un thème en commun : ce sera le nom de votre projet
- cherchez une api que vous souhaitez utiliser sur : [https://rapidapi.com/](https://rapidapi.com/)
- 15 minutes de _tempête de cerveaux_ pour définir ce que vous allez faire avec cette api
- inspirez-vous des deux projets précédents pour réaliser votre projet (toujours en groupe)

#### Quelques exemples d'api

[https://www.swapi.co/](https://www.swapi.co/)

[https://data.ratp.fr/explore](https://data.ratp.fr/explore)

[https://fr.wikipedia.org/w/api.php](https://fr.wikipedia.org/w/api.php)

[https://developer.github.com/v3/](https://developer.github.com/v3/)

[https://opendata.paris.fr/api/](https://opendata.paris.fr/api/) : par exemple les arbres

[https://www.data.gouv.fr/fr/](https://www.data.gouv.fr/fr/) pour les données du gouvernements (voir [ici](https://www.nosdeputes.fr/) une belle application)

[https://github.com/regardscitoyens/nosdeputes.fr/blob/master/doc/api.md](https://github.com/regardscitoyens/nosdeputes.fr/blob/master/doc/api.md)

et aussi [https://www.lafabriquedelaloi.fr/api/](https://www.lafabriquedelaloi.fr/api/)

[https://world.openfoodfacts.org/data](https://world.openfoodfacts.org/data) : open food facts (utilisée par exemple par l'application yuka)

[https://www.ibm.com/watson/developer/](https://www.ibm.com/watson/developer/) : l'intelligence artificielle d'IBM!!

[https://www.themoviedb.org/documentation/api](https://www.themoviedb.org/documentation/api) : La base de données des films

#### Note sur le scrapping

Pour les sites qui ne diffusent pas d'api, il est aussi possible de **scrapper** les données, c'est-à-dire utiliser un programme qui va consulter le site de façon automatique et récupère dans la page les données voulues.

Exemple avec marmiton : [https://github.com/yannguegan/scrap-marmiton](https://github.com/yannguegan/scrap-marmiton)

L'auteur de ce repo donne aussi un portfolio inspirant de ses meilleurs projets [https://dansmonlabo.com/portfolio/](https://dansmonlabo.com/portfolio/)

#### Cahier des charges

Votre application doit :
- porter sur au moins deux tables,
- créer des modèles java qui correspondent aux tables (une classe par table),
- utiliser au moins deux requêtes d'une api rest existante (par exemple une requête sur des users et une autre sur des repos pour l'api de github)
- être capable de convertir ces les résultats des requêtes en base en listes d'objets java
- pouvoir effectuer une opérations CRUD à effectuer via jdbc

```
1 | Create
2 | Read
3 | Update
4 | Delete

Veuillez choisir un numéro :
```
- pouvoir afficher la liste complète (ou tronquée aux N premiers) numérotée des objets en base récupérée via jdbc sur laquelle effectuer cette opération (update, delete, read) :

```
1 | Anissa   | chargée de projet
2 | Jonathan | soutien au projet
3 | Samuel   | soutien au projet
4 | Philippe | formateur
5 | Josselin | formateur

Veuillez choisir un numéro :
```
- être capable d'ajouter tous les objets résultats d'une requête api à votre base

#### Livrables

- un MCD de votre base
- un projet java buildé avec gradle qui contient une classe App.java (point d'entrée), un package model (au moins deux classes) et un package jdbc (les classes qui effectuent les opérations crud) et un package api (pour effectuer les requêtes api et transformer le résultats en objets java)
- un lien vers votre github qui contient un .gitgnore, un readme.md (description du projet, membres de l'équipe, image de votre mcd)
- une présentation orale (à partir du markdown et d'eclipse) pendant laquelle chacun présente une partie
- chaque personne de l'équipe fait un rendu sur simplonline qui sera validé après présentation orale

#### Equipes

nicolas congard   
tony deride   
olivier piveteau


robert roussely   
laetitia louis   
sébastien merchadou


elodie pessy   
bastien cacciuttolo   
cédric maunier


sophie balcon   
didier fournol   
romain gallard


virgile oxaran   
francois mackowski


florian dupont   
maureen defoort   
camille paudrat
