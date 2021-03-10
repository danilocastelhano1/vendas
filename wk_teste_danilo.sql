/*
 Navicat Premium Data Transfer

 Source Server         : Test
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 192.168.0.123:3306
 Source Schema         : wk_teste_danilo

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 10/03/2021 17:52:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `Codigo` int(255) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Cidade` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `UF` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Danilo', 'Lençóis Paulista', 'SP');
INSERT INTO `clientes` VALUES (2, 'Maria', 'Bauru', 'SP');
INSERT INTO `clientes` VALUES (3, 'João', 'São Paulo', 'SP');
INSERT INTO `clientes` VALUES (4, 'Valentim', 'São Paulo', 'SP');
INSERT INTO `clientes` VALUES (5, 'Milene', 'Cascavel', 'PR');
INSERT INTO `clientes` VALUES (6, 'Ícaro', 'Manaus', 'AM');
INSERT INTO `clientes` VALUES (7, 'Lourenço ', 'Campinas', 'SP');
INSERT INTO `clientes` VALUES (8, 'Florbela ', 'Jau', 'SP');
INSERT INTO `clientes` VALUES (9, 'Lídia ', 'Pato Branco', 'PR');
INSERT INTO `clientes` VALUES (10, 'Kennedy ', 'Curitiba', 'PR');
INSERT INTO `clientes` VALUES (11, 'Karen ', 'Belo Horizonte', 'MG');
INSERT INTO `clientes` VALUES (12, 'Clarinha ', 'Monte Mor', 'SP');
INSERT INTO `clientes` VALUES (13, 'Cristiano ', 'São Roque', 'SP');
INSERT INTO `clientes` VALUES (14, 'Rodney ', 'Bauru', 'SP');
INSERT INTO `clientes` VALUES (15, 'Amaro ', 'Bauru', 'SP');
INSERT INTO `clientes` VALUES (16, 'Patrícia ', 'Sorocab', 'SP');
INSERT INTO `clientes` VALUES (17, 'Rafaela ', 'Aparecida', 'SP');
INSERT INTO `clientes` VALUES (18, 'Kévin ', 'Niterói', 'RJ');
INSERT INTO `clientes` VALUES (19, 'Mayara ', 'Petropolis', 'RJ');
INSERT INTO `clientes` VALUES (20, 'Natanael ', 'São Caetano', 'SP');

-- ----------------------------
-- Table structure for produtos
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos`  (
  `Codigo` int(255) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `PrVenda` decimal(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES (1, 'Coca Cola Lata', 2.99);
INSERT INTO `produtos` VALUES (2, 'Coca Cola 2Lts', 6.99);
INSERT INTO `produtos` VALUES (3, 'Cerveja Lata', 1.99);
INSERT INTO `produtos` VALUES (4, 'Cerveja Long Neck', 4.99);
INSERT INTO `produtos` VALUES (5, 'Cerveja 600ml', 5.49);
INSERT INTO `produtos` VALUES (6, 'Suco Caixinha', 4.25);
INSERT INTO `produtos` VALUES (7, 'Tang Caju', 0.99);
INSERT INTO `produtos` VALUES (8, 'Bisnaguinhas', 5.59);
INSERT INTO `produtos` VALUES (9, 'Sabão em Pó', 8.63);
INSERT INTO `produtos` VALUES (10, 'Amaciante', 12.49);
INSERT INTO `produtos` VALUES (11, 'Manteiga', 4.22);
INSERT INTO `produtos` VALUES (12, 'Margarina', 4.59);
INSERT INTO `produtos` VALUES (13, 'Requeijão', 5.30);
INSERT INTO `produtos` VALUES (14, 'Papel Higiênico', 12.90);
INSERT INTO `produtos` VALUES (15, 'Macarrão', 8.41);
INSERT INTO `produtos` VALUES (16, 'Molho de Tomate', 1.99);
INSERT INTO `produtos` VALUES (17, 'Alvejante', 2.99);
INSERT INTO `produtos` VALUES (18, 'Detergente', 1.49);
INSERT INTO `produtos` VALUES (19, 'Biscoito', 0.59);
INSERT INTO `produtos` VALUES (20, 'Salgadinhos', 7.00);

-- ----------------------------
-- Table structure for venda
-- ----------------------------
DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda`  (
  `NumPed` int(255) NOT NULL AUTO_INCREMENT,
  `CodCli` int(255) NULL DEFAULT NULL,
  `NomeCli` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DtEmissao` datetime(0) NULL DEFAULT NULL,
  `VlrTotal` float(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`NumPed`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venda
-- ----------------------------

-- ----------------------------
-- Table structure for venda_item
-- ----------------------------
DROP TABLE IF EXISTS `venda_item`;
CREATE TABLE `venda_item`  (
  `Chave` int(11) NOT NULL AUTO_INCREMENT,
  `NumPed` int(11) NOT NULL,
  `CodProd` int(11) NOT NULL,
  `DescrProd` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Qtde` decimal(12, 2) NULL DEFAULT NULL,
  `Unitario` decimal(12, 2) NULL DEFAULT NULL,
  `Total` decimal(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`Chave`) USING BTREE,
  INDEX `CodProd`(`CodProd`) USING BTREE,
  INDEX `NumPed`(`NumPed`) USING BTREE,
  CONSTRAINT `CodProd` FOREIGN KEY (`CodProd`) REFERENCES `produtos` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NumPed` FOREIGN KEY (`NumPed`) REFERENCES `venda` (`NumPed`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of venda_item
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
