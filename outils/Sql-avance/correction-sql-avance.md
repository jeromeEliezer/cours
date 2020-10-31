# Correction SQL Avancé

## 1 Procédures Stockées

### 1.1 le Cadeau de la banque

La banque décide de fêter la nouvelle année en partageant ses gains avec les anciens clients. Pour cela, elle ajoutera une somme sur tous les comptes des clients ayant effectués des opérations antérieures au 31/10/2018 et dont le montant du dépôt était supérieur à 2000 euros (valeur constante).

La directrice Elise vous demande d'écrire et de lancer une **procédure stockée** nommée **proc_cadeaux** permettant d'ajouter 19 euros (pour chaque opération trouvée)pour tous les comptes concernés et d'effectuer automatiquement la modification sur le solde du compte des clients. Il faut prévoir de réutiliser cette procédure l'an prochain et considérer que le montant du cadeau et la date peuvent changer !

### 1.1 Correction de la procédure stockée : **proc_cadeaux**

Ci-dessous, la procédure ne modifie qu'une fois le solde dès qu'une opération est trouvée :

La requête UPDATE passera une fois sur chaque enregsitrement de la table compte ce qui est logique.

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` PROCEDURE `proc_cadeaux`(IN `cadeau` FLOAT UNSIGNED, IN `jour` DATE)
    COMMENT 'Procédure cadeau tp banque'
BEGIN
    UPDATE compte
    SET compte.SOLDE=compte.SOLDE+cadeau
    WHERE NUMERO IN
    (
        SELECT operations.NUMEROCOMPTE
        FROM operations
        WHERE operations.DATE < jour
        AND operations.TYPE = '+'
        AND operations.MONTANT > 2000
    );
    SELECT compte.NUMERO, compte.SOLDE
    FROM compte;
END$$
DELIMITER ;
```

Ci-dessous, en ajoutant **RIGHT OUTER JOIN** et la même requête imbriquée, ça répond à notre demande :

Il faut savoir combien d'opérations remplissent les conditions par compte et modifier le solde avec le montant du cadeau multiplié par le nombre d'opérations.

```sql
DELIMITER $$
CREATE DEFINER=`test`@`%` PROCEDURE `proc_cadeaux`(IN `cadeau` FLOAT, IN `jour` DATE)
    MODIFIES SQL DATA
BEGIN
	UPDATE
    compte
    RIGHT OUTER JOIN
    operations
    ON
    compte.NUMERO = operations.NUMEROCOMPTE
	SET compte.SOLDE = compte.SOLDE + cadeau *  
        (SELECT COUNT(*)
        FROM
        operations
        WHERE compte.NUMERO = operations.NUMEROCOMPTE
        AND operations.DATE < jour
        AND operations.TYPE = '+'
        AND operations.MONTANT > 2000);
    SELECT compte.NUMERO, compte.SOLDE
    FROM compte;
END$$
DELIMITER ;
```

#### Appel de la procédure depuis votre code JAVA dans une application Spring Boot

Pour lancer l'exécution d'une procédure stockée, il faut utiliser la classe **StoredProcedureQuery** de la manière suivante :

- On crée un objet **storedProcedure**.
- On appelle la méthode **createStoredProcedureQuery(nomDeLaProcédure)** en lui passant le nom de la procédure en paramètre.
- On enregistre les paramètres en entrée avec la méthode **registerStoredProcedureParameter(position, type, mode entrée ou sortie)**
- On affecte les valeurs à nos paramètres avec la méthode **setParameter(positionDuParamètre, ValeurAffectée)**
- On exécute la procédure stockée avec la méthode **execute()**

>**StoredProcedureQuery** maProcedure = entityManager.**createStoredProcedureQuery("proc_cadeaux")**;

```java
@Autowired
private EntityManager entityManager;
	
public void lancerProcedureCadeau(String jour, Float cadeau)
{
    StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("proc_cadeaux");
    storedProcedure.registerStoredProcedureParameter(1, Float.class , ParameterMode.IN);
    storedProcedure.registerStoredProcedureParameter(2, Date.class, ParameterMode.IN);
    storedProcedure.setParameter(1, cadeau);
    Calendar date = Calendar.getInstance();
    date.set(Integer.parseInt(jour.substring(0,4)), Integer.parseInt(jour.substring(5,7)), Integer.parseInt(jour.substring(8, 10)));
    storedProcedure.setParameter(2, date, TemporalType.DATE);
    storedProcedure.execute();

}
```

