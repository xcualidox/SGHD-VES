<<<<<<< Updated upstream
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 17, 2024 at 12:32 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

=======
-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------
>>>>>>> Stashed changes

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

<<<<<<< Updated upstream
--
-- Database: `proyecto`
--

CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Table structure for table `ano_escolar`
--

CREATE TABLE `ano_escolar` (
  `codigo` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ano_escolar`
--
=======

-- Dumping database structure for proyecto
CREATE DATABASE IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto`;

-- Dumping structure for table proyecto.ano_escolar
CREATE TABLE IF NOT EXISTS `ano_escolar` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `fecha_inicio` (`fecha_inicio`,`fecha_fin`),
  UNIQUE KEY `nombre_2` (`nombre`,`fecha_inicio`,`fecha_fin`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.ano_escolar: ~1 rows (approximately)
INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
	(18, '2024', '2024-09-12', '2024-09-13');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `ano_seccion`
--

CREATE TABLE `ano_seccion` (
  `codigo` int NOT NULL,
  `ano` varchar(4) NOT NULL,
  `seccion` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ano_seccion`
--
=======
-- Dumping structure for table proyecto.ano_seccion
CREATE TABLE IF NOT EXISTS `ano_seccion` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `ano` varchar(4) NOT NULL,
  `seccion` varchar(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.ano_seccion: ~4 rows (approximately)
INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`) VALUES
	(18, '1ero', 'A'),
	(19, '2do', 'B'),
	(20, '5to', 'C'),
	(21, '4to', 'C');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `asignatura`
--

CREATE TABLE `asignatura` (
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asignatura`
--

=======
-- Dumping structure for table proyecto.asignatura
CREATE TABLE IF NOT EXISTS `asignatura` (
  `codigo` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table proyecto.asignatura: ~14 rows (approximately)
>>>>>>> Stashed changes
INSERT INTO `asignatura` (`codigo`, `nombre`) VALUES
	('AP', 'ARTE Y PATRIMONIO'),
	('BI', 'BIOLOGIA'),
	('CA', 'CASTELLANO'),
	('CT', 'CIENCIAS DE LA TIERRA '),
	('CN', 'CIENCIAS NATURALES'),
	('EF', 'EDUCACION FISICA'),
	('FI', 'FÍSICA'),
	('FSN', 'FORMACIÓN PARA LA SOBERANIA NACIONAL'),
	('GHC', 'GEOGRAFÍA, HISTORIA Y CIUDADANÍA '),
	('ILE', 'INGLÉS Y OTRAS LENGUAS EXTRANJERAS'),
	('MA', 'MATEMATICA'),
	('OC', 'ORIENTACIÓN Y CONVIVENCIA'),
	('PGCRP', 'PARTICIPACION  EN GRUPOS DE CREACIÓN, RECREACIÓN Y PRODUCCIÓN  '),
	('QU', 'QUIMICA');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `aula`
--

CREATE TABLE `aula` (
  `codigo` int NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `disponibilidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aula`
--
=======
-- Dumping structure for table proyecto.aula
CREATE TABLE IF NOT EXISTS `aula` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `disponibilidad` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `disponibilidad` (`disponibilidad`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.aula: ~2 rows (approximately)
INSERT INTO `aula` (`codigo`, `nombre`, `descripcion`, `disponibilidad`) VALUES
	(25, 'Aula 1', 'se encuentra cuando lo buscas', 1),
	(26, 'Aula 2', 'sexo tilin\nBiologia', 1);

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cedula` bigint NOT NULL,
  `type` enum('login','error','eliminar','actualizar','insertar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `description` text COLLATE utf8mb3_spanish_ci NOT NULL,
  `user_computer` varchar(45) COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `bitacora`
--
=======
-- Dumping structure for table proyecto.bitacora
CREATE TABLE IF NOT EXISTS `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cedula` bigint NOT NULL,
  `type` enum('login','error','eliminar','actualizar','insertar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `user_computer` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.bitacora: ~4 rows (approximately)
INSERT INTO `bitacora` (`id`, `fecha_hora`, `cedula`, `type`, `description`, `user_computer`) VALUES
<<<<<<< Updated upstream
(1, '2024-07-16 20:22:23', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36'),
(2, '2024-07-16 20:23:43', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36');

-- --------------------------------------------------------

--
-- Table structure for table `dias_semana`
--

CREATE TABLE `dias_semana` (
=======
	(1, '2024-07-16 20:22:23', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36'),
	(2, '2024-07-16 20:23:43', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36'),
	(3, '2024-08-24 11:41:17', 19282324, 'login', '19282324 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
	(4, '2024-08-24 11:42:26', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU');

-- Dumping structure for table proyecto.dias_semana
CREATE TABLE IF NOT EXISTS `dias_semana` (
>>>>>>> Stashed changes
  `codigo` int NOT NULL,
  `dia` varchar(9) NOT NULL,
  KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
--
-- Dumping data for table `dias_semana`
--

=======
-- Dumping data for table proyecto.dias_semana: ~7 rows (approximately)
>>>>>>> Stashed changes
INSERT INTO `dias_semana` (`codigo`, `dia`) VALUES
	(1, 'Lunes'),
	(2, 'Martes'),
	(3, 'Miercoles'),
	(4, 'Jueves'),
	(5, 'Viernes'),
	(6, 'Sabado'),
	(7, 'Domingo');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `disponibilidad`
--

CREATE TABLE `disponibilidad` (
=======
-- Dumping structure for table proyecto.disponibilidad
CREATE TABLE IF NOT EXISTS `disponibilidad` (
>>>>>>> Stashed changes
  `codigo_id` int NOT NULL,
  `disponible` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
--
-- Dumping data for table `disponibilidad`
--

=======
-- Dumping data for table proyecto.disponibilidad: ~2 rows (approximately)
>>>>>>> Stashed changes
INSERT INTO `disponibilidad` (`codigo_id`, `disponible`) VALUES
	(0, 'No disponible'),
	(1, 'Disponible');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `horario_estudiante`
--

CREATE TABLE `horario_estudiante` (
  `codigo` int NOT NULL,
=======
-- Dumping structure for table proyecto.horario_estudiante
CREATE TABLE IF NOT EXISTS `horario_estudiante` (
  `codigo` int NOT NULL AUTO_INCREMENT,
>>>>>>> Stashed changes
  `codigo_a_escolar` int NOT NULL,
  `codigo_a_y_seccion` int NOT NULL,
  `codigo_asignatura` varchar(3) NOT NULL,
  `codigo_aula` int NOT NULL,
  `codigo_dia` varchar(5) NOT NULL,
  `grupo` varchar(2) NOT NULL,
<<<<<<< Updated upstream
  `profesor` varchar(40) NOT NULL,
  `intervalo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario_estudiante`
--
=======
  `profesor` bigint NOT NULL DEFAULT '0',
  `intervalo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_a_escolar` (`codigo_a_escolar`,`codigo_a_y_seccion`,`codigo_asignatura`,`codigo_aula`,`codigo_dia`),
  KEY `FK_horario_estudiante_personas` (`profesor`),
  CONSTRAINT `FK_horario_estudiante_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.horario_estudiante: ~2 rows (approximately)
INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`) VALUES
	(2, 18, 18, 'CT', 25, 'B1L', ' ', 19282340, 1),
	(3, 18, 18, 'CN', 25, 'B2L', ' ', 19282340, 1);

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `intervalo`
--

CREATE TABLE `intervalo` (
  `id` int NOT NULL,
  `intervalo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `intervalo`
--
=======
-- Dumping structure for table proyecto.intervalo
CREATE TABLE IF NOT EXISTS `intervalo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intervalo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.intervalo: 3 rows
/*!40000 ALTER TABLE `intervalo` DISABLE KEYS */;
INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
	(1, '40', 1),
	(2, '30', 0),
	(3, '50', 0);
/*!40000 ALTER TABLE `intervalo` ENABLE KEYS */;

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
=======
-- Dumping structure for table proyecto.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int NOT NULL AUTO_INCREMENT,
>>>>>>> Stashed changes
  `username` bigint NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
<<<<<<< Updated upstream
  `status` enum('active','inactive','new') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `login`
--
=======
  `status` enum('active','inactive','new') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'new',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `login_personas` FOREIGN KEY (`username`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.login: ~6 rows (approximately)
INSERT INTO `login` (`id`, `username`, `password`, `security_q_1`, `security_q_2`, `security_q_3`, `security_a_1`, `security_a_2`, `security_a_3`, `rol`, `status`) VALUES
<<<<<<< Updated upstream
(1, 27937454, '$2y$10$6LLM81Qpo8Qw/L0rwpv1l.VxzCx/S7ZqJe9w59OgUNPKF3HG6hm9.', '¿Cual es su color favorito?', '¿Cual es su comida favorita?', '¿Cual es su profesor favorito?', '$2y$10$1GL.mOB.jL29suGg74KlB.9p8A3xAghxojfPqVLBz3aAojnEg9M7q', '$2y$10$./BBNq3pjZwy1iFUtFqI.ORBaBRUlZOa/PwJMZHSMWnDejqnQM2y.', '$2y$10$ELm2TJjZOafp9clMgefI.uop22LG8yYN44ag13b.au9W/2xP3bFQW', 'master', 'active'),
(2, 8708088, '$2y$10$KUS.kZOop8H0.zCw0ZRITOgGKnrO8OU68PZy3RMXKM4bJAxcyBq9i', '', '', '', '', '', '', 'admin', 'active'),
(3, 26937454, '$2y$10$.0H6AyBzzc7kNetE99vB7uC3WHG/mNB/0nrq15m.82XPssDBhM9G.', '', '', '', '', '', '', 'profesor', 'new'),
(4, 27414644, '$2y$10$2LdbHmQeaN5.amJ86/gQFeZAK9Mb6fdZ2.bDZkqM9kWv5/1mXjERi', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$nmlXTunPzLLb5VrsRBZ7y.rr.RO0rAhszWg.H5HQP4ORBeAwyO7X2', '$2y$10$yv6lnXbkvRPxsW/GjqWWmulj1wAxhfgHzb6n7SUciFngJWVbdCA6C', '$2y$10$PwpOMuTvWGFmKcVGwW41He90ksoCzKG6DyT0kCJo7WveqSBxBOoIi', 'profesor', 'active'),
(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `id` int NOT NULL,
  `cedula` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id`, `cedula`, `nombres`, `apellidos`, `direccion`, `telefono`,`correo`) VALUES
(4, '11716900', 'JOHN ENMANUEL', 'RAMIREZ VALERO', 'Enrique Segoviano','+584169919122','cojggeo@equisde.com'),
(5, '27564672', 'NIRETCIA INMACULADA','RAMIREZ VALERO', 'Venezuela, Portuguesa, Guanare Urbanizacion la Verguisa entre la calle 13 y 2 , casa numero 10','04161234567', 'equisde@gmail.com'),
(7, '332323', 'DSFDSF', 'DSFDS', '.....................................................................................................................................................', '02556623425', 'test@test.test'),
(8, '123', 'D', 'D','Direksion','04246646364','lol@lol.com');

-- --------------------------------------------------------

--
-- Table structure for table `preguntas_seguridad`
--

CREATE TABLE `preguntas_seguridad` (
  `id` int NOT NULL,
  `pregunta` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `preguntas_seguridad`
--
=======
	(2, 11716900, '$2y$10$KUS.kZOop8H0.zCw0ZRITOgGKnrO8OU68PZy3RMXKM4bJAxcyBq9i', '', '', '', '', '', '', 'admin', 'active'),
	(3, 27414575, '$2y$10$.0H6AyBzzc7kNetE99vB7uC3WHG/mNB/0nrq15m.82XPssDBhM9G.', '', '', '', '', '', '', 'profesor', 'new'),
	(4, 27564672, '$2y$10$2LdbHmQeaN5.amJ86/gQFeZAK9Mb6fdZ2.bDZkqM9kWv5/1mXjERi', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$nmlXTunPzLLb5VrsRBZ7y.rr.RO0rAhszWg.H5HQP4ORBeAwyO7X2', '$2y$10$yv6lnXbkvRPxsW/GjqWWmulj1wAxhfgHzb6n7SUciFngJWVbdCA6C', '$2y$10$PwpOMuTvWGFmKcVGwW41He90ksoCzKG6DyT0kCJo7WveqSBxBOoIi', 'profesor', 'active'),
	(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active'),
	(7, 19282340, '$2y$10$moo9yxZLhEx/2nm8hm.4y.CYC6HTptlepQFJVvhWDDhrUAoCJnkwW', '¿Cuál es el nombre de tu escuela primaria?', '¿Cuál es el nombre de tu primera mascota?', '¿En qué ciudad naciste?', '$2y$10$.74Lk2GGk0wg.YfrqkhzA.Uy8WBuq/YVHEvm2YWY0uXOkLW4649tO', '$2y$10$sXMNpg.hK0t9yg1ZZzhif.SG.GzVSN7WkR6HJi6mCvAePrGOSYzPi', '$2y$10$0g4l.tzDZwQ3potE6fDBTukJdn0UO6nl1jSw4Y2GkdVPVv1deS5qm', 'profesor', 'active'),
	(9, 5656, '$2y$10$XnKkMjz3oQcmQ1vv2Vjga.iGB8bO7165A5pV87kcP/nZsvjAgZ3Zm', '', '', '', '', '', '', 'administrador', 'new');

-- Dumping structure for table proyecto.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `cedula` bigint NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Dumping data for table proyecto.personas: ~6 rows (approximately)
INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo`) VALUES
	(5656, 'FASD', 'MENDEZ', 'VENEZUELA, PORTUGUESA, GUANARE URBANIZACION LA VERGUISA ENTFRE LA CALLE 13 Y 2 , CASA NUMERO 10', '04122696463', 'equisde@gmail.com'),
	(11716900, 'JOHN ENMANUEL', 'RAMIREZ VALERO', 'Enrique Segoviano', '+584169919122', 'cojggeo@equisde.com'),
	(19282340, 'FASDFUNCIONO', 'FASDFUNCIONO', 'FASD', '04122696463', 'equisde@gmail.com'),
	(27414575, 'ASDAS', 'ADASDAS', 'DIREKSION', '04246646364', 'lol@lol.com'),
	(27564672, 'NIRETCIA INMACULADA', 'RAMIREZ VALERO', 'Venezuela, Portuguesa, Guanare Urbanizacion la Verguisa entre la calle 13 y 2 , casa numero 10', '04161234567', 'equisde@gmail.com'),
	(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'tuputamadre@puta.com');

-- Dumping structure for table proyecto.preguntas_seguridad
CREATE TABLE IF NOT EXISTS `preguntas_seguridad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.preguntas_seguridad: ~4 rows (approximately)
INSERT INTO `preguntas_seguridad` (`id`, `pregunta`) VALUES
	(1, '¿Como se llama tu mama?'),
	(2, '¿Cuando es tu Cumpleaños?'),
	(3, '¿Te gustan los gatos o perros?'),
	(4, '¿Cual es tu color favorito?');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `profesores_materias`
--

CREATE TABLE `profesores_materias` (
  `id` int NOT NULL,
  `profesor` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `materia` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `profesores_materias`
--
=======
-- Dumping structure for table proyecto.profesores_materias
CREATE TABLE IF NOT EXISTS `profesores_materias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profesor` bigint NOT NULL,
  `materia` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_profesores_materias_personas` (`profesor`),
  CONSTRAINT `FK_profesores_materias_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.profesores_materias: ~1 rows (approximately)
INSERT INTO `profesores_materias` (`id`, `profesor`, `materia`) VALUES
	(13, 19282340, 'CT');

<<<<<<< Updated upstream
-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
=======
-- Dumping structure for table proyecto.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
>>>>>>> Stashed changes
  `cedula` int NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol` int NOT NULL,
  `pregunta_seguridad` int NOT NULL,
  `respuesta` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
<<<<<<< Updated upstream
  `clave` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `usuarios`
--
=======
  `clave` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
>>>>>>> Stashed changes

-- Dumping data for table proyecto.usuarios: 2 rows
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `apellido`, `rol`, `pregunta_seguridad`, `respuesta`, `clave`) VALUES
<<<<<<< Updated upstream
(1, 2023, 'MAESTRO', 'MAESTRO', 2, 1, 'ANGEL2023', 'ANGEL2023'),
(2, 27564672, 'JONATHA', 'RAMIREZ', 0, 1, 'niretcia', '152560loco');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ano_escolar`
--
ALTER TABLE `ano_escolar`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `fecha_inicio` (`fecha_inicio`,`fecha_fin`),
  ADD UNIQUE KEY `nombre_2` (`nombre`,`fecha_inicio`,`fecha_fin`);

--
-- Indexes for table `ano_seccion`
--
ALTER TABLE `ano_seccion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `disponibilidad` (`disponibilidad`);

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dias_semana`
--
ALTER TABLE `dias_semana`
  ADD KEY `codigo` (`codigo`);

--
-- Indexes for table `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`codigo_id`);

--
-- Indexes for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_a_escolar` (`codigo_a_escolar`,`codigo_a_y_seccion`,`codigo_asignatura`,`codigo_aula`,`codigo_dia`);

--
-- Indexes for table `intervalo`
--
ALTER TABLE `intervalo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ano_escolar`
--
ALTER TABLE `ano_escolar`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;
=======
	(1, 2023, 'MAESTRO', 'MAESTRO', 2, 1, 'ANGEL2023', 'ANGEL2023'),
	(2, 27564672, 'JONATHA', 'RAMIREZ', 0, 1, 'niretcia', '152560loco');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
>>>>>>> Stashed changes

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
