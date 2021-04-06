# Evaluation Java Binome

- Durée : 4h30
- Compétences évaluées : POO avec Java, collection, SQL et JDBC

## Enoncé

Vous allez compléter une petite application Java "**Le Resto du jour**".

Voici les 6 classes :

- **Promo** (Intitulé, société, tableau d'apprenant)
- **Apprenant** (prénom, nom, inscrit (oui/non))
- **Restaurant** (Nom du restaurant, specialite)
- **Specialité** (code numérique, libellé de la spécialité)
- **Application** contenant les fonctionnalités et le main()
- **Connection** (Classe de connection à la base de données MySQL - Méthodes statiques)

La **PromoQuatre** est constituée d'**Apprenants**.  
Grâce à cette merveilleuse application, chaque **Apprenant.e** peut s'inscrire le matin même à l'un des restaurants enregistrés dans la base. Chaque **Restaurant** est associé à une et une seule **Spécialité**.

On ne s'occupe ni du prix car tout est gratuit, ni du menu !

Travail :

- compléter le code java des classes et méthodes pour que l'application fonctionne correctement.
- ajouter une classe de connection à la base de données.
- En fonction de la description des classes, créer les tables manquantes (2)

Vous devez ajouter une fonctionnalité qui affiche un Menu dans la console pour effectuer les différentes tâches demandées.

 A - Lister tous les Restaurants enregistrés
 B - Lister tous les Apprenant.e.s de la PromoQuatre
 C - Lister toutes les Spécialités
 D - Inscrire un.e Apprenant.e pour déjeuner dans un Restaurant.
 E - Afficher tous les Apprenant.e.s qui ne sont pas inscrits pour déjeuner.

## Livrable

Projet java (Maven ou Graddle) **LeRestoDuJour** à déposer sur Git.
