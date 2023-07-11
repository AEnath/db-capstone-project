-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema africanjollofdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema africanjollofdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `africanjollofdb` DEFAULT CHARACTER SET utf8 ;
USE `africanjollofdb` ;

-- -----------------------------------------------------
-- Table `africanjollofdb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `town` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`Staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`Staffs` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `birth_date` DATE NULL,
  `hire_date` VARCHAR(45) NOT NULL,
  `salary` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `town` VARCHAR(45) NULL,
  `role` INT NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `customer_id`, `staff_id`),
  INDEX `fk_Orders_Customers_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Orders_Staffs1_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `africanjollofdb`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Staffs1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `africanjollofdb`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `booking_date` DATETIME NOT NULL,
  `table_number` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `staff_id`, `customer_id`),
  INDEX `fk_Bookings_Staffs1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_Bookings_Customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Staffs1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `africanjollofdb`.`Staffs` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `africanjollofdb`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`MenuCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`MenuCategory` (
  `menu_category_id` INT NOT NULL,
  `menu_category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`Menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `menu_category_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`menu_id`, `menu_category_id`),
  INDEX `fk_Menu_MenuCategory1_idx` (`menu_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_MenuCategory1`
    FOREIGN KEY (`menu_category_id`)
    REFERENCES `africanjollofdb`.`MenuCategory` (`menu_category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`OrderDetails` (
  `order_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `menu_id`),
  INDEX `fk_ÒrderDetails_Orders1_idx` (`order_id` ASC) VISIBLE,
  INDEX `fk_OrderDetails_Menu1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_ÒrderDetails_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `africanjollofdb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `africanjollofdb`.`Menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `africanjollofdb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `africanjollofdb`.`OrderDeliveryStatus` (
  `delivery_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `delivery_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivery_id`, `order_id`),
  INDEX `fk_OrderDeliveryStatus_Orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDeliveryStatus_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `africanjollofdb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
