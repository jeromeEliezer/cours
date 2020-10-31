# Cours : Programmaton avec MySQL

Pour créer :

* Procédures stockées
* Triggers (déclencheurs)
* Transactions (avec Spring ou Hibernate)

Il va nous falloir utiliser une syntaxe propre à MySQL.

## Procédures stockées, c'est quoi ?

>Une procédure stockée est un petit programme stocké dans la base de données qui est exécutable depuis un client comme on peut le faire pour une requête. Une procédure est executée par le serveur de base de données.

Vous pouvez utiliser ce que vous voulez pour exécuter les exemples de cette initiation, en console, avec PhpMyAdmin, MySQL Workbench ou DataGrip (sauf pour les Triggers).

>Lorsque l'on crée une procédure, nous écrivons une suite d'instructions qui se terminent par des points virgules !

**Comment éviter cet inconvénient ?**

Réponse : **changer le caractère délimiteur** par un autre qui ne risque pas d'apparaître dans nos intructions, prenons par exemple le **symbole pipe** **'$$'**
sauf si cela est déjà modifié par défaut.

```sql
DELIMITER $$
```

**Quelle est la commande pour créer une procédure ?**

**CREATE PROCEDURE** name ([param[,param ...]])

On peut utiliser des paramètres :

- **IN** (entrée)
- **OUT** (sortie)
- **INOUT** (les deux)
- Aucun paramètre

Chaque paramètre est défini par :

- son sens (IN, OUT)
- son nom
- son type

Vous pouvez créer une nouvelle base de données ou bien utiliser une bd existante.

Créer une table **Article** sur laquelle vous allez travailler

```sql
CREATE TABLE `article` (
  `CODE` int(11) NOT NULL PRIMARY KEY,
  `DESIGNATION` varchar(255) DEFAULT NULL,
  `PRIX` float(5,2) DEFAULT NULL,
  `QUANTITE` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `article` (`CODE`, `DESIGNATION`, `PRIX`, `QUANTITE`) VALUES
(111111, 'Clos du Marquis 1999', 22.9, 10),
(222222, 'verre', 2.3, 20),
(333333, 'Barrique en chene', 85, 15),
(444444, 'Pinard de Guinot', 3.8, 150),
(555555, 'Les Hauts du Tertre 1999', 11.5, 100),
(666666, 'Bière de Guinot', 8.99, 200),
(777777, 'Clos du Baron 1998', 45.2, 60);
COMMIT;
```

>Note : Avec WorkBench, vous devez effectuer une modification dans vos préférences pour que les procédures et triggers puissent s'enregsitrer.
Edit -> 


Exemple d'une procédure qui met à jour les prix en leur appliquant un coefficient passé en paramètre.

Avec PhpMyAdmin, il y a une interface graphique facile à utiliser pour créer des procédure.

### Paramètre en entrée

```sql
DELIMITER $$
CREATE PROCEDURE `mise_a_jour_des_prix`(IN `coef` FLOAT)
    COMMENT 'Procédure pour modifier les prix avec un coefficient'
BEGIN
	UPDATE article SET prix = prix * coef;
END$$
DELIMITER ;
```

Chaque bloc d'instructions doit être encadré par **BEGIN** et **END** (il peut être ignoré dans le cas d'une seule instruction).

On exécute la procédure par la commande **CALL nom de la procédure(paramètres)**;

```sql
SET @augmentation=1.20;
CALL `mise_a_jour_des_prix`(@augmentation);
```

Si vous observez les prix de vos articles, vous allez constater qu'ils ont changer.

Vous pouvez aussi appeler cette procédure depuis JAVA puisqu'elle possède un nom.

Avec Java/JDBC :

```java
String sql = "{CALL mise_a_jour_des_prix(1.30)}"; 
CallableStatement statement = connection.prepareCall(sql);
```

### Paramètre en retour

Pour affecter un résultat SQL à une variable, on utilise le mot clé **INTO** :

```sql
CREATE PROCEDURE quel_est_le_nombre_des_articles (OUT nombre INT) 
BEGIN
	SELECT count(*) INTO nombre FROM article;
END
```

