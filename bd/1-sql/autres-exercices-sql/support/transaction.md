# La transaction

## Généralités

Une transaction est un bloc d'instructions de mises à jour dans la base de données. 
C'est une suite de requêtes `INSERT`, `UPDATE`, ou `DELETE` qui seront validées définitivement à la fin du bloc.   
On commence une transaction par l'instruction `START TRANSACTION`, et c'est l'instruction `COMMIT` qui valide la transaction.  
Il est possible d'annuler une transaction en cours grâce à l'instruction `ROLLBACK`.  

## Propriétés d'une transaction

L'acronyme `ACID` désigne les quatre attributs fondamentaux d'un gestionnaire de transaction :

* **Atomicité** : la transaction est entière, c'est **tout ou rien**
* **Cohérence** : une transaction crée un nouvel état de données. En cas d'anomalie pendant la transaction, on récupère l'état précédent dans lequel se trouvait la base de données. La BD doit rester cohérente.
* **Isolation** : une transaction en cours est toujours isolée.
* **Durabilité** : les données restent disponibles après la transaction (C'est la notion de persistence).

## Autocommit

Par défaut, une base de données est en autocommit. C'est à dire que chaque instruction de mises à jour est définitive dans la base. 
La transaction se résume en une seule ligne.  
L'instruction `START TRANSACTION` bascule l'autocommit à faux.  
Une autre manière de faire une transaction, c'est de basculer l'autocommit à faux (`SET autocommit=0`). 
Dans ce cas, la transaction démarre à la première mise à jour. La validation définitive est toujours le `COMMIT`.  
C'est souvent de cette façon qu'on gère les transactions dans un programme java ou php.  

## Moteur de stockage

Les bases de données fonctionnent avec des moteurs différents. On ne choisit pas son moteur sous Oracle ou Postgres. 
Par contre avec MySql, nous avons le choix entre InnoDB et MylSAM. **MylSAM ne gère pas les transactions**.  

## Fonctionnement

Lorsque l'on commence une transaction, toutes les mises à jour mettent la base dans un état transitoire. 
Cet état n'est visible que de la session en cours. Si un autre client se connecte sur la base, il ne voit pas cette transaction.  
Si cette transaction échoue la base de données revient à l'état précédent.  
On peut comparer cela à une zone tampon.  

## Etudiées ultrieurement

### Les transactions avec Spring

#### Annotation

Comme d'habitude, Spring utilise une annotation : `@Transactional`.  
Les transactions se font au niveau du service. 
Il suffit de mettre cette annotation au niveau de la méthode pour que cette méthode démarre et valide la transaction.  
Si une exception survient dans cette méthode, automatiquement un roolback est effectué sur la transaction en cours.  
Si tout ce passe bien, un commit est effectué à la fin de la méthode.

#### Gestionnaire de transaction

La transaction a besoin d'un gestionnaire de transaction. 
Ce gestionnaire sera différent selon qu'on utilise du jdbc, du jpa ou autre. 
Heureusement avec Spring Boot, il n'y a pas besoin de configurer ce gestionnaire.

#### La propagation

Nous allons voir la propagation du contexte transactionnel. 
Spring a ajouté un niveau supplémentaire : **la transaction logique**. 
Une méthode @transactional peut appeler une autre méthode @transactional. Ceci déclenche une sous-transaction.  
Que faut-il faire dans ce cas pour garder les propriétés ACID de la transaction ? Continuer dans la même transaction ? Faire une nouvelle transaction ?
2 méthodes de propagation sont intéressantes : `@Transactional(propagation=Propagation.REQUIRED)` et `@Transactional(propagation=Propagation.REQUIRES_NEW)`.

 Lisez le paragraphe *propagation du contexte transactionnel* de ce [tuto](https://openclassrooms.com/courses/simplifiez-le-developpement-dapplications-java-avec-spring/gerer-les-transactions-avec-spring-tx) pour bien comprendre la différence.

 Auteur : **Philippe Bouget**