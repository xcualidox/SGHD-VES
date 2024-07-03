-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-11-2023 a las 00:04:57
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

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
CREATE DATABASE IF NOT EXISTS `proyecto` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `proyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano_escolar`
--

DROP TABLE IF EXISTS `ano_escolar`;
CREATE TABLE IF NOT EXISTS `ano_escolar` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `fecha_inicio` (`fecha_inicio`,`fecha_fin`),
  UNIQUE KEY `nombre_2` (`nombre`,`fecha_inicio`,`fecha_fin`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_escolar`
--

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(16, '2022', '2023-07-23', '2023-07-27'),
(17, '2023', '2023-08-15', '2023-08-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano_seccion`
--

DROP TABLE IF EXISTS `ano_seccion`;
CREATE TABLE IF NOT EXISTS `ano_seccion` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `ano` varchar(4) NOT NULL,
  `seccion` varchar(1) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_seccion`
--

INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`) VALUES
(18, '1ero', 'A'),
(19, '2do', 'B'),
(20, '5to', 'C'),
(21, '4to', 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`codigo`, `nombre`) VALUES
('1ad', 'Asd'),
('sad', 'Triste');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

DROP TABLE IF EXISTS `aula`;
CREATE TABLE IF NOT EXISTS `aula` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `disponibilidad` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `disponibilidad` (`disponibilidad`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`codigo`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(25, 'Sexo', 'se encuentra cuando lo buscas', 1),
(26, 'Puta madre bart', 'sexo tilin\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_semana`
--

DROP TABLE IF EXISTS `dias_semana`;
CREATE TABLE IF NOT EXISTS `dias_semana` (
  `codigo` int NOT NULL,
  `dia` varchar(9) NOT NULL,
  KEY `codigo` (`codigo`)
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

DROP TABLE IF EXISTS `disponibilidad`;
CREATE TABLE IF NOT EXISTS `disponibilidad` (
  `codigo_id` int NOT NULL,
  `disponible` varchar(20) NOT NULL,
  PRIMARY KEY (`codigo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`codigo_id`, `disponible`) VALUES
(0, 'No disponible'),
(1, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_estudiante`
--

DROP TABLE IF EXISTS `horario_estudiante`;
CREATE TABLE IF NOT EXISTS `horario_estudiante` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `codigo_a_escolar` int NOT NULL,
  `codigo_a_y_seccion` int NOT NULL,
  `codigo_asignatura` varchar(3) NOT NULL,
  `codigo_aula` int NOT NULL,
  `codigo_dia` varchar(5) NOT NULL,
  `grupo` varchar(2) NOT NULL,
  `profesor` varchar(40) NOT NULL,
  `intervalo` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `codigo_a_escolar` (`codigo_a_escolar`,`codigo_a_y_seccion`,`codigo_asignatura`,`codigo_aula`,`codigo_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`) VALUES
(51, 17, 21, '1ad', 25, 'B1MM', ' ', '11716900', 1),
(52, 17, 21, '1ad', 25, 'B1J', '1', '11716900', 1),
(53, 17, 21, 'sad', 26, 'B1J', '2', '27564672', 1),
(54, 17, 21, '1ad', 26, 'B2MM', ' ', '11716900', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intervalo`
--

DROP TABLE IF EXISTS `intervalo`;
CREATE TABLE IF NOT EXISTS `intervalo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intervalo` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `intervalo`
--

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
(1, '45', 1),
(2, '30', 0),
(3, '50', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_seguridad`
--

DROP TABLE IF EXISTS `preguntas_seguridad`;
CREATE TABLE IF NOT EXISTS `preguntas_seguridad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
-- Estructura de tabla para la tabla `profesores`
--

DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `primer_nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `primer_apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `segundo_apellido` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`) VALUES
(4, '11716900', 'JONATHAN', 'ENMANUEL', 'RAMIREZ', 'VALERO'),
(5, '27564672', 'NIRETCIA', 'INMACULADA', 'RAMIREZ', 'VALERO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores_materias`
--

DROP TABLE IF EXISTS `profesores_materias`;
CREATE TABLE IF NOT EXISTS `profesores_materias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profesor` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `materia` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores_materias`
--

INSERT INTO `profesores_materias` (`id`, `profesor`, `materia`) VALUES
(40, '27564672', 'sad'),
(39, '11716900', '1ad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula` int NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `rol` int NOT NULL,
  `pregunta_seguridad` int NOT NULL,
  `respuesta` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `cedula`, `nombre`, `apellido`, `rol`, `pregunta_seguridad`, `respuesta`, `clave`) VALUES
(1, 2023, 'MAESTRO', 'MAESTRO', 2, 1, 'ANGEL2023', 'ANGEL2023'),
(2, 27564672, 'JONATHA', 'RAMIREZ', 0, 1, 'niretcia', '152560loco');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
