-- MySQL Script generated by MySQL Workbench
-- Fri Jun 19 21:28:11 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema afropreneurdigital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `afropreneurdigital` ;

-- -----------------------------------------------------
-- Schema afropreneurdigital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `afropreneurdigital` DEFAULT CHARACTER SET utf8 ;
USE `afropreneurdigital` ;

-- -----------------------------------------------------
-- Table `afropreneurdigital`.`AUTHOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `afropreneurdigital`.`AUTHOR` ;

CREATE TABLE IF NOT EXISTS `afropreneurdigital`.`AUTHOR` (
    `ID` INT NOT NULL,
    `FULL_NAME` VARCHAR(500) NULL,
    `LOGIN` VARCHAR(250) NULL,
    `PASSWORD` VARCHAR(250) NULL,
    `DESCRIPTION` VARCHAR(10000) NULL,
    `CREATED_AT` DATETIME NULL,
    `DELETED_AT` DATETIME NULL,
    PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afropreneurdigital`.`ARTICLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `afropreneurdigital`.`ARTICLE` ;

CREATE TABLE IF NOT EXISTS `afropreneurdigital`.`ARTICLE` (
    `ID` INT NOT NULL,
    `TITLE` VARCHAR(1000) NULL,
    `CONTENT` VARCHAR(10000) NULL,
    `RELEASE_DATE` DATETIME NULL,
    `AUTHOR_ID` INT NOT NULL,
    `DELETED_AT` DATETIME NULL,
    PRIMARY KEY (`ID`),
    INDEX `fk_ARTICLE_AUTHOR1_idx` (`AUTHOR_ID` ASC),
    CONSTRAINT `fk_ARTICLE_AUTHOR1`
        FOREIGN KEY (`AUTHOR_ID`)
            REFERENCES `afropreneurdigital`.`AUTHOR` (`ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afropreneurdigital`.`ENTITIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `afropreneurdigital`.`ENTITIES` ;

CREATE TABLE IF NOT EXISTS `afropreneurdigital`.`ENTITIES` (
   `ID` INT NOT NULL,
   `GROUP` VARCHAR(45) NULL,
   `KEY` VARCHAR(45) NULL,
   `VALUE` VARCHAR(45) NULL,
   `DESCRIPTION` VARCHAR(500) NULL,
   PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afropreneurdigital`.`ARTICLE_ENTITY_COMP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `afropreneurdigital`.`ARTICLE_ENTITY_COMP` ;

CREATE TABLE IF NOT EXISTS `afropreneurdigital`.`ARTICLE_ENTITY_COMP` (
  `ID` INT NOT NULL,
  `ARTICLE_ID` INT NOT NULL,
  `ENTITY_ID` INT NOT NULL,
  INDEX `fk_ARTICLE_has_ENTITIES_ENTITIES1_idx` (`ENTITY_ID` ASC),
  INDEX `fk_ARTICLE_has_ENTITIES_ARTICLE1_idx` (`ARTICLE_ID` ASC),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_ARTICLE_has_ENTITIES_ARTICLE1`
      FOREIGN KEY (`ARTICLE_ID`)
          REFERENCES `afropreneurdigital`.`ARTICLE` (`ID`)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARTICLE_has_ENTITIES_ENTITIES1`
      FOREIGN KEY (`ENTITY_ID`)
          REFERENCES `afropreneurdigital`.`ENTITIES` (`ID`)
          ON DELETE NO ACTION
          ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `afropreneurdigital`.`TOKEN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `afropreneurdigital`.`TOKEN` ;

CREATE TABLE IF NOT EXISTS `afropreneurdigital`.`TOKEN` (
    `ID` VARCHAR(250) NOT NULL,
    `EXPIRATION_DATE` DATETIME NULL,
    `AUTHOR_ID` INT NOT NULL,
    PRIMARY KEY (`ID`),
    INDEX `fk_TOKEN_AUTHOR1_idx` (`AUTHOR_ID` ASC),
    CONSTRAINT `fk_TOKEN_AUTHOR1`
        FOREIGN KEY (`AUTHOR_ID`)
            REFERENCES `afropreneurdigital`.`AUTHOR` (`ID`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
