-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2024 at 01:08 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

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

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(18, '2024', '2024-09-12', '2024-09-13');

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

INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`) VALUES
(18, '1ero', 'U'),
(19, '2do', 'U'),
(20, '5to', 'U'),
(21, '4to', 'U'),
(22, '3ero', 'U');

-- --------------------------------------------------------

--
-- Table structure for table `asignatura`
--

CREATE TABLE `asignatura` (
  `codigo` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asignatura`
--

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

INSERT INTO `aula` (`codigo`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(25, 'Aula 1', 'se encuentra cuando lo buscasxd', 1),
(26, 'Aula 2', 'sexo tilin\nBiologia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cedula` bigint NOT NULL,
  `type` enum('login','error','eliminar','actualizar','insertar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `user_computer` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `bitacora`
--

INSERT INTO `bitacora` (`id`, `fecha_hora`, `cedula`, `type`, `description`, `user_computer`) VALUES
(1, '2024-07-16 20:22:23', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36'),
(2, '2024-07-16 20:23:43', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-D2HTI36'),
(3, '2024-08-24 11:41:17', 19282324, 'login', '19282324 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(4, '2024-08-24 11:42:26', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(5, '2024-09-04 13:06:37', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(6, '2024-09-05 10:24:46', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(7, '2024-09-06 08:15:57', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(8, '2024-09-07 15:54:05', 29629080, 'login', '29629080 ha ingresado al sistema.', 'ZUHE2-PC');

-- --------------------------------------------------------

--
-- Table structure for table `dias_semana`
--

CREATE TABLE `dias_semana` (
  `codigo` int NOT NULL,
  `dia` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dias_semana`
--

INSERT INTO `dias_semana` (`codigo`, `dia`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Table structure for table `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `codigo_id` int NOT NULL,
  `disponible` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disponibilidad`
--

INSERT INTO `disponibilidad` (`codigo_id`, `disponible`) VALUES
(0, 'No disponible'),
(1, 'Disponible');

-- --------------------------------------------------------

--
-- Table structure for table `horario_estudiante`
--

CREATE TABLE `horario_estudiante` (
  `codigo` int NOT NULL,
  `codigo_a_escolar` int NOT NULL,
  `codigo_a_y_seccion` int NOT NULL,
  `codigo_asignatura` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `codigo_aula` int NOT NULL,
  `codigo_dia` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `grupo` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `profesor` bigint NOT NULL DEFAULT '0',
  `intervalo` int NOT NULL,
  `receso` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`, `receso`) VALUES
(1, 18, 18, 'AP', 25, 'B1J', ' ', 5656, 6, '08:20');

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

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
(7, '45', 0),
(6, '40', 1),
(5, '10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
  `username` bigint NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_2` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_3` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `status` enum('active','inactive','new') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `security_q_1`, `security_q_2`, `security_q_3`, `security_a_1`, `security_a_2`, `security_a_3`, `rol`, `status`) VALUES
(2, 11716900, '$2y$10$KUS.kZOop8H0.zCw0ZRITOgGKnrO8OU68PZy3RMXKM4bJAxcyBq9i', '', '', '', '', '', '', 'admin', 'active'),
(3, 27414575, '$2y$10$.0H6AyBzzc7kNetE99vB7uC3WHG/mNB/0nrq15m.82XPssDBhM9G.', '', '', '', '', '', '', 'profesor', 'new'),
(4, 27564672, '$2y$10$2LdbHmQeaN5.amJ86/gQFeZAK9Mb6fdZ2.bDZkqM9kWv5/1mXjERi', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$nmlXTunPzLLb5VrsRBZ7y.rr.RO0rAhszWg.H5HQP4ORBeAwyO7X2', '$2y$10$yv6lnXbkvRPxsW/GjqWWmulj1wAxhfgHzb6n7SUciFngJWVbdCA6C', '$2y$10$PwpOMuTvWGFmKcVGwW41He90ksoCzKG6DyT0kCJo7WveqSBxBOoIi', 'profesor', 'active'),
(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active'),
(7, 19282340, '$2y$10$moo9yxZLhEx/2nm8hm.4y.CYC6HTptlepQFJVvhWDDhrUAoCJnkwW', '¿Cuál es el nombre de tu escuela primaria?', '¿Cuál es el nombre de tu primera mascota?', '¿En qué ciudad naciste?', '$2y$10$.74Lk2GGk0wg.YfrqkhzA.Uy8WBuq/YVHEvm2YWY0uXOkLW4649tO', '$2y$10$sXMNpg.hK0t9yg1ZZzhif.SG.GzVSN7WkR6HJi6mCvAePrGOSYzPi', '$2y$10$0g4l.tzDZwQ3potE6fDBTukJdn0UO6nl1jSw4Y2GkdVPVv1deS5qm', 'profesor', 'active'),
(9, 5656, '$2y$10$XnKkMjz3oQcmQ1vv2Vjga.iGB8bO7165A5pV87kcP/nZsvjAgZ3Zm', '', '', '', '', '', '', 'profesor', 'new'),
(10, 19282324, '$2y$10$YWeRd2gZhLd0XqO.w/.hMOzr3.9q2J8S5/2QyjCncVDjAsr17xfOG', '', '', '', '', '', '', 'profesor', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `cedula` bigint NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(14) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo`) VALUES
(5656, 'PEDRITO', 'MENDEZ', 'VENEZUELA, PORTUGUESA, GUANARE URBANIZACION LA VERGUISA ENTFRE LA CALLE 13 Y 2 , CASA NUMERO 10', '04122696463', 'equisde@gmail.com'),
(11716900, 'JOHN ENMANUEL', 'RAMIREZ VALERO', 'Enrique Segoviano', '+584169919122', 'cojggeo@equisde.com'),
(19282324, 'CARLOS', 'DIAZ', 'FASDF', '04121', 'fasdf@gmail.com'),
(19282340, 'FASDFUNCIONO', 'FASDFUNCIONO', 'FASD', '04122696463', 'equisde@gmail.com'),
(27414575, 'ASDAS', 'ADASDAS', 'DIREKSION', '04246646364', 'lol@lol.com'),
(27564672, 'NIRETCIA INMACULADA', 'RAMIREZ VALERO', 'Venezuela, Portuguesa, Guanare Urbanizacion la Verguisa entre la calle 13 y 2 , casa numero 10', '04161234567', 'equisde@gmail.com'),
(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'tuputamadre@puta.com');

-- --------------------------------------------------------

--
-- Table structure for table `preguntas_seguridad`
--

CREATE TABLE `preguntas_seguridad` (
  `id` int NOT NULL,
  `pregunta` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `preguntas_seguridad`
--

INSERT INTO `preguntas_seguridad` (`id`, `pregunta`) VALUES
(1, '¿Como se llama tu mama?'),
(2, '¿Cuando es tu Cumpleaños?'),
(3, '¿Te gustan los gatos o perros?'),
(4, '¿Cual es tu color favorito?');

-- --------------------------------------------------------

--
-- Table structure for table `profesores_materias`
--

CREATE TABLE `profesores_materias` (
  `id` int NOT NULL,
  `profesor` bigint NOT NULL,
  `materia` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `profesores_materias`
--

INSERT INTO `profesores_materias` (`id`, `profesor`, `materia`) VALUES
(1, 19282324, 'AP'),
(2, 19282324, 'AP'),
(3, 5656, 'AP'),
(4, 5656, 'BI'),
(5, 5656, 'AP'),
(6, 5656, 'BI'),
(7, 5656, 'AP'),
(8, 5656, 'BI'),
(9, 5656, 'AP'),
(10, 5656, 'BI'),
(11, 5656, 'CA'),
(12, 5656, 'AP'),
(13, 5656, 'BI'),
(14, 11716900, 'CT');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `cedula` int NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol` int NOT NULL,
  `pregunta_seguridad` int NOT NULL,
  `respuesta` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `clave` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `apellido`, `rol`, `pregunta_seguridad`, `respuesta`, `clave`) VALUES
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
  ADD KEY `codigo_a_escolar` (`codigo_a_escolar`,`codigo_a_y_seccion`,`codigo_asignatura`,`codigo_aula`,`codigo_dia`),
  ADD KEY `FK_horario_estudiante_personas` (`profesor`),
  ADD KEY `FK_horario_estudiante_asignatura` (`codigo_asignatura`),
  ADD KEY `FK_horario_estudiante_aula` (`codigo_aula`),
  ADD KEY `FK_horario_estudiante_ano_seccion` (`codigo_a_y_seccion`);

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
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indexes for table `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_profesores_materias_personas` (`profesor`),
  ADD KEY `FK_profesores_materias_asignatura` (`materia`);

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
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  ADD CONSTRAINT `FK_horario_estudiante_ano_escolar` FOREIGN KEY (`codigo_a_escolar`) REFERENCES `ano_escolar` (`codigo`),
  ADD CONSTRAINT `FK_horario_estudiante_ano_seccion` FOREIGN KEY (`codigo_a_y_seccion`) REFERENCES `ano_seccion` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_asignatura` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignatura` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_aula` FOREIGN KEY (`codigo_aula`) REFERENCES `aula` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_profesores_materias` FOREIGN KEY (`profesor`) REFERENCES `profesores_materias` (`profesor`) ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_personas` FOREIGN KEY (`username`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD CONSTRAINT `FK_profesores_materias_asignatura` FOREIGN KEY (`materia`) REFERENCES `asignatura` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profesores_materias_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
