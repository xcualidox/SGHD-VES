-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-05-2025 a las 18:47:53
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
  `activo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_escolar`
--

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`, `activo`) VALUES
(18, '2024-2025', '2024-10-07', '2025-07-31', 1);

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
  `type` enum('login','error','eliminar','actualizar','insertar','modificar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `user_computer` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `fecha_hora`, `cedula`, `type`, `description`, `user_computer`) VALUES
(33, '2024-09-27 12:15:32', 27576598, 'login', '27576598 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(36, '2024-09-28 12:16:59', 27576598, 'login', '27576598 ha ingresado al sistema.', 'DESKTOP-Q1BQ71J'),
(37, '2024-09-28 21:10:10', 27576598, 'login', '27576598 ha ingresado al sistema.', 'Tahiris-PC'),
(38, '2024-09-29 10:25:43', 27576598, 'login', '27576598 ha ingresado al sistema.', 'Tahiris-PC'),
(306, '2024-11-12 10:30:38', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(307, '2024-11-12 10:33:47', 27576598, 'insertar', 'Agregó al profesor 30743410.', 'Tahiris-PC'),
(308, '2024-11-12 12:42:23', 30743410, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(309, '2024-11-12 12:43:56', 30743410, 'modificar', 'El precio del Dolar se ha Actualizado a: 44.75$', 'Tahiris-PC'),
(310, '2024-11-12 12:45:08', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(311, '2024-11-15 12:21:23', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(312, '2024-11-15 12:55:25', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(313, '2024-11-29 10:30:12', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(314, '2024-11-29 10:32:28', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(315, '2024-11-29 10:38:22', 12710000, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(316, '2024-11-29 10:48:27', 12710000, 'insertar', ' Insertó la mensualidad de Inscripcion del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(317, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Septiembre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(318, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Octubre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(319, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Noviembre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(320, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Diciembre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(321, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(322, '2024-11-29 10:48:28', 12710000, 'insertar', ' Insertó la mensualidad de Febrero del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(323, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Marzo del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(324, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Abril del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(325, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Mayo del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(326, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(327, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Junio del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(328, '2024-11-29 10:48:29', 12710000, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(329, '2025-02-11 08:26:31', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(330, '2025-02-20 08:59:52', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(331, '2025-02-20 09:16:33', 27576598, 'insertar', ' Insertó al estudiante MIRIANNYS MICHEL PACHECO PETAQUERO(34209385) correctamente.', 'Tahiris-PC'),
(332, '2025-02-20 09:42:35', 27576598, 'insertar', ' Insertó al estudiante JOSE ANGEL LANDINEZ LINAREZ(34343385) correctamente.', 'Tahiris-PC'),
(333, '2025-02-20 09:48:10', 27576598, 'insertar', ' Insertó al estudiante OSKEYLIS DEL CARMEN                 CEDEÑO SALAS                       (34389227) correctamente.', 'Tahiris-PC'),
(334, '2025-02-20 12:08:43', 27576598, 'insertar', ' Insertó al estudiante LEISMAR DEL CARMEN                  RODRIGUEZ ALVARADO                 (34389441) correctamente.', 'Tahiris-PC'),
(335, '2025-03-07 09:55:56', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(336, '2025-04-13 06:17:19', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(337, '2025-04-20 09:17:50', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(338, '2025-04-20 10:24:52', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"JOSE ANGEL LANDINEZ LINAREZ\"', 'DESKTOP-UEKPGTH'),
(339, '2025-04-20 10:57:24', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"JOSE ANGEL LANDINEZ LINAREZ\"', 'DESKTOP-UEKPGTH'),
(340, '2025-04-20 10:57:39', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"JOSE ANGEL LANDINEZ LINAREZ\"', 'DESKTOP-UEKPGTH'),
(341, '2025-04-20 12:15:45', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 90Bs', 'DESKTOP-UEKPGTH'),
(342, '2025-04-20 12:22:23', 29629080, 'modificar', 'El precio del Dolar se ha Actualizado a: 50.5Bs', 'DESKTOP-UEKPGTH'),
(343, '2025-04-20 12:26:11', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20Bs', 'DESKTOP-UEKPGTH'),
(344, '2025-04-20 12:30:41', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 80Bs', 'DESKTOP-UEKPGTH'),
(345, '2025-04-20 12:35:02', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 90Bs', 'DESKTOP-UEKPGTH'),
(346, '2025-04-20 12:36:09', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 80Bs', 'DESKTOP-UEKPGTH'),
(347, '2025-04-20 12:36:42', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 85.5Bs', 'DESKTOP-UEKPGTH'),
(348, '2025-04-20 12:36:45', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20Bs', 'DESKTOP-UEKPGTH'),
(349, '2025-04-20 12:36:53', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 95.54Bs', 'DESKTOP-UEKPGTH'),
(350, '2025-04-20 12:36:57', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20.5Bs', 'DESKTOP-UEKPGTH'),
(351, '2025-04-20 12:50:22', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20Bs', 'DESKTOP-UEKPGTH'),
(352, '2025-04-20 12:55:40', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 90Bs', 'DESKTOP-UEKPGTH'),
(353, '2025-04-20 13:35:01', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20Bs', 'DESKTOP-UEKPGTH'),
(354, '2025-04-20 13:41:34', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"JOSE ANGEL LANDINEZ LINAREZ\"', 'DESKTOP-UEKPGTH'),
(355, '2025-04-20 13:42:01', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"JOSE ANGEL LANDINEZ LINAREZ\"', 'DESKTOP-UEKPGTH'),
(356, '2025-04-20 14:53:21', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(357, '2025-04-20 14:53:51', 29629080, 'insertar', ' Insertó al estudiante TEST TEST(296290801) correctamente.', 'DESKTOP-UEKPGTH'),
(358, '2025-04-27 08:45:00', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(359, '2025-04-27 08:58:12', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(360, '2025-04-27 09:10:10', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 20Bs', 'DESKTOP-UEKPGTH'),
(361, '2025-04-27 10:29:40', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(362, '2025-04-27 10:45:10', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(363, '2025-04-27 10:47:53', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(364, '2025-04-27 10:47:53', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(365, '2025-04-27 10:47:53', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(366, '2025-04-27 10:50:11', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(367, '2025-04-27 10:50:11', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(368, '2025-04-27 10:50:11', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(369, '2025-04-27 10:51:29', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(370, '2025-04-27 10:52:34', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(371, '2025-04-27 10:52:34', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(372, '2025-04-27 10:52:34', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(373, '2025-04-27 11:02:50', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(374, '2025-04-27 11:03:38', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(375, '2025-05-03 10:43:14', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(376, '2025-05-16 07:35:53', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(377, '2025-05-17 09:54:29', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(378, '2025-05-17 10:29:07', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(379, '2025-05-17 11:17:53', 29629080, 'eliminar', ' Eliminó al estudiante Arepa TEST(296290801) correctamente.', 'DESKTOP-UEKPGTH'),
(380, '2025-05-17 14:38:44', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_inst`
--

