-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mobileapp
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL,
  `food_name` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `catagori` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (102,'Burger',300,'Burger',70,'burger.jpg'),(103,'Mini_Pizza',150,'Pizza',90,'pizza-1.jpg'),(111,'4pc Chicken fry',589,'Chicken',90,'chicken.jpg'),(201,'1pc Hot & Crispy Chicken',159,'Chicken',50,'c1.jpg'),(202,'2pc Hot & Crispy Chicken',299,'Chicken',80,'ch2.jpg'),(203,'2pc Smoky Red Chicken',299,'Chicken',100,'ch2.jpg'),(204,'4pc SmokyRed Chicken',589,'Chicken',100,'4psrc.png'),(301,'BBQ Temptation Pan',439,'Pizza',40,'pizza1.jpg'),(302,'Chicken Classic Pan Pizza',439,'Pizza',50,'p3.jpg'),(303,'Beef Lovers Pan Pizza',389,'Pizza',20,'pizza22.jpg'),(401,'Classic Zinger',319,'Burger',40,'classicZ.jpg'),(402,'Texas BBQ Zinger',399,'Burger',50,'texasBBq.jpg'),(403,'Super Charger Burger',289,'Burger',60,'supercb.jpg'),(404,'Moroccan Zinger',399,'Burger',100,'moroccanZ.jpg'),(809,'Fanta',50,'Beverage',400,'fanta.png'),(977,'CocaCola123',100,'Beverage',300,'cocac.jpg'),(1020,'Pepsi 500ml',60,'Beverage',400,'pepsi.jpg'),(1099,'Water',20,'Beverage',700,'mum.jpg');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-19 12:52:27
