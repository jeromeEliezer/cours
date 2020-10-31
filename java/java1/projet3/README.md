# Alerte à la poste!!

![img](https://media.giphy.com/media/xUPGcnR38snC3nf6X6/giphy.gif)

On suspecte des connexions depuis différentes dsi de laposte vers des ip reconnues malveillantes. Votre mission va consister à identifier les intrus à partir des logs de connexion.

## 1. Cahier des charges

Dans le fichier [**connexion.log**](./connexion.log), on a enregistré les ip qui ont été accédées depuis des ordinateurs de la poste entre 2015 et 2019. Sur chaque ligne on lit l'ip qui a été accédée, le login de la personne et la date/heure de connexion.

A vous de jouer pour retrouver le/les hackers (blackhat) infiltrés.

1) Parcourez le fichier pour trouver la liste de tous les utilisateurs qui se sont connectés, enregistrez cette liste dans un fichier **utilisateurs.txt**.

> *Indice : cherchez la fonction split()*

2) On soupçonne qu'une personne se connecte en dehors des heures d'ouverture des bureaux (8h-19h), peut-être depuis un poste distant. Utilisez un script pour retrouver l'identifiant de cette personne ainsi que l'ip à la laquelle elle se connectait

3) Le service de sécurité informatique a fournit un fichier contenant les ips dangereuses : [**warning.txt**](./warning.txt). Lisez ce fichier pour construire une liste contenant toutes les ip dangereuses. A l'aide de cette liste, relevez dans le fichier connexion.log tous les utilisateurs qui se sont connectés sur une de ces ip, on produira un fichier **suspect.txt** avec une ligne par utilisateur et le nombre de fois qu'il s'est connecté à une ip interdite :
```
josselin;17
philippe;27
```

> *Indice : utilisez une HashMap dont la clé est l'identifiant et la valeur une List d'ip*

## 2. Livrables

Un répertoire zippé nommé en minuscule sans accent : prenom-java3, qui contient trois fichiers :
- **HackerTracker.java**
- **utilisateurs.txt** et **suspect.txt**.

La classe nommée HackerTracker.java contient un `main` qui lance un menu qui permet de répondre aux questions.


Ne pas utiliser de package dans votre code.