Pour récupérer le résultat, on doit initialiser la variable qui va recevoir le résultat :

```sql
CALL `quel_est_le_nombre_des_articles`(@nb);
SELECT @nb AS `nombre`;
```

ou bien comme ceci :

```sql
SET @nb=0;
CALL `quel_est_le_nombre_des_articles`(@nb);
SELECT @nb;
```

### Modifier une procédure

Il faut la supprimer avec **DROP PROCEDURE** puis la recréer, il n'existe pas d'ALTER PROCEDURE en ligne de commande. Toutefois, grâce à l'interface de PhpMyAdmin, on peut facilement effectuer des modifications depuis l'interface graphique.

#### Afficher la procédure

```sql
SHOW CREATE PROCEDURE mise_a_jour_des_prix;
```

#### Détruire la procédure

1. Créez la procédure avec le code ci-dessous :

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` PROCEDURE `afficher_designation`()
    READS SQL DATA
BEGIN
	SELECT article.DESIGNATION FROM article ORDER BY article.DESIGNATION;
END$$
DELIMITER ;
```

2. Détruisez la procédure avec le code ci-dessous :

```sql
DROP PROCEDURE afficher_designation;
```

3. Affichez la liste de toutes les procédures de MySQL :

```sql
show PROCEDURE STATUS;
```

```sql
SHOW PROCEDURE STATUS LIKE '%proc_%' ;
```

### Commentaires

* Une seule ligne (il y a un espace après les 2 tirets) : **-- commentaires sur une ligne** 
* Sur plusieurs lignes : 

```sql
/*
*  première ligne
*  deuxieme ligne
*/
```

### Variables

>On déclare les variables avec le mot clef **DECLARE**. Les types sont les types MySQL habituels.

>On peut déclarer plusieurs variables du même type sur la même ligne.

>On peut fixer une valeur d'initialisation.

Exemple :

```sql
DECLARE prenom CHAR(15);
DECLARE a, b INT DEFAULT 0;
```

### Affectation de valeur à une variable

>On utilise le mot clé **SET**

```sql
DECLARE prenom CHAR(15);
DECLARE a, b INT DEFAULT 0;
SET a=10;
SET b=50;
SET prenom='Jonathan';

```

Exemple avec la table AVION :

```sql
CREATE TABLE `avion` (
  `AV_ID` int(11) NOT NULL,
  `AV_CONST` varchar(20) DEFAULT NULL,
  `AV_MODELE` varchar(10) DEFAULT NULL,
  `AV_CAPACITE` int(11) DEFAULT NULL,
  `AV_SITE` varchar(20) DEFAULT NULL,
  UNIQUE KEY `AV_ID` (`AV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `avion` (`AV_ID`, `AV_CONST`, `AV_MODELE`, `AV_CAPACITE`, `AV_SITE`) VALUES
(100, 'AIRBUS', 'A320', 300, 'Nice'),
(101, 'BOEING', 'B707', 250, 'Paris'),
(102, 'AIRBUS', 'A320', 300, 'Toulouse'),
(103, 'CARAVELLE', 'Caravelle', 200, 'Toulouse'),
(104, 'BOEING', 'B747', 400, 'Paris'),
(105, 'AIRBUS', 'A320', 300, 'Grenoble'),
(106, 'ATR', 'ATR42', 50, 'Paris'),
(107, 'BOEING', 'B727', 300, 'Lyon'),
(108, 'BOEING', 'B727', 300, 'Nantes'),
(109, 'AIRBUS', 'A340', 350, 'Bastia');
COMMIT;
```

* La société AIRBUS a été racheté par la société PIGEON, on vous demande d'écrire une procédure **proc_constructeur** pour changer tous les AV_CONST de la table AVION.

```sql
BEGIN
    SET @constructeur = 'PIGEON';
    UPDATE avion SET avion.AV_CONST = @constructeur WHERE avion.AV_CONST LIKE 'AIRBUS';
END
    
