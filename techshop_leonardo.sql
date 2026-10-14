-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: techshop
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Periféricos e Conectividade'),(2,'Áudio e Vídeo'),(3,'Componentes e Mobiliário');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Leonardo Luis','leo@gmail.com','02087456880'),(2,'shampoo','shampo@email.com','58489632540'),(3,'lok','lok@arroba.com','32565474190');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente` varchar(100) NOT NULL,
  `cliente_email` varchar(100) DEFAULT NULL,
  `produtos` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `produtos_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `produtos_id` (`produtos_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Joao Reis','joao@mail.com','SSD','Perifericos',NULL,NULL,NULL,NULL),(2,'Carla Dias','carla@mail.com','Headset','Audio',NULL,NULL,NULL,NULL),(3,'Joao Reis','joao@mail.com','Webcam','Perifericos',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int DEFAULT '0',
  `ativo` tinyint(1) DEFAULT '1',
  `categorias_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorias_id` (`categorias_id`),
  KEY `idx_produtos_nome` (`nome`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Mouser Gamer','Mouse com 6 botoes',129.90,35,1,1),(2,'Teclado Mecanico','Teclado RGB switch blue',249.90,20,1,1),(3,'Monitor Ultrawide','Monitor 29 polegadas Full HD 75Hz',1199.00,12,1,2),(4,'Headset Sem Fio','Headset com som surround 7.1',389.50,15,1,2),(5,'Webcam Full HD','Webcam 1080p com microfone embutido',189.90,50,1,1),(6,'SSd NVMe 1TB','SSD M.2 leitura ate 3500MB/s',495.00,37,1,3),(7,'Cadeira Gamer','Cadeira ergonomica com apoio de breaco 3D',899.90,8,1,3),(8,'Hub USB-C','Hub 7 em 1 com porta HDMI e leitores de cartao',159.00,25,1,1),(9,'Microfone Condesador','Microfone USB para streaming com pop filter',279.90,18,1,2),(10,'SSD 480GB','SSd SATA de 480GB',289.90,40,1,3),(11,'Mousepad Extra Grande','Mousepad Speed 900x400mm com bordas costuradas',79.90,30,1,1),(12,'Memória RAM 16GB','Memória DDR4 3200MHz com dissipador de calor',289.90,22,1,3),(14,'Fonte 650W 80 Plus','Fonte de alimentacao modular para PC gamer',349.90,10,1,3);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-13 23:40:16
