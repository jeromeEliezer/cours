DROP TABLE IF EXISTS `titulaire`;
CREATE TABLE `titulaire` (
  `CODE` int(4) NOT NULL,
  `PRENOM` varchar(32) NOT NULL,
  `NOM` varchar(32) NOT NULL,
  `ADRESSE` varchar(32) DEFAULT NULL,
  `CODEPOSTAL` char(5) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `titulaire` (`CODE`, `PRENOM`, `NOM`, `ADRESSE`, `CODEPOSTAL`) VALUES
(1000, 'Philippe', 'Bouget', '52 rue de la Java', '75013'),
(1001, 'Mireille', 'Kupper', '22 rue Loin de Paris', '91000'),
(1002, 'Juliette', 'Barats', '13 rue de la Bureautique', '75011'),
(1003, 'Malika', 'Chabira', '23 rue de l\'insertion', '7018'),
(1004, 'Josselin', 'Tobelem', '18 rue de SpringBoot', '93000'),
(1005, 'Jonathan', 'Siffert', '22 rue des Projets', '93000');

DROP TABLE IF EXISTS `typecompte`;
CREATE TABLE `typecompte` (
  `CODE` char(1) NOT NULL,
  `INTITULE` varchar(25) NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `typecompte` (`CODE`, `INTITULE`) VALUES
('C', 'Compte courant'),
('E', 'Compte épargne'),
('L', 'Compte épargne Logement');

DROP TABLE IF EXISTS `compte`;
CREATE TABLE `compte` (
  `NUMERO` int(5) NOT NULL,
  `CODETYPECOMPTE` char(1) NOT NULL,
  `CODETITULAIRE` int(4) NOT NULL,
  `SOLDE` float(10,2) NOT NULL,
  PRIMARY KEY (`NUMERO`),
  FOREIGN KEY (`CODETYPECOMPTE`)
    REFERENCES `typecompte` (`CODE`),
  FOREIGN KEY (`CODETITULAIRE`)
   REFERENCES `titulaire` (`CODE`)
   ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `compte` (`NUMERO`, `CODETYPECOMPTE`, `CODETITULAIRE`, `SOLDE`) VALUES
(10000, 'C', 1000, 3500.00),
(10001, 'C', 1001, 7000.00),
(10002, 'C', 1002, 2800.00),
(10003, 'C', 1003, 15200.00),
(10005, 'C', 1004, 60000.00),
(10006, 'C', 1005, 140000.00),
(10007, 'L', 1000, 100.00),
(10008, 'L', 1001, 100.00),
(10009, 'L', 1002, 200.00);

DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `NUMERO` int(11) NOT NULL AUTO_INCREMENT,
  `NUMEROCOMPTE` int(5) NOT NULL,
  `DATE` date NOT NULL,
  `LIBELLE` varchar(32) NOT NULL,
  `MONTANT` float(10,2) NOT NULL,
  `TYPE` char(1) NOT NULL,
  PRIMARY KEY (`NUMERO`),
  FOREIGN KEY (`NUMEROCOMPTE`)
    REFERENCES `COMPTE` (`NUMERO`)
    ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `operations` (`NUMERO`, `NUMEROCOMPTE`, `DATE`, `LIBELLE`, `MONTANT`, `TYPE`) VALUES
(1, 10000, '2018-10-01', 'Dépôt', 3500.00, '+'),
(2, 10001, '2018-10-18', 'Salaire', 7000.00, '+'),
(3, 10002, '2018-11-02', 'Dépôt', 2800.00, '+'),
(4, 10003, '2018-10-09', 'Salaire ', 15200.00, '+'),
(5, 10005, '2018-12-19', 'Dépôt', 150.00, '+'),
(6, 10006, '2018-12-19', 'Dépôt', 507.00, '+'),
(7, 10001, '2018-08-10', 'Dépôt ouverture', 2050.00, '+');
