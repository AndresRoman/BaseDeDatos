-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema proyectoBD2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectoBD2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoBD2` DEFAULT CHARACTER SET utf8 ;
USE `proyectoBD2` ;

-- -----------------------------------------------------
-- Table `proyectoBD2`.`Victima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Victima` (
  `idVictima` INT NOT NULL AUTO_INCREMENT,
  `NombreV` VARCHAR(45) NULL,
  `ApellidosV` VARCHAR(45) NULL,
  `EdadV` INT NULL,
  `NacionalidadV` VARCHAR(45) NULL,
  `OcupacionV` VARCHAR(45) NULL,
  PRIMARY KEY (`idVictima`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Situacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Situacion` (
  `idSituacion` INT NOT NULL AUTO_INCREMENT,
  `Situacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idSituacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Agresor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Agresor` (
  `idAgresor` INT NOT NULL AUTO_INCREMENT,
  `NombreA` VARCHAR(45) NULL,
  `ApellidosA` VARCHAR(45) NULL,
  `EdadA` INT NULL,
  `NacionalidadA` VARCHAR(45) NULL,
  `OcupacionA` VARCHAR(45) NULL,
  `Sentencia` VARCHAR(45) NULL,
  `idSituacion` INT NULL,
  PRIMARY KEY (`idAgresor`),
  INDEX `fk_Agresor_Situacion_idx` (`idSituacion` ASC),
  CONSTRAINT `fk_Agresor_Situacion`
    FOREIGN KEY (`idSituacion`)
    REFERENCES `proyectoBD2`.`Situacion` (`idSituacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Caso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Caso` (
  `idCaso` INT NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idCaso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `Departamento` VARCHAR(45) NULL,
  `idPais` INT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Pais1_idx` (`idPais` ASC),
  CONSTRAINT `fk_Departamento_Pais1`
    FOREIGN KEY (`idPais`)
    REFERENCES `proyectoBD2`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT,
  `Provincia` VARCHAR(45) NULL,
  `idDepartamento` INT NULL,
  PRIMARY KEY (`idProvincia`),
  INDEX `fk_Provincia_Departamento1_idx` (`idDepartamento` ASC),
  CONSTRAINT `fk_Provincia_Departamento1`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `proyectoBD2`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Lugar` (
  `idLugar` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  `idProvincia` INT NULL,
  PRIMARY KEY (`idLugar`),
  INDEX `fk_Lugar_Provincia1_idx` (`idProvincia` ASC),
  CONSTRAINT `fk_Lugar_Provincia1`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `proyectoBD2`.`Provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Arma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Arma` (
  `idArma` INT NOT NULL AUTO_INCREMENT,
  `Arma` VARCHAR(45) NULL,
  PRIMARY KEY (`idArma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Causa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Causa` (
  `idCausa` INT NOT NULL AUTO_INCREMENT,
  `Causa` VARCHAR(45) NULL,
  PRIMARY KEY (`idCausa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Feminicidio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Feminicidio` (
  `idFeminicidio` INT NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `idLugar` INT NULL,
  `Circunstancias` VARCHAR(45) NULL,
  `idVictima` INT NULL,
  `idAgresor` INT NULL,
  `idCausa` INT NULL,
  `Relacion` VARCHAR(45) NULL,
  `TiempoRelacion` VARCHAR(45) NULL,
  `AgresionPrevia` VARCHAR(45) NULL,
  `idCaso` INT NULL,
  `Testigo` VARCHAR(45) NULL,
  `idArma` INT NULL,
  PRIMARY KEY (`idFeminicidio`),
  INDEX `fk_Feminicidio_Arma1_idx` (`idArma` ASC),
  INDEX `fk_Feminicidio_Causa1_idx` (`idCausa` ASC),
  INDEX `fk_Feminicidio_Agresor1_idx` (`idAgresor` ASC),
  INDEX `fk_Feminicidio_Lugar1_idx` (`idLugar` ASC),
  INDEX `fk_Feminicidio_Caso1_idx` (`idCaso` ASC),
  INDEX `fk_Feminicidio_Victima1_idx` (`idVictima` ASC),
  CONSTRAINT `fk_Feminicidio_Arma1`
    FOREIGN KEY (`idArma`)
    REFERENCES `proyectoBD2`.`Arma` (`idArma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feminicidio_Causa1`
    FOREIGN KEY (`idCausa`)
    REFERENCES `proyectoBD2`.`Causa` (`idCausa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feminicidio_Agresor1`
    FOREIGN KEY (`idAgresor`)
    REFERENCES `proyectoBD2`.`Agresor` (`idAgresor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feminicidio_Lugar1`
    FOREIGN KEY (`idLugar`)
    REFERENCES `proyectoBD2`.`Lugar` (`idLugar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feminicidio_Caso1`
    FOREIGN KEY (`idCaso`)
    REFERENCES `proyectoBD2`.`Caso` (`idCaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feminicidio_Victima1`
    FOREIGN KEY (`idVictima`)
    REFERENCES `proyectoBD2`.`Victima` (`idVictima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectoBD2`.`Fuente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoBD2`.`Fuente` (
  `idFuente` INT NOT NULL AUTO_INCREMENT,
  `URL` VARCHAR(45) NULL,
  `FechaURL` VARCHAR(45) NULL,
  `TextoURL` VARCHAR(45) NULL,
  `PalabrasURL` VARCHAR(45) NULL,
  `AutorURL` VARCHAR(45) NULL,
  `CategoriaURL` VARCHAR(45) NULL,
  `idFeminicidio` INT NULL,
  PRIMARY KEY (`idFuente`),
  INDEX `fk_Fuente_Feminicidio1_idx` (`idFeminicidio` ASC),
  CONSTRAINT `fk_Fuente_Feminicidio1`
    FOREIGN KEY (`idFeminicidio`)
    REFERENCES `proyectoBD2`.`Feminicidio` (`idFeminicidio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
