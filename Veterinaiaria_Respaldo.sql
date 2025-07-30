CREATE DATABASE  IF NOT EXISTS `veterinaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `veterinaria`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinaria
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_mascota` int DEFAULT NULL,
  `id_veterinario` int DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascotas` (`id_mascota`),
  CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,'2025-12-23','10:00:00',1,2,'Vacunación anual'),(2,'2025-07-16','11:00:00',2,5,'Esterilización'),(3,'2025-07-17','10:30:00',3,2,'Revisión general'),(4,'2025-07-22','09:30:00',1,1,'Cirugia'),(5,'2025-07-23','09:30:00',5,3,'Cirugia'),(6,'2025-07-31','11:00:00',6,3,'Castración'),(7,'2025-08-14','16:20:00',7,1,'Desparacitación'),(8,'2025-08-20','18:10:00',8,2,'Control Medico'),(9,'2025-08-10','13:50:00',9,1,'Lavado de estomago'),(10,'2025-09-01','17:15:00',10,3,'Empacho'),(11,'2025-08-03','12:30:00',11,1,'Gastritis por Helicobacter'),(12,'2025-09-07','08:00:00',12,3,'Perdida del apetito'),(13,'2025-07-01','13:30:00',13,2,'Problemas urinarios'),(14,'2025-07-01','09:15:00',14,2,'Calicivirus felino'),(15,'2025-07-02','10:00:00',15,3,'Vacunación'),(16,'2025-08-16','16:00:00',16,2,'Infección Estomacal'),(17,'2025-07-05','13:45:00',17,1,'Desparacitación'),(18,'2025-07-06','15:20:00',18,1,'Problemas de piel'),(19,'2025-07-03','11:28:00',19,3,'Cirugia'),(20,'2025-08-09','17:15:00',20,3,'Revision general'),(21,'2025-07-24','12:00:00',21,2,'Vacuna');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dueños`
--

