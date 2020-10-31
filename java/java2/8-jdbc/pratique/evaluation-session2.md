# Projet d'évaluation :  Java - JDBC - SQL - MySQL - MCD ou UML

En vous aidant des cours :

- Java, JUnit
- JDBC
- MCD (modélisation Merise pour la base de données) sous JFreesoft ou JMerise
- SQL avec MySQL (DataGrip ou MySQL WorkBench)
- Markdown (pour concevoir votre documentation du projet)
- Utilisez GitHub pour travailler en binôme.

[Annexe pour créer la BD](annexe-bd-apprenants.md)

réaliser les tâches suivantes :

## 1. Connexion et requêtes "Select"

- En fonctions du cahier des charges que vous trouverez en annexe, élaborez le MCD, MLD et le MPD.
- Créez une base de données sous MySQL nommée **bd-apprenants**
- Ajoutez les informations dans les tables correspondantes.
- Créez un nouveau projet sous Eclipse ou un autre IDE de votre choix
- Créez les packages nécessaires
- Créez une classe de connection à la base de données
- Créez une classe contenant les méthodes pour exécuter des requêtes suivantes (affichez les résultats dans la console) :

  - Affichez les noms et prénoms de tous les apprenant(e)s.
  - Affichez la liste des apprenants pour chaque région (Ile France, Pays de Loire et Aquitaine).
  - Recherchez un apprenant(e) (par son nom) et afficher la liste des activités qu'il ou qu'elle pratique.
  - Recherchez les apprenants qui pratiquent une activité passée en paramètre d'une méthode.

L'application devra fonctionner en console.

2 possibilités :

- Vous créez un menu pour choisir une action et saisir les informations dans la console Eclipse.
- Vous lancez des méthodes dans votre méthode main() en affichant ce que vous faites (toujours en console).

## 2. Connexion et requêtes CRUD (Create, Read, Update, Delete)

- Create : Ecrire une méthode qui permet d'**ajouter un(e) nouvel(le) apprenant(e)**.
- Create : Ecrire une méthode qui permet d'**affecter 2 activités (Caresser le chat et Ecouter de la musique) à l'apprenant(e) que vous venez d'ajouter**.
- Read   : Ecrire une requête qui permet d'afficher la **liste des activités que personne ne fait**.  (ajouter des activités non pratiquées)
- Update : Ecrire une méthode qui permet la mise à jour du **nom** d'un(e) apprenant(e).
- Delete : Ecrire une méthode qui permet de **détruire un(e) apprenant(e) en fonction de l'objet Apprenant passé en paramètre**.

## 3. Faites-le tester par l'un de vos pairs !

## 4. Evaluation : Faites une démonstration à l'un de vos formateurs !

Présentation + démonstration.
