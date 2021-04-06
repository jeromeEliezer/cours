
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema concession
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `concession` ;

-- -----------------------------------------------------
-- Schema concession
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `concession` DEFAULT CHARACTER SET utf8 ;
USE `concession` ;

-- -----------------------------------------------------
-- Table `concession`.`carburant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`carburant` ;

CREATE TABLE IF NOT EXISTS `concession`.`carburant` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `nom_UNIQUE` ON `concession`.`carburant` (`nom` ASC);


-- -----------------------------------------------------
-- Table `concession`.`couleur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`couleur` ;

CREATE TABLE IF NOT EXISTS `concession`.`couleur` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `nom_UNIQUE` ON `concession`.`couleur` (`nom` ASC);


-- -----------------------------------------------------
-- Table `concession`.`modele`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`modele` ;

CREATE TABLE IF NOT EXISTS `concession`.`modele` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `marque` VARCHAR(45) NULL DEFAULT NULL,
  `annee` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `uk_UNIQUE` ON `concession`.`modele` (`nom` ASC, `marque` ASC, `annee` ASC);


-- -----------------------------------------------------
-- Table `concession`.`motorisation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`motorisation` ;

CREATE TABLE IF NOT EXISTS `concession`.`motorisation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cylindree` INT(11) NOT NULL,
  `Chevaux` INT(11) NOT NULL,
  `id_carburant` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_motorisation_carburant`
    FOREIGN KEY (`id_carburant`)
    REFERENCES `concession`.`carburant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `uk_UNIQUE` ON `concession`.`motorisation` (`cylindree` ASC, `Chevaux` ASC, `id_carburant` ASC);

CREATE INDEX `fk_motorisation_carburant_idx` ON `concession`.`motorisation` (`id_carburant` ASC);


-- -----------------------------------------------------
-- Table `concession`.`ville`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`ville` ;

CREATE TABLE IF NOT EXISTS `concession`.`ville` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `nom_UNIQUE` ON `concession`.`ville` (`nom` ASC);


-- -----------------------------------------------------
-- Table `concession`.`stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`stock` ;

CREATE TABLE IF NOT EXISTS `concession`.`stock` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `entrepot` VARCHAR(45) NOT NULL,
  `id_ville` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_stock_ville`
    FOREIGN KEY (`id_ville`)
    REFERENCES `concession`.`ville` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `entrepot_UNIQUE` ON `concession`.`stock` (`entrepot` ASC);

CREATE INDEX `fk_stock_ville_idx` ON `concession`.`stock` (`id_ville` ASC);


-- -----------------------------------------------------
-- Table `concession`.`vehicule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`vehicule` ;

CREATE TABLE IF NOT EXISTS `concession`.`vehicule` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `prix` DECIMAL(8,2) NULL DEFAULT NULL,
  `occasion` TINYINT(1) NOT NULL,
  `date_entree` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_stock` INT(11) NULL DEFAULT NULL,
  `id_modele` INT(11) NOT NULL,
  `id_couleur` INT(11) NOT NULL,
  `id_motorisation` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vehicule_couleur`
    FOREIGN KEY (`id_couleur`)
    REFERENCES `concession`.`couleur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicule_modele`
    FOREIGN KEY (`id_modele`)
    REFERENCES `concession`.`modele` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicule_motorisation`
    FOREIGN KEY (`id_motorisation`)
    REFERENCES `concession`.`motorisation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicule_stock`
    FOREIGN KEY (`id_stock`)
    REFERENCES `concession`.`stock` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `uk_UNIQUE` ON `concession`.`vehicule` (`date_entree` ASC, `occasion` ASC, `id_modele` ASC, `id_couleur` ASC, `id_motorisation` ASC);

CREATE INDEX `fk_vehicule_stock_idx` ON `concession`.`vehicule` (`id_stock` ASC);

CREATE INDEX `fk_vehicule_modele_idx` ON `concession`.`vehicule` (`id_modele` ASC);

CREATE INDEX `fk_vehicule_couleur_idx` ON `concession`.`vehicule` (`id_couleur` ASC);

CREATE INDEX `fk_vehicule_motorisation_idx` ON `concession`.`vehicule` (`id_motorisation` ASC);


-- -----------------------------------------------------
-- Table `concession`.`vendeur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`vendeur` ;

CREATE TABLE IF NOT EXISTS `concession`.`vendeur` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `id_responsable` INT(11) NULL DEFAULT NULL,
  `id_ville` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vendeur_responsable`
    FOREIGN KEY (`id_responsable`)
    REFERENCES `concession`.`vendeur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendeur_ville`
    FOREIGN KEY (`id_ville`)
    REFERENCES `concession`.`ville` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `uk_UNIQUE` ON `concession`.`vendeur` (`prenom` ASC, `nom` ASC);

CREATE INDEX `fk_vendeur_responsable_idx` ON `concession`.`vendeur` (`id_responsable` ASC);

CREATE INDEX `fk_vendeur_ville_idx` ON `concession`.`vendeur` (`id_ville` ASC);


-- -----------------------------------------------------
-- Table `concession`.`vente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`vente` ;

CREATE TABLE IF NOT EXISTS `concession`.`vente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `date_heure` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_vendeur` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vente_vendeur`
    FOREIGN KEY (`id_vendeur`)
    REFERENCES `concession`.`vendeur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `uk_UNIQUE` ON `concession`.`vente` (`date_heure` ASC, `id_vendeur` ASC);

CREATE INDEX `fk_vente_vendeur_idx` ON `concession`.`vente` (`id_vendeur` ASC);


-- -----------------------------------------------------
-- Table `concession`.`vehicule_vendu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `concession`.`vehicule_vendu` ;

CREATE TABLE IF NOT EXISTS `concession`.`vehicule_vendu` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `prix` DECIMAL(8,2) NOT NULL,
  `id_vehicule` INT(11) NOT NULL,
  `id_vente` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `id_vente`),
  CONSTRAINT `fk_vehicule_vendu_vente1`
    FOREIGN KEY (`id_vente`)
    REFERENCES `concession`.`vente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicule_vendu_vehicule1`
    FOREIGN KEY (`id_vehicule`)
    REFERENCES `concession`.`vehicule` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_vehicule_vendu_vente1_idx` ON `concession`.`vehicule_vendu` (`id_vente` ASC);

CREATE INDEX `fk_vehicule_vendu_vehicule1_idx` ON `concession`.`vehicule_vendu` (`id_vehicule` ASC);

CREATE UNIQUE INDEX `id_vehicule_UNIQUE` ON `concession`.`vehicule_vendu` (`id_vehicule` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
