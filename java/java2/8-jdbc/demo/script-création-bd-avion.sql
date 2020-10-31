SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd-avion`
--

-- --------------------------------------------------------

--
-- Structure de la table `avion`
--

DROP TABLE IF EXISTS `avion`;
CREATE TABLE IF NOT EXISTS `avion` (
  `AV_ID` int(11) NOT NULL,
  `AV_CONST` varchar(20) DEFAULT NULL,
  `AV_MODELE` varchar(10) DEFAULT NULL,
  `AV_CAPACITE` int(11) DEFAULT NULL,
  `AV_SITE` varchar(20) DEFAULT NULL,
  UNIQUE KEY `AV_ID` (`AV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avion`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `pilote`
--

DROP TABLE IF EXISTS `pilote`;
CREATE TABLE IF NOT EXISTS `pilote` (
  `PI_ID` int(11) NOT NULL,
  `PI_NOM` varchar(20) DEFAULT NULL,
  `PI_SITE` varchar(20) DEFAULT NULL,
  UNIQUE KEY `PI_ID` (`PI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pilote`
--

INSERT INTO `pilote` (`PI_ID`, `PI_NOM`, `PI_SITE`) VALUES
(1, 'SERGE', 'NICE'),
(2, 'JEAN', 'PARIS'),
(3, 'CLAUDINE', 'GRENOBLE'),
(4, 'ROBERT', 'NANTES'),
(5, 'MICHEL', 'PARIS'),
(6, 'LUCIENNE', 'TOULOUSE'),
(7, 'BERTRAND', 'LYON'),
(8, 'HERVE', 'BASTIA'),
(9, 'LUC', 'PARIS');

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `VO_ID` char(5) NOT NULL,
  `VO_AVION` int(11) NOT NULL,
  `VO_PILOTE` int(11) NOT NULL,
  `VO_SITE_DEPART` varchar(50) DEFAULT NULL,
  `VO_SITE_ARRIVEE` varchar(50) DEFAULT NULL,
  `VO_HEURE_DEPART` time DEFAULT NULL,
  `VO_HEURE_ARRIVEE` time DEFAULT NULL,
  UNIQUE KEY `VO_ID` (`VO_ID`),
  KEY `fk_vol_pilote_id` (`VO_PILOTE`),
  KEY `fk_vol_avion_id` (`VO_AVION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`VO_ID`, `VO_AVION`, `VO_PILOTE`, `VO_SITE_DEPART`, `VO_SITE_ARRIVEE`, `VO_HEURE_DEPART`, `VO_HEURE_ARRIVEE`) VALUES
('IT100', 100, 1, 'NICE', 'PARIS', '07:00:00', '09:00:00'),
('IT101', 100, 2, 'PARIS', 'TOULOUSE', '11:00:00', '12:00:00'),
('IT102', 101, 1, 'PARIS', 'NICE', '12:00:00', '14:00:00'),
('IT103', 105, 3, 'GRENOBLE', 'TOULOUSE', '09:00:00', '11:00:00'),
('IT104', 105, 3, 'TOULOUSE', 'GRENOBLE', '17:00:00', '19:00:00'),
('IT105', 107, 7, 'LYON', 'PARIS', '06:00:00', '07:00:00'),
('IT106', 109, 8, 'BASTIA', 'PARIS', '10:00:00', '13:00:00'),
('IT107', 106, 9, 'PARIS', 'BRIVE', '07:00:00', '08:00:00'),
('IT108', 106, 9, 'BRIVE', 'PARIS', '19:00:00', '20:00:00'),
('IT109', 107, 7, 'PARIS', 'LYON', '18:00:00', '19:00:00'),
('IT110', 102, 2, 'TOULOUSE', 'PARIS', '15:00:00', '16:00:00'),
('IT111', 101, 4, 'NICE', 'NANTES', '17:00:00', '19:00:00');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `fk_vol_avion_id` FOREIGN KEY (`VO_AVION`) REFERENCES `avion` (`AV_ID`),
  ADD CONSTRAINT `fk_vol_pilote_id` FOREIGN KEY (`VO_PILOTE`) REFERENCES `pilote` (`PI_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
