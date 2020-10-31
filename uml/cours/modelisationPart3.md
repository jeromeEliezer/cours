<center> <h1>Modélisation - Babysitting web site</h1> </center>

# Demande
Vous allez modélisez un site de réservation de babysitting.  
L'application permet de mettre en relation un babysitter et des parents d'enfants.  

Le babysitter s'inscrit sur le site, il donne :

* son nom, son prénom, son age
* son adresse postale
* ses compétences (anglais, musicien, ....)
* ses disponibilités dans un calendrier hebdomadaire  

Le parent s'inscrit sur le site, il donne :

* son nom
* le nombre d'enfants à garder
* son adresse postale  

Le parent et le babysitter doivent s'identifier pour accéder au site.  

Le calendrier est composé :

* de jours dans la semaine (lundi, mardi,...)
* de plages horaires (heure de début, heure de fin)

Le parent recherche un babysitter disponible, pour une date donnée, sur une plage horaire de son choix, et peut choisir des compétences.
La recherche affiche la liste des babysitters disponibles.

 
# Une solution 

## Définition des entités

Dans un 1er temps, il faut définir les entités sans les relier entre elles.  
La 1ère erreur que fait un débutant lorsqu'il demarre un diagramme, c'est de partir dans le détail.
Par exemple, on commence à penser comment un parent va interagir avec un babysitter, ou on définit comment un babysitter enregistre ses disponibilités.  
On finit par concevoir un schéma complexe.  
En fait, il faut commencer par définir les acteurs et le référentiel.

### Les acteurs
Les acteurs sont les entités qui interagissent sur le système.  
Il y a 2 acteurs :
* le babysitter
* le parent  

Ces 2 acteurs doivent s'identifier.  
Ils héritent donc de User qui est une entité classique de connexion à un site.  

![Acteurs](img/bbSitter1.png)    

Puis on complète, et on relie les acteurs.  

![Acteurs](img/bbSitter2.png)    


### Le référentiel
Le référentiel est composé d'éléments qui évoluent très peu. C'est les fondations du modèle.  
Ici, nous avons des compétences :    
![Référentiel](img/bbSitter3.png)    

un calendrier:  
![Référentiel](img/bbSitter4.png)  

un calendrier avec des relations :  
![Référentiel](img/bbSitter5.png)  


## Les relations du babysitter
Un babysitter posséde des compétences et mets ces disponibilités dans le calendrier.  
![Référentiel](img/bbSitter6.png)  

## Le schéma final
Et voilà :  

![Référentiel](img/bbSitter7.png)   
note : Il existe une relation entre le parent les compétences car les compétences recherchées par les parents sont des données persistentes (le parent ne resaisit pas à chaque requête les compétences qu'il désire.)  

