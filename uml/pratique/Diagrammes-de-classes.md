# Pratique

Maintenant que vous connaissez les concepts UML et les différents diagrammes, il ne vous reste plus qu'à mettre en pratique vos nouvelles compétences.

## Diagrammes de classes

### 1) 15 Diagrammes de classe (sans multiplicité)

1) Un pays possède une capitale

2) Une personne dîne avec une fourchette

3) Un chemin peut représenter un fichier ou un répertoire

4) Un chemin est un répertoire avec éventuellement un nom de fichier

5) Un fichier contient des enregistrements

6) Un fichier est accessible par un utilisateur selon des droits d'accès

7) Un dessin est soit du texte, soit une forme géométrique, soit un groupe de dessins

8) Des personnes utilisent un langage pour un projet

9) Une personne joue dans une équipe pour une certaine durée

10) Une équipe est composée de plusieurs personnes

11) Une route connecte deux villes

12) Un ordinateur est composé d'un ou plusieurs moniteurs, d'un boîtier, d'une souris optionnelle et d'un clavier. Un boîtier a un châssis métallique, une carte mère, plusieurs barrettes de mémoire (RAM, ROM et cache), un ventilateur optionnel, des supports de stockage (SSD, HD, CD-ROM, DVD-ROM,...) et des cartes périphériques (son, réseau, graphique,...). Un ordinateur possède toujours au moins 2 ports USB.

13) L'université comporte des personnels administratifs et techniques, des enseignants, des étudiants et des chercheurs (qui sont tous des personnes). Certains étudiants peuvent être des chercheurs (les doctorants) ou des enseignants (les assistants enseignants). Certaines personnes (étudiants ou non) peuvent être à la fois chercheurs et enseignants.

14) Un éditeur de documents graphiques supporte le groupement d'objets graphiques. Un document se compose de plusieurs feuilles, chacune contenant des objets graphiques (texte, forme géométrique et groupe d'objets). Un groupe est un ensemble d'objets pouvant contenir d'autres groupes. Un groupe doit contenir au moins deux éléments. Les formes géométriques comprennent les cercles, les ellipses, les rectangles, les carrés, les lignes...

15) Une personne physique peut avoir jusqu'à trois sociétés (personnes morales) qui l'emploient. Chaque personne physique possède un numéro de sécurité sociale qui l'identifie. Une voiture a un numéro d'immatriculation. Une voiture est la propriété d'une personne (physique ou morale). Un emprunt dans une banque peut être demandé pour l'achat d'une voiture.

### 2) Réservation des vols (avec multiplicités)

Cette étude de cas concerne un système de réservation de vols pour une agence de voyages.

Les interviews des experts métiers auxquelles on a procédé ont permis de résumer leur connaissance du domaine sous la forme des phrases suivantes :

- Des compagnies aériennes proposent différents vols.
- Un vol est ouvert à la réservation et refermé sur ordre de la compagnie.
- Un client peut réserver un ou plusieurs vols, pour des passagers différents.
- Une réservation concerne un seul vol et un seul passager.
- Une réservation peut être annulée ou confirmée.
- Un vol a un aéroport de départ et un aéroport d’arrivée.
- Un vol a un jour et une heure de départ, et un jour et une heure d’arrivée.
- Un vol peut comporter des escales dans des aéroports.
- Une escale a une heure d’arrivée et une heure de départ.
- Chaque aéroport dessert une ou plusieurs villes.

Travail : Représenter le diagramme de classes avec les multiplicités.

### 3) Locauto - Location de Véhicules

Une société de locations de véhicules a une implantation nationale et possède plusieurs agences dans différentes villes. Elle souhaite informatiser la gestion des réservations.

Elle met en location des véhicules de type utilitaire ou voiture. Ils sont caractérisés par un numéro d’immatriculation, une marque et une catégorie.

Les clients peuvent réserver un véhicule d’une certaine catégorie, pour une certaine date et pour une durée.

La société de location garde une trace de ses clients : nom, adresse, téléphone.

Il existe 2 sortes de clients :

- les particuliers
- les entreprises.

Dans le cas des entreprises, la société de location demande un nom qui servira de contact. Un taux de remise est attribué suite à une négociation commerciale.

Le jour où le client se présente pour prendre le véhicule réservé, l’agence établit un contrat sur lequel figurent les données du véhicule (y compris le kilométrage), les données du client et le nom du conducteur.

Au retour du véhicule, l’agence récupère le nouveau kilométrage.

Représenter le diagramme de classes le plus complet possible avec les multiplicités, les attributs et les méthodes que vous pensez utiles.

## Diagrammes de classe, scénario et séquence

### 1) « VidéoLocaTout » - étude de cas complet

#### Cahier des charges

L'application VideoLocaTout  assure la gestion d'un Vidéo club. Et oui, ça revient à la mode comme pour les vinyles !

Un film peut être enregistré sur plusieurs types de support (cassettes VHS, CD, DVD, DVD-Blue-Ray), cette liste n’est pas exhaustive compte tenu de l’évolution technologique.

Pour renseigner les clients, le vendeur souhaite pouvoir effectuer des rechercher selon différents critères :

- Film
- Acteur
- Réalisateur
- Année
- Genre du Film (Comique, dramatique,…)

Les supports sont loués au comptoir avec facturation immédiate. Un chèque de caution non encaissé est demandé et sera rendu au retour des emprunts.

Un Client peut s'abonner, dans ce cas sa caution est conservée mais il bénéficie d'une remise d’un montant de 10%. Un support a un prix de location journalier.

Une location peut regrouper plusieurs supports empruntés sur un ou plusieurs jours. Elle est numérotée automatiquement  (dernier numéro incrémenté de 1). Sa date de début est la date du jour, la date de retour sera renseignée lorsque le client  restituera les ou le support (théoriquement >= date emprunt + nombre de jours  avec  le week-end qui compte pour un seul jour).

Le montant de la location est calculé par la formule suivante :

montantLocation = somme (prixDuSupport  X nombreDeJour )

Le Client  paye immédiatement, soit en liquide, en carte ou en chèque.

Quand on reçoit de nouveaux supports, il faut les enregistrer avec leurs  caractéristiques de location (prix, type, …) ainsi que ses critères de recherche (film, acteur,..). La base de données des films, acteurs et réalisateur sera ainsi alimentée en continue.

Toutes les semaines le vendeur a besoin de la liste des locations non revenues. Si le client est abonné il lui enverra une lettre de relance sinon il gardera la caution. Un client avec un seul retard ne peut plus louer d'autres cassettes. Cela bloque les emprunts.

Le vendeur a aussi besoin de connaître la prochaine date de retour d'un film si aucun de ses supports n'est en stock. 
Les supports (surtout les K7 VHS) ou DVD peuvent être dégradés au retour, dans ce cas, leur état est enregistré mais le support ne peut plus être emprunté et sont prix d'achat n'est pas comptabilisé à l'inventaire.

L'inventaire totalise le prix d'achat des supports classés par type puis année d'achat. Le vendeur doit pouvoir consulter les statistiques de location par genre, par type de support et par Film.

Travail à faire :

1. construire le diagramme de classes.
2. Le cas d’utilisation.
3. Ecrire le scénario du cas d’utilisation « Enregistrer location ».
4. Ecrire le diagramme de séquence pour « Enregistrer location ».

### 2) Étude de cas « Waouf-waouf » (facultatif)

Conservé bien au chaud pour le moment car ce tp est très long et un peu compliqué !

Auteur : **Philippe Bouget**