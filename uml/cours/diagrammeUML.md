# Les diagrammes utiles pour modéliser une application web

Il existe 3 catégories de diagrammes :

* Diagramme décrivant les fonctionnalités
* Diagramme décrivant les données, la partie invariante
* Diagramme décrivant les actions dans le temps
  
## Description des fonctionnalités

Un seul  diagramme. C'est le diagramme des cas d'utilisation (USE CASE)
L'équivalent SCRUM est le USER STORY.   
Avec ce diagramme, on identifie les acteurs et leurs rôles ainsi que les fonctionnalités de l'application.  
On définit un Use Case global pour l'application, puis des Uses Cases détaillés si besoin pour chacun des Uses cases principaux.  
[exemple](http://www.uml-sysml.org/diagrammes-uml-et-sysml/diagramme-uml/use-case-diagramme)

Chaque Use Case doit donner lieu à la description d'un scénario textuel décrivant tout le cheminement du traitement :

* Lorsque tout se passe bien
* Lorsque quelque chose se passe mal
Les scénaris permettent aussi de décrire les champs impactés par le traitement. On le relie souvent à une page Web.

## Description des données

Un seul diagramme. C'est le diagramme des classes (MOO)
On définit les classes (entités) qui sont **persistantes** (celles qui seront stockées en base de données).  
[Notre tutoriel ici](modelisationPart1.md)

## Description des traitements

Ici nous avons 3 diagrammes. Vous utilisez au choix le **diagramme des séquences** ou le **diagramme d'activité**.  
Pour l'enchaînement des écrans, on utilise le diagramme de navigation.

### Le diagramme d'activité

Le diagramme d'activité décrit un comportement en fonction du temps. 

[exemples](https://creately.com/diagram-community/examples/t/activity-diagram?utm_source=umltypes&utm_medium=blog&utm_campaign=tutorialposts)

### Le diagramme de navigation

Le diagramme de navigation définit l'enchaînement des vues (écrans). Il est complémentaire du diagramme d'activité.
C'est ce que l'on appelle la **cinématique**.

### Le diagramme des séquences SI

On définit une action utilisateur dans le  temps.  
Une action exécute une URL donc un contrôleur, ce qui déclenche une action et renvoie une réponse.
Bien utile dans une architecture MVC, car il aide à la réalisation des contrôleurs. Avec ce diagramme, nous sommes capable de nommer une requête http.  
Un exemple d'authentification de token avec Spring Boot sous forme d'un diagramme de séquence.

![Authentification](../img/Diagram-Authentification.png)

## Pour aller plus loin

N'hésitez pas à vous procurer ce très bon [livre](https://www.eyrolles.com/Informatique/Livre/uml-2-9782212123890).

Auteur : **Philippe Bouget**