DROP TABLE IF EXISTS `dueños`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dueños` (
  `id_dueño` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_dueño`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueños`
--

LOCK TABLES `dueños` WRITE;
/*!40000 ALTER TABLE `dueños` DISABLE KEYS */;
INSERT INTO `dueños` VALUES (1,'Juan Pérez','Calle 5 #123, Centro','5551234567','JuanPerez78@gmail.com'),(2,'María Jimenez','Av. Reforma #456','5559876543','marijim_34@gmail.com'),(3,'Carlos Gómez','Calle Morelos #789','5553456789','CarGom12@gmail.com'),(4,'Adrian Gonzalez Valentin','panoramica del fortin','9512162996','adri_an_04@hotmail.com'),(5,'Antonio Perez Ruiz','Colonia Reforrma #602','9519753014','Anto.Perez_98@gmail.com'),(6,'Fernanda Gonzalez','Callejon Benito Juarez #620','9517259463','Fernanchus12_Gon@gmail.com'),(7,'Roberto Martinez Rodriguez','Colonia Jardin #120','9510936286','RobertoMarti_Rodri@gmail.com'),(8,'Martin Arriaga Ruiz','Paraje Los Pinos #943','9512631203','MartinArriaga_Ruiz@gmail.com'),(9,'Ximena Zarate Martinez','Privada Niños Heroes #731','9510183501','Xime12_Marti@hotmail.com'),(10,'Emilio Jose Andreu','Emiliano Zapata #201','9516482160','Emilio.23Jose@gmail.com'),(11,'Pedro Vargas Torres','San Jose #326','9511379263','Pedro_VarTor@gmail.com'),(12,'Adelina','Conocido','43524343143114','adnieto.tecnm@gmail.com');
/*!40000 ALTER TABLE `dueños` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  `id_tipo_empleado` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_tipo_empleado` (`id_tipo_empleado`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_tipo_empleado`) REFERENCES `tipos_empleado` (`id_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Marco Antonio','Jiménez Juárez','9514147400','Antonio de León #705, Col. Candiani','marcojimenezjuarez@gmail.com','Gracioso','',1),(2,'Carlos','Pérez Ramírez','5552345678','Consultorio 1','carlos.perez@veterinaria.com','Electriciti','Cirugía',2),(3,'Laura','Gómez Díaz','5553456789','Recepción','laura.gomez@veterinaria.com','Silencio',NULL,4),(4,'Jorge','López Medina','5554567890','Área de recuperación','jorge.lopez@veterinaria.com','Todobaboso',NULL,3),(5,'Luis','Herrera Flores','5555678901','Consultorio 2','luis.herrera@veterinaria.com','babuino','Medicina general',2),(16,'Adrian','Gonzalez Valentin','9512162996','panoramica del fortin','adri_an_04@hotmail.com','cocodriloS1',NULL,1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(30) DEFAULT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id_dueño` int DEFAULT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `id_dueño` (`id_dueño`),
  CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_dueño`) REFERENCES `dueños` (`id_dueño`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Firulais','Perro','Labrador',5,1),(2,'Michi','Gato','Siames',3,2),(3,'Rocky','Perro','Pitbull',2,3),(4,'Nina','Perro','Chihuahua',4,2),(5,'Princesa','Perro','pitbull',2,4),(6,'Kazumi','Perro','Chihuahua',5,4),(7,'Mico','Perro','Pomerania',5,5),(8,'Rudy','Perro','Doberman',13,4),(9,'Cheems','Perro','Shiba inu',1,1),(10,'SImba','Cuy','Inti',2,3),(11,'Huranio','Hurón','Canela',6,6),(12,'Tambor','Conejo','Mini Lop',5,6),(13,'Pelusa','Gato','Ragdoll',3,8),(14,'Luna','Gato','Korat',3,9),(15,'Zoe','Perro','Poodle',1,10),(16,'Toby','Perro','Sabueso',2,7),(17,'Felix','Gato','Siamés',4,10),(18,'Sam','Hurón','Albino',1,11),(19,'Canelo','Hurón','Canela',2,11),(20,'Kitty','Gato','escocés',2,4),(21,'Chiquis','Perro','snauser',11,12);
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_empleado`
--

DROP TABLE IF EXISTS `tipos_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_empleado` (
  `id_tipo_empleado` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_empleado`
--

LOCK TABLES `tipos_empleado` WRITE;
/*!40000 ALTER TABLE `tipos_empleado` DISABLE KEYS */;
INSERT INTO `tipos_empleado` VALUES (1,'Administrador'),(2,'Veterinario'),(3,'Asistente'),(4,'Recepcionista'),(5,'Cajero');
/*!40000 ALTER TABLE `tipos_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamientos`
--

DROP TABLE IF EXISTS `tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamientos` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `costo` decimal(8,2) DEFAULT NULL,
  `id_cita` int DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_cita` (`id_cita`),
  CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY (`id_cita`) REFERENCES `citas` (`id_cita`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamientos`
--

LOCK TABLES `tratamientos` WRITE;
/*!40000 ALTER TABLE `tratamientos` DISABLE KEYS */;
INSERT INTO `tratamientos` VALUES (1,'Vacuna antirrabia',250.00,1),(2,'Cirugía de esterilización',1200.00,2),(4,'Cirugia',1500.00,3),(9,'Cirugia',1200.00,5),(10,'Castración',350.00,6),(11,'Desparacitación',500.00,7),(12,'Control Medico',800.00,8),(13,'Lavado de estomago',1000.00,9),(14,'Empacho',250.00,10),(15,'Gastritis por Helicobacter',250.00,11),(16,'Perdida del Apetito',300.00,12),(17,'Problemas urinarios',450.00,13),(18,'Calicivirus felino',500.00,14),(19,'Vacunación',200.00,15),(20,'Infección Estomacal',200.00,16),(21,'Desparacitación',150.00,17),(22,'Problemas de Piel',300.00,18),(23,'Cirugia',500.00,19),(24,'Revision general',200.00,20),(25,'Vacuna',200.00,21);
/*!40000 ALTER TABLE `tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'veterinaria'
--

--
-- Dumping routines for database 'veterinaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 19:28:25