```

Voici le code généré lors de votre création de la procédure ci-dessus que vous pouvez récupérer :

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` PROCEDURE `proc_constructeur`()
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Remplacer le nom AIRBUS par PIGEON'
BEGIN
    SET @constructeur = 'AIRBUS';
    UPDATE avion SET avion.AV_CONST = @constructeur WHERE avion.AV_CONST LIKE 'PIGEON';
END$$
DELIMITER ;
```

## Retouner des enregistrements

>Lorqu'une procédure execute une requête SELECT, les enregistrements sont retournés.

Dans l'interface graphique de PhpMyAdmin :

```sql
BEGIN
	SELECT count(*) INTO nombre FROM article;
END
```

Dans SQL :

```sql
DELIMITER $$
CREATE PROCEDURE `proc_tous_les_boeing`()
BEGIN
	SELECT * FROM avion WHERE avion.AV_CONST='BOEING';
END$$
DELIMITER ;
```

### Appel de la procédure depuis Java avec **CALL()**

```java
String sql = "CALL proc_tous_les_boeing()"; 
CallableStatement statement = connection.prepareCall(sql);
```

>Remarque : Il n'est pas possible d'appeler la procédure à partir d'une autre Requête. Il est préférable de construire une VUE.

### Fonctions

>Une fonction comme une procédure, s'exécute sur le serveur de base de données. Une fonction retourne un résultat et peut être utilisée directement dans une requête SQL.

#### Création

>On utilise la commande **CREATE FUNCTION name (params) RETURNS returnType**

Avec la table Article : On veut calculer le ca théorique de tous les produits de la table article.

```sql
BEGIN
	SELECT SUM(article.PRIX * article.QUANTITE) INTO @ca FROM article;
   RETURN @ca;
END
```

Ecriture sans l'interface graphique :

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` FUNCTION `fonction_ca`() RETURNS decimal(8,2) unsigned
BEGIN
	SELECT SUM(article.PRIX * article.QUANTITE) INTO @ca FROM article;
   RETURN @ca;
END$$
DELIMITER ;
```

### Utilisation de la fonction dans la requête SQL

Appel depuis SQL : La **fonction_ca()** affiche le chiffre d'affaires.

```sql
select fonction_ca();
```

Pour la création de routines telles que procedures ou fonctions, il faut posséder le droit ALTER ROUTINE

Exemple de fonction qui arrondi un montant à 50 centimes prés :

```sql
CREATE FUNCTION arrondi50(variable DECIMAL(8,2)) RETURNS DECIMAL(8,2)
    RETURN ROUND((variable * 2) + 0.49999)/2;
```

Code complet de la fonction :

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` FUNCTION `fonc_arrondi50`(`var` DECIMAL) RETURNS decimal(8,2) unsigned
    NO SQL
    DETERMINISTIC
    COMMENT 'test'
RETURN ROUND((var * 2) + 0.49999)/2$$
DELIMITER ;
```

### Utilisation de cette fonction **fonc_arrondi50** dans une autre fonction **fonction_ca**

```sql
BEGIN
	SELECT fonc_arrondi50(SUM(article.PRIX * article.QUANTITE)) INTO @ca FROM article;
   RETURN @ca;
END
```
### Utilisation de la fonction dans une procédure :

```sql
BEGIN
	UPDATE article SET prix = fonc_arrondi50(prix * coef);
END
```

#### IF THEN ELSE

```sql
IF var = 2 THEN
    ...
ELSE
    ...
ELSEIF
    ...
END IF;
```

#### CASE

>Suivant la valeur de la variable qui suit **CASE**, le programme va traiter le cas qui corespond.

```sql
CASE var
    WHEN 1 THEN ...;
    WHEN 2 THEN ...;
    ELSE  ...;  // autres cas
END CASE;

#### LOOP

```sql
LOOP
    ...
END LOOP
```

>Pour sortir de la boucle on ajoute une étiquette. L'appel à **LEAVE** suivi de l'étiquette provoque la sortie de la boucle.

```sql
LOOP 
    ...
    IF mavariable = 0 THEN LEAVE uneEtiquette;
END LOOP uneEtiquette;

#### REPEAT UNTIL

```sql
REPEAT
    ...
