-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 27 sep. 2018 à 09:58
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

INSERT INTO `apprenant` (`id_apprenant`, `prenom`, `nom`, `datenaissance`, `email`, `emailpro`, `photo`, `region_fk`) VALUES
(1, 'Géraldine', 'Autrique', '1970-12-27', 'geraldine.autrique@laposte.fr', '', '', 3),
(2, 'Nicolas', 'Filine', '1986-08-07', 'nicolas.filine@laposte.fr', '', '', 1),
(3, 'Pierre', 'Gorce', '1976-01-05', 'pierrexgorce@gmail.com', '', '', 1),
(4, 'Samuel', 'Joblon', '1973-10-18', 'samuel.joblon@gmail.com', '', '', 1),
(5, 'Phoneprasong', 'Khamvongsa', NULL, 'pomlao@hotmail.com', '', '', 2),
(6, 'Vincent', 'Lebegue', '1986-08-13', 'vincent.lebegue@labanquepostale.fr', '', '', 1),
(7, 'Matthieu', 'Londeix', '1981-05-19', 'matthieu.londeix@laposte.fr', '', '', 2),
(8, 'Thomas', 'Longueville', '1972-04-26', 'thomas.longueville@laposte.fr', '', '', 2),
(9, 'Christine', 'Métivier', '1980-04-29', 'christine.pereira@laposte.fr', '', '', 1),
(10, 'Laurent', 'Picard', '1972-05-23', 'laurent2.picard@laposte.fr', '', '', 1),
(11, 'David', 'Pouline', '1982-07-07', 'david.pouline@facteo.fr', '', '', 3),
(12, 'Julien', 'Prod\'homme', '1990-08-31', 'prodhomme.julien@gmail.com', '', '', 1),
(13, 'Samuel', 'Sabot', '1980-04-10', 'samuel.sabot@facteo.fr', '', '', 3),
(14, 'Salvatore', 'Sancesario', '1975-05-10', 'salvatore.sancesario@facteo.fr', '', '', 1),
(15, 'David', 'Sylvestre', '1986-07-06', 'david.sylvestre@mfacteur.fr', '', '', 2),
(16, 'Cédric', 'Tressous', '1984-08-08', 'cedric.tressous@gmail.com', '', '', 2);

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
