-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 27 sep. 2019 à 09:58
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `promo3`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `id_activite` varchar(3) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`id_activite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id_activite`, `libelle`) VALUES
('001', 'Programmer en java'),
('002', 'Ecouter les mouches'),
('003', 'Jouer au bilboquet'),
('004', 'Dormir pendant le cours'),
('005', 'Chercher un stage à Haiti'),
('006', 'Attendre les vacances'),
('007', 'Prendre le goûter'),
('008', 'Caresser le chat'),
('009', 'Ecouter de la musique'),
('010', 'Rien faire');

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

DROP TABLE IF EXISTS `apprenant`;
CREATE TABLE IF NOT EXISTS `apprenant` (
  `id_apprenant` int(2) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `datenaissance` date DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `emailpro` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `region_fk` int(40) DEFAULT NULL,
  PRIMARY KEY (`id_apprenant`),
  KEY `fk_apprenant_region` (`region_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenant`
--

insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (1, 'Isadore', 'Hullett', '2021-02-22', 'ihullett0@google.cn', 'ihullett0@miitbeian.gov.cn', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (2, 'Lucilia', 'Westrope', '2020-11-10', 'lwestrope1@virginia.edu', 'lwestrope1@guardian.co.uk', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (3, 'Stanton', 'Anthes', '2020-10-28', 'santhes2@slate.com', 'santhes2@mediafire.com', null, 1);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (4, 'Averil', 'Kinneir', '2020-10-27', 'akinneir3@howstuffworks.com', 'akinneir3@cdbaby.com', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (5, 'Giovanna', 'Haldane', '2021-04-02', 'ghaldane4@bbc.co.uk', 'ghaldane4@pen.io', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (6, 'Antonietta', 'Ciardo', '2020-12-31', 'aciardo5@cam.ac.uk', 'aciardo5@omniture.com', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (7, 'Whit', 'Pendall', '2020-09-21', 'wpendall6@guardian.co.uk', 'wpendall6@oakley.com', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (8, 'Leora', 'Feron', '2020-05-30', 'lferon7@free.fr', 'lferon7@slate.com', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (9, 'Beth', 'Waberer', '2021-04-05', 'bwaberer8@netscape.com', 'bwaberer8@illinois.edu', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (10, 'Therine', 'Towersey', '2020-10-09', 'ttowersey9@usnews.com', 'ttowersey9@samsung.com', null, 3);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (11, 'Myrvyn', 'Barrie', '2020-08-10', 'mbarriea@livejournal.com', 'mbarriea@usatoday.com', null, 1);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (12, 'Randolf', 'Didsbury', '2020-08-30', 'rdidsburyb@webnode.com', 'rdidsburyb@usgs.gov', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (13, 'Othella', 'Wisdom', '2020-09-19', 'owisdomc@bravesites.com', 'owisdomc@parallels.com', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (14, 'Chadwick', 'Ropartz', '2020-10-17', 'cropartzd@craigslist.org', 'cropartzd@irs.gov', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (15, 'Emalee', 'Keizman', '2020-06-23', 'ekeizmane@altervista.org', 'ekeizmane@xinhuanet.com', null, 2);
insert into apprenant (id_apprenant, prenom, nom, datenaissance, email, emailpro, photo, region_fk) values (16, 'Derril', 'Jerson', '2020-05-20', 'djersonf@t-online.de', 'djersonf@alexa.com', null, 3);


-- --------------------------------------------------------

--
-- Structure de la table `apprenants_activites`
--

DROP TABLE IF EXISTS `apprenants_activites`;
CREATE TABLE IF NOT EXISTS `apprenants_activites` (
  `apprenant_id` int(2) NOT NULL,
  `activite_id` varchar(3) NOT NULL,
  PRIMARY KEY (`apprenant_id`,`activite_id`),
  KEY `apprenants_activites_ibfk_2` (`activite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenants_activites`
--

INSERT INTO `apprenants_activites` (`apprenant_id`, `activite_id`) VALUES
(1, '001'),
(1, '002'),
(6, '002'),
(11, '002'),
(2, '003'),
(2, '004'),
(3, '004'),
(7, '004'),
(3, '005'),
(16, '005'),
(4, '006'),
(5, '006'),
(7, '006'),
(5, '007'),
(9, '008'),
(10, '008'),
(11, '008'),
(14, '008'),
(8, '009'),
(14, '009'),
(15, '009'),
(16, '009'),
(3, '010'),
(8, '010'),
(9, '010'),
(12, '010'),
(14, '010'),
(15, '010'),
(16, '010');

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE IF NOT EXISTS `region` (
  `id_region` int(1) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(40) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`id_region`, `libelle`) VALUES
(1, 'ILE DE FRANCE'),
(2, 'NOUVELLE AQUITAINE'),
(3, 'PAYS DE LOIRE');

--
-- Contraintes pour la table `apprenant`
--
ALTER TABLE `apprenant`
  ADD CONSTRAINT `fk_apprenant_region` FOREIGN KEY (`region_fk`) REFERENCES `region` (`id_region`);

--
-- Contraintes pour la table `apprenants_activites`
--
ALTER TABLE `apprenants_activites`
  ADD CONSTRAINT `apprenants_activites_ibfk_1` FOREIGN KEY (`apprenant_id`) REFERENCES `apprenant` (`id_apprenant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `apprenants_activites_ibfk_2` FOREIGN KEY (`activite_id`) REFERENCES `activite` (`id_activite`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