### 1.2 Appel de la procédure

```sql
SET @cadeau='19';
SET @date='2018-10-31';
CALL `proc_cadeau`(@cadeau, @date);
```

## 2 Triggers

## 2.1 Duplication de données dans une autre table sous condition

Créer une table identique à celle de **compte** que vous nommerez **compteriche**. Vous pouvez ne pas activer les clefs étrangères codetypecompte et codetitulaire pour cette table.

```sql
CREATE TABLE IF NOT EXISTS `compteriche` (
  `NUMERO` int(11) NOT NULL,
  `CODETYPECOMPTE` char(1) NOT NULL,
  `CODETITULAIRE` int(4) NOT NULL,
  `SOLDE` float(10,2) NOT NULL,
  PRIMARY KEY (`NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

La directrice vous demande d'écrire un Trigger qui permet lors de chaque ouverture de compte courant dont la somme est supérieure à 10000 euros :

- Enregistrer l'**opération d'ouverture** de compte à la date du jour (table opération)
- Dupliquer la totalité des informations de ce nouveau compte dans la table **compteriche** si celui-ci rempli la condition.
- Pour la date du jour on peut utiliser la fonction **NOW()**

### 2.1 Correction du Trigger : **compte_dupli_auto**

```sql
CREATE TRIGGER `compte_dupli_auto` AFTER INSERT ON `compte`
 FOR EACH ROW BEGIN
	IF NEW.solde >10000 AND NEW.codetypecompte='C'
    THEN
		INSERT INTO operations (`NUMEROCOMPTE`, `DATE`, `LIBELLE`, `MONTANT`, `TYPE`) VALUES (NEW.numero, '2019-01-08', 'ouverture', NEW.solde, '+');
		INSERT INTO `compteriche` (`NUMERO`, `CODETYPECOMPTE`, `CODETITULAIRE`, `SOLDE`) VALUES (NEW.numero, NEW.codetypecompte, NEW.codetitulaire, NEW.solde);
    END IF;	
END

```

## 2.2 Historisation automatique avec le Trigger : **histotitulaire**

On vous demande de mettre en place un trigger qui permet après chaque mise à jour des informations d'un Titulaire, de conserver les anciennes données dans la table en y ajoutant la date du jour de la modification et le type d'action. Ici, l'action sera égale à "MAJ" pour mise à jour.

Voici le script de la Table :

```sql
CREATE TABLE `histotitulaire` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATEACTION` datetime NOT NULL,
  `ACTION` varchar(15) DEFAULT NULL,
  `CODE` int(4) NOT NULL,
  `PRENOM` varchar(32) NOT NULL,
  `NOM` varchar(32) NOT NULL,
  `ADRESSE` varchar(32) DEFAULT NULL,
  `CODEPOSTAL` char(5) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## 2.2 Correction

```sql
FOR EACH ROW
BEGIN
	INSERT INTO histotitulaire (DATEACTION, ACTION, CODE, PRENOM, NOM,ADRESSE,CODEPOSTAL)
    VALUES(now(),'MAJ',OLD.CODE,OLD.PRENOM,OLD.NOM,OLD.ADRESSE,OLD.CODEPOSTAL);
END
```

Code MySQL récupéré pour ce trigger :

```sql
CREATE TRIGGER `titulaire_update` BEFORE UPDATE ON `titulaire`
 FOR EACH ROW BEGIN
	INSERT INTO histotitulaire (DATEACTION, ACTION, CODE, PRENOM, NOM,ADRESSE,CODEPOSTAL)
    VALUES(now(),'MAJ',OLD.CODE,OLD.PRENOM,OLD.NOM,OLD.ADRESSE,OLD.CODEPOSTAL);
END
```

## Code JAVA et Triggers

>Vous n'avez rien à faire en JAVA pour les Triggers puisque par définition ils se déclenchent en fonction d'un événément sur une table de votre base de données.

[Lien vers le site MySQLtutorial.org](http://www.mysqltutorial.org/)

Auteur : **Philippe Bouget**
