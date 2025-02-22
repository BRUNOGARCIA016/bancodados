-- MySQL Script generated by MySQL Workbench
-- Mon Sep 16 14:26:04 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `idpedidos` INT NOT NULL,
  `data` DATE NULL,
  `status` VARCHAR(45) NULL,
  `cliente_idcliente` INT NULL,
  `sessao` VARCHAR(45) NULL,
  PRIMARY KEY (`idpedidos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidoitens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidoitens` (
  `idpedidoitens` INT NOT NULL,
  `qtade` INT NULL,
  `preco` FLOAT NULL,
  `total` FLOAT NULL,
  `pedidos_idpedidos` INT NULL,
  `pedidoitenscol` VARCHAR(45) NULL,
  `pedidoitenscol1` VARCHAR(45) NULL,
  `produto_idprodutos` INT NULL,
  `pedidos_idpedidos1` INT NOT NULL,
  PRIMARY KEY (`idpedidoitens`),
  INDEX `fk_pedidoitens_pedidos1_idx` (`pedidos_idpedidos1` ASC) VISIBLE,
  CONSTRAINT `fk_pedidoitens_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos1`)
    REFERENCES `mydb`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `idproduto` INT NOT NULL,
  `dsproduto` VARCHAR(45) NULL,
  `preco` INT NULL,
  `foto` LONGBLOB NULL,
  `categoria_idcategoria` INT NULL,
  `produtocol` VARCHAR(45) NULL,
  `pedidoitens_idpedidoitens` INT NOT NULL,
  PRIMARY KEY (`idproduto`),
  INDEX `fk_produto_pedidoitens1_idx` (`pedidoitens_idpedidoitens` ASC) VISIBLE,
  CONSTRAINT `fk_produto_pedidoitens1`
    FOREIGN KEY (`pedidoitens_idpedidoitens`)
    REFERENCES `mydb`.`pedidoitens` (`idpedidoitens`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL,
  `dscategoria` VARCHAR(45) NOT NULL,
  `produto_idproduto` INT NOT NULL,
  PRIMARY KEY (`idcategoria`),
  INDEX `fk_categoria_produto_idx` (`produto_idproduto` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_produto`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idcliente` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `senha` VARCHAR(100) NULL,
  `clientecol` VARCHAR(45) NULL,
  `pedidos_idpedidos` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_cliente_pedidos1_idx` (`pedidos_idpedidos` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `mydb`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
