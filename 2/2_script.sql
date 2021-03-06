-- MySQL Script generated by MySQL Workbench
-- жм 21 янв 2022 18:39:41
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dz-2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dz-2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dz-2` DEFAULT CHARACTER SET utf8 ;
USE `dz-2` ;

-- -----------------------------------------------------
-- Table `dz-2`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dz-2`.`department` (
  `id_department` INT NOT NULL AUTO_INCREMENT,
  `department` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dz-2`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dz-2`.`employees` (
  `id_employees` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  PRIMARY KEY (`id_employees`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dz-2`.`department_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dz-2`.`department_employees` (
  `id_department_employees` INT NOT NULL AUTO_INCREMENT,
  `department_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `time_start` DATE NOT NULL,
  `time_finish` DATE NOT NULL,
  PRIMARY KEY (`id_department_employees`),
  INDEX `fk_department_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_employees_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `dz-2`.`department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees`
    FOREIGN KEY (`employee_id`)
    REFERENCES `dz-2`.`employees` (`id_employees`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dz-2`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dz-2`.`salary` (
  `id_salary` INT NOT NULL AUTO_INCREMENT,
  `salary` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL,
  `time_start` DATE NOT NULL,
  `time_finish` DATE NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id_salary`),
  INDEX `fk_employee_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `dz-2`.`employees` (`id_employees`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dz-2`.`boss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dz-2`.`boss` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `boss_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `time_start` DATE NOT NULL,
  `time_finish` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_boss_idx` (`boss_id` ASC) VISIBLE,
  INDEX `fk_employee_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_boss`
    FOREIGN KEY (`boss_id`)
    REFERENCES `dz-2`.`employees` (`id_employees`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `dz-2`.`employees` (`id_employees`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
