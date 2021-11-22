SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema zcdiatnb_practica
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema zcdiatnb_practica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zcdiatnb_practica` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `zcdiatnb_practica` ;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`paises` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`provincias` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
`CodigoPais` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `FK_PAISESPROVINCIAS_idx` (`CodigoPais` ASC) ,
CONSTRAINT `FK_PAISESPROVINCIAS`
FOREIGN KEY (`CodigoPais`)
REFERENCES `zcdiatnb_practica`.`paises` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`localidades` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
`CodigoProvincia` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `fk_localid_provincia_idx` (`CodigoProvincia` ASC) ,
CONSTRAINT `fk_localid_provincia`
FOREIGN KEY (`CodigoProvincia`)
REFERENCES `zcdiatnb_practica`.`provincias` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`usuarios` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Nombre` VARCHAR(45) NOT NULL,
`Apellido` VARCHAR(45) NOT NULL,
`Email` VARCHAR(45) NOT NULL,
`Password` VARCHAR(45) NOT NULL,
`CodigoLocalidad` INT NOT NULL,
`Dni` INT NOT NULL,
`Sexo` CHAR(1) NOT NULL,
`FechaNacimiento` DATE NOT NULL,
`Capacita` BIT(1) NOT NULL,
PRIMARY KEY (`Codigo`),
UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) ,
UNIQUE INDEX `Dni_UNIQUE` (`Dni` ASC) ,
INDEX `fk_alumnos_localidades_idx` (`CodigoLocalidad` ASC) ,
CONSTRAINT `fk_alumnos_localidades`
FOREIGN KEY (`CodigoLocalidad`)
REFERENCES `zcdiatnb_practica`.`localidades` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`cursos` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Nombre` VARCHAR(45) NOT NULL,
`Descripcion` VARCHAR(500) NOT NULL,
`Logo` VARCHAR(45) NOT NULL,
`CodigoProfesor` INT NOT NULL,
`DuracionEnMinutos` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `fk_cursos_prof_idx` (`CodigoProfesor` ASC) ,
CONSTRAINT `fk_cursos_prof`
FOREIGN KEY (`CodigoProfesor`)
REFERENCES `zcdiatnb_practica`.`usuarios` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`unidadesporcurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`unidadesporcurso` (
`CodigoCurso` INT NOT NULL,
`CodigoUnidad` INT NOT NULL,
`Nombre` VARCHAR(45) NOT NULL,
`Descripcion` VARCHAR(1000) NOT NULL,
`Video` VARCHAR(45) NOT NULL,
`Archivo` VARCHAR(45) NOT NULL,
PRIMARY KEY (`CodigoCurso`, `CodigoUnidad`),
CONSTRAINT `FK_UNIPORCURSO_CURSO`
FOREIGN KEY (`CodigoCurso`)
REFERENCES `zcdiatnb_practica`.`cursos` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`inscripcionesporalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`inscripcionesporalumno` (
`CodigoAlumno` INT NOT NULL,
`CodigoCurso` INT NOT NULL,
`FechaInscripcion` DATE NOT NULL,
`FechaFinalizacion` DATE NULL DEFAULT NULL,
PRIMARY KEY (`CodigoAlumno`, `CodigoCurso`),
INDEX `fk_curso_idx` (`CodigoCurso` ASC) ,
CONSTRAINT `FK_ALUMNOS_CURSOS`
FOREIGN KEY (`CodigoAlumno`)
REFERENCES `zcdiatnb_practica`.`usuarios` (`Codigo`),
CONSTRAINT `fk_curso`
FOREIGN KEY (`CodigoCurso`)
REFERENCES `zcdiatnb_practica`.`cursos` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
-- -----------------------------------------------------
-- Table `zcdiatnb_practica`.`estadodecursosporalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zcdiatnb_practica`.`estadodecursosporalumno` (
`CodigoAlumno` INT NOT NULL,
`CodigoCurso` INT NOT NULL,
`CodigoUnidad` INT NOT NULL,
`Estado` BIT(1) NOT NULL,
PRIMARY KEY (`CodigoAlumno`, `CodigoCurso`, `CodigoUnidad`),
INDEX `fk_estadodecursos_UNIDADES_idx` (`CodigoCurso` ASC, `CodigoUnidad` ASC) ,
CONSTRAINT `fk_estadodecursos_UNIDADES`
FOREIGN KEY (`CodigoCurso` , `CodigoUnidad`)
REFERENCES `zcdiatnb_practica`.`unidadesporcurso` (`CodigoCurso` , `CodigoUnidad`),
CONSTRAINT `FK_INSCRIPCION_ESTADOS`
FOREIGN KEY (`CodigoAlumno` , `CodigoCurso`)
REFERENCES `zcdiatnb_practica`.`inscripcionesporalumno` (`CodigoAlumno` , `CodigoCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;