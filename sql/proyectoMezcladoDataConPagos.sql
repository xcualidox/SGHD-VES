-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 04, 2024 at 11:12 PM
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
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ano_escolar`
--

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(18, '2024-2025', '2024-10-07', '2025-07-31', 1),
(20, 'xd', '2024-10-21', '2024-10-22', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ano_seccion`
--

CREATE TABLE `ano_seccion` (
  `codigo` int NOT NULL,
  `ano` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `seccion` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ano_seccion`
--

INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`) VALUES
(18, '1ero', 'A'),
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
('QU', 'QUIMICA'),
('TC', 'TRABAJO COMUNITARIO');

-- --------------------------------------------------------

--
-- Table structure for table `aula`
--

CREATE TABLE `aula` (
  `codigo` int NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `disponibilidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aula`
--

INSERT INTO `aula` (`codigo`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(25, 'Aula 1', 'aula 1', 1),
(26, 'Aula 2', 'aula 2', 1),
(27, 'Aula 3', 'aula 3', 1),
(28, 'Aula 4', 'aula 4', 1),
(29, 'Aula 5', 'aula 5', 1),
(30, 'Cancha deportiva', 'actividades y recreaciones', 1),
(31, 'Laboratorio', 'laboratorio', 1),
(32, 'Aula música', 'música', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cedula` bigint NOT NULL,
  `type` enum('login','error','eliminar','actualizar','insertar','modificar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
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
(8, '2024-09-07 15:54:05', 29629080, 'login', '29629080 ha ingresado al sistema.', 'ZUHE2-PC'),
(9, '2024-09-15 20:13:38', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(10, '2024-09-15 20:13:52', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(11, '2024-09-15 20:14:51', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(12, '2024-09-17 18:27:56', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(13, '2024-09-19 09:33:40', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(14, '2024-09-20 14:12:22', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(15, '2024-09-21 09:34:55', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(16, '2024-09-22 09:52:57', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(17, '2024-09-22 13:19:42', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(18, '2024-09-23 09:46:30', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(19, '2024-09-24 12:16:58', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(20, '2024-09-24 13:20:04', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(21, '2024-09-24 22:49:50', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(22, '2024-09-25 09:13:44', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(23, '2024-09-25 09:39:30', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(24, '2024-09-26 08:54:31', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(25, '2024-09-26 09:05:01', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(26, '2024-09-26 09:07:49', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(27, '2024-09-26 09:14:10', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU'),
(28, '2024-09-27 11:14:41', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(29, '2024-09-27 11:15:33', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(30, '2024-09-27 11:16:49', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(31, '2024-09-27 11:18:48', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(32, '2024-09-27 11:34:57', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(33, '2024-09-27 12:15:32', 27576598, 'login', '27576598 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(34, '2024-09-27 12:42:17', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(35, '2024-09-27 12:50:41', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(36, '2024-09-28 12:16:59', 27576598, 'login', '27576598 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(37, '2024-09-28 21:10:10', 27576598, 'login', '27576598 ha ingresado al sistema.', 'Tahiris-PC'),
(38, '2024-09-29 10:25:43', 27576598, 'login', '27576598 ha ingresado al sistema.', 'Tahiris-PC'),
(39, '2024-10-21 18:21:23', 29629080, 'insertar', '29629080 ha agregado la sección 1ero-A.', 'ZUHE2-PC'),
(40, '2024-10-21 18:38:30', 29629080, 'insertar', '29629080 ha creado el horario para el año 18 sección 23.', 'ZUHE2-PC'),
(41, '2024-10-21 18:55:22', 29629080, 'insertar', '29629080 ha creado el horario para el año  sección .', 'ZUHE2-PC'),
(42, '2024-10-21 18:55:58', 29629080, 'insertar', '29629080 ha creado el horario para el año  sección .', 'ZUHE2-PC'),
(43, '2024-10-21 18:57:25', 29629080, 'insertar', '29629080 ha creado el horario para el año  sección .', 'ZUHE2-PC'),
(44, '2024-10-21 18:59:10', 29629080, 'insertar', '29629080 ha creado el horario para el año  sección .', 'ZUHE2-PC'),
(45, '2024-10-21 19:01:19', 29629080, 'insertar', '29629080 ha creado el horario para el año 2024-2025 sección 1ero .', 'ZUHE2-PC'),
(46, '2024-10-21 19:01:40', 29629080, 'insertar', '29629080 ha creado el horario para el año 2024-2025 sección 1ero A.', 'ZUHE2-PC'),
(47, '2024-10-21 19:04:09', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"1ero A\".', 'ZUHE2-PC'),
(48, '2024-10-21 19:12:36', 29629080, 'eliminar', 'Eliminó el horario del año \"2024-2025\" sección \"1ero A\".', 'ZUHE2-PC'),
(49, '2024-10-21 19:36:17', 29629080, 'insertar', 'Agregó el año escolar xd.', 'ZUHE2-PC'),
(50, '2024-10-21 19:55:52', 29629080, 'modificar', 'Modificó al profesor 4608560.', 'ZUHE2-PC'),
(51, '2024-10-21 20:03:02', 29629080, 'login', '29629080 ha ingresado al sistema.', 'ZUHE2-PC'),
(52, '2024-10-21 20:03:33', 29629080, 'modificar', 'Modificó al profesor 4608560.', 'ZUHE2-PC'),
(53, '2024-10-21 20:18:14', 29629080, 'modificar', 'Modificó la sección 1ero-U.', 'ZUHE2-PC'),
(54, '2024-10-21 20:18:31', 29629080, 'modificar', 'Modificó la sección 1ero-A.', 'ZUHE2-PC'),
(55, '2024-10-21 20:20:45', 29629080, 'login', 'Ingresó al sistema.', 'ZUHE2-PC'),
(56, '2024-10-21 20:29:30', 29629080, 'modificar', 'Cambió el PEMSUN del profesor\"5945762.', 'ZUHE2-PC'),
(57, '2024-10-21 20:31:29', 29629080, 'modificar', 'Cambió el PEMSUN del profesor\"5945762.', 'ZUHE2-PC'),
(58, '2024-10-21 20:35:05', 29629080, 'modificar', 'Movió el PEMSUN del profesor  a 4608560.', 'ZUHE2-PC'),
(59, '2024-10-21 20:35:05', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 4608560.', 'ZUHE2-PC'),
(60, '2024-10-21 20:35:05', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 4608560.', 'ZUHE2-PC'),
(61, '2024-10-21 20:36:46', 29629080, 'modificar', 'Movió el PEMSUN del profesor 4608560 a 29629080.', 'ZUHE2-PC'),
(62, '2024-10-22 19:16:21', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(63, '2024-10-22 19:16:21', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(64, '2024-10-22 19:17:03', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(65, '2024-10-22 19:17:38', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(66, '2024-10-22 19:17:38', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(67, '2024-10-22 19:39:25', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(68, '2024-10-22 19:43:13', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(69, '2024-10-22 19:43:43', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 29629080.', 'ZUHE2-PC'),
(70, '2024-10-22 19:51:57', 29629080, 'modificar', 'Movió las materias del profesor 29629080 al profesor 12710000.', 'ZUHE2-PC'),
(71, '2024-10-25 17:17:37', 29629080, 'login', 'Ingresó al sistema.', 'ZUHE2-PC'),
(72, '2024-10-29 14:40:34', 29629080, 'insertar', 'Agregó al profesor 27216803.', 'ZUHE2-PC'),
(73, '2024-10-29 14:41:16', 27216803, 'login', 'Ingresó al sistema.', 'ZUHE2-PC'),
(74, '2024-10-29 18:05:15', 29629080, 'eliminar', '.', 'ZUHE2-PC'),
(75, '2024-10-29 18:46:02', 29629080, 'eliminar', ' Eliminó la mensualidad de agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(76, '2024-10-29 18:47:22', 29629080, 'eliminar', ' Eliminó la mensualidad de junio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(77, '2024-10-29 18:51:01', 29629080, 'eliminar', ' Eliminó la mensualidad de julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(78, '2024-10-29 18:58:36', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(79, '2024-10-29 19:17:47', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(80, '2024-10-29 19:19:49', 29629080, 'insertar', ' Insertó la mensualidad de Junio (id:) del Año Escolar \"18\"', 'ZUHE2-PC'),
(81, '2024-10-29 19:19:50', 29629080, 'insertar', ' Insertó la mensualidad de Junio (id:) del Año Escolar \"18\"', 'ZUHE2-PC'),
(82, '2024-10-29 19:35:12', 29629080, 'eliminar', ' Eliminó la mensualidad de Junio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(83, '2024-10-29 19:35:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Junio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(84, '2024-10-29 19:35:31', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"18\"', 'ZUHE2-PC'),
(85, '2024-10-29 19:35:31', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"18\"', 'ZUHE2-PC'),
(86, '2024-10-29 19:36:00', 29629080, 'insertar', ' Insertó la mensualidad de Septiembre del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(87, '2024-10-29 19:36:00', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(88, '2024-10-29 19:59:16', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(89, '2024-10-29 20:00:59', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(90, '2024-10-29 20:02:55', 29629080, 'modificar', ' Modificó la mensualidad de 1 del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(91, '2024-10-29 20:04:08', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(92, '2024-10-29 20:04:24', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(93, '2024-10-29 20:05:30', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(94, '2024-10-29 20:06:43', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(95, '2024-10-29 20:08:01', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(96, '2024-10-29 20:08:15', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(97, '2024-10-29 20:08:36', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(98, '2024-10-29 20:09:16', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(99, '2024-10-29 20:09:40', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(100, '2024-10-29 20:19:04', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(101, '2024-10-29 20:19:20', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(102, '2024-10-29 20:19:50', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(103, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(104, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(105, '2024-10-29 20:23:26', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(106, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(107, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(108, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Septiembre del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(109, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(110, '2024-10-29 20:23:26', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(111, '2024-10-29 20:23:27', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(112, '2024-10-29 20:23:27', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(113, '2024-10-29 20:23:27', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(114, '2024-10-29 20:23:27', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(115, '2024-10-29 20:25:06', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(116, '2024-10-29 20:25:07', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(117, '2024-10-29 20:25:08', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(118, '2024-10-29 20:25:09', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(119, '2024-10-29 20:25:10', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(120, '2024-10-29 20:25:10', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(121, '2024-10-29 20:25:11', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(122, '2024-10-29 20:25:12', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(123, '2024-10-29 20:25:13', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(124, '2024-10-29 20:25:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Septiembre del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(125, '2024-10-29 20:25:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(126, '2024-10-29 20:25:15', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(127, '2024-10-29 20:25:16', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(128, '2024-10-29 20:25:17', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(129, '2024-10-29 20:25:18', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(130, '2024-10-29 20:25:18', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(131, '2024-10-29 20:25:19', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(132, '2024-10-29 20:25:20', 29629080, 'eliminar', ' Eliminó la mensualidad de Septiembre del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(133, '2024-10-29 20:25:21', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(134, '2024-10-29 20:25:22', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(135, '2024-10-29 20:25:26', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(136, '2024-10-29 20:25:26', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(137, '2024-10-29 20:25:26', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(138, '2024-10-29 20:25:36', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(139, '2024-10-29 20:26:41', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(140, '2024-10-29 20:26:46', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(141, '2024-10-29 20:26:49', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(142, '2024-10-29 20:26:51', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(143, '2024-10-29 20:27:01', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(144, '2024-10-29 20:27:04', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(145, '2024-10-29 20:27:32', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(146, '2024-10-29 20:28:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(147, '2024-10-29 20:28:16', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(148, '2024-10-29 20:28:42', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(149, '2024-10-29 20:28:45', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(150, '2024-10-29 20:28:47', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(151, '2024-10-29 20:34:23', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"\"', 'ZUHE2-PC'),
(152, '2024-10-29 20:38:14', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(153, '2024-10-29 20:38:33', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(154, '2024-10-29 20:38:35', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(155, '2024-10-29 20:38:37', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(156, '2024-10-29 20:38:39', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(157, '2024-10-29 20:38:41', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(158, '2024-10-29 20:40:34', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(159, '2024-10-29 20:40:57', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(160, '2024-10-29 20:41:00', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(161, '2024-10-29 20:43:11', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(162, '2024-10-29 20:43:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(163, '2024-10-29 20:43:16', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(164, '2024-10-29 20:44:03', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(165, '2024-10-29 20:44:05', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(166, '2024-10-29 20:47:12', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(167, '2024-10-29 20:47:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(168, '2024-10-29 20:48:49', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(169, '2024-10-29 20:48:50', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(170, '2024-10-29 20:49:10', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(171, '2024-10-29 20:49:12', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(172, '2024-10-29 20:50:02', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(173, '2024-10-29 20:50:32', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(174, '2024-10-29 20:50:34', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(175, '2024-10-29 20:52:22', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(176, '2024-10-29 20:53:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(177, '2024-10-29 20:55:08', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(178, '2024-10-29 20:55:15', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(179, '2024-10-29 20:57:54', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(180, '2024-10-29 20:58:22', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(181, '2024-10-29 20:58:24', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(182, '2024-10-29 20:59:09', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(183, '2024-10-29 20:59:11', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(184, '2024-10-29 21:01:06', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(185, '2024-10-29 21:01:09', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(186, '2024-10-29 21:05:32', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(187, '2024-10-29 21:05:32', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(188, '2024-10-29 21:05:32', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(189, '2024-10-29 21:05:32', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(190, '2024-10-29 21:05:36', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(191, '2024-10-29 21:05:38', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(192, '2024-10-29 21:05:39', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(193, '2024-10-29 21:05:42', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(194, '2024-10-29 21:05:42', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(195, '2024-10-29 21:05:42', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(196, '2024-10-29 21:05:42', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(197, '2024-10-29 21:05:45', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(198, '2024-10-29 21:05:46', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(199, '2024-10-29 21:05:47', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(200, '2024-10-29 21:05:49', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(201, '2024-10-29 21:09:20', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(202, '2024-10-29 21:09:20', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(203, '2024-10-29 21:09:21', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(204, '2024-10-29 21:09:23', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(205, '2024-10-29 21:09:24', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(206, '2024-10-29 21:09:25', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(207, '2024-10-29 21:09:54', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(208, '2024-10-29 21:09:59', 29629080, 'modificar', ' Modificó la mensualidad de Lol del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(209, '2024-10-29 21:10:20', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(210, '2024-10-29 21:10:20', 29629080, 'insertar', ' Insertó la mensualidad de Junio del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(211, '2024-10-29 21:10:32', 29629080, 'eliminar', ' Eliminó la mensualidad de Junio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(212, '2024-10-29 21:10:33', 29629080, 'eliminar', ' Eliminó la mensualidad de Julio del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(213, '2024-10-29 21:10:41', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(214, '2024-10-29 21:10:41', 29629080, 'insertar', ' Insertó la mensualidad de Febrero del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(215, '2024-10-29 21:11:14', 29629080, 'eliminar', ' Eliminó la mensualidad de Febrero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(216, '2024-10-29 21:11:15', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(217, '2024-10-29 21:11:17', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(218, '2024-10-29 21:11:39', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(219, '2024-10-29 21:11:39', 29629080, 'insertar', ' Insertó la mensualidad de Noviembre del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(220, '2024-10-29 21:13:47', 29629080, 'eliminar', ' Eliminó la mensualidad de Noviembre del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(221, '2024-10-29 21:14:03', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(222, '2024-10-29 21:14:19', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(223, '2024-10-29 21:14:54', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(224, '2024-10-29 21:22:23', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(225, '2024-10-29 21:22:25', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(226, '2024-10-29 21:22:29', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(227, '2024-10-29 21:23:13', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(228, '2024-10-29 21:24:17', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(229, '2024-10-29 21:24:43', 29629080, 'modificar', ' Modificó la mensualidad de  del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(230, '2024-10-29 21:30:22', 29629080, 'modificar', ' Modificó la mensualidad de agosto del Año Escolar \"Lmao\"', 'ZUHE2-PC'),
(231, '2024-10-29 21:34:02', 29629080, 'modificar', ' Modificó la mensualidad de agosto del A.Escolar \"2024-2025\"', 'ZUHE2-PC'),
(232, '2024-10-29 21:39:39', 29629080, 'modificar', ' Modificó la mensualidad de \"Agosto del A.Escolar \"agosto\" por \"\"Agosto del A.Escolar \"18\"', 'ZUHE2-PC'),
(233, '2024-10-29 21:41:33', 29629080, 'modificar', ' Modificó la mensualidad de \"Agosto del A.Escolar \"agosto\" por \"Agosto del A.Escolar \"2024-2025\"', 'ZUHE2-PC'),
(234, '2024-10-29 21:42:29', 29629080, 'modificar', ' Modificó la mensualidad de \"Agosto del A.Escolar \"2024-2025\" por \"Agosto del A.Escolar \"2024-2025\"', 'ZUHE2-PC'),
(235, '2024-10-29 21:43:06', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del A.Escolar \"2024-2025\" por Agosto del A.Escolar \"2024-2025\"', 'ZUHE2-PC'),
(236, '2024-10-29 21:47:54', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del A.Escolar \"\" () por Agosto del A.Escolar \"2024-2025\" (222)', 'ZUHE2-PC'),
(237, '2024-10-29 21:49:55', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del A.Escolar \"2024-2025\" () por Agosto del A.Escolar \"2024-2025\" (111)', 'ZUHE2-PC'),
(238, '2024-10-29 21:51:33', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del A.Escolar \"2024-2025\" (111) por Agosto del A.Escolar \"2024-2025\" (444)', 'ZUHE2-PC'),
(239, '2024-10-29 21:53:08', 29629080, 'modificar', ' Modificó la mensualidad de Agosto del A.Escolar \"2024-2025\" (444$) por Agosto del A.Escolar \"2024-2025\" (111$)', 'ZUHE2-PC'),
(240, '2024-11-03 16:57:19', 29629080, 'modificar', 'Modificó la sección 1ero-U.', 'ZUHE2-PC'),
(241, '2024-11-03 16:57:21', 29629080, 'eliminar', 'Eliminó la sección 1ero-A.', 'ZUHE2-PC'),
(242, '2024-11-03 16:57:26', 29629080, 'eliminar', 'Eliminó la sección 1ero-A.', 'ZUHE2-PC'),
(243, '2024-11-03 17:18:31', 29629080, 'insertar', ' Insertó al estudiante 3 3(3) correctamente.', 'ZUHE2-PC'),
(244, '2024-11-03 17:24:41', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(245, '2024-11-03 17:28:44', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(246, '2024-11-03 17:28:59', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(247, '2024-11-03 17:29:09', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(248, '2024-11-03 17:29:30', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(249, '2024-11-03 17:30:19', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(250, '2024-11-03 17:36:41', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(251, '2024-11-03 17:39:11', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(252, '2024-11-03 17:46:43', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(253, '2024-11-03 17:46:47', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(254, '2024-11-03 17:47:06', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(255, '2024-11-03 17:49:43', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(256, '2024-11-03 17:50:01', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(257, '2024-11-03 17:52:16', 29629080, 'modificar', ' Modificó al estudiante 2 1(1) correctamente.', 'ZUHE2-PC'),
(258, '2024-11-03 17:53:01', 29629080, 'insertar', ' Insertó al estudiante 1 1(1) correctamente.', 'ZUHE2-PC'),
(259, '2024-11-03 17:56:16', 29629080, 'modificar', ' Modificó al estudiante 1 1(1) correctamente.', 'ZUHE2-PC'),
(260, '2024-11-03 18:00:13', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(261, '2024-11-03 18:02:20', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(262, '2024-11-03 18:04:22', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(263, '2024-11-03 18:04:40', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(264, '2024-11-03 18:05:00', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(265, '2024-11-03 18:06:10', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(266, '2024-11-03 18:07:12', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(267, '2024-11-03 18:07:16', 29629080, 'modificar', ' Modificó al estudiante Lol Lolol(123456) correctamente.', 'ZUHE2-PC'),
(268, '2024-11-03 18:12:28', 29629080, 'insertar', ' Insertó al estudiante cedulaRepresentante nombresRepresentante apellidosRepresentante telefono telefonoDomicilio direccion correo correctamente.', 'ZUHE2-PC'),
(269, '2024-11-03 18:13:35', 29629080, 'insertar', ' Insertó al estudiante 6 6 6 6 6 6 6 correctamente.', 'ZUHE2-PC'),
(270, '2024-11-03 18:15:46', 29629080, 'insertar', ' Insertó al estudiante 456 nombreR apellidoR 111 222 enrique segoviano cojggeo 456 nombreR apellidoR 111 222 enrique segoviano cojggeo correctamente.', 'ZUHE2-PC'),
(271, '2024-11-03 18:18:20', 29629080, 'insertar', ' Insertó al estudiante  3 nombreE apellidoE 1ero A 2024-2025 3 nombreR apellidoR 111 222 enrique segoviaNO cojggeo correctamente.', 'ZUHE2-PC'),
(272, '2024-11-03 18:20:43', 29629080, 'insertar', ' Insertó al estudiante cedulaEstudianteActual: \"\" cedulaEstudiante: \"5125\" nombres: \"asd1\" apellidos: \"asd2\" anoSeccion: \"1ero A\" anoEscolar: \"2024-2025\" 5125 asd3 asd4 111 222 asd7 asd8 correctamente.', 'ZUHE2-PC'),
(273, '2024-11-03 18:21:37', 29629080, 'insertar', ' Insertó al estudiante cedulaEstudianteActual: \"\" <br>cedulaEstudiante: \"125125\" <br>nombres: \"asdas\" <br>apellidos: \"asdas\" <br>anoSeccion: \"1ero A\" <br>anoEscolar: \"2024-2025\" <br>1251251 asdas dasdsa 111 222 asdas asdas correctamente.', 'ZUHE2-PC'),
(274, '2024-11-03 18:22:31', 29629080, 'insertar', ' Insertó al estudiante cedulaEstudianteActual: \"\" <br>cedulaEstudiante: \"12125\" <br>nombres: \"asd\" <br>apellidos: \"asdas\" <br>anoSeccion: \"1ero A\" <br>anoEscolar: \"2024-2025\" <br>cedulaRepresentante: \"125125\" <br>nombresRepresentante: \"dasd\" <br>apellidosRepresentante: \"asdas\" <br>telefono: \"111\" <br>telefonoDomicilio: \"222\" <br>direccion: \"asdas\" <br>correo: \"asdas\" <br>correctamente.', 'ZUHE2-PC'),
(275, '2024-11-03 18:26:31', 29629080, 'modificar', ' Modificó al estudiante cedulaEstudianteActual: \"1\" <br>cedulaEstudiante: \"1\" <br>nombres: \"1\" <br>apellidos: \"1\" <br>anoSeccion: \"1ero A\" <br>anoEscolar: \"2024-2025\" <br><br>cedulaRepresentante: \"2\" <br>nombresRepresentante: \"1\" <br>apellidosRepresentante: \"1\" <br>telefono: \"1\" <br>telefonoDomicilio: \"1\" <br>direccion: \"1\" <br>correo: \"1\" <br> correctamente.', 'ZUHE2-PC'),
(276, '2024-11-03 18:27:08', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"1\"<br>cedulaEstudiante: \"1\"<br>nombres: \"1\"<br>apellidos: \"1\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"3\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(277, '2024-11-03 18:36:42', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"3\"<br>cedulaEstudiante: \"3\"<br>nombres: \"nombreE\"<br>apellidos: \"apellidoE\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"7\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(278, '2024-11-03 18:37:06', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"1\"<br>cedulaEstudiante: \"1\"<br>nombres: \"1\"<br>apellidos: \"1\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"5\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(279, '2024-11-03 18:37:19', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"1\"<br>cedulaEstudiante: \"1\"<br>nombres: \"1\"<br>apellidos: \"1\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"10\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(280, '2024-11-03 18:37:35', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"2\"<br>cedulaEstudiante: \"2\"<br>nombres: \"2\"<br>apellidos: \"2\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"5\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(281, '2024-11-03 18:37:43', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"1\"<br>cedulaEstudiante: \"1\"<br>nombres: \"1\"<br>apellidos: \"1\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"2\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(282, '2024-11-03 18:37:50', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"2\"<br>cedulaEstudiante: \"2\"<br>nombres: \"2\"<br>apellidos: \"2\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"2\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(283, '2024-11-03 18:37:55', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"3\"<br>cedulaEstudiante: \"3\"<br>nombres: \"nombreE\"<br>apellidos: \"apellidoE\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"2\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(284, '2024-11-03 18:38:02', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"5\"<br>cedulaEstudiante: \"5\"<br>nombres: \"5\"<br>apellidos: \"5\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"2\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(285, '2024-11-03 18:38:16', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"1\"<br>cedulaEstudiante: \"1\"<br>nombres: \"1\"<br>apellidos: \"1\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"1\"<br>nombresRepresentante: \"1\"<br>apellidosRepresentante: \"1\"<br>telefono: \"1\"<br>telefonoDomicilio: \"1\"<br>direccion: \"1\"<br>correo: \"1\" correctamente.', 'ZUHE2-PC'),
(286, '2024-11-03 19:51:39', 29629080, 'insertar', ' Insertó al estudiante 123 123(12345656) correctamente.', 'ZUHE2-PC'),
(287, '2024-11-03 20:02:23', 29629080, 'insertar', ' Insertó al estudiante  () correctamente.', 'ZUHE2-PC'),
(288, '2024-11-03 20:02:42', 29629080, 'insertar', ' Insertó al estudiante  () correctamente.', 'ZUHE2-PC'),
(289, '2024-11-03 20:04:03', 29629080, 'insertar', ' Insertó al estudiante  () correctamente.', 'ZUHE2-PC'),
(290, '2024-11-03 20:05:14', 29629080, 'eliminar', ' Eliminó al estudiante 5 5() correctamente.', 'ZUHE2-PC'),
(291, '2024-11-03 20:05:27', 29629080, 'eliminar', ' Eliminó al estudiante 6 6(6) correctamente.', 'ZUHE2-PC'),
(292, '2024-11-03 20:10:56', 29629080, 'eliminar', ' Eliminó al estudiante NombreE ApellidoE(123) correctamente.', 'ZUHE2-PC'),
(293, '2024-11-03 20:12:06', 29629080, 'eliminar', ' Eliminó al estudiante Asd1 Asd2(5125) correctamente.', 'ZUHE2-PC'),
(294, '2024-11-03 20:12:24', 29629080, 'eliminar', ' Eliminó al estudiante Asd Asdas(12125) correctamente.', 'ZUHE2-PC'),
(295, '2024-11-03 20:12:29', 29629080, 'eliminar', ' Eliminó al estudiante Angel Orlando Mendez Mendoza(29629080) correctamente.', 'ZUHE2-PC'),
(296, '2024-11-03 21:56:08', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"123456\"<br>cedulaEstudiante: \"123456\"<br>nombres: \"lol\"<br>apellidos: \"lolol\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"125124\"<br>nombresRepresentante: \"5125\"<br>apellidosRepresentante: \"125125\"<br>telefono: \"12512\"<br>telefonoDomicilio: \"51251\"<br>direccion: \"125125\"<br>correo: \"12512\" correctamente.', 'ZUHE2-PC'),
(297, '2024-11-03 22:33:26', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"125125\"<br>cedulaEstudiante: \"125125\"<br>nombres: \"asdas\"<br>apellidos: \"asdas\"<br>anoSeccion: \"1ero A\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"125\"<br>nombresRepresentante: \"125\"<br>apellidosRepresentante: \"125\"<br>telefono: \"125\"<br>telefonoDomicilio: \"125\"<br>direccion: \"125\"<br>correo: \"125\" correctamente.', 'ZUHE2-PC'),
(298, '2024-11-04 18:20:41', 29629080, 'eliminar', ' Eliminó la mensualidad de Agosto del Año Escolar \"2024-2025\"', 'ZUHE2-PC'),
(299, '2024-11-04 18:20:43', 29629080, 'eliminar', ' Eliminó la mensualidad de Enero del Año Escolar \"2024-2025\"', 'ZUHE2-PC');

-- --------------------------------------------------------

--
-- Table structure for table `datos_inst`
--

CREATE TABLE `datos_inst` (
  `rif` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre_institucion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `codigo_plantel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

INSERT INTO `datos_inst` (`rif`, `direccion`, `telefono`, `nombre_institucion`, `codigo_plantel`) VALUES
('J-30053973-3\r\n', 'Calle 28, Av. Esquina 37 , Acarigua', '0255-6153561', 'U.E. COLEGIO \"VICENTE EMILIO SOJO\"\n', 'P.D.00511808\n');

-- --------------------------------------------------------

--

--



-- --------------------------------------------------------

--
-- Table structure for table `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `codigo_id` int NOT NULL,
  `disponible` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disponibilidad`
--

INSERT INTO `disponibilidad` (`codigo_id`, `disponible`) VALUES
(0, 'No disponible'),
(1, 'Disponible');

-- --------------------------------------------------------

--
-- Table structure for table `dolar`
--

CREATE TABLE `dolar` (
  `id` int NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `dolar`
--

INSERT INTO `dolar` (`id`, `precio`) VALUES
(1, 36.8);

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `cedula_estudiante` bigint NOT NULL DEFAULT '0',
  `nombres` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `ano` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `seccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`cedula_estudiante`, `nombres`, `apellidos`, `ano`, `seccion`, `activo`) VALUES
(123456, 'lol', 'lolol', '2024-2025', '1ero U', 1),
(8585684, 'Carlos', 'Diaz', '2024-2025', '3ero U', 1),
(19282324, 'Carlos', 'Diaz', '2024-2025', '5to U', 1),
(29629080, 'Angel Orlando', 'Mendez Mendoza', '2024-2025', '1ero U', 1),
(30294676, 'Carlos', 'Diaz', '2024-2025', '3ero U', 1),
(74545958, 'Juan Jose', 'Mendez', '2024-2025', '1ero U', 1);

-- --------------------------------------------------------

--
-- Table structure for table `horario_estudiante`
--

CREATE TABLE `horario_estudiante` (
  `codigo` int NOT NULL,
  `codigo_a_escolar` int DEFAULT NULL,
  `codigo_a_y_seccion` int DEFAULT NULL,
  `codigo_asignatura` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `codigo_aula` int DEFAULT NULL,
  `codigo_dia` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `grupo` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `profesor` bigint DEFAULT NULL,
  `intervalo` int NOT NULL,
  `receso` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`, `receso`) VALUES
(5481, 18, 22, 'MA', 27, 'B1M', ' ', 25347183, 6, '08:20'),
(5482, 18, 22, 'FI', 27, 'B1MM', ' ', 25347183, 6, '08:20'),
(5483, 18, 22, 'CA', 27, 'B1J', ' ', 10143237, 6, '08:20'),
(5484, 18, 22, 'CA', 27, 'B1V', ' ', 10143237, 6, '08:20'),
(5485, 18, 22, 'QU', 27, 'B2L', ' ', 14091761, 6, '08:20'),
(5486, 18, 22, 'MA', 27, 'B2M', ' ', 25347183, 6, '08:20'),
(5487, 18, 22, 'FI', 27, 'B2MM', ' ', 25347183, 6, '08:20'),
(5488, 18, 22, 'CA', 27, 'B2J', ' ', 10143237, 6, '08:20'),
(5489, 18, 22, 'CA', 27, 'B2V', ' ', 10143237, 6, '08:20'),
(5490, 18, 22, 'QU', 27, 'B3L', ' ', 14091761, 6, '08:20'),
(5491, 18, 22, 'OC', 27, 'B3M', ' ', 5945762, 6, '08:20'),
(5492, 18, 22, 'QU', 31, 'B3MM', '1', 14091761, 6, '08:20'),
(5493, 18, 22, 'BI', 27, 'B3MM', '2', 15071661, 6, '08:20'),
(5494, 18, 22, 'ILE', 27, 'B3J', ' ', 29800040, 6, '08:20'),
(5495, 18, 22, 'QU', 27, 'B4L', ' ', 14091761, 6, '08:20'),
(5496, 18, 22, 'TC', 27, 'B4M', ' ', 10143237, 6, '08:20'),
(5497, 18, 22, 'QU', 27, 'B4MM', '1', 14091761, 6, '08:20'),
(5498, 18, 22, 'BI', 31, 'B4MM', '2', 15071661, 6, '08:20'),
(5499, 18, 22, 'ILE', 27, 'B4J', ' ', 29800040, 6, '08:20'),
(5500, 18, 22, 'EF', 27, 'B4V', ' ', 5945762, 6, '08:20'),
(5501, 18, 22, 'ILE', 27, 'B5L', ' ', 29800040, 6, '08:20'),
(5502, 18, 22, 'TC', 27, 'B5M', ' ', 10143237, 6, '08:20'),
(5503, 18, 22, 'GHC', 27, 'B5MM', ' ', 15214479, 6, '08:20'),
(5504, 18, 22, 'ILE', 27, 'B5J', ' ', 29800040, 6, '08:20'),
(5505, 18, 22, 'EF', 27, 'B5V', ' ', 5945762, 6, '08:20'),
(5506, 18, 22, 'ILE', 27, 'B6L', ' ', 29800040, 6, '08:20'),
(5507, 18, 22, 'BI', 27, 'B6M', ' ', 15071661, 6, '08:20'),
(5508, 18, 22, 'GHC', 27, 'B6MM', ' ', 15214479, 6, '08:20'),
(5509, 18, 22, 'PGCRP', 27, 'B6J', ' ', 15214479, 6, '08:20'),
(5510, 18, 22, 'GHC', 27, 'B6V', ' ', 15214479, 6, '08:20'),
(5511, 18, 22, 'FI', 27, 'B7L', ' ', 25347183, 6, '08:20'),
(5512, 18, 22, 'BI', 27, 'B7M', ' ', 15071661, 6, '08:20'),
(5513, 18, 22, 'GHC', 27, 'B7MM', ' ', 15214479, 6, '08:20'),
(5514, 18, 22, 'PGCRP', 27, 'B7J', ' ', 15214479, 6, '08:20'),
(5515, 18, 22, 'MA', 27, 'B7V', ' ', 25347183, 6, '08:20'),
(5516, 18, 22, 'FI', 27, 'B8L', ' ', 25347183, 6, '08:20'),
(5517, 18, 22, 'BI', 27, 'B8M', ' ', 15071661, 6, '08:20'),
(5518, 18, 22, 'PGCRP', 27, 'B8J', ' ', 15214479, 6, '08:20'),
(5519, 18, 22, 'MA', 27, 'B8V', ' ', 25347183, 6, '08:20'),
(5648, 18, 21, 'ILE', 28, 'B1M', ' ', 29800040, 6, '09:00'),
(5649, 18, 21, 'BI', 28, 'B1MM', ' ', 15071661, 6, '09:00'),
(5650, 18, 21, 'EF', 28, 'B1J', ' ', 5945762, 6, '09:00'),
(5651, 18, 21, 'QU', 28, 'B1V', ' ', 14091761, 6, '09:00'),
(5652, 18, 21, 'MA', 28, 'B2L', ' ', 25347183, 6, '09:00'),
(5653, 18, 21, 'ILE', 28, 'B2M', ' ', 29800040, 6, '09:00'),
(5654, 18, 21, 'BI', 28, 'B2MM', ' ', 15071661, 6, '09:00'),
(5655, 18, 21, 'EF', 28, 'B2J', ' ', 5945762, 6, '09:00'),
(5656, 18, 21, 'QU', 28, 'B2V', ' ', 14091761, 6, '09:00'),
(5657, 18, 21, 'ILE', 28, 'B3M', ' ', 29800040, 6, '09:00'),
(5658, 18, 21, 'EF', 28, 'B3J', ' ', 5945762, 6, '09:00'),
(5659, 18, 21, 'QU', 28, 'B3V', ' ', 14091761, 6, '09:00'),
(5660, 18, 21, 'FI', 28, 'B4L', ' ', 25347183, 6, '09:00'),
(5661, 18, 21, 'MA', 28, 'B4M', ' ', 25347183, 6, '09:00'),
(5662, 18, 21, 'FI', 28, 'B4MM', ' ', 25347183, 6, '09:00'),
(5663, 18, 21, 'MA', 28, 'B4J', ' ', 25347183, 6, '09:00'),
(5664, 18, 21, 'ILE', 28, 'B4V', ' ', 29800040, 6, '09:00'),
(5665, 18, 21, 'CA', 28, 'B5L', ' ', 10143237, 6, '09:00'),
(5666, 18, 21, 'BI', 28, 'B5M', ' ', 15071661, 6, '09:00'),
(5667, 18, 21, 'FI', 28, 'B5MM', ' ', 25347183, 6, '09:00'),
(5668, 18, 21, 'MA', 28, 'B5J', ' ', 25347183, 6, '09:00'),
(5669, 18, 21, 'CA', 28, 'B5V', ' ', 10143237, 6, '09:00'),
(5670, 18, 21, 'CA', 28, 'B6L', ' ', 10143237, 6, '09:00'),
(5671, 18, 21, 'FSN', 29, 'B6M', ' ', 5945762, 6, '09:00'),
(5672, 18, 21, 'FI', 28, 'B6MM', ' ', 25347183, 6, '09:00'),
(5673, 18, 21, 'PGCRP', 28, 'B6J', ' ', 5945762, 6, '09:00'),
(5674, 18, 21, 'CA', 28, 'B6V', ' ', 10143237, 6, '09:00'),
(5675, 18, 21, 'OC', 28, 'B7L', ' ', 10143237, 6, '09:00'),
(5676, 18, 21, 'FSN', 29, 'B7M', ' ', 5945762, 6, '09:00'),
(5677, 18, 21, 'TC', 28, 'B7MM', ' ', 10143237, 6, '09:00'),
(5678, 18, 21, 'PGCRP', 28, 'B7J', ' ', 5945762, 6, '09:00'),
(5679, 18, 21, 'GHC', 28, 'B7V', ' ', 15214479, 6, '09:00'),
(5680, 18, 21, 'OC', 28, 'B8L', ' ', 10143237, 6, '09:00'),
(5681, 18, 21, 'GHC', 28, 'B8M', ' ', 15214479, 6, '09:00'),
(5682, 18, 21, 'GHC', 32, 'B8MM', ' ', 15214479, 6, '09:00'),
(5683, 18, 21, 'PGCRP', 28, 'B8J', ' ', 5945762, 6, '09:00'),
(5684, 18, 21, 'GHC', 28, 'B8V', ' ', 15214479, 6, '09:00'),
(5989, 18, 20, 'BI', 29, 'B1M', ' ', 15071661, 6, '09:00'),
(5990, 18, 20, 'CT', 29, 'B1MM', ' ', 14091761, 6, '09:00'),
(5991, 18, 20, 'FI', 29, 'B1J', ' ', 25347183, 6, '09:00'),
(5992, 18, 20, 'EF', 29, 'B1V', ' ', 5945762, 6, '09:00'),
(5993, 18, 20, 'CA', 29, 'B2L', ' ', 10143237, 6, '09:00'),
(5994, 18, 20, 'BI', 29, 'B2M', ' ', 15071661, 6, '09:00'),
(5995, 18, 20, 'CT', 29, 'B2MM', ' ', 14091761, 6, '09:00'),
(5996, 18, 20, 'FI', 29, 'B2J', ' ', 25347183, 6, '09:00'),
(5997, 18, 20, 'EF', 29, 'B2V', ' ', 5945762, 6, '09:00'),
(5998, 18, 20, 'CA', 29, 'B3L', ' ', 10143237, 6, '09:00'),
(5999, 18, 20, 'FI', 29, 'B3M', ' ', 25347183, 6, '09:00'),
(6000, 18, 20, 'CA', 29, 'B3MM', ' ', 10143237, 6, '09:00'),
(6001, 18, 20, 'FI', 29, 'B3J', ' ', 25347183, 6, '09:00'),
(6002, 18, 20, 'EF', 29, 'B3V', ' ', 5945762, 6, '09:00'),
(6003, 18, 20, 'OC', 29, 'B4L', ' ', 15214479, 6, '09:00'),
(6004, 18, 20, 'FSN', 30, 'B4M', ' ', 5945762, 6, '09:00'),
(6005, 18, 20, 'CA', 29, 'B4MM', ' ', 10143237, 6, '09:00'),
(6006, 18, 20, 'GHC', 29, 'B4J', ' ', 15214479, 6, '09:00'),
(6007, 18, 20, 'MA', 29, 'B4V', ' ', 25347183, 6, '09:00'),
(6008, 18, 20, 'QU', 29, 'B5L', ' ', 14091761, 6, '09:00'),
(6009, 18, 20, 'FSN', 30, 'B5M', ' ', 5945762, 6, '09:00'),
(6010, 18, 20, 'BI', 29, 'B5MM', ' ', 15071661, 6, '09:00'),
(6011, 18, 20, 'GHC', 29, 'B5J', ' ', 15214479, 6, '09:00'),
(6012, 18, 20, 'GHC', 29, 'B5V', ' ', 15214479, 6, '09:00'),
(6013, 18, 20, 'QU', 29, 'B6L', ' ', 14091761, 6, '09:00'),
(6014, 18, 20, 'MA', 28, 'B6M', ' ', 25347183, 6, '09:00'),
(6015, 18, 20, 'BI', 29, 'B6MM', ' ', 15071661, 6, '09:00'),
(6016, 18, 20, 'PGCRP', 29, 'B6J', ' ', 10143237, 6, '09:00'),
(6017, 18, 20, 'ILE', 29, 'B6V', ' ', 29800040, 6, '09:00'),
(6018, 18, 20, 'GHC', 29, 'B7L', ' ', 15214479, 6, '09:00'),
(6019, 18, 20, 'MA', 31, 'B7M', ' ', 25347183, 6, '09:00'),
(6020, 18, 20, 'QU', 29, 'B7MM', ' ', 14091761, 6, '09:00'),
(6021, 18, 20, 'PGCRP', 29, 'B7J', ' ', 10143237, 6, '09:00'),
(6022, 18, 20, 'ILE', 29, 'B7V', ' ', 29800040, 6, '09:00'),
(6023, 18, 20, 'GHC', 29, 'B8L', ' ', 15214479, 6, '09:00'),
(6024, 18, 20, 'MA', 29, 'B8M', ' ', 25347183, 6, '09:00'),
(6025, 18, 20, 'QU', 29, 'B8MM', ' ', 14091761, 6, '09:00'),
(6026, 18, 20, 'PGCRP', 29, 'B8J', ' ', 10143237, 6, '09:00'),
(6027, 18, 20, 'ILE', 29, 'B8V', ' ', 29800040, 6, '09:00'),
(6028, 18, 18, 'GHC', 25, 'B1M', ' ', 15214479, 6, '08:20'),
(6029, 18, 18, 'ILE', 25, 'B1MM', ' ', 29800040, 6, '08:20'),
(6030, 18, 18, 'AP', 25, 'B1J', ' ', 15214479, 6, '08:20'),
(6031, 18, 18, 'MA', 25, 'B1V', ' ', 25347183, 6, '08:20'),
(6032, 18, 18, 'GHC', 25, 'B2L', ' ', 15214479, 6, '08:20'),
(6033, 18, 18, 'GHC', 25, 'B2M', ' ', 15214479, 6, '08:20'),
(6034, 18, 18, 'ILE', 25, 'B2MM', ' ', 29800040, 6, '08:20'),
(6035, 18, 18, 'AP', 25, 'B2J', ' ', 15214479, 6, '08:20'),
(6036, 18, 18, 'MA', 25, 'B2V', ' ', 25347183, 6, '08:20'),
(6037, 18, 18, 'ILE', 25, 'B3L', ' ', 29800040, 6, '08:20'),
(6038, 18, 18, 'CN', 25, 'B3M', ' ', 15071661, 6, '08:20'),
(6039, 18, 18, 'GHC', 25, 'B3MM', ' ', 15214479, 6, '08:20'),
(6040, 18, 18, 'CA', 25, 'B3J', ' ', 10143237, 6, '08:20'),
(6041, 18, 18, 'CA', 25, 'B3V', ' ', 10143237, 6, '08:20'),
(6042, 18, 18, 'ILE', 25, 'B4L', ' ', 29800040, 6, '08:20'),
(6043, 18, 18, 'CN', 25, 'B4M', ' ', 15071661, 6, '08:20'),
(6044, 18, 18, 'GHC', 25, 'B4MM', ' ', 15214479, 6, '08:20'),
(6045, 18, 18, 'CA', 25, 'B4J', ' ', 10143237, 6, '08:20'),
(6046, 18, 18, 'CA', 25, 'B4V', ' ', 10143237, 6, '08:20'),
(6047, 18, 18, 'MA', 25, 'B5L', ' ', 25347183, 6, '08:20'),
(6048, 18, 18, 'AP', 25, 'B5M', ' ', 15214479, 6, '08:20'),
(6049, 18, 18, 'TC', 25, 'B5MM', ' ', 10143237, 6, '08:20'),
(6050, 18, 18, 'CA', 25, 'B5J', ' ', 10143237, 6, '08:20'),
(6051, 18, 18, 'ILE', 25, 'B5V', ' ', 29800040, 6, '08:20'),
(6052, 18, 18, 'MA', 25, 'B6L', ' ', 25347183, 6, '08:20'),
(6053, 18, 18, 'AP', 25, 'B6M', ' ', 15214479, 6, '08:20'),
(6054, 18, 18, 'TC', 25, 'B6MM', ' ', 10143237, 6, '08:20'),
(6055, 18, 18, 'PGCRP', 25, 'B6J', ' ', 29800040, 6, '08:20'),
(6056, 18, 18, 'EF', 25, 'B6V', ' ', 5945762, 6, '08:20'),
(6057, 18, 18, 'AP', 25, 'B7M', ' ', 15214479, 6, '08:20'),
(6058, 18, 18, 'CN', 25, 'B7MM', ' ', 15071661, 6, '08:20'),
(6059, 18, 18, 'PGCRP', 25, 'B7J', ' ', 29800040, 6, '08:20'),
(6060, 18, 18, 'EF', 25, 'B7V', ' ', 5945762, 6, '08:20'),
(6061, 18, 18, 'CN', 28, 'B8MM', ' ', 15071661, 6, '08:20'),
(6062, 18, 18, 'PGCRP', 25, 'B8J', ' ', 29800040, 6, '08:20'),
(6063, 18, 18, 'EF', 25, 'B8V', ' ', 5945762, 6, '08:20'),
(6128, 18, 19, 'TC', 26, 'B1M', ' ', 10143237, 6, '08:20'),
(6129, 18, 19, 'GHC', 26, 'B1MM', ' ', 15214479, 6, '08:20'),
(6130, 18, 19, 'ILE', 26, 'B1J', ' ', 29800040, 6, '08:20'),
(6131, 18, 19, 'AP', 26, 'B1V', ' ', 15214479, 6, '08:20'),
(6132, 18, 19, 'OC', 26, 'B2L', ' ', 29800040, 6, '08:20'),
(6133, 18, 19, 'TC', 26, 'B2M', ' ', 10143237, 6, '08:20'),
(6134, 18, 19, 'GHC', 26, 'B2MM', ' ', 15214479, 6, '08:20'),
(6135, 18, 19, 'ILE', 26, 'B2J', ' ', 29800040, 6, '08:20'),
(6136, 18, 19, 'AP', 26, 'B2V', ' ', 15214479, 6, '08:20'),
(6137, 18, 19, 'GHC', 26, 'B3M', ' ', 15214479, 6, '08:20'),
(6138, 18, 19, 'CA', 26, 'B4L', ' ', 10143237, 6, '08:20'),
(6139, 18, 19, 'GHC', 26, 'B4M', ' ', 15214479, 6, '08:20'),
(6140, 18, 19, 'OC', 26, 'B4MM', ' ', 29800040, 6, '08:20'),
(6141, 18, 19, 'EF', 26, 'B4J', ' ', 5945762, 6, '08:20'),
(6142, 18, 19, 'CN', 26, 'B4V', ' ', 14091761, 6, '08:20'),
(6143, 18, 19, 'AP', 26, 'B5L', ' ', 15214479, 6, '08:20'),
(6144, 18, 19, 'ILE', 26, 'B5M', ' ', 29800040, 6, '08:20'),
(6145, 18, 19, 'CN', 26, 'B5MM', ' ', 14091761, 6, '08:20'),
(6146, 18, 19, 'EF', 26, 'B5J', ' ', 5945762, 6, '08:20'),
(6147, 18, 19, 'MA', 26, 'B5V', ' ', 25347183, 6, '08:20'),
(6148, 18, 19, 'AP', 26, 'B6L', ' ', 15214479, 6, '08:20'),
(6149, 18, 19, 'ILE', 26, 'B6M', ' ', 29800040, 6, '08:20'),
(6150, 18, 19, 'CN', 26, 'B6MM', ' ', 14091761, 6, '08:20'),
(6151, 18, 19, 'PGCRP', 26, 'B6J', ' ', 25347183, 6, '08:20'),
(6152, 18, 19, 'MA', 26, 'B6V', ' ', 25347183, 6, '08:20'),
(6153, 18, 19, 'ILE', 26, 'B7L', ' ', 29800040, 6, '08:20'),
(6154, 18, 19, 'MA', 26, 'B7MM', ' ', 25347183, 6, '08:20'),
(6155, 18, 19, 'PGCRP', 26, 'B7J', ' ', 25347183, 6, '08:20'),
(6156, 18, 19, 'CA', 26, 'B7V', ' ', 10143237, 6, '08:20'),
(6157, 18, 19, 'ILE', 26, 'B8L', ' ', 29800040, 6, '08:20'),
(6158, 18, 19, 'MA', 26, 'B8MM', ' ', 25347183, 6, '08:20'),
(6159, 18, 19, 'PGCRP', 26, 'B8J', ' ', 25347183, 6, '08:20'),
(6160, 18, 19, 'CA', 26, 'B8V', ' ', 10143237, 6, '08:20');

-- --------------------------------------------------------

--
-- Table structure for table `intervalo`
--

CREATE TABLE `intervalo` (
  `id` int NOT NULL,
  `intervalo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `intervalo`
--

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
(5, '10', 0),
(6, '40', 1),
(7, '45', 0);

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
(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active'),
(12, 12710000, '$2y$10$rk1LVXZoN56cdb1UOT7VO.J3j4Vi39g.1LqGaNEiN6dPB17UDTh1G', '', '', '', '', '', '', 'admin', 'new'),
(15, 15214479, '$2y$10$0AELJ3OJuaZwRxqOeRef8udxMiCE9b5/k5wMShASCzHyjFEU/sADm', '', '', '', '', '', '', 'profesor', 'new'),
(16, 15071661, '$2y$10$jiwLP0zsQQKN33KLP.Ob..eMVcdD57haA1efWBBr2qWYbSm9Mv4vy', '', '', '', '', '', '', 'profesor', 'new'),
(17, 14091761, '$2y$10$upjcc6Z.vBmJYRShy48Ece/z4ZuJlozIvNCDT17wRBpfZbquRjbie', '', '', '', '', '', '', 'profesor', 'new'),
(18, 29800040, '$2y$10$Dhd7KLprNTVq5zcauHlQ4u55.0oM6OXZgP.VtHpypQY.GEubnjsSK', '', '', '', '', '', '', 'profesor', 'new'),
(19, 25347183, '$2y$10$TrZHZIr/5Qc7YEbySeWw7u7iEtRP9PXkQMmFw11lYQV7feCpKkrmG', '', '', '', '', '', '', 'profesor', 'new'),
(20, 5945762, '$2y$10$5s5O94wcje2uKuN8Unc7E.E01sPXKQedJ2kwwsx3A5U8X4qp9vN66', '', '', '', '', '', '', 'profesor', 'new'),
(21, 10143237, '$2y$10$sfa3mZOpK7yhzEZwwkKmhOr43sO/0hjxM52DXsU2Y3tiOl4DjsxfS', '', '', '', '', '', '', 'profesor', 'new'),
(22, 4608560, '$2y$10$kYE/QOWeyuOwsZVyZrYMVeRKDb0WLM7fl7BuJP.Wt5w/RC4lnxkg2', '', '', '', '', '', '', 'admin', 'new'),
(23, 27576598, '$2y$10$aWAaKkzN5ZH3PZhhJCbWcOkfx8cYQ2oPyyeDF77KJkPA9NNAODEWG', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '¿Cuál es el nombre de tu escuela primaria?', '$2y$10$oyreTRaPRJIJpcvrlgCn8uGreex5GTAkYifkGdtw0Qlwdvv8/S4JS', '$2y$10$wCOboA6GSoqSlNxwmkQAuOQvA8MvHIiEetAXgq7EwVmBaQSFbFqOe', '$2y$10$N2VPQmeU/PThXn9LBwtTDOcbrAN7zI3RH.928zd2BWn9y4YJC5RCG', 'admin', 'active'),
(24, 5950682, '$2y$10$zQPpvq5dO1ChBMDTCKB2tuMg8dQ4lFz5FWJ7iPZAgNKSNfOEZ1r6a', '', '', '', '', '', '', 'coordinador', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `mensualidad`
--

CREATE TABLE `mensualidad` (
  `id` bigint NOT NULL,
  `ano_escolar` int NOT NULL,
  `mes` enum('inscripcion','enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `monto` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `mensualidad`
--

INSERT INTO `mensualidad` (`id`, `ano_escolar`, `mes`, `monto`) VALUES
(1, 18, 'agosto', 111),
(2, 18, 'agosto', 20);

-- --------------------------------------------------------

--
-- Table structure for table `meses_pagos`
--

CREATE TABLE `meses_pagos` (
  `cedula_estudiante` bigint NOT NULL,
  `mes` bigint NOT NULL DEFAULT '0',
  `ano_escolar` int NOT NULL,
  `ano_seccion` int NOT NULL,
  `abonado` float NOT NULL,
  `maximo` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `meses_pagos`
--

INSERT INTO `meses_pagos` (`cedula_estudiante`, `mes`, `ano_escolar`, `ano_seccion`, `abonado`, `maximo`) VALUES
(123456, 1, 18, 18, 500, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `meses_saldados`
--

CREATE TABLE `meses_saldados` (
  `id` bigint NOT NULL DEFAULT '0',
  `cedula_estudiante` bigint NOT NULL,
  `mes` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '0',
  `ano_escolar` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `ano_seccion` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `MontoBS` double NOT NULL,
  `MontoBCV` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `meses_saldados`
--

INSERT INTO `meses_saldados` (`id`, `cedula_estudiante`, `mes`, `ano_escolar`, `ano_seccion`, `fecha`, `MontoBS`, `MontoBCV`) VALUES
(0, 8585684, 'Enero', '2024-2025', '4to U', '2024-10-18', 400, 24);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `idPago` bigint NOT NULL,
  `cedula_estudiante` bigint NOT NULL,
  `cedula_representante` bigint NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `referencia_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `ano_escolar` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '0',
  `mes` bigint NOT NULL DEFAULT '0',
  `detalles` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `descuento` float NOT NULL DEFAULT '1',
  `nombresE` varchar(141) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombresR` varchar(141) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `monto` double DEFAULT '0',
  `tipo_pago` enum('dolar','bolivar') COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `dolarBCV` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`idPago`, `cedula_estudiante`, `cedula_representante`, `fecha`, `referencia_id`, `ano_escolar`, `mes`, `detalles`, `descuento`, `nombresE`, `nombresR`, `telefono`, `direccion`, `monto`, `tipo_pago`, `dolarBCV`) VALUES
(1, 8585684, 7595362, '2024-10-18', 'XD', '2024-2025', 1, 'LOL', 1, 'Carlos', 'Diaz', '0424', 'enrique segomviano', 200, 'dolar', 38.7);

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `cedula` bigint NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `personas`
--


INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo`) VALUES
(4608560, 'VICTOR', 'MENDOZA', 'ACARIGUA', '04121864925', 'correo'),
(5945762, 'EDUARDO', 'GARCíA', 'ACARIGUA', '04245830436', 'correo'),
(5950682, 'JULIO ALBERTO', 'SALóN', 'ACARIGUA', '04245687482', 'correo'),
(10143237, 'WILMER', 'GARCíA', 'ACARIGUA', '04128681905', 'correo'),
(12710000, 'TAHIRIS', 'VARGAS', 'EN UNA URBANIZACION', '04121541222', 'TahirisVargas@gmail.com'),
(14091761, 'MARYURI', 'RIVEROS', 'ACARIGUA', '04261105755', 'correo'),
(15071661, 'WILLIAMS', 'LUGO', 'ACARIGUA', '04245409631', 'correo'),
(15214479, 'AURORA', 'RIOS', 'ACARIGUA', '04145342254', 'correo'),
(25347183, 'LEONELBYS', 'LUCENA', 'ACARIGUA', '04123459120', 'correo'),
(27576598, 'VICTOR JULIO', 'MENDOZA VARGAS', 'ACARIGUA', '04125157986', 'correo'),
(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'irechamo@yolewadesi.unawaina'),
(29800040, 'VENUS', 'MARTINEZ', 'ACARIGUA', '04125304708', 'correo');

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
  `id` bigint NOT NULL,
  `profesor` bigint NOT NULL,
  `materia` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `profesores_materias`
--

INSERT INTO `profesores_materias` (`id`, `profesor`, `materia`) VALUES
(219, 15071661, 'BI'),
(220, 15071661, 'CN'),
(227, 14091761, 'CT'),
(228, 14091761, 'QU'),
(266, 5945762, 'EF'),
(267, 5945762, 'FSN'),
(268, 5945762, 'OC'),
(269, 5945762, 'PGCRP'),
(270, 5945762, 'TC'),
(271, 10143237, 'CA'),
(272, 10143237, 'OC'),
(273, 10143237, 'PGCRP'),
(274, 10143237, 'TC'),
(275, 15214479, 'AP'),
(276, 15214479, 'GHC'),
(277, 15214479, 'OC'),
(278, 15214479, 'PGCRP'),
(279, 15214479, 'TC'),
(280, 25347183, 'FI'),
(281, 25347183, 'MA'),
(282, 25347183, 'OC'),
(283, 25347183, 'PGCRP'),
(284, 25347183, 'TC'),
(285, 29800040, 'ILE'),
(286, 29800040, 'OC'),
(287, 29800040, 'PGCRP'),
(288, 29800040, 'TC'),
(289, 5945762, 'EF'),
(290, 5945762, 'FSN'),
(291, 5945762, 'OC'),
(292, 5945762, 'PGCRP'),
(293, 5945762, 'TC'),
(294, 14091761, 'CN'),
(295, 15071661, 'CN');

-- --------------------------------------------------------

--
-- Table structure for table `representante`
--

CREATE TABLE `representante` (
  `cedula_representante` bigint NOT NULL DEFAULT '0',
  `nombres` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '0',
  `telefono_2` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `representante`
--

INSERT INTO `representante` (`cedula_representante`, `nombres`, `apellidos`, `correo`, `direccion`, `telefono`, `telefono_2`) VALUES
(7595361, 'Obama', 'Clinton', 'casa', 'Casa', '04122696463', '04245552194'),
(7595362, 'Hillaryg', 'Clinton', 'casa', 'Casa', '04122696463', '04245552194'),
(7595365, 'Orlando', 'Mendez', 'casa', 'Casa', '04122696463', '04245552194'),
(75953625, 'Hillaryg', 'Clinton', 'casa', 'Casa', '04122696463', '04245552194');

-- --------------------------------------------------------

--
-- Table structure for table `representante-representado`
--

CREATE TABLE `representante-representado` (
  `cedula_estudiante` bigint NOT NULL,
  `cedula_representante` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `representante-representado`
--

INSERT INTO `representante-representado` (`cedula_estudiante`, `cedula_representante`) VALUES
(8585684, 7595361),
(19282324, 7595365),
(29629080, 7595365),
(74545958, 7595365),
(30294676, 75953625);
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


--
-- Indexes for table `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`codigo_id`);

--
-- Indexes for table `dolar`
--
ALTER TABLE `dolar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`cedula_estudiante`),
  ADD KEY `FK_estudiante_ano_escolar` (`ano`);

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
-- Indexes for table `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mensualidad_ano_escolar` (`ano_escolar`);

--
-- Indexes for table `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD PRIMARY KEY (`cedula_estudiante`,`ano_escolar`),
  ADD KEY `FK_meses_pagos_estudiante` (`cedula_estudiante`),
  ADD KEY `FK_meses_pagos_ano_escolar` (`ano_escolar`),
  ADD KEY `FK_meses_pagos_ano_seccion` (`ano_seccion`),
  ADD KEY `FK_meses_pagos_mensualidad` (`mes`);

--
-- Indexes for table `meses_saldados`
--
ALTER TABLE `meses_saldados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_meses_saldados_estudiante` (`cedula_estudiante`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `FK_pagos_estudiante` (`cedula_estudiante`),
  ADD KEY `FK_pagos_representante` (`cedula_representante`),
  ADD KEY `FK_pagos_ano_escolar` (`ano_escolar`),
  ADD KEY `FK_pagos_mensualidad` (`mes`);

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
-- Indexes for table `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`cedula_representante`);

--
-- Indexes for table `representante-representado`
--
ALTER TABLE `representante-representado`
  ADD PRIMARY KEY (`cedula_estudiante`),
  ADD KEY `FK_representante-representado_representante` (`cedula_representante`),
  ADD KEY `FK2_cedula_estudiante` (`cedula_estudiante`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ano_escolar`
--
ALTER TABLE `ano_escolar`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3970;

--
-- AUTO_INCREMENT for table `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_estudiante_ano_escolar` FOREIGN KEY (`ano`) REFERENCES `ano_escolar` (`nombre`) ON UPDATE CASCADE;

--
-- Constraints for table `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  ADD CONSTRAINT `FK_horario_estudiante_ano_escolar` FOREIGN KEY (`codigo_a_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_ano_seccion` FOREIGN KEY (`codigo_a_y_seccion`) REFERENCES `ano_seccion` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_asignatura` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignatura` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_aula` FOREIGN KEY (`codigo_aula`) REFERENCES `aula` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_profesores_materias` FOREIGN KEY (`profesor`) REFERENCES `profesores_materias` (`profesor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_personas` FOREIGN KEY (`username`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `FK_mensualidad_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD CONSTRAINT `FK_meses_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_ano_seccion` FOREIGN KEY (`ano_seccion`) REFERENCES `ano_seccion` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_mensualidad` FOREIGN KEY (`mes`) REFERENCES `mensualidad` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `meses_saldados`
--
ALTER TABLE `meses_saldados`
  ADD CONSTRAINT `FK_meses_saldados_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE;

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FK_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_mensualidad` FOREIGN KEY (`mes`) REFERENCES `mensualidad` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_representante` FOREIGN KEY (`cedula_representante`) REFERENCES `representante` (`cedula_representante`) ON UPDATE CASCADE;

--
-- Constraints for table `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD CONSTRAINT `FK_profesores_materias_asignatura` FOREIGN KEY (`materia`) REFERENCES `asignatura` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profesores_materias_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `representante-representado`
--
ALTER TABLE `representante-representado`
  ADD CONSTRAINT `FK2_cedula_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_representante-representado_representante` FOREIGN KEY (`cedula_representante`) REFERENCES `representante` (`cedula_representante`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
