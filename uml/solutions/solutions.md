# Solutions des exercices pratiques

## Uses Cases

### 1. Garagiste

![garagiste](../img/garagiste.png)

### 2. Gestion des Demandes de Formation

>Erreur sur les 2 diagrammes : il faut remplacer la relation \<<include>\>  par \<<extend>\> entre *établir une demande* et *consulter catalogue*. Le Use Case *Etablir une demande* peut être détaillé en d'autres *Uses Cases*

![Gestion des Formations](../img/demandes-formation.png)

Autre exemple avec le logiciel ArgoUml :

![Gestion des Formations](../img/demandes-formation-argo-uml.png)

### 3. Diagramme de cas d’utilisation (Guichet Automatique)

#### Etape 1

![GAB](../img/gab01.png)

#### Etape 2

![GAB](../img/gab02.png)

#### Etape 3

![GAB](../img/gab03.png)

#### Etape 4

![GAB](../img/gab04.png)

#### Scénario : Retirer Argent avec une CB

Cas d’utilisation : Retirer de l’argent (avec une Carte Bancaire)

Informations générales

**Objectif** : Effectuer un retrait d’argent avec une Carte Bancaire

**Acteur principal** : Porteur de Carte Bancaire ou Client de la Banque

**Acteur secondaire** : aucun

**Pré-condition** : Le distributeur contient des Billets. Il est dans l’attente d’une opération. Il n’est pas en panne.

**Post-condition** : Si l’argent a été retiré, la somme restante sur le compte est diminuée du montant du retrait effectué. Dans le cas contraire, la somme sur le compte est inchangée.

**Déclencheur** : introduction d’une carte bancaire dans le DAB

Scénario Principal

Etape - Acteur - Description de l’action

1. Client - introduit sa carte bancaire
2. Système - lit la carte et vérifie sa validité
3. Système - demande au client de taper son code
4. Client - tape son code confidentiel et valide
5. Système - Vérifie que le code correspond à la carte
6. Client - choisit une opération de retrait
7. Système - demande le montant à retirer
8. Client - saisit le montant du retrait souhaité et valide

Scénari alternatifs

Alternative 5a : Carte Invalide

cette alternative est effective à l’étape 2 du scénario principal.

1. Système - rejette la carte et affiche le message d’information « carte invalide »

Le cas d’utilisation se termine.

## Diagrammes de classes

### 1) 15 Diagrammes de classe (sans multiplicité)

#### Cas 1

![Cas1](../img/15-cas-01.png)

#### Cas 2

![Cas2](../img/15-cas-02.png)

#### Cas 3

![Cas3](../img/15-cas-03.png)

#### Cas 4

![Cas4](../img/15-cas-04.png)

#### Cas 5

![Cas5](../img/15-cas-05.png)

#### Cas 6

![Cas6](../img/15-cas-06.png)

#### Cas 7

![Cas7](../img/15-cas-07.png)

#### Cas 8

Association ternaire (normalement, c'est un losange qui relie 3 ou plusieurs classes)
StarUML ne permet pas de créer ce type de relation. Il faut donc passer par une classe d'association.

![Cas8](../img/15-cas-08bis.png)

#### Cas 9

![Cas9](../img/15-cas-09.png)

#### Cas 10

![Cas10](../img/15-cas-10.png)

#### Cas 11

![Cas11](../img/15-cas-11.png)

#### Cas 12

Ce shéma est incomplet, il manque les supports SSD, et USB.

![Cas12](../img/15-cas-12.png)

#### Cas 13

![Cas13](../img/15-cas-13.png)

#### Cas 14

![Cas14](../img/15-cas-14.png)

#### Cas 15

![Cas15](../img/15-cas-15.png)

### 2) TP - Vols

![vols-diag-classe](../img/vols-diag-classe.png)

### 3) TP - Locauto

![vols-diag-classe](../img/locauto-classes.png)

### 4) Gestion de Locations Vidéos

Diagramme de flux (hors UML)

![videolocatoutFlux](../img/locavideo-flux.png)

Use Case

![videolocatoutUsecase](../img/locavideo-use-case.png)

Diagramme de classes

![videolocatoutDiagClasse](../img/locavideo-diag-classe.png)

Télécharger le scénario "Enregistrer une location"

[scenario](scenario-video.pdf)