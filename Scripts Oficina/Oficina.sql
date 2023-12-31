-- MySQL Script generated by MySQL Workbench
-- Sat Sep  2 22:18:51 2023
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
-- Table `mydb`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `Placa` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Placa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CPF` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Carro` VARCHAR(45) NOT NULL,
  `Veiculo_Placa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF`, `Veiculo_Placa`),
  INDEX `fk_Cliente_Veiculo1_idx` (`Veiculo_Placa` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `mydb`.`Veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servico` (
  `NumeroPedido` INT NOT NULL,
  `Tipo` ENUM('Revisão', 'Funilaria', 'Eletronica Embarcada', 'Cambio') NULL,
  PRIMARY KEY (`NumeroPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecanico` (
  `idMecanico` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NOT NULL,
  `Departamento` ENUM('Funilaria', 'EletronicaEmbarcada', 'Cambio') NOT NULL,
  PRIMARY KEY (`idMecanico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carro` (
  `idCarro` INT NOT NULL,
  `Veiculo_Placa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCarro`, `Veiculo_Placa`),
  INDEX `fk_Carro_Veiculo1_idx` (`Veiculo_Placa` ASC) VISIBLE,
  CONSTRAINT `fk_Carro_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `mydb`.`Veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Caminhao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Caminhao` (
  `IdCaminhao` VARCHAR(45) NOT NULL,
  `Veiculo_Placa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCaminhao`, `Veiculo_Placa`),
  CONSTRAINT `fk_Caminhao_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `mydb`.`Veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Eletrico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Eletrico` (
  `idEletrico` INT NOT NULL,
  `Veiculo_Placa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEletrico`, `Veiculo_Placa`),
  INDEX `fk_Eletrico_Veiculo1_idx` (`Veiculo_Placa` ASC) VISIBLE,
  CONSTRAINT `fk_Eletrico_Veiculo1`
    FOREIGN KEY (`Veiculo_Placa`)
    REFERENCES `mydb`.`Veiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TabelaPrecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TabelaPrecos` (
  `idServico` INT ZEROFILL NOT NULL,
  `ValorEstimado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrdemServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrdemServico` (
  `idOrdemServico` INT NOT NULL,
  `Data` DATE NOT NULL,
  `Valor` INT NOT NULL,
  `Status` ENUM('Criada', 'Autorizada', 'Em Serviço', 'Não Autorizado') NOT NULL,
  `Prazo` DATE NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  `Cliente_Veiculo_Placa` VARCHAR(45) NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  `NumeroPedido` INT NOT NULL,
  `TabelaPrecos_idServico` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idOrdemServico`, `Cliente_CPF`, `Cliente_Veiculo_Placa`, `Mecanico_idMecanico`, `NumeroPedido`, `TabelaPrecos_idServico`),
  INDEX `fk_OrdemServico_Cliente1_idx` (`Cliente_CPF` ASC, `Cliente_Veiculo_Placa` ASC) VISIBLE,
  INDEX `fk_OrdemServico_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  INDEX `fk_OrdemServico_Servico1_idx` (`NumeroPedido` ASC) VISIBLE,
  INDEX `fk_OrdemServico_TabelaPrecos1_idx` (`TabelaPrecos_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServico_Cliente1`
    FOREIGN KEY (`Cliente_CPF` , `Cliente_Veiculo_Placa`)
    REFERENCES `mydb`.`Cliente` (`CPF` , `Veiculo_Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mydb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Servico1`
    FOREIGN KEY (`NumeroPedido`)
    REFERENCES `mydb`.`Servico` (`NumeroPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_TabelaPrecos1`
    FOREIGN KEY (`TabelaPrecos_idServico`)
    REFERENCES `mydb`.`TabelaPrecos` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funilaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funilaria` (
  `Nome` VARCHAR(45) NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`Mecanico_idMecanico`),
  CONSTRAINT `fk_Funilaria_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mydb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EletronicaEmbarcada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EletronicaEmbarcada` (
  `Nome` VARCHAR(45) NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`Mecanico_idMecanico`),
  CONSTRAINT `fk_EletronicaEmbarcada_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mydb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cambio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cambio` (
  `Nome` VARCHAR(45) NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  PRIMARY KEY (`Mecanico_idMecanico`),
  CONSTRAINT `fk_Cambio_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mydb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Solicitacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Solicitacao` (
  `idSolicitacao` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  `Cliente_Veiculo_Placa` VARCHAR(45) NOT NULL,
  `Mecanico_idMecanico` INT NOT NULL,
  `TabelaPrecos_idServico` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idSolicitacao`, `Cliente_CPF`, `Cliente_Veiculo_Placa`, `Mecanico_idMecanico`, `TabelaPrecos_idServico`),
  INDEX `fk_Solicitacao_Cliente1_idx` (`Cliente_CPF` ASC, `Cliente_Veiculo_Placa` ASC) VISIBLE,
  INDEX `fk_Solicitacao_Mecanico1_idx` (`Mecanico_idMecanico` ASC) VISIBLE,
  INDEX `fk_Solicitacao_TabelaPrecos1_idx` (`TabelaPrecos_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_Solicitacao_Cliente1`
    FOREIGN KEY (`Cliente_CPF` , `Cliente_Veiculo_Placa`)
    REFERENCES `mydb`.`Cliente` (`CPF` , `Veiculo_Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitacao_Mecanico1`
    FOREIGN KEY (`Mecanico_idMecanico`)
    REFERENCES `mydb`.`Mecanico` (`idMecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Solicitacao_TabelaPrecos1`
    FOREIGN KEY (`TabelaPrecos_idServico`)
    REFERENCES `mydb`.`TabelaPrecos` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
