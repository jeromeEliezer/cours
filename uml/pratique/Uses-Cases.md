# Pratique

## Uses Cases

### 1. Garagiste

L’activité de monsieur Moldu, garagiste, consiste essentiellement à assurer le contrôle technique et la réparation des véhicules ainsi que la vente de pièces détachées.
Le garage dispose de plusieurs services :

- service technique qui s’occupe de l’entretien, de la réparation et du contrôle technique
- service commercial qui assure l’accueil des clients, réalise les ventes, édite les factures, devis et comptes-rendus de contrôle technique.
- Le service logistique qui gère notamment les stocks.

Dans le cadre de son expansion, monsieur Moldu souhaiterait disposer d’un logiciel lui permettant de gérer ses stocks, ses factures, devis, compte-rendu technique et la liste de ses clients.

Travail à faire : Exprimer le besoin du garagiste sous la forme d’un diagramme de cas d’utilisation.
Identifier les acteurs et les uses cases.

### 2. Gestion des Demandes de Formation

Le système de gestion des demandes de formation doit permettre d’initialiser une demande de formation et de suivre cette demande jusqu’à l’inscription effective d’un(e) employé(e).

L’employé(e) peut consulter le catalogue et sélectionner un thème ou une formation ou même une session particulière. La demande est automatiquement enregistrée par le système et transmise au responsable de formation par e-mail.

Si l’employé(e) n’a pas choisi de session, mais simplement une formation ou un thème, le responsable formation va consulter le catalogue et sélectionner les sessions qui paraissent correspondre le mieux à la demande.

Une fois que l’employé(e) a demandé une formation, et que celle-ci est acceptée, le responsable formation va utiliser le système pour envoyer automatiquement par fax une demande d’inscription sous forme de bon de commande à l’organisme.

L’employé(e) peut consulter l’état de ses demandes de formation en cours et les annuler individuellement.
Le responsable formation est automatiquement avertie par e-mail.
Le responsable formation peut introduire une nouvelle formation dans le catalogue, modifier une formation existante ou supprimer une formation qu’un organisme ne délivre plus. Il peut modifier les lieux de sessions et mettre à jour les dates.

Travail à faire : à partir de l’énoncé ci-dessus, vous devez identifier les acteurs, les cas d’utilisation et construire le diagramme de cas d’utilisation.

### 3. Diagramme de cas d’utilisation (Guichet Automatique)

Le système à modéliser concerne un système simplifié de guichet automatique de banque (GAB).
Le GAB offre les services suivants :

- Distribution d’argent à tout porteur de carte de crédit, via un lecteur de carte et un distributeur de billet.
- Consultation du solde de compte, dépôt en numéraire et dépôt de chèque pour les clients de la banque possédant une carte de la banque.

Il faut signaler que toutes les transactions sont sécurisées et il est parfois nécessaire de recharger le distributeur.
Avant chaque utilisation du GAB, nous devons nous authentifier. Cela se traduisant par un ensemble d’étapes communes à chaque description de cas d’utilisation, du genre :

1. le porteur de carte de crédit introduit sa carte dans le lecteur.
2. le GAB vérifie que la carte est valide
3. le GAB demande la saisie du code d’identification
4. le porteur de carte saisit son code
5. le GAB compare le code d’identification avec celui qui est codé sur la puce de la carte.

Remarque : Nous souhaitons que dans le cas d’utilisation « **retirer de l’argent** », le client de la banque puisse avoir la possibilité de consulter son solde juste avant qu’il ne choisisse le montant de son retrait. Ceci afin d’ajuster le montant demandé avec ce qui lui reste sur le compte.

Travail à faire : à partir de l’énoncé ci-dessus, vous devez identifier les acteurs, les cas d’utilisation et construire le diagramme de cas d’utilisation. En utilisant si nécessaire, les relations d’inclusion, d’extension et de généralisation.

Auteur : **Philippe Bouget**