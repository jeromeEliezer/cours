# Entrainement :  Java - JDBC - SQL - MySQL

## 1. Compléter les méthodes de la classe Requetes

### Ajouter les éléments ci-dessous

- Ajouter une classe Categorie dans le package **fr.bouget.model**
- Compléter les méthodes
  - ajouterCategorie(Categorie categorie)
  - ModifierCategorie(Categorie categorie)
  - SupprimerCategorie(Categorie categorie)
  - getAllCategories()

   Créer la table dans la BD-Avion même si cela n'a aucun rapport.

    Nom de la table : categorie
    Colonnes :
  - id : identifiant de type entier auto-généré par MySQL (clef primaire)
  - name : libelle de la catégorie en chaine de caractères d'une longueur de 45

  - ajouter les enregistrements suivants en utilisant la méthode **ajouterCategorie()** :
    - 1 Cinéma
    - 2 Chant
    - 3 Musique
    - 4 Théâtre

  - Utilisez les autres méthodes que vous avez écrites.

## 2. Compléter les méthodes de l'application bd-avion

- ajouterAvion()
- ajouterVol()
- modifierAvion()

L'application devra fonctionner en console. Vous pouvez créer un menu pour vous permettre de choisir une action et de saisir les informations dans la console Eclipse.

>Remarque : CRUD est un acronyme qui se réfère à la majorité des opérations implémentées dans les bases de données relationnelles. Chaque composante de l'acronyme peut être associé à un type de requête en SQL ainsi qu'à une méthode HTTP que vous découvrirez ultérieurement.

Auteur : **Philippe Bouget**