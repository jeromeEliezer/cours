SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `avion` (
  `AV_ID` int(11) NOT NULL,
  `AV_CONST` varchar(20) DEFAULT NULL,
  `AV_MODELE` varchar(10) DEFAULT NULL,
  `AV_CAPACITE` int(11) DEFAULT NULL,
  `AV_SITE` varchar(20) DEFAULT NULL,
  UNIQUE KEY `AV_ID` (`AV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pilote` (
  `PI_ID` int(11) NOT NULL,
  `PI_NOM` varchar(20) DEFAULT NULL,
  `PI_SITE` varchar(20) DEFAULT NULL,
  UNIQUE KEY `PI_ID` (`PI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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

ALTER TABLE `vol`
  ADD CONSTRAINT `fk_vol_avion_id` FOREIGN KEY (`VO_AVION`) REFERENCES `avion` (`AV_ID`),
  ADD CONSTRAINT `fk_vol_pilote_id` FOREIGN KEY (`VO_PILOTE`) REFERENCES `pilote` (`PI_ID`);
COMMIT;

