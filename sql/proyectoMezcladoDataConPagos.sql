-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-10-2024 a las 12:51:54
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano_escolar`
--

CREATE TABLE `ano_escolar` (
  `codigo` int NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `activo` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_escolar`
--

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(18, '2024-2025', '2024-10-07', '2025-07-31', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano_seccion`
--

CREATE TABLE `ano_seccion` (
  `codigo` int NOT NULL,
  `ano` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `seccion` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_seccion`
--

INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`) VALUES
(18, '1ero', 'U'),
(19, '2do', 'U'),
(20, '5to', 'U'),
(21, '4to', 'U'),
(22, '3ero', 'U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `codigo` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
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
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `codigo` int NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `disponibilidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aula`
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
-- Estructura de tabla para la tabla `bitacora`
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
-- Volcado de datos para la tabla `bitacora`
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
(38, '2024-09-29 10:25:43', 27576598, 'login', '27576598 ha ingresado al sistema.', 'Tahiris-PC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_inst`
--

CREATE TABLE `datos_inst` (
  `direccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre_institucion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_semana`
--

CREATE TABLE `dias_semana` (
  `codigo` int NOT NULL,
  `dia` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dias_semana`
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
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `codigo_id` int NOT NULL,
  `disponible` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`codigo_id`, `disponible`) VALUES
(0, 'No disponible'),
(1, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dolar`
--

CREATE TABLE `dolar` (
  `id` int NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `dolar`
--

INSERT INTO `dolar` (`id`, `precio`) VALUES
(1, 36.8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `cedula_estudiante` bigint NOT NULL DEFAULT '0',
  `nombres` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellidos` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `ano` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `seccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`cedula_estudiante`, `nombres`, `apellidos`, `ano`, `seccion`) VALUES
(123456, 'lol', 'lolol', '2024-2025', '1ero U'),
(8585684, 'Carlos', 'Diaz', '2024-2025', '3ero U'),
(19282324, 'Carlos', 'Diaz', '2024-2025', '5to U'),
(29629080, 'Angel Orlando', 'Mendez Mendoza', '2024-2025', '1ero U'),
(30294676, 'Carlos', 'Diaz', '2024-2025', '3ero U'),
(74545958, 'Juan Jose', 'Mendez', '2024-2025', '1ero U');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_estudiante`
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
-- Volcado de datos para la tabla `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`, `receso`) VALUES
(3576, 18, 19, 'ILE', 26, 'B1M', ' ', 29800040, 6, '08:20'),
(3577, 18, 19, 'AP', 26, 'B1MM', ' ', 15214479, 6, '08:20'),
(3578, 18, 19, 'MA', 26, 'B1J', ' ', 25347183, 6, '08:20'),
(3579, 18, 19, 'AP', 26, 'B1V', ' ', 15214479, 6, '08:20'),
(3580, 18, 19, 'TC', 26, 'B2L', ' ', 15214479, 6, '08:20'),
(3581, 18, 19, 'ILE', 26, 'B2M', ' ', 29800040, 6, '08:20'),
(3582, 18, 19, 'AP', 26, 'B2MM', ' ', 15214479, 6, '08:20'),
(3583, 18, 19, 'MA', 26, 'B2J', ' ', 25347183, 6, '08:20'),
(3584, 18, 19, 'AP', 26, 'B2V', ' ', 15214479, 6, '08:20'),
(3585, 18, 19, 'CA', 26, 'B3L', ' ', NULL, 6, '08:20'),
(3586, 18, 19, 'CN', 26, 'B3M', ' ', 15071661, 6, '08:20'),
(3587, 18, 19, 'OC', 26, 'B3J', ' ', 25347183, 6, '08:20'),
(3588, 18, 19, 'GHC', 26, 'B3V', ' ', 15214479, 6, '08:20'),
(3589, 18, 19, 'CA', 26, 'B4L', ' ', NULL, 6, '08:20'),
(3590, 18, 19, 'CN', 26, 'B4M', ' ', 15071661, 6, '08:20'),
(3591, 18, 19, 'CA', 26, 'B4MM', ' ', 10143237, 6, '08:20'),
(3592, 18, 19, 'OC', 26, 'B4J', ' ', 25347183, 6, '08:20'),
(3593, 18, 19, 'GHC', 26, 'B4V', ' ', 15214479, 6, '08:20'),
(3594, 18, 19, 'CA', 26, 'B5L', ' ', NULL, 6, '08:20'),
(3595, 18, 19, 'CN', 26, 'B5M', ' ', 15071661, 6, '08:20'),
(3596, 18, 19, 'CN', 26, 'B5MM', ' ', 15071661, 6, '08:20'),
(3597, 18, 19, 'ILE', 26, 'B5V', ' ', 29800040, 6, '08:20'),
(3598, 18, 19, 'GHC', 26, 'B6L', ' ', NULL, 6, '08:20'),
(3599, 18, 19, 'EF', 26, 'B6M', ' ', NULL, 6, '08:20'),
(3600, 18, 19, 'CN', 26, 'B6MM', ' ', 15071661, 6, '08:20'),
(3601, 18, 19, 'PGCRP', 26, 'B6J', ' ', NULL, 6, '08:20'),
(3602, 18, 19, 'ILE', 26, 'B6V', ' ', 29800040, 6, '08:20'),
(3603, 18, 19, 'GHC', 26, 'B7L', ' ', NULL, 6, '08:20'),
(3604, 18, 19, 'EF', 26, 'B7M', ' ', NULL, 6, '08:20'),
(3605, 18, 19, 'MA', 26, 'B7MM', ' ', 25347183, 6, '08:20'),
(3606, 18, 19, 'PGCRP', 26, 'B7J', ' ', NULL, 6, '08:20'),
(3607, 18, 19, 'ILE', 26, 'B7V', ' ', 29800040, 6, '08:20'),
(3608, 18, 19, 'GHC', 26, 'B8L', ' ', NULL, 6, '08:20'),
(3609, 18, 19, 'EF', 26, 'B8M', ' ', NULL, 6, '08:20'),
(3610, 18, 19, 'MA', 26, 'B8MM', ' ', 25347183, 6, '08:20'),
(3611, 18, 19, 'PGCRP', 26, 'B8J', ' ', NULL, 6, '08:20'),
(3766, 18, 18, 'AP', 25, 'B1M', ' ', 15214479, 6, '08:20'),
(3767, 18, 18, 'CN', 25, 'B1MM', ' ', 15071661, 6, '08:20'),
(3768, 18, 18, 'CA', 25, 'B1J', ' ', 10143237, 6, '08:20'),
(3769, 18, 18, 'ILE', 25, 'B1V', ' ', 29800040, 6, '08:20'),
(3770, 18, 18, 'OC', 25, 'B2L', ' ', 29800040, 6, '08:20'),
(3771, 18, 18, 'AP', 25, 'B2M', ' ', 15214479, 6, '08:20'),
(3772, 18, 18, 'CN', 25, 'B2MM', ' ', 15071661, 6, '08:20'),
(3773, 18, 18, 'CA', 25, 'B2J', ' ', 10143237, 6, '08:20'),
(3774, 18, 18, 'ILE', 25, 'B2V', ' ', 29800040, 6, '08:20'),
(3775, 18, 18, 'GHC', 25, 'B3L', ' ', 15214479, 6, '08:20'),
(3776, 18, 18, 'OC', 25, 'B3M', ' ', 25347183, 6, '08:20'),
(3777, 18, 18, 'MA', 25, 'B3MM', ' ', 25347183, 6, '08:20'),
(3778, 18, 18, 'EF', 25, 'B3J', ' ', 5945762, 6, '08:20'),
(3779, 18, 18, 'CA', 25, 'B3V', ' ', 10143237, 6, '08:20'),
(3780, 18, 18, 'GHC', 25, 'B4L', ' ', 15214479, 6, '08:20'),
(3781, 18, 18, 'GHC', 25, 'B4M', ' ', 15214479, 6, '08:20'),
(3782, 18, 18, 'MA', 25, 'B4MM', ' ', 25347183, 6, '08:20'),
(3783, 18, 18, 'EF', 25, 'B4J', ' ', 5945762, 6, '08:20'),
(3784, 18, 18, 'CA', 25, 'B4V', ' ', 10143237, 6, '08:20'),
(3785, 18, 18, 'GHC', 25, 'B5L', ' ', 15214479, 6, '08:20'),
(3786, 18, 18, 'GHC', 25, 'B5M', ' ', 15214479, 6, '08:20'),
(3787, 18, 18, 'AP', 25, 'B5MM', ' ', 15214479, 6, '08:20'),
(3788, 18, 18, 'EF', 25, 'B5J', ' ', 5945762, 6, '08:20'),
(3789, 18, 18, 'TC', 25, 'B5V', ' ', 15214479, 6, '08:20'),
(3790, 18, 18, 'CN', 25, 'B6L', ' ', 15071661, 6, '08:20'),
(3791, 18, 18, 'ILE', 25, 'B6M', ' ', 29800040, 6, '08:20'),
(3792, 18, 18, 'AP', 25, 'B6MM', ' ', 15214479, 6, '08:20'),
(3793, 18, 18, 'PGCRP', 25, 'B6J', ' ', NULL, 6, '08:20'),
(3794, 18, 18, 'MA', 25, 'B6V', ' ', 25347183, 6, '08:20'),
(3795, 18, 18, 'CN', 25, 'B7L', ' ', 15071661, 6, '08:20'),
(3796, 18, 18, 'ILE', 25, 'B7M', ' ', 29800040, 6, '08:20'),
(3797, 18, 18, 'ILE', 25, 'B7MM', ' ', 29800040, 6, '08:20'),
(3798, 18, 18, 'PGCRP', 25, 'B7J', ' ', NULL, 6, '08:20'),
(3799, 18, 18, 'MA', 25, 'B7V', ' ', 25347183, 6, '08:20'),
(3800, 18, 18, 'CN', 25, 'B8L', ' ', 15071661, 6, '08:20'),
(3801, 18, 18, 'ILE', 25, 'B8M', ' ', 29800040, 6, '08:20'),
(3802, 18, 18, 'PGCRP', 25, 'B8J', ' ', NULL, 6, '08:20'),
(3842, 18, 22, 'OC', 27, 'B1M', ' ', 5945762, 6, '08:20'),
(3843, 18, 22, 'FI', 27, 'B1MM', ' ', 25347183, 6, '08:20'),
(3844, 18, 22, 'GHC', 27, 'B1J', ' ', 15214479, 6, '08:20'),
(3845, 18, 22, 'FI', 27, 'B1V', ' ', 25347183, 6, '08:20'),
(3846, 18, 22, 'MA', 27, 'B2L', ' ', 25347183, 6, '08:20'),
(3847, 18, 22, 'OC', 27, 'B2M', ' ', 5945762, 6, '08:20'),
(3848, 18, 22, 'FI', 27, 'B2MM', ' ', 25347183, 6, '08:20'),
(3849, 18, 22, 'GHC', 27, 'B2J', ' ', 15214479, 6, '08:20'),
(3850, 18, 22, 'FI', 27, 'B2V', ' ', 25347183, 6, '08:20'),
(3851, 18, 22, 'MA', 27, 'B3L', ' ', 25347183, 6, '08:20'),
(3852, 18, 22, 'EF', 30, 'B3M', ' ', 5945762, 6, '08:20'),
(3853, 18, 22, 'QU', 27, 'B3MM', ' ', 14091761, 6, '08:20'),
(3854, 18, 22, 'CA', 27, 'B3J', ' ', 10143237, 6, '08:20'),
(3855, 18, 22, 'ILE', 27, 'B3V', ' ', NULL, 6, '08:20'),
(3856, 18, 22, 'QU', 27, 'B4L', ' ', 14091761, 6, '08:20'),
(3857, 18, 22, 'EF', 30, 'B4M', ' ', 5945762, 6, '08:20'),
(3858, 18, 22, 'BI', 27, 'B4MM', ' ', 15071661, 6, '08:20'),
(3859, 18, 22, 'ILE', 27, 'B4J', ' ', 29800040, 6, '08:20'),
(3860, 18, 22, 'ILE', 27, 'B4V', ' ', 29800040, 6, '08:20'),
(3861, 18, 22, 'QU', 27, 'B5L', ' ', 14091761, 6, '08:20'),
(3862, 18, 22, 'EF', 30, 'B5M', ' ', 5945762, 6, '08:20'),
(3863, 18, 22, 'MA', 27, 'B5MM', ' ', 25347183, 6, '08:20'),
(3864, 18, 22, 'ILE', 27, 'B5J', ' ', 29800040, 6, '08:20'),
(3865, 18, 22, 'CA', 27, 'B5V', ' ', 10143237, 6, '08:20'),
(3866, 18, 22, 'QU', 27, 'B6L', ' ', 14091761, 6, '08:20'),
(3867, 18, 22, 'BI', 27, 'B6M', ' ', 15071661, 6, '08:20'),
(3868, 18, 22, 'MA', 27, 'B6MM', ' ', 25347183, 6, '08:20'),
(3869, 18, 22, 'PGCRP', 27, 'B6J', ' ', NULL, 6, '08:20'),
(3870, 18, 22, 'GHC', 27, 'B6V', ' ', 15214479, 6, '08:20'),
(3871, 18, 22, 'CA', 27, 'B7L', ' ', 10143237, 6, '08:20'),
(3872, 18, 22, 'BI', 27, 'B7M', ' ', 15071661, 6, '08:20'),
(3873, 18, 22, 'GHC', 27, 'B7MM', ' ', 15214479, 6, '08:20'),
(3874, 18, 22, 'PGCRP', 27, 'B7J', ' ', NULL, 6, '08:20'),
(3875, 18, 22, 'TC', 27, 'B7V', ' ', 5945762, 6, '08:20'),
(3876, 18, 22, 'CA', 27, 'B8L', ' ', 10143237, 6, '08:20'),
(3877, 18, 22, 'BI', 27, 'B8M', ' ', 15071661, 6, '08:20'),
(3878, 18, 22, 'GHC', 27, 'B8MM', ' ', 15214479, 6, '08:20'),
(3879, 18, 22, 'PGCRP', 27, 'B8J', ' ', NULL, 6, '08:20'),
(3880, 18, 22, 'TC', 27, 'B8V', ' ', 5945762, 6, '08:20'),
(3881, 18, 21, 'FI', 28, 'B1M', ' ', 25347183, 6, '09:00'),
(3882, 18, 21, 'ILE', 28, 'B1MM', ' ', 29800040, 6, '09:00'),
(3883, 18, 21, 'FSN', 28, 'B1J', ' ', NULL, 6, '09:00'),
(3884, 18, 21, 'CA', 28, 'B1V', ' ', 10143237, 6, '09:00'),
(3885, 18, 21, 'QU', 28, 'B2L', ' ', 14091761, 6, '09:00'),
(3886, 18, 21, 'FI', 28, 'B2M', ' ', 25347183, 6, '09:00'),
(3887, 18, 21, 'ILE', 28, 'B2MM', ' ', 29800040, 6, '09:00'),
(3888, 18, 21, 'FSN', 28, 'B2J', ' ', NULL, 6, '09:00'),
(3889, 18, 21, 'CA', 28, 'B2V', ' ', 10143237, 6, '09:00'),
(3890, 18, 21, 'QU', 28, 'B3L', ' ', 14091761, 6, '09:00'),
(3891, 18, 21, 'GHC', 28, 'B3M', ' ', 15214479, 6, '09:00'),
(3892, 18, 21, 'ILE', 28, 'B3MM', ' ', 29800040, 6, '09:00'),
(3893, 18, 21, 'MA', 28, 'B3V', ' ', 25347183, 6, '09:00'),
(3894, 18, 21, 'BI', 28, 'B4L', ' ', 15071661, 6, '09:00'),
(3895, 18, 21, 'ILE', 28, 'B4M', ' ', 29800040, 6, '09:00'),
(3896, 18, 21, 'GHC', 28, 'B4MM', ' ', 15214479, 6, '09:00'),
(3897, 18, 21, 'GHC', 28, 'B4J', ' ', 15214479, 6, '09:00'),
(3898, 18, 21, 'EF', 28, 'B4V', ' ', 5945762, 6, '09:00'),
(3899, 18, 21, 'BI', 28, 'B5L', ' ', 15071661, 6, '09:00'),
(3900, 18, 21, 'ILE', 28, 'B5M', ' ', 29800040, 6, '09:00'),
(3901, 18, 21, 'QU', 28, 'B5MM', ' ', 14091761, 6, '09:00'),
(3902, 18, 21, 'GHC', 28, 'B5J', ' ', 15214479, 6, '09:00'),
(3903, 18, 21, 'EF', 28, 'B5V', ' ', 5945762, 6, '09:00'),
(3904, 18, 21, 'ILE', 28, 'B6L', ' ', 29800040, 6, '09:00'),
(3905, 18, 21, 'MA', 28, 'B6M', ' ', 25347183, 6, '09:00'),
(3906, 18, 21, 'QU', 28, 'B6MM', ' ', 14091761, 6, '09:00'),
(3907, 18, 21, 'PGCRP', 28, 'B6J', ' ', NULL, 6, '09:00'),
(3908, 18, 21, 'EF', 28, 'B6V', ' ', 5945762, 6, '09:00'),
(3909, 18, 21, 'FI', 28, 'B7L', ' ', 25347183, 6, '09:00'),
(3910, 18, 21, 'MA', 28, 'B7M', ' ', 25347183, 6, '09:00'),
(3911, 18, 21, 'BI', 28, 'B7MM', ' ', 15071661, 6, '09:00'),
(3912, 18, 21, 'PGCRP', 28, 'B7J', ' ', NULL, 6, '09:00'),
(3913, 18, 21, 'OC', 28, 'B7V', ' ', 15214479, 6, '09:00'),
(3914, 18, 21, 'FI', 28, 'B8L', ' ', 25347183, 6, '09:00'),
(3915, 18, 21, 'MA', 28, 'B8M', ' ', 25347183, 6, '09:00'),
(3916, 18, 21, 'BI', 28, 'B8MM', ' ', 15071661, 6, '09:00'),
(3917, 18, 21, 'PGCRP', 28, 'B8J', ' ', NULL, 6, '09:00'),
(3918, 18, 21, 'OC', 28, 'B8V', ' ', 15214479, 6, '09:00'),
(3919, 18, 20, 'BI', 29, 'B1M', ' ', 15071661, 6, '09:00'),
(3920, 18, 20, 'CT', 29, 'B1MM', ' ', 14091761, 6, '09:00'),
(3921, 18, 20, 'ILE', 29, 'B1J', ' ', 29800040, 6, '09:00'),
(3922, 18, 20, 'FSN', 29, 'B1V', ' ', NULL, 6, '09:00'),
(3923, 18, 20, 'BI', 29, 'B2L', ' ', 15071661, 6, '09:00'),
(3924, 18, 20, 'BI', 29, 'B2M', ' ', 15071661, 6, '09:00'),
(3925, 18, 20, 'CT', 29, 'B2MM', ' ', 14091761, 6, '09:00'),
(3926, 18, 20, 'ILE', 29, 'B2J', ' ', 29800040, 6, '09:00'),
(3927, 18, 20, 'FSN', 29, 'B2V', ' ', NULL, 6, '09:00'),
(3928, 18, 20, 'BI', 29, 'B3L', ' ', 15071661, 6, '09:00'),
(3929, 18, 20, 'FI', 29, 'B3M', ' ', NULL, 6, '09:00'),
(3930, 18, 20, 'CA', 29, 'B3MM', ' ', 10143237, 6, '09:00'),
(3931, 18, 20, 'ILE', 29, 'B3J', ' ', 29800040, 6, '09:00'),
(3932, 18, 20, 'ILE', 29, 'B3V', ' ', 29800040, 6, '09:00'),
(3933, 18, 20, 'FI', 29, 'B4L', ' ', 25347183, 6, '09:00'),
(3934, 18, 20, 'MA', 29, 'B4M', ' ', 25347183, 6, '09:00'),
(3935, 18, 20, 'EF', 29, 'B4MM', ' ', 5945762, 6, '09:00'),
(3936, 18, 20, 'CA', 29, 'B4J', ' ', 10143237, 6, '09:00'),
(3937, 18, 20, 'MA', 29, 'B4V', ' ', 25347183, 6, '09:00'),
(3938, 18, 20, 'FI', 29, 'B5L', ' ', 25347183, 6, '09:00'),
(3939, 18, 20, 'MA', 29, 'B5M', ' ', 25347183, 6, '09:00'),
(3940, 18, 20, 'EF', 29, 'B5MM', ' ', 5945762, 6, '09:00'),
(3941, 18, 20, 'CA', 29, 'B5J', ' ', 10143237, 6, '09:00'),
(3942, 18, 20, 'MA', 29, 'B5V', ' ', 25347183, 6, '09:00'),
(3943, 18, 20, 'FI', 29, 'B6L', ' ', 25347183, 6, '09:00'),
(3944, 18, 20, 'GHC', 29, 'B6M', ' ', 15214479, 6, '09:00'),
(3945, 18, 20, 'EF', 29, 'B6MM', ' ', 5945762, 6, '09:00'),
(3946, 18, 20, 'PGCRP', 29, 'B6J', ' ', NULL, 6, '09:00'),
(3947, 18, 20, 'CA', 29, 'B6V', ' ', 10143237, 6, '09:00'),
(3948, 18, 20, 'QU', 29, 'B7L', ' ', 14091761, 6, '09:00'),
(3949, 18, 20, 'GHC', 29, 'B7M', ' ', 15214479, 6, '09:00'),
(3950, 18, 20, 'QU', 29, 'B7MM', ' ', 14091761, 6, '09:00'),
(3951, 18, 20, 'PGCRP', 29, 'B7J', ' ', NULL, 6, '09:00'),
(3952, 18, 20, 'CA', 29, 'B7V', ' ', 10143237, 6, '09:00'),
(3953, 18, 20, 'QU', 29, 'B8L', ' ', 14091761, 6, '09:00'),
(3954, 18, 20, 'GHC', 29, 'B8M', ' ', 15214479, 6, '09:00'),
(3955, 18, 20, 'QU', 29, 'B8MM', ' ', 14091761, 6, '09:00'),
(3956, 18, 20, 'PGCRP', 29, 'B8J', ' ', NULL, 6, '09:00'),
(3957, 18, 20, 'OC', 29, 'B8V', ' ', 10143237, 6, '09:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intervalo`
--

CREATE TABLE `intervalo` (
  `id` int NOT NULL,
  `intervalo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `intervalo`
--

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
(5, '10', 0),
(6, '40', 1),
(7, '45', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
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
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `security_q_1`, `security_q_2`, `security_q_3`, `security_a_1`, `security_a_2`, `security_a_3`, `rol`, `status`) VALUES
(4, 27564672, '$2y$10$2LdbHmQeaN5.amJ86/gQFeZAK9Mb6fdZ2.bDZkqM9kWv5/1mXjERi', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$nmlXTunPzLLb5VrsRBZ7y.rr.RO0rAhszWg.H5HQP4ORBeAwyO7X2', '$2y$10$yv6lnXbkvRPxsW/GjqWWmulj1wAxhfgHzb6n7SUciFngJWVbdCA6C', '$2y$10$PwpOMuTvWGFmKcVGwW41He90ksoCzKG6DyT0kCJo7WveqSBxBOoIi', 'profesor', 'active'),
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
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE `mensualidad` (
  `ano_escolar` int NOT NULL,
  `mes` float NOT NULL DEFAULT '0',
  `monto` float NOT NULL DEFAULT '0',
  `fecha` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses_pagos`
--

CREATE TABLE `meses_pagos` (
  `cedula_estudiante` bigint NOT NULL,
  `mes` int NOT NULL,
  `ano_escolar` int NOT NULL,
  `ano_seccion` int NOT NULL,
  `abonado` float NOT NULL,
  `maximo` int NOT NULL,
  `saldado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `meses_pagos`
--

INSERT INTO `meses_pagos` (`cedula_estudiante`, `mes`, `ano_escolar`, `ano_seccion`, `abonado`, `maximo`, `saldado`) VALUES
(123456, 1, 18, 18, 500, 1000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` bigint NOT NULL,
  `cedula_representante` bigint NOT NULL DEFAULT '0',
  `monto` float NOT NULL DEFAULT '0',
  `fecha` date NOT NULL,
  `referencia_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `ano_escolar` int NOT NULL DEFAULT '0',
  `mes` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `detalles` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
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
-- Volcado de datos para la tabla `personas`
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
(27564672, 'NIRETCIA INMACULADA', 'RAMIREZ VALERO', 'Venezuela, Portuguesa, Guanare Urbanizacion la Verguisa entre la calle 13 y 2 , casa numero 10', '04161234567', 'equisde@gmail.com'),
(27576598, 'VICTOR JULIO', 'MENDOZA VARGAS', 'ACARIGUA', '04125157986', 'correo'),
(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'irechamo@yolewadesi.unawaina'),
(29800040, 'VENUS', 'MARTINEZ', 'ACARIGUA', '04125304708', 'correo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_seguridad`
--

CREATE TABLE `preguntas_seguridad` (
  `id` int NOT NULL,
  `pregunta` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `preguntas_seguridad`
--

INSERT INTO `preguntas_seguridad` (`id`, `pregunta`) VALUES
(1, '¿Como se llama tu mama?'),
(2, '¿Cuando es tu Cumpleaños?'),
(3, '¿Te gustan los gatos o perros?'),
(4, '¿Cual es tu color favorito?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_materias`
--

CREATE TABLE `profesores_materias` (
  `id` bigint NOT NULL,
  `profesor` bigint NOT NULL,
  `materia` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `profesores_materias`
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
(288, 29800040, 'TC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
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
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`cedula_representante`, `nombres`, `apellidos`, `correo`, `direccion`, `telefono`, `telefono_2`) VALUES
(7595361, 'Obama', 'Clinton', 'casa', 'Casa', '04122696463', '04245552194'),
(7595362, 'Hillary', 'Clinton', 'casa', 'Casa', '04122696463', '04245552194'),
(7595365, 'Orlando', 'Mendez', 'casa', 'Casa', '04122696463', '04245552194');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante-representado`
--

CREATE TABLE `representante-representado` (
  `cedula_estudiante` bigint NOT NULL,
  `cedula_representante` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `representante-representado`
--

INSERT INTO `representante-representado` (`cedula_estudiante`, `cedula_representante`) VALUES
(8585684, 7595361),
(30294676, 7595362),
(19282324, 7595365),
(29629080, 7595365),
(74545958, 7595365);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ano_escolar`
--
ALTER TABLE `ano_escolar`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `fecha_inicio` (`fecha_inicio`,`fecha_fin`),
  ADD UNIQUE KEY `nombre_2` (`nombre`,`fecha_inicio`,`fecha_fin`);

--
-- Indices de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `disponibilidad` (`disponibilidad`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dias_semana`
--
ALTER TABLE `dias_semana`
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`codigo_id`);

--
-- Indices de la tabla `dolar`
--
ALTER TABLE `dolar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`cedula_estudiante`),
  ADD KEY `FK_estudiante_ano_escolar` (`ano`);

--
-- Indices de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_a_escolar` (`codigo_a_escolar`,`codigo_a_y_seccion`,`codigo_asignatura`,`codigo_aula`,`codigo_dia`),
  ADD KEY `FK_horario_estudiante_personas` (`profesor`),
  ADD KEY `FK_horario_estudiante_asignatura` (`codigo_asignatura`),
  ADD KEY `FK_horario_estudiante_aula` (`codigo_aula`),
  ADD KEY `FK_horario_estudiante_ano_seccion` (`codigo_a_y_seccion`);

--
-- Indices de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD KEY `FK_mensualidad_ano_escolar` (`ano_escolar`);

--
-- Indices de la tabla `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD PRIMARY KEY (`cedula_estudiante`,`ano_escolar`),
  ADD KEY `FK_meses_pagos_estudiante` (`cedula_estudiante`),
  ADD KEY `FK_meses_pagos_ano_escolar` (`ano_escolar`),
  ADD KEY `FK_meses_pagos_ano_seccion` (`ano_seccion`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `FK_pagos_representante` (`cedula_representante`),
  ADD KEY `FK_pagos_ano_escolar` (`ano_escolar`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_profesores_materias_personas` (`profesor`),
  ADD KEY `FK_profesores_materias_asignatura` (`materia`);

--
-- Indices de la tabla `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`cedula_representante`);

--
-- Indices de la tabla `representante-representado`
--
ALTER TABLE `representante-representado`
  ADD PRIMARY KEY (`cedula_estudiante`),
  ADD KEY `FK_representante-representado_representante` (`cedula_representante`),
  ADD KEY `FK2_cedula_estudiante` (`cedula_estudiante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ano_escolar`
--
ALTER TABLE `ano_escolar`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3958;

--
-- AUTO_INCREMENT de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_estudiante_ano_escolar` FOREIGN KEY (`ano`) REFERENCES `ano_escolar` (`nombre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  ADD CONSTRAINT `FK_horario_estudiante_ano_escolar` FOREIGN KEY (`codigo_a_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_ano_seccion` FOREIGN KEY (`codigo_a_y_seccion`) REFERENCES `ano_seccion` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_asignatura` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignatura` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_aula` FOREIGN KEY (`codigo_aula`) REFERENCES `aula` (`codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_horario_estudiante_profesores_materias` FOREIGN KEY (`profesor`) REFERENCES `profesores_materias` (`profesor`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_personas` FOREIGN KEY (`username`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `FK_mensualidad_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD CONSTRAINT `FK_meses_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_ano_seccion` FOREIGN KEY (`ano_seccion`) REFERENCES `ano_seccion` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FK_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`),
  ADD CONSTRAINT `FK_pagos_representante` FOREIGN KEY (`cedula_representante`) REFERENCES `representante` (`cedula_representante`);

--
-- Filtros para la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD CONSTRAINT `FK_profesores_materias_asignatura` FOREIGN KEY (`materia`) REFERENCES `asignatura` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profesores_materias_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `representante-representado`
--
ALTER TABLE `representante-representado`
  ADD CONSTRAINT `FK2_cedula_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_representante-representado_representante` FOREIGN KEY (`cedula_representante`) REFERENCES `representante` (`cedula_representante`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
