-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-07-2025 a las 18:42:04
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
(18, '2024-2025', '2024-10-07', '2025-07-31', 0),
(21, '2025-2026', '2025-10-07', '2026-07-31', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ano_seccion`
--

CREATE TABLE `ano_seccion` (
  `codigo` int NOT NULL,
  `ano` enum('1ero','2do','3ero','4to','5to') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `seccion` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `receso` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_seccion`
--

INSERT INTO `ano_seccion` (`codigo`, `ano`, `seccion`, `receso`) VALUES
(18, '1ero', 'U', '08:20:00'),
(19, '2do', 'U', '08:20:00'),
(20, '5to', 'U', '09:00:00'),
(21, '4to', 'U', '09:00:00'),
(22, '3ero', 'U', '08:20:00');

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
('BI', 'BIOLOGÍA'),
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
(380, '2025-05-17 14:38:44', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(381, '2025-05-25 18:38:13', 29629080, 'login', 'Ingresó al sistema.', 'xcualidox'),
(382, '2025-06-11 21:26:10', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(383, '2025-06-24 19:26:39', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(384, '2025-06-24 19:49:41', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(385, '2025-06-26 20:03:58', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(386, '2025-06-26 20:15:15', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(387, '2025-06-26 20:15:21', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(388, '2025-06-26 20:15:47', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(389, '2025-06-26 20:16:30', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(390, '2025-06-26 20:16:35', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(391, '2025-06-26 20:16:41', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(392, '2025-06-26 20:16:47', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(393, '2025-06-26 20:17:21', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(394, '2025-06-26 20:19:42', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(395, '2025-06-26 20:20:24', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(396, '2025-06-26 20:27:39', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(397, '2025-06-28 09:20:32', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(398, '2025-06-28 09:44:09', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(399, '2025-06-28 09:50:52', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(400, '2025-06-28 11:16:50', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(401, '2025-06-28 11:16:58', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(402, '2025-06-28 12:12:04', 29629080, 'insertar', 'Agregó la sección 1ero-A.', 'DESKTOP-UEKPGTH'),
(403, '2025-06-28 12:12:23', 29629080, 'eliminar', 'Eliminó la sección 1ero-A.', 'DESKTOP-UEKPGTH'),
(404, '2025-06-28 14:15:15', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 5945762.', 'DESKTOP-UEKPGTH'),
(405, '2025-06-28 15:17:39', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(406, '2025-06-28 15:38:14', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(407, '2025-06-28 15:43:46', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(408, '2025-06-28 15:46:44', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(409, '2025-06-28 15:48:11', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(410, '2025-06-28 15:49:10', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(411, '2025-06-28 16:23:44', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(412, '2025-06-28 16:25:33', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(413, '2025-06-28 16:29:54', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(414, '2025-06-28 16:34:44', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(415, '2025-06-28 16:54:36', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(416, '2025-06-28 16:59:03', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(417, '2025-06-28 16:59:57', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(418, '2025-06-28 17:10:46', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(419, '2025-06-28 17:14:06', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(420, '2025-06-28 17:14:11', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(421, '2025-06-28 17:14:23', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(422, '2025-06-28 17:15:55', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(423, '2025-06-28 17:27:59', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(424, '2025-06-28 17:28:07', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'DESKTOP-UEKPGTH'),
(425, '2025-07-04 20:57:45', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(426, '2025-07-10 13:48:51', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(427, '2025-07-10 13:49:01', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(428, '2025-07-10 13:50:25', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(429, '2025-07-10 16:48:03', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(430, '2025-07-10 16:48:25', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(431, '2025-07-10 16:58:17', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(432, '2025-07-10 16:58:40', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(433, '2025-07-10 16:59:24', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(434, '2025-07-10 17:59:50', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(435, '2025-07-10 18:32:25', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(436, '2025-07-10 18:56:27', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(437, '2025-07-10 19:10:00', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(438, '2025-07-10 19:17:38', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(439, '2025-07-10 19:17:52', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(440, '2025-07-10 20:25:08', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(441, '2025-07-11 01:29:20', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(442, '2025-07-11 01:29:32', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(443, '2025-07-11 01:29:53', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(444, '2025-07-11 17:28:07', 29629080, 'login', 'Ingresó al sistema.', 'ZUHE2-PC'),
(445, '2025-07-13 19:23:52', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"3ero U\".', 'ZUHE2-PC'),
(446, '2025-07-13 19:26:31', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"1ero U\".', 'ZUHE2-PC'),
(447, '2025-07-17 20:32:35', 29629080, 'insertar', 'Creó el horario para el año \"2024-2025\" sección \"2do U\".', 'ZUHE2-PC'),
(448, '2025-07-17 21:56:47', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'ZUHE2-PC'),
(449, '2025-07-17 21:56:47', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'ZUHE2-PC'),
(450, '2025-07-20 20:10:11', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(451, '2025-07-20 20:10:16', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(452, '2025-07-20 20:10:29', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(453, '2025-07-20 20:13:42', 29629080, 'modificar', 'Modificó la sección -.', 'DESKTOP-UEKPGTH'),
(454, '2025-07-20 20:50:03', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(455, '2025-07-21 21:44:01', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(456, '2025-07-21 21:44:39', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 5945762.', 'DESKTOP-UEKPGTH'),
(457, '2025-07-21 21:44:59', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(458, '2025-07-21 21:45:08', 29629080, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'DESKTOP-UEKPGTH'),
(459, '2025-07-21 21:45:43', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(460, '2025-07-21 21:46:09', 29629080, 'eliminar', 'Eliminó el horario del Profesor \"EDUARDO GARCíA\" Del año escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(461, '2025-07-21 21:47:04', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(462, '2025-07-21 21:47:43', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(463, '2025-07-21 21:48:52', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(464, '2025-07-21 21:49:28', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(465, '2025-07-21 21:56:07', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(466, '2025-07-22 21:00:27', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(467, '2025-07-22 21:10:55', 29629080, 'eliminar', 'Eliminó el horario del Profesor \"WILMER GARCíA\" Del año escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(468, '2025-07-24 09:36:54', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(469, '2025-07-24 09:37:29', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(470, '2025-07-24 09:53:05', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(471, '2025-07-24 10:47:22', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(472, '2025-07-24 10:50:25', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(473, '2025-07-24 10:50:48', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(474, '2025-07-24 10:51:30', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(475, '2025-07-24 11:21:50', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(476, '2025-07-24 11:22:02', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(477, '2025-07-24 11:22:57', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(478, '2025-07-24 11:48:17', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(479, '2025-07-24 11:57:39', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(480, '2025-07-24 12:00:04', 29629080, 'insertar', 'Agregó el año escolar 2025-2026.', 'DESKTOP-UEKPGTH'),
(481, '2025-07-24 12:00:07', 29629080, 'modificar', 'Activo Año Escolar: 2025-2026.', 'DESKTOP-UEKPGTH'),
(482, '2025-07-24 12:00:39', 29629080, 'eliminar', 'Eliminó el horario del Profesor \"EDUARDO GARCíA\" Del año escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(483, '2025-07-24 12:03:42', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2025-2026\".', 'DESKTOP-UEKPGTH'),
(484, '2025-07-24 12:03:49', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2025-2026\".', 'DESKTOP-UEKPGTH'),
(485, '2025-07-24 12:05:48', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(486, '2025-07-24 12:06:09', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(487, '2025-07-24 12:06:19', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2024-2025\".', 'DESKTOP-UEKPGTH'),
(488, '2025-07-24 14:40:21', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH');

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
(1, 106.86);

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
  `receso` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(6, '40', 0, '12:50:00', '07:00:00'),
(7, '45', 1, '12:50:00', '07:00:00');

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
-- Estructura de tabla para la tabla `materia_ano`
--

CREATE TABLE `materia_ano` (
  `id` int NOT NULL,
  `codigo_materia` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `ano` enum('1ero','2do','3ero','4to','5to') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `anoxd` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `materia_ano`
--

INSERT INTO `materia_ano` (`id`, `codigo_materia`, `ano`, `anoxd`) VALUES
(64, 'AP', '1ero', 0),
(65, 'AP', '2do', 0),
(87, 'CT', '4to', 0),
(91, 'FI', '4to', 0),
(92, 'FI', '5to', 0),
(93, 'FSN', '4to', 0),
(95, 'ILE', '1ero', 0),
(96, 'ILE', '2do', 0),
(97, 'ILE', '3ero', 0),
(98, 'ILE', '4to', 0),
(99, 'ILE', '5to', 0),
(100, 'CN', '1ero', 0),
(101, 'CN', '2do', 0),
(102, 'CN', '3ero', 0),
(103, 'MA', '1ero', 0),
(104, 'MA', '2do', 0),
(105, 'MA', '3ero', 0),
(106, 'MA', '4to', 0),
(107, 'MA', '5to', 0),
(116, 'PGCRP', '1ero', 0),
(117, 'PGCRP', '2do', 0),
(118, 'PGCRP', '3ero', 0),
(119, 'PGCRP', '4to', 0),
(120, 'PGCRP', '5to', 0),
(131, 'OC', '1ero', 0),
(132, 'OC', '2do', 0),
(133, 'OC', '3ero', 0),
(134, 'GHC', '1ero', 0),
(135, 'GHC', '4to', 0),
(136, 'EF', '1ero', 0),
(137, 'EF', '2do', 0),
(138, 'EF', '3ero', 0),
(139, 'EF', '4to', 0),
(140, 'EF', '5to', 0),
(141, 'CA', '1ero', 0),
(142, 'CA', '2do', 0),
(143, 'CA', '3ero', 0),
(144, 'CA', '4to', 0),
(145, 'CA', '5to', 0),
(149, 'BI', '3ero', 0),
(150, 'BI', '4to', 0),
(151, 'BI', '5to', 0),
(152, 'TC', '1ero', 0),
(153, 'TC', '2do', 0),
(154, 'TC', '3ero', 0),
(155, 'TC', '4to', 0),
(156, 'TC', '5to', 0);

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
(220, 15071661, 'CN'),
(227, 14091761, 'CT'),
(266, 5945762, 'EF'),
(267, 5945762, 'FSN'),
(268, 5945762, 'OC'),
(269, 5945762, 'PGCRP'),
(271, 10143237, 'CA'),
(272, 10143237, 'OC'),
(273, 10143237, 'PGCRP'),
(276, 15214479, 'GHC'),
(277, 15214479, 'OC'),
(278, 15214479, 'PGCRP'),
(280, 25347183, 'FI'),
(281, 25347183, 'MA'),
(282, 25347183, 'OC'),
(283, 25347183, 'PGCRP'),
(285, 29800040, 'ILE'),
(286, 29800040, 'OC'),
(287, 29800040, 'PGCRP'),
(289, 5945762, 'EF'),
(290, 5945762, 'FSN'),
(291, 5945762, 'OC'),
(292, 5945762, 'PGCRP'),
(294, 14091761, 'CN'),
(295, 15071661, 'CN'),
(297, 10143237, 'BI'),
(298, 10143237, 'CT'),
(299, 10143237, 'CN'),
(300, 10143237, 'EF'),
(301, 10143237, 'FI'),
(302, 10143237, 'FSN'),
(303, 10143237, 'GHC'),
(304, 10143237, 'ILE'),
(305, 10143237, 'MA'),
(307, 5945762, 'AP'),
(308, 10143237, 'AP');

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
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `ano` (`ano`);

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
-- Indices de la tabla `materia_ano`
--
ALTER TABLE `materia_ano`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_materia` (`codigo_materia`,`ano`) USING BTREE,
  ADD KEY `ano` (`ano`);

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
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=489;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7428;

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
-- AUTO_INCREMENT de la tabla `materia_ano`
--
ALTER TABLE `materia_ano`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

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
-- Filtros para la tabla `materia_ano`
--
ALTER TABLE `materia_ano`
  ADD CONSTRAINT `FK_materia_ano_ano_seccion` FOREIGN KEY (`ano`) REFERENCES `ano_seccion` (`ano`),
  ADD CONSTRAINT `materia_ano_ibfk_1` FOREIGN KEY (`codigo_materia`) REFERENCES `asignatura` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

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
