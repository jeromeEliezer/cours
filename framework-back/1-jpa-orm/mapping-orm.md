# Exercices pratiques pour maîtriser le Mapping avec JPA/Hibernate/SpringBoot

Tous les TP ne sont pas à faire.   
Les TP obligatoires sont les suivants : 1, 2, 5, 6, 7, 8, 9, 10, 11, 12.1, 12.2, 12.3 et 12.4.

1 - ENTITE VIN - PERSISTANCE (**[pinard01](exercices/pinard01-entity.md)**) identifiant **NON AUTO-GENERE**

![pinard01](images/pinard01.png)

2 - ENTITE VIN AVEC **CLE PRIMAIRE AUTO-GENEREE** (**[pinard02](exercices/pinard02-entity-clef-auto-generee.md)**)

![pinard01](images/pinard01.png)

3 - ENTITE VIN : **CLE PRIMAIRE COMPOSITE** avec **@IdClass** [**(pinard03)**](exercices/pinard03-entity-clef-composee-IdClass.md)

Pour ce projet (démo), on utilise **Lombok** pour réduire le code de l'entité **Vin**. Il faut penser à installer le JAR dans votre IDE et l'ajouter dans votre dépendance **Gradle** ou **Maven**.

![pinard03](images/tp3-clef-composite-1.png)

4 - ENTITE VIN : CLE PRIMAIRE COMPOSITE avec **EmbeddedId** (**[pinard04](exercices/pinard04-entity-clef-composee-EmbeddedId.md.md)**)

Pour ce projet, pas de Lombok.

![pinard03](images/tp3-clef-composite-1.png)

5 - ENTITE CLIENT : MAPPING MULTI-TABLES avec **@SecondaryTable** (**[client01](exercices/client01-entity-table-secondaire.md)**)

![client01](images/client01.png)

6 - **@OneToOne** : ASSOCIATION UNIDIRECTIONNELLE DE 1 VERS 1 (**[client02](exercices/client02-@OneToOne-unidirectionnelle.md)**)

![tp6-uni-1-1.png](images/tp6-uni-1-1.png)

7 - **@OneToOne** : ASSOCIATION BIDIRECTIONNELLE DE 1 VERS 1 (**[client03](exercices/client03-@OneToOne-bidirectionnelle.md)**)

![tp7-bi-1-1.png](images/tp7-bi-1-1.png)

8 - **@OneToOne** & **@OneToMany** : ASSOCIATION UNIRECTIONNELLE DE 1 VERS n (**[client04](exercices/client04-@OneToOne-@OneToMany-uni-et-bidirectionnelle.md)**)

![tp8-uni-n-n.png](images/tp8-uni-1-n.png)

9 - **@ManyToOne** : ASSOCIATION UNIDIRECTIONNELLE DE N VERS 1 (**[croisiere01](exercices/croisiere01-@ManyToOne-unidirectionnelle.md)**)

![tp9-uni-n-1.png](images/tp9-uni-n-1.png)

10 - **@ManyToMany**, **@OneToMany** : ASSOCIATION BIDIRECTIONNELLE DE N VERS 1 (**[croisiere02](exercices/croisiere02-@ManyToMany-@ManyToOne-@OneToMany-uni-et-bidirectionnelle.md)**)

![heritage12.4.png](images/tp10-bi-n-1.png)

11 - **@ManyToMany**, **@OneToMany**, **@ManyToOne** : ASSOCIATION BIDIRECTIONNELLE DE N VERS N (**[croisiere03](exercices/croisiere03-@ManyToMany-@ManyToOne-@OneToMany-uni-et-bidirectionnelle.md)**)


![heritage12.4.png](images/tp11-bi-n-n.png)

12.1 - HERITAGE : **SINGLE_TABLE** - UNE TABLE UNIQUE PAR HIERARCHIE/CLASSE (**[heritage01](exercices/heritage01-Single-Table.md)**)

![heritage12.4.png](images/heritage12.1.png)

12.2 - HERITAGE : **TABLE_PER_CLASS** - UNE TABLE PAR CLASSE CONCRETE (**[heritage02](exercices/heritage02-Table-Per-Class.md)**)

![heritage12.4.png](images/heritage12.2.png)

12.3 - HERITAGE : **JOINED** - UNE TABLE PAR SOUS-CLASSE (**[heritage03](exercices/heritage03-Joined.md)**)

![heritage12.3.png](images/heritage12.3.png)

L'annoation **JOINED** permet de générer des jointures.

12.4 – HERITAGE : **@MappedSuperClass** - CLASSE DE BASE NON PERSISTANTE (**[heritage04](exercices/heritage04-@MappedSuperClass.md)**)

![heritage12.4.png](images/heritage12.4.png)

L'annoation **@MappedSuperClass** permet de générer des tables relatives au sous-classes en intégrant les propriété de la classe mère.

**Tous les projets Eclipse/Gradle sont sur mon github !**

Nous verrons ultérieurement la notion de `transaction` avec Hibernate (prochaine session).