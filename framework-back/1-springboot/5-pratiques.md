# Mise en pratique

## 1. Projet Spring & Javascript & HTML

Pour ce projet vous pouvez :

- soit utiliser le projet `springdemo03` qui récupère et retourne un tableau d'objets **Pilote** instancié dans le Contrôleur.

- soit accéder à la base de données bd-avion et retourner les objets `Pilote` récupérés dans la table Pilote (Utilisez JDBC ou Hibernate)

## 2. Projet Spring & JavaScript & JDBCTemplate

Ce TP vous rappelle certainement quelque chose...

Les vidéos sur youtube possèdent un id, par exemple : [https://youtu.be/FVYxxHn8R-k](https://youtu.be/FVYxxHn8R-k), l'id est : FVYxxHn8R-k.

Une ```vidéo``` peut être décrite par un id, un titre et une catégorie.

Une ```catégorie``` peut posséder un id et un intitulé (par exemple : fun, sport, tutorials, ...).

- Créez le diagramme UML ou le MCD correspondant.
- Implémentez les classes de modèle (**vidéo** et **catégorie**).
- Utilisez Springboot pour connecter ce modèle avec une base mysql et créez les méthodes CRUD au choix :

    - JDBCTemplate
    - JDBC tout court
    - Annotations JPA

1) Visualiser la liste des vidéos présentes en base sous le format JSON 

2) afficher la liste dans une page HTML grâce à JavaScript (vu avec Josselin).

2) Ajouter une vidéo (en fournissant un id, un titre et l'intitulé de la catégorie)

3) Lire une vidéo (pour ça, allez voir ce [repository](https://github.com/jtobelem-simplon/simple-webview))
