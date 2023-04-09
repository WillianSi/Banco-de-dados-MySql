-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.22 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para supermercado
DROP DATABASE IF EXISTS `supermercado`;
CREATE DATABASE IF NOT EXISTS `supermercado` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermercado`;

-- Copiando estrutura para tabela supermercado.cargo
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.cargo: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`idCargo`, `nome`, `salario`) VALUES
	(1, 'Caixa', 1500.05),
	(2, 'Repositor', 1156.08),
	(3, 'Gerente', 1980.56);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(19) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `bairro` varchar(90) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.cliente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCliente`, `nome`, `dataNascimento`, `cpf`, `telefone`, `email`, `endereco`, `bairro`, `cidade`, `cep`, `uf`) VALUES
	(1, 'Sophia Bush', '1994-09-22', '181.728.834-20', '(35) 99977-6610', 'rhea_braun@gmail.com', '9284 Steuber Ranch Suite 835', 'Brooklyn Park', 'Machado', '37750-000', 'MG'),
	(2, 'Felix Trinidad', NULL, '302.457.497-21', '(35) 99844-9865', 'delta2@hotmail.com', '9153 Lennie Fork Suite 963', 'Southaven', 'Machado', '37750-000', 'MG'),
	(5, 'Carmen', '1982-05-07', '316.357.830-62', '(35) 9986655-9980', 'carmen98@hotmail.com', '58155 Balistreri Tunnel Suite 134', 'Lawton', 'Machado', '37750-000', 'MG');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.fornecedor
DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone` varchar(19) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `bairro` varchar(90) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.fornecedor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` (`idFornecedor`, `nome`, `cnpj`, `telefone`, `email`, `endereco`, `bairro`, `cidade`, `cep`, `uf`) VALUES
	(1, 'Nova Safra', '07.770.708/0001-70', '(31)3394-1500', 'atendimento0@novasafra.com.br', 'Ceasa Rodovia BR – 040, Km 688 – Pavilhão A', 'Kennedy', 'Andradas', '95731', 'MG'),
	(2, 'Copal Distribuidora', '35.622.178/0001-59', '(48) 3246-1666', 'supermercadocopal@copalalimentos.com.br', 'Rua Heriberto Hulse, 4633 – Serraria', 'São José', 'Florianopolis', '46874', 'SC');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.funcionario
DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataNascimento` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(19) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `bairro` varchar(90) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `cep` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '37750-000',
  `uf` varchar(2) NOT NULL,
  `CARGO_idCargo` int NOT NULL,
  PRIMARY KEY (`idFuncionario`,`CARGO_idCargo`),
  KEY `fk_FUNCIONARIO_CARGO1_idx` (`CARGO_idCargo`),
  CONSTRAINT `fk_FUNCIONARIO_CARGO1` FOREIGN KEY (`CARGO_idCargo`) REFERENCES `cargo` (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.funcionario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`idFuncionario`, `nome`, `dataNascimento`, `cpf`, `telefone`, `email`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `CARGO_idCargo`) VALUES
	(1, 'Zacarias de Sousa', '2000-08-29', '012.142.881-89', '(35) 997346754', 'zacarias1998@gmail.com', '8654 Ryan Keys Suite 564', 'Collierville', 'Machado', '37750-000', 'MG', 1),
	(2, 'Jaqueline Cardoso', '1990-04-22', '161.147.173-76', '(35) 95501-1624', 'jaquelin_mosciski@gmail.com', '55580 Manuel Groves Suite 562 - Louisville', 'Grand Island', 'Machado', '37750-000', 'MG', 3);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para procedure supermercado.inseriCliente
DROP PROCEDURE IF EXISTS `inseriCliente`;
DELIMITER //
CREATE PROCEDURE `inseriCliente`(
	IN `id` INT,
	IN `nome` VARCHAR(200),
	IN `dataNascimento` DATE,
	IN `cpf` VARCHAR(14),
	IN `telefone` VARCHAR(19),
	IN `email` VARCHAR(100),
	IN `endereco` VARCHAR(50),
	IN `bairro` VARCHAR(90),
	IN `cidade` VARCHAR(100),
	IN `cep` VARCHAR(20),
	IN `uf` VARCHAR(2)
)
BEGIN

insert into cliente values (id,nome,dataNascimento,cpf,telefone,email,endereco,bairro,cidade,cep,uf);

END//
DELIMITER ;

-- Copiando estrutura para tabela supermercado.itens_venda
DROP TABLE IF EXISTS `itens_venda`;
CREATE TABLE IF NOT EXISTS `itens_venda` (
  `VENDA_idVenda` int NOT NULL,
  `PRODUTO_idProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`VENDA_idVenda`,`PRODUTO_idProduto`),
  KEY `fk_VENDA_has_PRODUTO_PRODUTO1_idx` (`PRODUTO_idProduto`),
  KEY `fk_VENDA_has_PRODUTO_VENDA1_idx` (`VENDA_idVenda`),
  CONSTRAINT `fk_VENDA_has_PRODUTO_PRODUTO1` FOREIGN KEY (`PRODUTO_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `fk_VENDA_has_PRODUTO_VENDA1` FOREIGN KEY (`VENDA_idVenda`) REFERENCES `venda` (`idVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.itens_venda: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT INTO `itens_venda` (`VENDA_idVenda`, `PRODUTO_idProduto`, `quantidade`) VALUES
	(1, 3, 10),
	(3, 5, 5),
	(4, 6, 50);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;

-- Copiando estrutura para procedure supermercado.listaTabelas
DROP PROCEDURE IF EXISTS `listaTabelas`;
DELIMITER //
CREATE PROCEDURE `listaTabelas`(
	IN `escolha` INT
)
BEGIN

if(escolha = 1 )
   then SELECT * FROM cliente ORDER BY cliente.nome;
   ELSE if (escolha = 2)
      then SELECT * FROM marca ORDER BY marca.nome;
      ELSE if ( escolha = 3)
         then SELECT * FROM produto ORDER BY produto.nome;
             ELSE if ( escolha = 4)
                then SELECT * FROM funcionario ORDER BY funcionario.nome;
                  ELSE SELECT "escolha inválida" AS erro;
            END if;
         END if;
      END if;
	END if;

END//
DELIMITER ;

-- Copiando estrutura para tabela supermercado.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.marca: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idMarca`, `nome`) VALUES
	(1, ' Mondelez'),
	(2, 'Dr. Pepper Snapple'),
	(4, 'Nestle'),
	(3, 'Panco');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `validade` date NOT NULL,
  `descrição` varchar(200) DEFAULT NULL,
  `preco` float NOT NULL,
  `quantidadeEposicao` int NOT NULL,
  `MARCA_idMarca` int NOT NULL,
  PRIMARY KEY (`idProduto`,`MARCA_idMarca`),
  KEY `fk_PRODUTO_MARCA_idx` (`MARCA_idMarca`),
  CONSTRAINT `fk_PRODUTO_MARCA` FOREIGN KEY (`MARCA_idMarca`) REFERENCES `marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.produto: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idProduto`, `nome`, `validade`, `descrição`, `preco`, `quantidadeEposicao`, `MARCA_idMarca`) VALUES
	(1, 'Arroz', '2022-07-06', NULL, 12.5, 200, 1),
	(2, 'Feijão', '2022-08-06', NULL, 15.8, 300, 2),
	(3, 'Açúcar', '2023-07-12', NULL, 17.8, 390, 1),
	(4, 'Biscoitos', '2021-10-06', NULL, 8.6, 50, 3),
	(5, 'Detergente', '2024-07-06', NULL, 5.9, 495, 2),
	(6, 'Iogurte', '2021-11-04', NULL, 2.5, 550, 4),
	(15, 'Café', '2022-07-09', NULL, 9.9, 500, 1),
	(16, 'Pão de sal', '2021-11-09', NULL, 10.5, 150, 3),
	(17, 'Refrigerante', '2022-01-12', NULL, 8.7, 850, 4),
	(18, 'Suco', '2022-12-19', NULL, 1.5, 1000, 2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.produto_fornecedor
DROP TABLE IF EXISTS `produto_fornecedor`;
CREATE TABLE IF NOT EXISTS `produto_fornecedor` (
  `FORNECEDOR_idFornecedor` int NOT NULL,
  `PRODUTO_idProduto` int NOT NULL,
  PRIMARY KEY (`FORNECEDOR_idFornecedor`,`PRODUTO_idProduto`),
  KEY `fk_FORNECEDOR_has_PRODUTO_PRODUTO1_idx` (`PRODUTO_idProduto`),
  KEY `fk_FORNECEDOR_has_PRODUTO_FORNECEDOR1_idx` (`FORNECEDOR_idFornecedor`),
  CONSTRAINT `fk_FORNECEDOR_has_PRODUTO_FORNECEDOR1` FOREIGN KEY (`FORNECEDOR_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_FORNECEDOR_has_PRODUTO_PRODUTO1` FOREIGN KEY (`PRODUTO_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.produto_fornecedor: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` (`FORNECEDOR_idFornecedor`, `PRODUTO_idProduto`) VALUES
	(1, 1),
	(2, 2),
	(2, 3),
	(1, 4),
	(2, 5),
	(1, 6);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;

-- Copiando estrutura para tabela supermercado.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `idVenda` int NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `formaPagamento` enum('Dinheiro','Cheque','Cartão de crédito','Cartão de débito','PIX') NOT NULL,
  `FUNCIONARIO_idFuncionario` int NOT NULL,
  `CLIENTE_idCliente` int NOT NULL,
  PRIMARY KEY (`idVenda`,`FUNCIONARIO_idFuncionario`,`CLIENTE_idCliente`),
  KEY `fk_VENDA_FUNCIONARIO1_idx` (`FUNCIONARIO_idFuncionario`),
  KEY `fk_VENDA_CLIENTE1_idx` (`CLIENTE_idCliente`),
  CONSTRAINT `fk_VENDA_CLIENTE1` FOREIGN KEY (`CLIENTE_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_VENDA_FUNCIONARIO1` FOREIGN KEY (`FUNCIONARIO_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela supermercado.venda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`idVenda`, `data`, `formaPagamento`, `FUNCIONARIO_idFuncionario`, `CLIENTE_idCliente`) VALUES
	(1, '2021-07-06 13:57:12', 'Dinheiro', 1, 2),
	(2, '2021-07-06 13:58:12', 'Cartão de crédito', 2, 1),
	(3, '2021-07-06 13:58:33', 'PIX', 1, 1),
	(4, '2021-07-06 13:58:48', 'Cartão de débito', 2, 2);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Copiando estrutura para trigger supermercado.baixaProduto
DROP TRIGGER IF EXISTS `baixaProduto`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `baixaProduto` BEFORE INSERT ON `itens_venda` FOR EACH ROW BEGIN

UPDATE Produto SET produto.quantidadeEposicao = produto.quantidadeEposicao - NEW.quantidade
WHERE idProduto = NEW.PRODUTO_idProduto;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger supermercado.itens_venda_after_delete
DROP TRIGGER IF EXISTS `itens_venda_after_delete`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `itens_venda_after_delete` AFTER DELETE ON `itens_venda` FOR EACH ROW BEGIN

UPDATE Produto SET produto.quantidadeEposicao = produto.quantidadeEposicao + OLD.quantidade
WHERE idProduto = OLD.PRODUTO_idProduto;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
