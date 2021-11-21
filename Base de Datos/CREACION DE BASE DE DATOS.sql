SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema practica
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema practica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `practica` ;
-- -----------------------------------------------------
-- Table `practica`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`paises` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
PRIMARY KEY (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`provincias` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
`CodigoPais` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `FK_PAISESPROVINCIAS_idx` (`CodigoPais` ASC) VISIBLE,
CONSTRAINT `FK_PAISESPROVINCIAS`
FOREIGN KEY (`CodigoPais`)
REFERENCES `practica`.`paises` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`localidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`localidades` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL,
`CodigoProvincia` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `fk_localid_provincia_idx` (`CodigoProvincia` ASC) VISIBLE,
CONSTRAINT `fk_localid_provincia`
FOREIGN KEY (`CodigoProvincia`)
REFERENCES `practica`.`provincias` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`usuarios` (
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
UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
UNIQUE INDEX `Dni_UNIQUE` (`Dni` ASC) VISIBLE,
INDEX `fk_alumnos_localidades_idx` (`CodigoLocalidad` ASC) VISIBLE,
CONSTRAINT `fk_alumnos_localidades`
FOREIGN KEY (`CodigoLocalidad`)
REFERENCES `practica`.`localidades` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`cursos` (
`Codigo` INT NOT NULL AUTO_INCREMENT,
`Nombre` VARCHAR(45) NOT NULL,
`Descripcion` VARCHAR(500) NOT NULL,
`Logo` VARCHAR(45) NOT NULL,
`CodigoProfesor` INT NOT NULL,
`DuracionEnMinutos` INT NOT NULL,
PRIMARY KEY (`Codigo`),
INDEX `fk_cursos_prof_idx` (`CodigoProfesor` ASC) VISIBLE,
CONSTRAINT `fk_cursos_prof`
FOREIGN KEY (`CodigoProfesor`)
REFERENCES `practica`.`usuarios` (`Codigo`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`unidadesporcurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`unidadesporcurso` (
`CodigoCurso` INT NOT NULL,
`CodigoUnidad` INT NOT NULL,
`Nombre` VARCHAR(45) NOT NULL,
`Descripcion` VARCHAR(1000) NOT NULL,
`Video` VARCHAR(45) NOT NULL,
`Archivo` VARCHAR(45) NOT NULL,
PRIMARY KEY (`CodigoCurso`, `CodigoUnidad`),
CONSTRAINT `FK_UNIPORCURSO_CURSO`
FOREIGN KEY (`CodigoCurso`)
REFERENCES `practica`.`cursos` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`inscripcionesporalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`inscripcionesporalumno` (
`CodigoAlumno` INT NOT NULL,
`CodigoCurso` INT NOT NULL,
`FechaInscripcion` DATE NOT NULL,
`FechaFinalizacion` DATE NULL DEFAULT NULL,
PRIMARY KEY (`CodigoAlumno`, `CodigoCurso`),
INDEX `fk_curso_idx` (`CodigoCurso` ASC) VISIBLE,
CONSTRAINT `FK_ALUMNOS_CURSOS`
FOREIGN KEY (`CodigoAlumno`)
REFERENCES `practica`.`usuarios` (`Codigo`),
CONSTRAINT `fk_curso`
FOREIGN KEY (`CodigoCurso`)
REFERENCES `practica`.`cursos` (`Codigo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `practica`.`estadodecursosporalumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica`.`estadodecursosporalumno` (
`CodigoAlumno` INT NOT NULL,
`CodigoCurso` INT NOT NULL,
`CodigoUnidad` INT NOT NULL,
`Estado` BIT(1) NOT NULL,
PRIMARY KEY (`CodigoAlumno`, `CodigoCurso`, `CodigoUnidad`),
INDEX `fk_estadodecursos_UNIDADES_idx` (`CodigoCurso` ASC, `CodigoUnidad` ASC) VISIBLE,
CONSTRAINT `fk_estadodecursos_UNIDADES`
FOREIGN KEY (`CodigoCurso` , `CodigoUnidad`)
REFERENCES `practica`.`unidadesporcurso` (`CodigoCurso` , `CodigoUnidad`),
CONSTRAINT `FK_INSCRIPCION_ESTADOS`
FOREIGN KEY (`CodigoAlumno` , `CodigoCurso`)
REFERENCES `practica`.`inscripcionesporalumno` (`CodigoAlumno` , `CodigoCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;