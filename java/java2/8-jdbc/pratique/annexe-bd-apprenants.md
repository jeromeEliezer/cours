# Complément pour l'évaluation (MCD ou Diagramme de classe)

Dans le but de mettre en place une application pour gérer les différentes activités des apprenants de la Promo3 de LaPoste, voici ci-dessous, les informations dont vous disposez :

- un(e) apprenant(e) peut avoir aucune ou plusieurs activités
- un(e) apprenant(e) est rattaché(e) à une et une seule région
- une région a au minimum un, voire plusieurs apprenant(e)s

Notre base de données doit enregistrer les informations suivantes :

Pour chaque apprenant(e) on enregistre son prénom et son nom, sa date de naissance, son email et sa photo.
Une région est identifiée par un numéro d'ordre auto-généré et commençant par 1. Un libellé lui est associé.

Les 3 régions sont :

- Ile de France
- Pays de Loire
- Aquitaine

Voici la liste des activités qui doivent être enregistrées dans la base :

- 001 => Programmer en java
- 002 => Ecouter les mouches
- 003 => Jouer au bilboquet
- 004 => Dormir pendant le cours
- 005 => Chercher un stage à Haiti
- 006 => Attendre les vacances
- 007 => Prendre le goûter
- 008 => Caresser le chat
- 009 => Ecouter de la musique
- 010 => Rien faire
- 011 => Jouer à Angular
- 012 => Rêver
- 013 => Travailler jour et nuit

Voici la liste des apprenant(e)s à enregistrer et leurs activités respectives :

- 'Géraldine', 'Autrique','1970-12-27','geraldine.autrique@laposte.fr' en région Aquitaine => a pour activités : 001, 003, 005
- 'Nicolas', 'Filine', '1986-08-07', 'nicolas.filine@laposte.fr', en région Ile de France => a pour activités :002, 004, 006
- 'Pierre', 'Gorce', '1976-01-05', 'pierrexgorce@gmail.com', en région Ile de France => a pour activités :007
- 'Samuel', 'Joblon', '1973-10-18', 'samuel.joblon@gmail.com', en région Ile de France => a pour activités :008, 010
- 'Phoneprasong', 'Khamvongsa', , 'pomlao@hotmail.com', en région pays de Loire => a pour activités :002, 004, 006
- 'Vincent', 'Lebegue', '1986-08-13', 'vincent.lebegue@labanquepostale.fr', en région Ile de France => a pour activités : 001, 003, 005
- 'Matthieu', 'Londeix', '1981-05-19', 'matthieu.londeix@laposte.fr', en région pays de Loire => a pour activités : 002, 004, 006
- 'Thomas', 'Longueville', '1972-04-26', 'thomas.longueville@laposte.fr', en région pays de Loire => a pour activités :008, 010 OO9
- 'Christine', 'Métivier', '1980-04-29', 'christine.pereira@laposte.fr', en région Ile de France => a pour activités :001, 003, 005
- 'Laurent', 'Picard', '1972-05-23', 'laurent2.picard@laposte.fr', en région Ile de France => a pour activités : 011
- 'David', 'Pouline', '1982-07-07', 'david.pouline@facteo.fr', en région Aquitaine => a pour activités : 002, 004, 006
- 'Julien', 'Prod\'homme', '1990-08-31', 'prodhomme.julien@gmail.com', en région Ile de France => a pour activités : 001, 003, 005
- 'Samuel', 'Sabot', '1980-04-10', 'samuel.sabot@facteo.fr', en région Aquitaine => a pour activités : 011
- 'Salvatore', 'Sancesario', '1975-05-10', 'salvatore.sancesario@facteo.fr', en région Ile de France => a pour activités : 008, 010
- 'David', 'Sylvestre', '1986-07-06', 'david.sylvestre@mfacteur.fr', en région pays de Loire => a pour activités :001, 003, 005
- 'Cédric', 'Tressous', '1984-08-08', 'cedric.tressous@gmail.com', en région pays de Loire => a pour activités :008
- 'Zébulon', 'Zébutruc', '1977-03-13', 'zebulonzeb@free.fr', en région pays de Loire => a pour activités :ne fait aucune activité

Auteur : **Philippe Bouget**