CREATE TABLE `datos_inst` (
  `rif` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `nombre_institucion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `codigo_plantel` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `datos_inst`
--

INSERT INTO `datos_inst` (`rif`, `direccion`, `telefono`, `nombre_institucion`, `codigo_plantel`) VALUES
('J-30053973-3\r\n', 'Calle 28, Av. Esquina 37 , Acarigua', '0255-6153561', 'U.E. COLEGIO \"VICENTE EMILIO SOJO\"\n', 'P.D.00511808\n');

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
(1, 94.76);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
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
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`cedula_estudiante`, `nombres`, `apellidos`, `ano`, `seccion`, `activo`) VALUES
(34209385, 'MIRIANNYS MICHEL', 'PACHECO PETAQUERO', '2024-2025', '1ero U', 1),
(34343385, 'JOSE ANGEL', 'LANDINEZ LINAREZ', '2024-2025', '1ero U', 0),
(34389227, 'OSKEYLIS DEL CARMEN                ', 'CEDEÑO SALAS                       ', '2024-2025', '1ero U', 1),
(34389441, 'LEISMAR DEL CARMEN                 ', 'RODRIGUEZ ALVARADO                 ', '2024-2025', '1ero U', 1);

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
-- Estructura de tabla para la tabla `intervalo`
--

CREATE TABLE `intervalo` (
  `id` int NOT NULL,
  `intervalo` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL,
  `hora_final` time DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `intervalo`
--

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`, `hora_final`, `hora_inicio`) VALUES
(5, '30', 0, '12:50:00', '07:00:00'),
(6, '40', 1, '12:50:00', '07:00:00'),
(7, '45', 0, '12:50:00', '07:00:00');

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
(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active'),
(12, 12710000, '$2y$10$bCOZpNIaa2JLIHAfHT9kjO9qMcr6qRT1R.DiPqK6gFYN0Wes4oemi', '¿Cuál es el nombre de tu primera mascota?', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '$2y$10$TJBIYuFvf4oaJduH2o6UKu4F2sQQAPToZq9Qv96DGijtVTxbVte66', '$2y$10$uaKzIagIgBMm3YkdcPieQuZhexxeU1q7SZrBSefRiIRcmSFpQ41vW', '$2y$10$wtJTCbBSryZBDqLMNDuPVuYcMo4lPlQUyMQxIGtj3nde1iVzd3s3m', 'admin', 'active'),
(15, 15214479, '$2y$10$0AELJ3OJuaZwRxqOeRef8udxMiCE9b5/k5wMShASCzHyjFEU/sADm', '', '', '', '', '', '', 'profesor', 'new'),
(16, 15071661, '$2y$10$jiwLP0zsQQKN33KLP.Ob..eMVcdD57haA1efWBBr2qWYbSm9Mv4vy', '', '', '', '', '', '', 'profesor', 'new'),
(17, 14091761, '$2y$10$upjcc6Z.vBmJYRShy48Ece/z4ZuJlozIvNCDT17wRBpfZbquRjbie', '', '', '', '', '', '', 'profesor', 'new'),
(18, 29800040, '$2y$10$Dhd7KLprNTVq5zcauHlQ4u55.0oM6OXZgP.VtHpypQY.GEubnjsSK', '', '', '', '', '', '', 'profesor', 'new'),
(19, 25347183, '$2y$10$TrZHZIr/5Qc7YEbySeWw7u7iEtRP9PXkQMmFw11lYQV7feCpKkrmG', '', '', '', '', '', '', 'profesor', 'new'),
(20, 5945762, '$2y$10$5s5O94wcje2uKuN8Unc7E.E01sPXKQedJ2kwwsx3A5U8X4qp9vN66', '', '', '', '', '', '', 'profesor', 'new'),
(21, 10143237, '$2y$10$sfa3mZOpK7yhzEZwwkKmhOr43sO/0hjxM52DXsU2Y3tiOl4DjsxfS', '', '', '', '', '', '', 'profesor', 'new'),
(22, 4608560, '$2y$10$kYE/QOWeyuOwsZVyZrYMVeRKDb0WLM7fl7BuJP.Wt5w/RC4lnxkg2', '', '', '', '', '', '', 'admin', 'new'),
(23, 27576598, '$2y$10$ejPPrAWqtZCISNZyvEZeV.Ow7H.SQn3GQE7fHILVuxS/T/Q.nia8m', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '¿Cuál es el nombre de tu escuela primaria?', '$2y$10$oyreTRaPRJIJpcvrlgCn8uGreex5GTAkYifkGdtw0Qlwdvv8/S4JS', '$2y$10$wCOboA6GSoqSlNxwmkQAuOQvA8MvHIiEetAXgq7EwVmBaQSFbFqOe', '$2y$10$N2VPQmeU/PThXn9LBwtTDOcbrAN7zI3RH.928zd2BWn9y4YJC5RCG', 'admin', 'active'),
(24, 5950682, '$2y$10$zQPpvq5dO1ChBMDTCKB2tuMg8dQ4lFz5FWJ7iPZAgNKSNfOEZ1r6a', '', '', '', '', '', '', 'coordinador', 'new'),
(26, 30743410, '$2y$10$l3QvvPB.0EX2k7lU8HoUmOwyqvwzANQqjLiRwFJrssH5EYvxqNCJ6', '¿Cuál es el nombre de tu primera mascota?', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '$2y$10$75P72bnT5Q3/aYIDa4gz9ODhG4yU2bhocN/IB9A3YaHz449J5nipW', '$2y$10$rY0kLr/JFITb6BXUBU9e2eKtqNswTjeYvWEGdOkHv2Vr9wjWRknVC', '$2y$10$5aXLzjotuwZtInEYeqzSqOQWa2gU.HjUqu22WEfYHgJKM12r4Give', 'secretario', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE `mensualidad` (
  `id` bigint NOT NULL,
  `ano_escolar` int NOT NULL,
  `mes` enum('inscripcion','enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `monto` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `mensualidad`
--

INSERT INTO `mensualidad` (`id`, `ano_escolar`, `mes`, `monto`) VALUES
(92, 18, 'inscripcion', 60.00),
(93, 18, 'septiembre', 60.00),
(94, 18, 'octubre', 60.00),
(95, 18, 'noviembre', 60.00),
(96, 18, 'diciembre', 60.00),
(97, 18, 'enero', 60.00),
(98, 18, 'febrero', 60.00),
(99, 18, 'marzo', 60.00),
(100, 18, 'abril', 60.00),
(101, 18, 'mayo', 60.00),
(102, 18, 'agosto', 30.00),
(103, 18, 'junio', 60.00),
(104, 18, 'agosto', 30.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses_pagos`
--

CREATE TABLE `meses_pagos` (
  `cedula_estudiante` bigint NOT NULL,
  `mes` bigint NOT NULL DEFAULT '0',
  `ano_escolar` int NOT NULL,
  `ano_seccion` int NOT NULL,
  `abonado` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `meses_pagos`
--

INSERT INTO `meses_pagos` (`cedula_estudiante`, `mes`, `ano_escolar`, `ano_seccion`, `abonado`) VALUES
(34343385, 92, 18, 18, 60.00),
(34343385, 93, 18, 18, 60.00),
(34343385, 94, 18, 18, 40.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses_saldados`
--

CREATE TABLE `meses_saldados` (
  `id` bigint NOT NULL DEFAULT '0',
  `cedula_estudiante` bigint NOT NULL,
  `mes` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '0',
  `ano_escolar` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `ano_seccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `MontoBS` decimal(20,2) NOT NULL DEFAULT '0.00',
  `MontoBCV` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` bigint NOT NULL,
  `cedula_estudiante` bigint NOT NULL,
  `cedula_representante` bigint NOT NULL DEFAULT '0',
  `fecha` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `referencia_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
  `ano_escolar` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '0',
  `mes` bigint NOT NULL DEFAULT '0',
  `detalles` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `descuento` decimal(20,2) NOT NULL DEFAULT '1.00',
  `nombres_estudiante` varchar(141) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombres_representante` varchar(141) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `monto` decimal(20,2) DEFAULT NULL,
  `tipo_pago` enum('dolar','bolivar') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `dolarBCV` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `cedula_estudiante`, `cedula_representante`, `fecha`, `referencia_id`, `ano_escolar`, `mes`, `detalles`, `descuento`, `nombres_estudiante`, `nombres_representante`, `telefono`, `direccion`, `monto`, `tipo_pago`, `dolarBCV`) VALUES
(3, 34343385, 16860175, '20-04-2025', '545', '2024-2025', 92, 'pago', 1.00, 'JOSE ANGEL LANDINEZ LINAREZ', 'JOSE LUIS  LINAREZ MUÑOZ', '04145390428', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', 60.00, 'dolar', 44.75),
(4, 34343385, 16860175, '20-04-2025', 'pago', '2024-2025', 93, 'test', 1.00, 'JOSE ANGEL LANDINEZ LINAREZ', 'JOSE LUIS  LINAREZ MUÑOZ', '04145390428', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', 50.00, 'dolar', 44.75),
(5, 34343385, 16860175, '20-04-2025', 'pago', '2024-2025', 93, 'test', 1.00, 'JOSE ANGEL LANDINEZ LINAREZ', 'JOSE LUIS  LINAREZ MUÑOZ', '04145390428', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', 10.00, 'dolar', 44.75),
(6, 34343385, 16860175, '20-04-2025', '', '2024-2025', 94, '', 1.00, 'JOSE ANGEL LANDINEZ LINAREZ', 'JOSE LUIS  LINAREZ MUÑOZ', '04145390428', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', 30.00, 'dolar', 80.96),
(7, 34343385, 16860175, '20-04-2025', '', '2024-2025', 94, '', 1.00, 'JOSE ANGEL LANDINEZ LINAREZ', 'JOSE LUIS  LINAREZ MUÑOZ', '04145390428', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', 10.00, 'dolar', 80.96);

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
(27576598, 'VICTOR JULIO', 'MENDOZA VARGAS', 'ACARIGUA', '04125157986', 'correo'),
(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'irechamo@yolewadesi.unawaina'),
(29800040, 'VENUS', 'MARTINEZ', 'ACARIGUA', '04125304708', 'correo'),
(30743410, 'VALENTINA', 'HERRERA', 'SAN VICENTE 1 ACARIGUA', '04125510589', 'cypherlenherrera@gmail.com');

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
(16860175, 'JOSE LUIS ', 'LINAREZ MUÑOZ', 'REPRESENTACIONESLANDINEZ@GMAIL.COM', 'URB LOMAS DE SANTA SOFIA CONJ 13 N° 53 ARAURE', '04145390428', ''),
(17276273, 'LEIDA DEL CARMEN ', 'ALVARADO', 'LEIDADELCARMENALVARADO@GMAIL.COM', 'PARROQUIA RIO ACARIGUA', '04261526325', ''),
(20498969, 'KEILA JOANA', 'SALAS RICO', 'KEILASALASRICO@GMAIL.COM', 'BARRIO 5 DE DICIEMBRE', '04244213343', ''),
(24020929, 'MARIA DEL CARMEN', 'PETAQUERO ALDANA', 'MPETAQUERO@GMAIL.COM', 'URB GONZALO BARRIOS  MANUELITA SAENZ', '04246394273', '');

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
(34343385, 16860175),
(34389441, 17276273),
(34389227, 20498969),
(34209385, 24020929);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mensualidad_ano_escolar` (`ano_escolar`);

--
-- Indices de la tabla `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD PRIMARY KEY (`cedula_estudiante`,`ano_escolar`,`mes`) USING BTREE,
  ADD KEY `FK_meses_pagos_estudiante` (`cedula_estudiante`),
  ADD KEY `FK_meses_pagos_ano_escolar` (`ano_escolar`),
  ADD KEY `FK_meses_pagos_ano_seccion` (`ano_seccion`),
  ADD KEY `FK_meses_pagos_mensualidad` (`mes`);

--
-- Indices de la tabla `meses_saldados`
--
ALTER TABLE `meses_saldados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_meses_saldados_estudiante` (`cedula_estudiante`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `FK_pagos_estudiante` (`cedula_estudiante`),
  ADD KEY `FK_pagos_representante` (`cedula_representante`),
  ADD KEY `FK_pagos_ano_escolar` (`ano_escolar`),
  ADD KEY `FK_pagos_mensualidad` (`mes`);

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
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6161;

--
-- AUTO_INCREMENT de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

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
  ADD CONSTRAINT `FK_mensualidad_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `meses_pagos`
--
ALTER TABLE `meses_pagos`
  ADD CONSTRAINT `FK_meses_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_ano_seccion` FOREIGN KEY (`ano_seccion`) REFERENCES `ano_seccion` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_meses_pagos_mensualidad` FOREIGN KEY (`mes`) REFERENCES `mensualidad` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `meses_saldados`
--
ALTER TABLE `meses_saldados`
  ADD CONSTRAINT `FK_meses_saldados_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FK_pagos_ano_escolar` FOREIGN KEY (`ano_escolar`) REFERENCES `ano_escolar` (`nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `estudiante` (`cedula_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_mensualidad` FOREIGN KEY (`mes`) REFERENCES `mensualidad` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_pagos_representante` FOREIGN KEY (`cedula_representante`) REFERENCES `representante` (`cedula_representante`) ON UPDATE CASCADE;

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