UNTIL var = 5 END REPEAT;
```

Si on veut recommencer l'itération :

```sql
uneEtiquette: REPEAT
        ...
    IF i = 3 THEN ITERATE uneEtiquette; END IF;
UNTIL i < 100 END REPEAT uneEtiquette;
```

#### WHILE

```sql
WHILE i < 100 DO
    ...
END WHILE
```

#### curseurs (CURSOR)

>Un **CURSOR**, c'est ce qui nous permet de parcourir un jeu d'enregistrements. On déclare le curseur et on l'associe à une requête de type SELECT, celle qui va fournir les enregistrements.

Pour cela, on doit le déclarer et lui donner un nom :

```sql
DECLARE moncurseur CURSOR FOR SELECT code, designation FROM article; 
```

Avant de l'exécuter, il faut déclarer des variables qui récupéreront les valeurs des champs :

```sql
DECLARE var_id INT;
DECLARE var_nom VARCHAR(50);
```

>On doit ensuite ouvrir le curseur avec **OPEN** pour exécuter la requête.
A chaque boucle on '**FETCH**' les valeurs dans les variables :

```sql
OPEN moncurseur;

LOOP
    FETCH moncurseur INTO code, designation;
    ...
    IF done THEN
      LEAVE boucle;
    END IF;
END LOOP;

--ensuite il faut fermer le curseur pour libérer les ressources

CLOSE moncurseur;
```

### Triggers

>Les Triggers (déclencheurs en français), sont des procédures attachées directement à un **évênement d'une table**. Par exemple sur chaque insertion ou chaque suppression d'enregistrement.

>Un Trigger est donc **rattaché à une table et à un évênement**. On doit aussi indiquer si notre code sera déclenché avant (**BEFORE**) ou après (**AFTER**) l'évênement.

Syntaxe :

>CREATE TRIGGER \<nomDuTrigger> \<action_time> \<event> ON \<table>

- **action_time** précise si l'action a lieu avant (**BEFORE**) ou après (**AFTER**) l'évênement.

- **event** c'est l'événement sur lequelle l'action est rattachée :
   - INSERT (ajout)
   - DELETE (suppression)
   - UPDATE (mise à jour)

Voici l'exemple de Grafikart, (messages et topics d'un forum) que vous pouvez tester :

```sql
CREATE TABLE topic (id_topic INT NOT NULL AUTO_INCREMENT, description VARCHAR(255), message_at DATETIME);

CREATE TABLE message (id_message INT NOT NULL AUTO_INCREMENT, id_topic INT, msg TEXT, created_at DATETIME DEFAULT CURRENT_TIMESTAMP);
```

Objectif : Nous souhaitons qu'à chaque nouveau message, le champ **message_at** du **topic** soit mis à jour à la date courante.

Dans le trigger, on accède aux données de l'enregistrement à insérer avec le préfixe **NEW**

```sql
CREATE TRIGGER insMsg BEFORE INSERT ON message
    FOR EACH ROW
     BEGIN
        UPDATE topic SET message_at = NOW() WHERE id_topic = NEW.id_topic;
     END;
```

>**FOR EACH ROW** est obligatoire même si dans notre cas nous ne traitons qu'un seul enregistrement.

Supposons que nous voulions supprimer un message, la date du topic doit être mise à jour avec :

- Soit la date de l'avant-dernier message s'il existe
- Soit null s'il n'existe pas

```sql
CREATE TRIGGER delMsg BEFORE DELETE ON message
FOR EACH ROW
BEGIN
    DECLARE date_topic DATETIME;
    DECLARE date_av_dernier DATETIME;
    DECLARE id_av_dernier INT DEFAULT 0;
    /* on modifie le topic si seulement le message supprime est le dernier */
    SELECT message_at INTO date_topic FROM topic WHERE id_topic = OLD.id_topic;
    IF date_topic <= OLD.created_at THEN
        BEGIN
            /* on recherche l'avant dernier message du meme topic*/
            SELECT created_at, id_topic INTO date_av_dernier, id_av_dernier
            FROM message
            WHERE id_message <> OLD.id_message AND id_topic = OLD.id_topic ORDER BY Created_at DESC LIMIT 1;

            /* on met a jour la date dans le topic ou NULL si pas de message anterieur */
            IF id_av_dernier = 0 THEN
                UPDATE topic SET message_at = NULL WHERE id_topic = OLD.id_topic;
            ELSE
                UPDATE topic SET message_at = date_av_dernier WHERE id_topic = OLD.id_topic;
            END IF;
        END;
    END IF;
