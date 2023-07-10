-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AfricanJollofDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AfricanJollofDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AfricanJollofDB` DEFAULT CHARACTER SET utf8 ;
USE `AfricanJollofDB` ;

-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone_no` VARCHAR(14) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `town` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Staffs` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_no` VARCHAR(14) NOT NULL,
  `email` VARCHAR(45) NULL,
  `birth_date` DATE NULL,
  `hire_date` VARCHAR(45) NULL,
  `salary` DECIMAL(10,2) NULL,
  `address` VARCHAR(100) NULL,
  `town` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `hire_date_UNIQUE` (`hire_date` ASC) VISIBLE,
  UNIQUE INDEX `salary_UNIQUE` (`salary` ASC) VISIBLE,
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `customer_id`, `staff_id`),
  INDEX `fk_Orders_Customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Orders_Staffs1_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `AfricanJollofDB`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Staffs1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `AfricanJollofDB`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `booking_date` DATETIME NOT NULL,
  `table_number` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `staff_id`),
  INDEX `fk_Bookings_Staffs1_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Staffs1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `AfricanJollofDB`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `menu_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`OrderDetails` (
  `detail_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`detail_id`, `menu_id`, `order_id`),
  INDEX `fk_ÒrderDetails_Menu1_idx` (`menu_id` ASC) VISIBLE,
  INDEX `fk_ÒrderDetails_Orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_ÒrderDetails_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `AfricanJollofDB`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ÒrderDetails_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `AfricanJollofDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`OrderDeliveryStatus` (
  `delivery_id` INT NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `delivery_status` VARCHAR(45) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`delivery_id`, `order_id`),
  INDEX `fk_OrderDeliveryStatus_Orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDeliveryStatus_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `AfricanJollofDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Starters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Starters` (
  `starter_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `unit_price` FLOAT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`, `starter_id`),
  INDEX `fk_Starters_Menu1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_Starters_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `AfricanJollofDB`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`MainCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`MainCourses` (
  `main_course_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `unit_price` FLOAT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`main_course_id`, `menu_id`),
  INDEX `fk_MainCourses_Menu1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_MainCourses_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `AfricanJollofDB`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Deserts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Deserts` (
  `desert_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `unit_price` DECIMAL(5,2) NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`desert_id`, `menu_id`),
  INDEX `fk_Deserts_Menu1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_Deserts_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `AfricanJollofDB`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AfricanJollofDB`.`Drinks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AfricanJollofDB`.`Drinks` (
  `drink_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `unit_price` FLOAT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`drink_id`, `menu_id`),
  INDEX `fk_Drinks_Menu1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_Drinks_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `AfricanJollofDB`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
