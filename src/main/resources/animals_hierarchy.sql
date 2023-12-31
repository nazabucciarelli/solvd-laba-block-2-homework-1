-- MySQL Script generated by MySQL Workbench
-- mié 13 dic 2023 23:43:52
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema animals
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema animals
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `animals` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `animals` ;

-- -----------------------------------------------------
-- Table `animals`.`zoos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`zoos` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `customers_capacity` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`animal_rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`animal_rooms` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `zoos_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_animal_rooms_zoos_idx` (`zoos_id` ASC) VISIBLE,
  CONSTRAINT `fk_animal_rooms_zoos`
    FOREIGN KEY (`zoos_id`)
    REFERENCES `animals`.`zoos` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`feeding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`feeding` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`genders` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`habitat` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`animals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`animals` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `weight` DOUBLE NOT NULL,
  `feeding_id` BIGINT UNSIGNED NOT NULL,
  `habitat_id` BIGINT UNSIGNED NOT NULL,
  `genders_id` BIGINT UNSIGNED NOT NULL,
  `animal_rooms_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_animals_feeding1_idx` (`feeding_id` ASC) VISIBLE,
  INDEX `fk_animals_habitat1_idx` (`habitat_id` ASC) VISIBLE,
  INDEX `fk_animals_gender1_idx` (`genders_id` ASC) VISIBLE,
  INDEX `fk_animals_animal_rooms1_idx` (`animal_rooms_id` ASC) VISIBLE,
  CONSTRAINT `fk_animals_animal_rooms1`
    FOREIGN KEY (`animal_rooms_id`)
    REFERENCES `animals`.`animal_rooms` (`id`),
  CONSTRAINT `fk_animals_feeding1`
    FOREIGN KEY (`feeding_id`)
    REFERENCES `animals`.`feeding` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_animals_gender1`
    FOREIGN KEY (`genders_id`)
    REFERENCES `animals`.`genders` (`id`),
  CONSTRAINT `fk_animals_habitat1`
    FOREIGN KEY (`habitat_id`)
    REFERENCES `animals`.`habitat` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`countries` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`persons` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(60) NOT NULL,
  `last_name` VARCHAR(60) NOT NULL,
  `birth_date` DATE NOT NULL,
  `genders_id` BIGINT UNSIGNED NOT NULL,
  `countries_id` BIGINT UNSIGNED NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_persons_gender1_idx` (`genders_id` ASC) VISIBLE,
  INDEX `fk_persons_countries1_idx` (`countries_id` ASC) VISIBLE,
  CONSTRAINT `fk_persons_countries1`
    FOREIGN KEY (`countries_id`)
    REFERENCES `animals`.`countries` (`id`),
  CONSTRAINT `fk_persons_gender1`
    FOREIGN KEY (`genders_id`)
    REFERENCES `animals`.`genders` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`customers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `times_visiting_zoo` INT NOT NULL,
  `persons_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_customers_persons1_idx` (`persons_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_persons1`
    FOREIGN KEY (`persons_id`)
    REFERENCES `animals`.`persons` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`customer_zoos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`customer_zoos` (
  `zoos_id` BIGINT UNSIGNED NOT NULL,
  `customers_id` BIGINT UNSIGNED NOT NULL,
  `visit_datetime` TIMESTAMP NOT NULL,
  `spent_money` DOUBLE NOT NULL,
  PRIMARY KEY (`zoos_id`, `customers_id`),
  UNIQUE INDEX `zoos_id_UNIQUE` (`zoos_id` ASC) VISIBLE,
  UNIQUE INDEX `customers_id_UNIQUE` (`customers_id` ASC) VISIBLE,
  INDEX `fk_zoos_has_customers_customers1_idx` (`customers_id` ASC) VISIBLE,
  INDEX `fk_zoos_has_customers_zoos1_idx` (`zoos_id` ASC) VISIBLE,
  CONSTRAINT `fk_zoos_has_customers_customers1`
    FOREIGN KEY (`customers_id`)
    REFERENCES `animals`.`customers` (`id`),
  CONSTRAINT `fk_zoos_has_customers_zoos1`
    FOREIGN KEY (`zoos_id`)
    REFERENCES `animals`.`zoos` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`departments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`position` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`employees_identifiers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`employees_identifiers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_id` BIGINT UNSIGNED NOT NULL,
  `departments_id` BIGINT UNSIGNED NOT NULL,
  `identification_code` VARCHAR(20) NOT NULL,
  `image_url` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_employees_identifiers_position1_idx` (`position_id` ASC) VISIBLE,
  INDEX `fk_employees_identifiers_departments1_idx` (`departments_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_identifiers_departments1`
    FOREIGN KEY (`departments_id`)
    REFERENCES `animals`.`departments` (`id`),
  CONSTRAINT `fk_employees_identifiers_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `animals`.`position` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `animals`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `animals`.`employees` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `entry_date` DATE NOT NULL,
  `salary` DOUBLE NOT NULL,
  `persons_id` BIGINT UNSIGNED NOT NULL,
  `employees_identifiers_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_employees_employee1_idx` (`persons_id` ASC) VISIBLE,
  INDEX `fk_employees_employees_identifiers1_idx` (`employees_identifiers_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_employee1`
    FOREIGN KEY (`persons_id`)
    REFERENCES `animals`.`persons` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_employees_employees_identifiers1`
    FOREIGN KEY (`employees_identifiers_id`)
    REFERENCES `animals`.`employees_identifiers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