END;
```

Autre solution  : **Placer le Trigger après la suppression**.

Dans ce cas, le message est déja supprimé, on recherche donc la date du dernier message s'il existe.

```sql
CREATE TRIGGER delMsg AFTER DELETE ON message
FOR EACH ROW
BEGIN
    DECLARE date_topic DATETIME;
    DECLARE date_dernier DATETIME;
    DECLARE id_dernier INT DEFAULT 0;

    /* on modifie le topic si seulement le message supprime etait le dernier */
    SELECT message_at INTO date_topic FROM topic WHERE id_topic = OLD.id_topic;
    IF date_topic <= OLD.created_at THEN
        BEGIN
            /* on recherche le dernier message existant du meme topic*/
            SELECT created_at, id_topic INTO date_dernier, id_dernier
            FROM message
            WHERE id_topic = OLD.id_topic ORDER BY Created_at DESC LIMIT 1;

            /* on met a jour la date dans le topic ou NULL si pas de message anterieur */
            IF id_dernier = 0 THEN
                UPDATE topic SET message_at = NULL WHERE id_topic = OLD.id_topic;
            ELSE
                UPDATE topic SET message_at = date_av_dernier WHERE id_topic = OLD.id_topic;
            END IF;
        END;
    END IF;
END;
```

#### Trigger pour gérer un compteur de messages

>On suppose que la table topic contient le nombre de messages. Pour cela on ajoute un champ **nb_messages** initialisé à zéro.

```sql
CREATE TABLE topic (id_topic INT NOT NULL AUTO_INCREMENT, description VARCHAR(255), message_at DATETIME, nb_messages INT DEFAULT '0');
```

On crée un Trigger sur l'ajout de message et un autre sur la suppression :

```sql
CREATE TRIGGER cnt_add_msg AFTER INSERT ON message
FOR EACH ROW    
    UPDATE topic SET nb_messages = nb_messages + 1 WHERE id_topic = NEW.id_topic;
END;
On crée un trigger sur la suppression de message

CREATE TRIGGER cnt_del_msg AFTER DELETE ON message
FOR EACH ROW
    UPDATE topic SET nb_messages = nb_messages - 1 WHERE id_topic = OLD.id_topic;
END;
```

#### Comportement avec **Auto-increment**

Supposons que lorsque l'on crée un topic, on crée automatiquement un premier message qui reprend la description du topic.

```sql
CREATE TRIGGER instopic AFTER INSERT ON topic
FOR EACH ROW
    INSERT INTO message (id_topic,  msg) VALUES (NEW.id_topic, NEW.description);
```

- Que nous donne le **lastInsertId() pour PHP**, celui du message ou celui du topic ?

Réponse : Celui du topic

Exemple avec PDO de PHP :
```php
$pdo->exec("INSERT INTO topic (description) VALUES (\"La vie des bêtes\");");
echo $pdo->lastInsertId();
```

#### Suppression en cascade

Lorsque l'on crée une liaison entre deux tables, on a la possiblité de définir une suppession en cascade. Cela signifie que si on supprime un topic, tous ses messages sont supprimés dans la foulée (sans avoir besoin de trigger).

Le problème est que la suppression dans la table mère désactive le trigger DELETE de la table fille ! Il faut choisir l'un ou l'autre.

#### Voir les triggers existants dans la BD

```sql
SHOW TRIGGERS LIKE '%';
```

Voilà pour une première approche. Vous avez un tuto sur OpenClassroom qui est bien écrit.

[tuto sur openclassroom](https://openclassrooms.com/fr/courses/1959476-administrez-vos-bases-de-donnees-avec-mysql/1972254-structurer-ses-instructions)

Auteur : **Philippe Bouget**