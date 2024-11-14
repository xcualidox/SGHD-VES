-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-11-2024 a las 16:29:26
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
(306, '2024-11-11 20:04:21', 29629080, 'insertar', ' Insertó al estudiante Fasd Asdf(456464) correctamente.', 'DESKTOP-F3R7OPU'),
(307, '2024-11-11 21:53:02', 29629080, 'insertar', ' Insertó la mensualidad de Inscripcion del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(308, '2024-11-12 14:37:13', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-F3R7OPU'),
(309, '2024-11-12 16:54:31', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"456464\"<br>cedulaEstudiante: \"59595\"<br>nombres: \"fasf\"<br>apellidos: \"asf\"<br>anoSeccion: \"1ero U\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"4654\"<br>nombresRepresentante: \"fasf\"<br>apellidosRepresentante: \"asf\"<br>telefono: \"4645\"<br>telefonoDomicilio: \"4564\"<br>direccion: \"fas\"<br>correo: \"asf\" correctamente.', 'DESKTOP-F3R7OPU'),
(310, '2024-11-12 16:54:48', 29629080, 'insertar', ' Insertó al estudiante Fasf Asf(9595959) correctamente.', 'DESKTOP-F3R7OPU'),
(311, '2024-11-12 17:01:25', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(312, '2024-11-12 17:41:46', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(313, '2024-11-12 17:42:09', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(314, '2024-11-12 17:42:09', 29629080, 'insertar', ' Insertó la mensualidad de Junio del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(315, '2024-11-12 17:42:09', 29629080, 'insertar', ' Insertó la mensualidad de Abril del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(316, '2024-11-12 17:42:32', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(317, '2024-11-12 17:42:32', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(318, '2024-11-12 17:42:33', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(319, '2024-11-12 18:07:00', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(320, '2024-11-12 18:08:00', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(321, '2024-11-12 18:08:00', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(322, '2024-11-12 18:08:00', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(323, '2024-11-12 18:48:29', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(324, '2024-11-12 20:38:46', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(325, '2024-11-12 20:48:34', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(326, '2024-11-12 20:49:16', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(327, '2024-11-12 20:52:14', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(328, '2024-11-12 21:48:19', 29629080, 'modificar', ' Modificó al estudiante <br>cedulaEstudianteActual: \"9595959\"<br>cedulaEstudiante: \"29629080\"<br>nombres: \"Angel Orlando\"<br>apellidos: \"Mendez Mendoza\"<br>anoSeccion: \"1ero U\"<br>anoEscolar: \"2024-2025\"<br><br>cedulaRepresentante: \"7595365\"<br>nombresRepresentante: \"Orlando Nicolas\"<br>apellidosRepresentante: \"Mendez Montilla\"<br>telefono: \"04122696463\"<br>telefonoDomicilio: \"02556594\"<br>direccion: \"fasdf\"<br>correo: \"asdf\" correctamente.', 'DESKTOP-F3R7OPU'),
(329, '2024-11-13 10:04:12', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-F3R7OPU'),
(330, '2024-11-14 09:07:30', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-F3R7OPU'),
(331, '2024-11-14 09:07:55', 29629080, 'insertar', ' Insertó la mensualidad de Febrero del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(332, '2024-11-14 09:08:21', 29629080, 'modificar', ' Modificó la mensualidad de Inscripcion del A.Escolar \"2024-2025\" (500.00$) por Inscripcion del A.Escolar \"2024-2025\" (130$)', 'DESKTOP-F3R7OPU'),
(333, '2024-11-14 09:08:22', 29629080, 'modificar', ' Modificó la mensualidad de Enero del A.Escolar \"2024-2025\" (600.00$) por Enero del A.Escolar \"2024-2025\" (60$)', 'DESKTOP-F3R7OPU'),
(334, '2024-11-14 09:08:22', 29629080, 'modificar', ' Modificó la mensualidad de Junio del A.Escolar \"2024-2025\" (500.00$) por Junio del A.Escolar \"2024-2025\" (60$)', 'DESKTOP-F3R7OPU'),
(335, '2024-11-14 09:08:22', 29629080, 'modificar', ' Modificó la mensualidad de Abril del A.Escolar \"2024-2025\" (150.00$) por Abril del A.Escolar \"2024-2025\" (60$)', 'DESKTOP-F3R7OPU'),
(336, '2024-11-14 09:08:22', 29629080, 'modificar', ' Modificó la mensualidad de Febrero del A.Escolar \"2024-2025\" (500.00$) por Febrero del A.Escolar \"2024-2025\" (60$)', 'DESKTOP-F3R7OPU'),
(337, '2024-11-14 09:09:35', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(338, '2024-11-14 09:14:52', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(339, '2024-11-14 09:15:33', 29629080, 'insertar', ' Insertó la mensualidad de Septiembre del Año Escolar \"Lmao\"', 'DESKTOP-F3R7OPU'),
(340, '2024-11-14 09:15:41', 29629080, 'modificar', ' Modificó la mensualidad de Abril del A.Escolar \"2024-2025\" (60.00$) por Abril del A.Escolar \"2024-2025\" (60.52$)', 'DESKTOP-F3R7OPU'),
(341, '2024-11-14 09:19:00', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(342, '2024-11-14 09:20:53', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(343, '2024-11-14 09:21:47', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(344, '2024-11-14 09:22:42', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(345, '2024-11-14 09:24:49', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(346, '2024-11-14 09:25:09', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(347, '2024-11-14 09:25:20', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(348, '2024-11-14 09:26:15', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(349, '2024-11-14 09:26:48', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(350, '2024-11-14 09:27:07', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(351, '2024-11-14 09:29:49', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(352, '2024-11-14 09:30:19', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(353, '2024-11-14 09:30:43', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(354, '2024-11-14 09:32:45', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(355, '2024-11-14 09:37:42', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(356, '2024-11-14 09:38:05', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(357, '2024-11-14 09:38:05', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(358, '2024-11-14 09:38:32', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(359, '2024-11-14 09:38:32', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(360, '2024-11-14 09:53:02', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(361, '2024-11-14 09:54:28', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(362, '2024-11-14 09:54:28', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"fasf asf\"', 'DESKTOP-F3R7OPU'),
(363, '2024-11-14 09:56:53', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(364, '2024-11-14 09:57:04', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(365, '2024-11-14 09:57:04', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(366, '2024-11-14 09:57:21', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(367, '2024-11-14 09:58:29', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(368, '2024-11-14 10:17:13', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(369, '2024-11-14 12:25:32', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(370, '2024-11-14 12:25:40', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(371, '2024-11-14 12:25:47', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(372, '2024-11-14 12:25:55', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(373, '2024-11-14 12:26:05', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU'),
(374, '2024-11-14 12:26:49', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"Angel Orlando Mendez Mendoza\"', 'DESKTOP-F3R7OPU');

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
  `seccion` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`cedula_estudiante`, `nombres`, `apellidos`, `ano`, `seccion`, `activo`) VALUES
(59595, 'fasf', 'asf', '2024-2025', '1ero U', 1),
(29629080, 'Angel Orlando', 'Mendez Mendoza', '2024-2025', '3ero U', 1);

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
  `estado` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `intervalo`
--

INSERT INTO `intervalo` (`id`, `intervalo`, `estado`) VALUES
(5, '30', 0),
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
  `id` bigint NOT NULL,
  `ano_escolar` int NOT NULL,
  `mes` enum('inscripcion','enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `monto` decimal(20,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `mensualidad`
--

INSERT INTO `mensualidad` (`id`, `ano_escolar`, `mes`, `monto`) VALUES
(92, 18, 'inscripcion', 130.00),
(93, 18, 'enero', 60.00),
(94, 18, 'junio', 60.00),
(95, 18, 'abril', 60.52),
(96, 18, 'febrero', 60.00),
(97, 18, 'septiembre', 60.50);

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
(59595, 92, 18, 18, 130.00),
(59595, 96, 18, 18, 5.00),
(59595, 97, 18, 18, 5.00),
(29629080, 92, 18, 18, 110.00),
(29629080, 93, 18, 18, 18.99),
(29629080, 94, 18, 18, 12.99),
(29629080, 96, 18, 18, 60.00),
(29629080, 97, 18, 18, 60.00);

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
  `fecha` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT '',
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
  `dolarBCV` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `cedula_estudiante`, `cedula_representante`, `fecha`, `referencia_id`, `ano_escolar`, `mes`, `detalles`, `descuento`, `nombres_estudiante`, `nombres_representante`, `telefono`, `direccion`, `monto`, `tipo_pago`, `dolarBCV`) VALUES
(38, 59595, 4654, '14-11-2024', '', '2024-2025', 92, '', 1.00, 'fasf asf', 'fasf asf', '4645', 'fas', 130.00, 'dolar', 36.8),
(39, 59595, 4654, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'fasf asf', 'fasf asf', '4645', 'fas', 5.00, 'dolar', 36.8),
(40, 59595, 4654, '14-11-2024', '', '2024-2025', 97, '', 1.00, 'fasf asf', 'fasf asf', '4645', 'fas', 5.00, 'dolar', 36.8),
(41, 29629080, 7595365, '14-11-2024', '', '2024-2025', 92, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 110.00, 'dolar', 36.8),
(42, 29629080, 7595365, '14-11-2024', '', '2024-2025', 93, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.99, 'bolivar', 36.8),
(43, 29629080, 7595365, '14-11-2024', '', '2024-2025', 94, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.99, 'bolivar', 36.8),
(44, 29629080, 7595365, '14-11-2024', '', '2024-2025', 94, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 10.00, 'dolar', 36.8),
(45, 29629080, 7595365, '14-11-2024', '', '2024-2025', 97, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 60.00, 'dolar', 36.8),
(46, 29629080, 7595365, '14-11-2024', '', '2024-2025', 93, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 16.00, 'dolar', 36.8),
(47, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.00, 'dolar', 36.8),
(48, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.00, 'dolar', 36.8),
(49, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.00, 'dolar', 36.8),
(50, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.00, 'dolar', 36.8),
(51, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 2.00, 'dolar', 36.8),
(52, 29629080, 7595365, '14-11-2024', '', '2024-2025', 96, '', 1.00, 'Angel Orlando Mendez Mendoza', 'Orlando Nicolas Mendez Montilla', '04122696463', 'fasdf', 50.00, 'dolar', 36.8);

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
(4654, 'fasf', 'asf', 'asf', 'fas', '4645', '4564'),
(49494, 'asdf', 'asdf', 'asdf', 'asdf', '041226964', ''),
(56465, 'fasf', 'asf', 'asf', 'fasf', '4654', ''),
(7595365, 'Orlando Nicolas', 'Mendez Montilla', 'asdf', 'fasdf', '04122696463', '02556594');

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
(59595, 4654),
(29629080, 7595365);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6161;

--
-- AUTO_INCREMENT de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
