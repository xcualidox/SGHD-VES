-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2025 a las 15:57:15
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
(22, '2025-2026', '2025-10-05', '2026-07-31', 1);

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
(22, '3ero', 'U', '08:20:00'),
(25, '1ero', 'A', '08:20:00');

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
('CIVICO', 'LUNES CIVICO'),
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
(488, '2025-07-24 14:40:21', 29629080, 'login', 'Ingresó al sistema.', 'DESKTOP-UEKPGTH'),
(489, '2025-08-04 20:26:14', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(490, '2025-08-04 20:28:13', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'Tahiris-PC'),
(491, '2025-08-04 20:30:49', 29629080, 'eliminar', 'Eliminó el horario del Profesor \"EDUARDO GARCíA\" Del año escolar \"2024-2025\".', 'Tahiris-PC'),
(492, '2025-08-04 20:33:27', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2024-2025\".', 'Tahiris-PC'),
(493, '2025-08-07 10:10:06', 29629080, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(494, '2025-08-07 10:11:44', 29629080, 'eliminar', 'Eliminó el horario del Profesor \"EDUARDO GARCíA\" Del año escolar \"2024-2025\".', 'Tahiris-PC'),
(495, '2025-08-07 10:27:14', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(496, '2025-08-07 10:29:24', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"EDUARDO GARCíA\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(497, '2025-08-07 10:33:21', 29629080, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCíA\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(498, '2025-10-06 16:19:46', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(499, '2025-10-06 16:26:43', 27576598, 'modificar', 'Modificó al profesor 12000000 (profesor).', 'Tahiris-PC'),
(500, '2025-10-06 16:27:15', 27576598, 'modificar', 'Modificó al profesor 10000000 (profesor).', 'Tahiris-PC'),
(501, '2025-10-06 16:28:09', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10000000.', 'Tahiris-PC'),
(502, '2025-10-06 16:28:33', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'Tahiris-PC'),
(503, '2025-10-06 16:29:04', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 12000000.', 'Tahiris-PC'),
(504, '2025-10-06 16:30:23', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 14091761.', 'Tahiris-PC'),
(505, '2025-10-06 16:31:01', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15071661.', 'Tahiris-PC'),
(506, '2025-10-06 16:31:40', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10000000.', 'Tahiris-PC'),
(507, '2025-10-06 16:31:54', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10000000.', 'Tahiris-PC'),
(508, '2025-10-06 16:32:18', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'Tahiris-PC'),
(509, '2025-10-06 16:32:29', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 12000000.', 'Tahiris-PC'),
(510, '2025-10-06 16:32:36', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 14091761.', 'Tahiris-PC'),
(511, '2025-10-06 16:32:39', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15071661.', 'Tahiris-PC'),
(512, '2025-10-06 16:33:04', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15214479.', 'Tahiris-PC'),
(513, '2025-10-06 16:35:11', 27576598, 'modificar', 'Modificó al profesor 18928013 (profesor).', 'Tahiris-PC'),
(514, '2025-10-06 16:36:09', 27576598, 'modificar', 'Modificó al profesor 14399700 (profesor).', 'Tahiris-PC'),
(515, '2025-10-06 16:36:38', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 18928013.', 'Tahiris-PC'),
(516, '2025-10-06 16:47:55', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MARYURI RIVEROS\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(517, '2025-10-06 16:48:29', 27576598, 'eliminar', 'Eliminó el horario del Profesor \"MARYURI RIVEROS\" Del año escolar \"2025-2026\".', 'Tahiris-PC'),
(518, '2025-10-06 17:27:14', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(519, '2025-10-06 17:28:23', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026\".', 'Tahiris-PC'),
(520, '2025-10-06 17:28:25', 27576598, 'eliminar', 'Eliminó el horario del Profesor \"PABLO GONZALEZ\" Del año escolar \"2025-2026\".', 'Tahiris-PC'),
(521, '2025-10-06 17:29:00', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(522, '2025-10-06 17:29:08', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(523, '2025-10-06 17:29:37', 27576598, 'insertar', 'Agregó la sección 1ero-U.', 'Tahiris-PC'),
(524, '2025-10-06 17:29:58', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(525, '2025-10-06 17:30:03', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(526, '2025-10-06 17:30:17', 27576598, 'modificar', 'Modificó la sección -.', 'Tahiris-PC'),
(527, '2025-10-06 17:32:30', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(528, '2025-10-06 17:33:03', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10000000.', 'Tahiris-PC'),
(529, '2025-10-06 17:34:02', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10000000.', 'Tahiris-PC'),
(530, '2025-10-06 17:37:42', 27576598, 'modificar', 'Modificó el año escolar 2025-2026.', 'Tahiris-PC'),
(531, '2025-10-06 17:39:11', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(532, '2025-10-06 17:39:15', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(533, '2025-10-06 17:39:18', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(534, '2025-10-06 17:39:20', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(535, '2025-10-06 17:39:23', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(536, '2025-10-06 17:39:26', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(537, '2025-10-06 19:41:32', 27576598, 'insertar', 'Agregó el año escolar 2025-2026 (1).', 'Tahiris-PC'),
(538, '2025-10-06 19:41:38', 27576598, 'modificar', 'Activo Año Escolar: 2025-2026 (1).', 'Tahiris-PC'),
(539, '2025-10-06 19:42:19', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(540, '2025-10-06 19:42:22', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(541, '2025-10-06 19:42:30', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(542, '2025-10-06 19:42:46', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(543, '2025-10-06 19:42:49', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(544, '2025-10-06 19:42:53', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(545, '2025-10-06 19:42:57', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(546, '2025-10-06 19:43:01', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(547, '2025-10-06 19:43:05', 27576598, 'eliminar', 'Eliminó al profesor .', 'Tahiris-PC'),
(548, '2025-10-06 19:45:08', 27576598, 'insertar', 'Agregó al profesor 10143237.', 'Tahiris-PC'),
(549, '2025-10-06 19:47:05', 27576598, 'insertar', 'Agregó al profesor 15071661.', 'Tahiris-PC'),
(550, '2025-10-06 19:48:01', 27576598, 'insertar', 'Agregó al profesor 18928013.', 'Tahiris-PC'),
(551, '2025-10-06 19:48:57', 27576598, 'insertar', 'Agregó al profesor 14399700.', 'Tahiris-PC'),
(552, '2025-10-06 19:49:54', 27576598, 'insertar', 'Agregó al profesor 14091761.', 'Tahiris-PC'),
(553, '2025-10-06 19:50:43', 27576598, 'insertar', 'Agregó al profesor 15214479.', 'Tahiris-PC'),
(554, '2025-10-06 19:51:29', 27576598, 'insertar', 'Agregó al profesor 5945553.', 'Tahiris-PC'),
(555, '2025-10-06 19:54:01', 27576598, 'modificar', 'Activo Año Escolar: 2025-2026.', 'Tahiris-PC'),
(556, '2025-10-06 19:56:10', 27576598, 'modificar', 'Activo Año Escolar: 2025-2026 (1).', 'Tahiris-PC'),
(557, '2025-10-06 19:58:23', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(558, '2025-10-06 20:32:55', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 14091761.', 'Tahiris-PC'),
(559, '2025-10-06 20:34:02', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 15071661.', 'Tahiris-PC'),
(560, '2025-10-06 20:34:08', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15071661.', 'Tahiris-PC'),
(561, '2025-10-06 20:35:32', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 10143237.', 'Tahiris-PC'),
(562, '2025-10-06 20:36:08', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 15214479.', 'Tahiris-PC'),
(563, '2025-10-06 20:36:29', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 5945553.', 'Tahiris-PC'),
(564, '2025-10-06 20:37:18', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 18928013.', 'Tahiris-PC'),
(565, '2025-10-06 20:37:42', 27576598, 'modificar', 'Movió las materias del profesor  al profesor 14399700.', 'Tahiris-PC'),
(566, '2025-10-06 20:38:29', 27576598, 'eliminar', 'Eliminó la sección .', 'Tahiris-PC'),
(567, '2025-10-06 20:41:41', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 5945553.', 'Tahiris-PC'),
(568, '2025-10-06 20:41:48', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 10143237.', 'Tahiris-PC'),
(569, '2025-10-06 20:42:01', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 14091761.', 'Tahiris-PC'),
(570, '2025-10-06 20:42:07', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15071661.', 'Tahiris-PC'),
(571, '2025-10-06 20:42:15', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 15214479.', 'Tahiris-PC'),
(572, '2025-10-06 20:42:21', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 18928013.', 'Tahiris-PC'),
(573, '2025-10-06 20:42:26', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 14399700.', 'Tahiris-PC'),
(574, '2025-10-06 20:48:45', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MAYURI  RIVEROS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(575, '2025-10-06 20:51:41', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(576, '2025-10-06 21:10:12', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MAYURI  RIVEROS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(577, '2025-10-06 21:19:18', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(578, '2025-10-06 21:26:27', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(579, '2025-10-06 21:26:30', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MAYURI  RIVEROS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(580, '2025-10-06 21:29:13', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(581, '2025-10-06 21:30:00', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(582, '2025-10-06 21:30:47', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(583, '2025-10-06 21:31:29', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(584, '2025-10-06 21:32:20', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(585, '2025-10-06 21:32:52', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MAYURI  RIVEROS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(586, '2025-10-06 21:53:01', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(587, '2025-10-06 21:58:30', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(588, '2025-10-06 22:02:06', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(589, '2025-10-06 22:05:54', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(590, '2025-10-06 22:07:17', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(591, '2025-10-06 22:16:16', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(592, '2025-10-06 22:16:40', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(593, '2025-10-06 22:17:56', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(594, '2025-10-06 22:20:28', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(595, '2025-10-06 22:28:17', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(596, '2025-10-06 22:28:34', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(597, '2025-10-06 22:31:25', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(598, '2025-10-06 22:31:31', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(599, '2025-10-06 22:33:36', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(600, '2025-10-06 22:35:34', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(601, '2025-10-06 22:35:45', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(602, '2025-10-06 22:47:10', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(603, '2025-10-06 22:48:52', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(604, '2025-10-06 22:49:04', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(605, '2025-10-06 22:50:13', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(606, '2025-10-06 22:50:41', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(607, '2025-10-06 22:51:33', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(608, '2025-10-06 23:01:41', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(609, '2025-10-06 23:02:10', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(610, '2025-10-06 23:03:27', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(611, '2025-10-06 23:03:46', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(612, '2025-10-06 23:07:21', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(613, '2025-10-06 23:08:25', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(614, '2025-10-06 23:10:20', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(615, '2025-10-06 23:11:44', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(616, '2025-10-06 23:13:05', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(617, '2025-10-06 23:13:26', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(618, '2025-10-06 23:13:53', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(619, '2025-10-06 23:22:21', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(620, '2025-10-06 23:26:10', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(621, '2025-10-06 23:27:58', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(622, '2025-10-06 23:29:35', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(623, '2025-10-06 23:33:14', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(624, '2025-10-06 23:33:24', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(625, '2025-10-06 23:34:23', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(626, '2025-10-06 23:34:35', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(627, '2025-10-06 23:34:48', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(628, '2025-10-06 23:35:04', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(629, '2025-10-06 23:35:38', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(630, '2025-10-06 23:36:13', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(631, '2025-10-06 23:36:34', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(632, '2025-10-06 23:40:36', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(633, '2025-10-06 23:42:01', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(634, '2025-10-06 23:43:27', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(635, '2025-10-06 23:43:41', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(636, '2025-10-06 23:44:50', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(637, '2025-10-06 23:45:51', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(638, '2025-10-06 23:47:10', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(639, '2025-10-06 23:47:49', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(640, '2025-10-06 23:49:30', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(641, '2025-10-06 23:50:25', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(642, '2025-10-06 23:53:22', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(643, '2025-10-07 00:02:11', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(644, '2025-10-07 00:03:54', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(645, '2025-10-07 00:05:01', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(646, '2025-10-07 00:10:00', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(647, '2025-10-07 00:10:32', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(648, '2025-10-07 00:10:58', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(649, '2025-10-07 00:11:56', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"RICARDO  ALVAREZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(650, '2025-10-07 00:12:17', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(651, '2025-10-07 00:12:46', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(652, '2025-10-07 00:13:13', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(653, '2025-10-07 00:22:53', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(654, '2025-10-07 00:23:09', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(655, '2025-10-07 00:25:53', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(656, '2025-10-07 00:28:34', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(657, '2025-10-07 00:31:49', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(658, '2025-10-07 00:33:17', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(659, '2025-10-07 08:25:35', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(660, '2025-10-07 08:36:02', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(661, '2025-10-07 08:40:42', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(662, '2025-10-07 08:42:43', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(663, '2025-10-07 08:49:25', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(664, '2025-10-07 08:49:43', 27576598, 'modificar', 'Cambió el PEMSUN del profesor 18928013.', 'Tahiris-PC'),
(665, '2025-10-07 08:50:12', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(666, '2025-10-07 09:17:21', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(667, '2025-10-07 09:17:38', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(668, '2025-10-07 09:30:04', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(669, '2025-10-07 09:30:14', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(670, '2025-10-07 09:30:25', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"MAYURI  RIVEROS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(671, '2025-10-07 09:30:31', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"AURORA RIOS\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(672, '2025-10-07 09:30:38', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILLIAMS LUGO\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(673, '2025-10-07 09:30:48', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(674, '2025-10-07 09:30:57', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"JHIMMY  TORRES\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(675, '2025-10-07 09:31:13', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(676, '2025-10-07 09:32:07', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"PABLO GONZALEZ\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(677, '2025-10-07 09:35:56', 27576598, 'insertar', 'Creó/Actualizo el horario Del Docente\"WILMER GARCIA\" Del Año Escolar \"2025-2026 (1)\".', 'Tahiris-PC'),
(678, '2025-10-17 11:14:17', 27576598, 'login', 'Ingresó al sistema.', 'Tahiris-PC'),
(679, '2025-10-17 11:15:41', 27576598, 'insertar', 'Agregó al profesor 29629080.', 'Tahiris-PC'),
(703, '2025-11-01 14:05:12', 29629080, 'eliminar', 'Eliminó la sección .', 'PC-Angel'),
(704, '2025-11-01 14:06:46', 29629080, 'eliminar', 'Eliminó la sección .', 'PC-Angel'),
(705, '2025-11-01 16:38:39', 29629080, 'login', 'Ingresó al sistema.', 'PC-Angel'),
(706, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Noviembre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(707, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Diciembre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(708, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Enero del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(709, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Febrero del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(710, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Marzo del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(711, '2025-11-10 10:05:49', 29629080, 'insertar', ' Insertó la mensualidad de Abril del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(712, '2025-11-10 10:05:50', 29629080, 'insertar', ' Insertó la mensualidad de Mayo del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(713, '2025-11-10 10:05:50', 29629080, 'insertar', ' Insertó la mensualidad de Junio del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(714, '2025-11-10 10:05:50', 29629080, 'insertar', ' Insertó la mensualidad de Julio del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(715, '2025-11-10 10:05:50', 29629080, 'insertar', ' Insertó la mensualidad de Agosto del Año Escolar \"Lmao\"', 'Tahiris-PC');
INSERT INTO `bitacora` (`id`, `fecha_hora`, `cedula`, `type`, `description`, `user_computer`) VALUES
(716, '2025-11-10 10:09:29', 29629080, 'modificar', 'El precio del Dólar se ha actualizado a: 227.56Bs', 'Tahiris-PC'),
(717, '2025-11-10 10:10:39', 29629080, 'insertar', ' Insertó la mensualidad de Octubre del Año Escolar \"Lmao\"', 'Tahiris-PC'),
(718, '2025-11-10 10:13:28', 29629080, 'insertar', ' Registró el pago ID: 0 del estudiante \"CESAR DAVID FIGUEREDO BALLESTER\"', 'Tahiris-PC');

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
(1, 227.56);

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
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `cod_ano_seccion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`cedula_estudiante`, `nombres`, `apellidos`, `ano`, `seccion`, `activo`, `cod_ano_seccion`) VALUES
(32777011, 'LISMAR ANAIS', 'SOSA CARDENAS', '2025-2026', '5to U', 1, 20),
(32838191, 'CAMILA VALENTINA', 'ANZOLA MENDOZA', '2025-2026', '5to U', 1, 20),
(32922586, 'JORGELYS PAOLA', 'NADALES PRIMERA', '2025-2026', '5to U', 1, 20),
(33002091, 'ANDRUS ENRIQUE', 'MADRID ACOSTA', '2025-2026', '5to U', 1, 20),
(33002547, 'VICMAR ANDREINA', 'LEON NIÑO', '2025-2026', '5to U', 1, 20),
(33002566, 'JUAN DAVID', 'CATTAROSSI VALERA', '2025-2026', '5to U', 1, 20),
(33084424, 'JOSE ROBERTO', 'VARGAS GUERRERO', '2025-2026', '5to U', 1, 20),
(33168912, 'VILMA VICTORIA', 'TORREALBA MENDOZA', '2025-2026', '5to U', 1, 20),
(33169289, 'KAMILA STEFANYA', 'LINARES RODRIGUEZ', '2025-2026', '5to U', 1, 20),
(33175090, 'KATHERINE PAOLA', 'CEDEÑO VILORIA', '2025-2026', '5to U', 1, 20),
(33175127, 'IVAN ALEJANDRO', 'TORO LOPEZ', '2025-2026', '4to U', 1, 21),
(33175175, 'EUSKARYH BRAYLIN', 'HERNANDEZ DOMINGUEZ', '2025-2026', '5to U', 1, 20),
(33175330, 'DENNIMAR VALENTINA', 'PAREDES GUEVARA', '2025-2026', '4to U', 1, 21),
(33252644, 'KAMILA SOFIA', 'GOMEZ ESCALONA', '2025-2026', '5to U', 1, 20),
(33306143, 'VALERIA DE LOS ANGELES', 'RODRIGUEZ RODRIGUEZ', '2025-2026', '5to U', 1, 20),
(33306236, 'LUIS ALEJANDRO', 'BASTIDAS SOTELDO', '2025-2026', '5to U', 1, 20),
(33306573, 'MARIA FERNANDA', 'PEREZ LANDAETA', '2025-2026', '5to U', 1, 20),
(33349422, 'TOMAS ALFONSO', 'ALCANTARA MARTINEZ', '2025-2026', '5to U', 1, 20),
(33349771, 'FRANYER ALEXANDER', 'TORREALBA TERAN', '2025-2026', '5to U', 1, 20),
(33414159, 'LEDIUZKA TATIANA', 'ALFONZO PASTERNAK', '2025-2026', '5to U', 1, 20),
(33414638, 'REYSON JEREMI', 'PEREZ LOAIZA', '2025-2026', '5to U', 1, 20),
(33414641, 'RANIEL FRANCO', 'PEREZ LOAIZA', '2025-2026', '5to U', 1, 20),
(33485222, 'STEFANI FABIANA', 'CAÑIZALEZ TORO', '2025-2026', '5to U', 1, 20),
(33485436, 'JESUS ALBERTO', 'YEPEZ SANCHEZ', '2025-2026', '4to U', 1, 21),
(33485451, 'CAMILA GLORIANNYS', 'LANDINEZ LINAREZ', '2025-2026', '4to U', 1, 21),
(33493695, 'BARBARA KENDRUA JOSE', 'SEGUERI BARCO', '2025-2026', '5to U', 1, 20),
(33710201, 'LEONARDO DANIEL', 'PEREZ JIMENEZ', '2025-2026', '5to U', 1, 20),
(33777714, 'MICHAEL STIVEN', 'COLMENAREZ HERRERA', '2025-2026', '4to U', 1, 21),
(33778602, 'KEILYN CETMICE', 'ROMERO ALVIA', '2025-2026', '4to U', 1, 21),
(33778697, 'SEBASTIAN JOSE', 'SEGOVIA BLANCO', '2025-2026', '4to U', 1, 21),
(33879996, 'EZEQUIEL RENE', 'RIVAS LINAREZ', '2025-2026', '5to U', 1, 20),
(33880380, 'KRISTTIAN ROBERTO', 'AGUILAR RODRIGUEZ', '2025-2026', '3ero U', 1, 22),
(33947595, 'KHAMILA VICTORIA', 'MENDOZA ALVAREZ', '2025-2026', '4to U', 1, 21),
(33947844, 'ROSMERYS KATERIN', 'ALVARADO ARAUJO', '2025-2026', '5to U', 1, 20),
(33947848, 'SANTIAGO ALEJANDRO', 'OROPEZA FALCON', '2025-2026', '4to U', 1, 21),
(33948349, 'ANGEL GABRIEL', 'YECERRA SIRA', '2025-2026', '4to U', 1, 21),
(33948358, 'ANGELYS DOUGLIMAR', 'REINOSO SANCHEZ', '2025-2026', '3ero U', 1, 22),
(33999685, 'MAURICIO YAMPIER', 'ANGULO BOLIVAR', '2025-2026', '3ero U', 1, 22),
(34168961, 'ALEXANDERLYS GEORGELYZ', 'YEPEZ ADAM', '2025-2026', '2do U', 1, 19),
(34169023, 'DIANYS ESTEFANIA', 'BETIN VIRGUEZ', '2025-2026', '3ero U', 1, 22),
(34169524, 'JOSTIN SMIT', 'ROJAS GUTIERREZ', '2025-2026', '3ero U', 1, 22),
(34169617, 'CELESTE SARAI', 'PALMA RONDON', '2025-2026', '4to U', 1, 21),
(34208687, 'YORKELLYS SOFIA', 'GARCIA CORDERO', '2025-2026', '3ero U', 1, 22),
(34208742, 'CARLOS GABRIEL', 'GONZALEZ ARAPE', '2025-2026', '4to U', 1, 21),
(34208775, 'CAMILO SANTIAGO', 'NIÑO AMARO', '2025-2026', '3ero U', 1, 22),
(34208827, 'DORKA RASEC', 'REVEROL PEREZ', '2025-2026', '3ero U', 1, 22),
(34208869, 'FREVIXON ADRIAN', 'RODRIGUEZ MORA', '2025-2026', '5to U', 1, 20),
(34209204, 'ANDREA CAROLINA', 'PEROZA ORTIZ', '2025-2026', '5to U', 1, 20),
(34209319, 'LUIS ARTURO', 'LOBATON RODRIGUEZ', '2025-2026', '5to U', 1, 20),
(34223407, 'GENESIS NOHEMI', 'ZARATE BASTIDAS', '2025-2026', '4to U', 1, 21),
(34223693, 'JEANNA ANDREA', 'CEDEÑO PEREZ', '2025-2026', '3ero U', 1, 22),
(34223742, 'LUIS JOSE', 'PERDOMO URDANETA', '2025-2026', '3ero U', 1, 22),
(34224002, 'ANGELICA ISABELLA', 'SALAS VARGAS', '2025-2026', '3ero U', 1, 22),
(34224087, 'DANIEL ALEXANDER', 'ROSALES RICO', '2025-2026', '4to U', 1, 21),
(34224185, 'KEIBER ALEJANDRO', 'ALVARADO AGUILAR', '2025-2026', '3ero U', 1, 22),
(34224205, 'SOFIA SARAHI', 'LOYO ROSALES', '2025-2026', '4to U', 1, 21),
(34224321, 'SANTIAGO ALEJANDRO', 'PONTE PELAYO', '2025-2026', '3ero U', 1, 22),
(34275610, 'ESTEFANY PAOLA', 'DURAN TORRES', '2025-2026', '4to U', 1, 21),
(34276293, 'JEANKARLYS ALEXANDRA', 'ESCALONA TORRES', '2025-2026', '4to U', 1, 21),
(34276347, 'PAUL ALEJANDRO', 'ANDRADE AGUILAR', '2025-2026', '3ero U', 1, 22),
(34303906, 'SEBASTIAN JOSUE', 'QUERALES OLIVEROS', '2025-2026', '4to U', 1, 21),
(34304391, 'MARIANA VICTORIA', 'LEAL LOPEZ', '2025-2026', '3ero U', 1, 22),
(34304471, 'MARIELI MAYBEL', 'ZAMORA RODRIGUEZ', '2025-2026', '3ero U', 1, 22),
(34343007, 'JOSE ANGEL', 'LANDINEZ LINAREZ', '2025-2026', '2do U', 1, 19),
(34343212, 'RUTMARY ANDREINA', 'ANCISO SALCEDO', '2025-2026', '3ero U', 1, 22),
(34343401, 'JOSE ANGEL', 'HERNANDEZ CORDERO', '2025-2026', '5to U', 1, 20),
(34388569, 'ENNZO DAVID', 'BARCO RODRIGUEZ', '2025-2026', '2do U', 1, 19),
(34388926, 'JAVIER ALEXANDER', 'BRITO RODRIGUEZ', '2025-2026', '4to U', 1, 21),
(34389227, 'OSKEYLIS DEL CARMEN', 'CEDEÑO SALAS', '2025-2026', '2do U', 1, 19),
(34389261, 'ISABELA VALENTINA', 'LUCENA SANCHEZ', '2025-2026', '4to U', 1, 21),
(34389441, 'LEISMAR DEL CARMEN', 'RODRIGUEZ ALVARADO', '2025-2026', '2do U', 1, 19),
(34400906, 'MARIANNA JOSE', 'VALDERRAMA BARCO', '2025-2026', '3ero U', 1, 22),
(34458464, 'EDUAR JOSE', 'BRACHO MEDINA', '2025-2026', '4to U', 1, 21),
(34458527, 'LUISA MARIA', 'HURTADO YECERRA', '2025-2026', '3ero U', 1, 22),
(34458550, 'MANUEL ENRIQUE', 'MEJIA GONZALEZ', '2025-2026', '2do U', 1, 19),
(34458556, 'ANTHONI GABRIEL', 'CALZOLAIO GONZALEZ', '2025-2026', '2do U', 1, 19),
(34458851, 'ELIERD JOSE', 'PEREZ RODRIGUEZ', '2025-2026', '3ero U', 1, 22),
(34458860, 'IVAN GABRIEL', 'SANCHEZ GONZALEZ', '2025-2026', '2do U', 1, 19),
(34458961, 'JESUS DANIEL', 'ALVARADO MAMBEL', '2025-2026', '4to U', 1, 21),
(34459000, 'ALEXANDER JESUS', 'BARRAEZ COHIL', '2025-2026', '4to U', 1, 21),
(34459056, 'ANGEL JONAS', 'ACOSTA MONTILLA', '2025-2026', '3ero U', 1, 22),
(34486772, 'JOHAN DANIEL', 'MARTINEZ MEJIAS', '2025-2026', '4to U', 1, 21),
(34487294, 'ADRIANA VICTORIA', 'TERAN HERNANDEZ', '2025-2026', '2do U', 1, 19),
(34572386, 'SOFIA NAZARETH', 'TAMAYO LOZADA', '2025-2026', '2do U', 1, 19),
(34633400, 'DAVISMAR KATHERINE', 'GARRIDO AVENDAÑO', '2025-2026', '3ero U', 1, 22),
(34633558, 'SHALOME VICTORIA', 'NARANJO PEREZ', '2025-2026', '2do U', 1, 19),
(34634039, 'YENDERSSON YOHANDRY', 'ROJAS CAMACARO', '2025-2026', '2do U', 1, 19),
(34722484, 'EMILY CAMILA', 'GIMENEZ RODRIGUEZ', '2025-2026', '2do U', 1, 19),
(34722694, 'MARIA JOSE', 'DUDAMEL RIVERO', '2025-2026', '3ero U', 1, 22),
(34722745, 'AARON SEBASTIAN', 'VARELA HERNANDEZ', '2025-2026', '3ero U', 1, 22),
(34722924, 'KENDER JOSUE', 'COLMENAREZ SANCHEZ', '2025-2026', '2do U', 1, 19),
(34723236, 'VALERIA MARIA', 'JAIMES TORRES', '2025-2026', '1ero U', 1, 18),
(34811537, 'MARIELLYS VALENTINA', 'NOGUERA DELGADO', '2025-2026', '1ero U', 1, 18),
(34811560, 'CESAR DAVID', 'FIGUEREDO BALLESTER', '2025-2026', '2do U', 1, 19),
(34811726, 'ALEJANDRA SOFIA', 'YEPEZ PIÑA', '2025-2026', '1ero U', 1, 18),
(34892828, 'VALERIA STEPHANIA', 'BURGOS RODRIGUEZ', '2025-2026', '1ero U', 1, 18),
(34893034, 'LUIS ALFONSO', 'SOSA CARDENAS', '2025-2026', '1ero U', 1, 18),
(34959720, 'EDUARDO JESUS', 'RODRIGUEZ CASTRO', '2025-2026', '4to U', 1, 21),
(35030218, 'SANTIAGO YHOSUE', 'CASTILLO QUEVEDO', '2025-2026', '1ero U', 1, 18),
(35030694, 'DILIA MARIA', 'KIENZLER LEON', '2025-2026', '4to U', 1, 21),
(35079515, 'WALESKA RASHEL', 'PIÑERO COLMENAREZ', '2025-2026', '4to U', 1, 21),
(35079838, 'VALERIA VALENTINA', 'RUIZ VILLAREAL', '2025-2026', '3ero U', 1, 22),
(35126833, 'JOSE GREGORIO', 'BARRERA ARAUJO', '2025-2026', '2do U', 1, 19),
(35162879, 'ZAMIRA VALENTINA', 'CORDERO MELENDEZ', '2025-2026', '3ero U', 1, 22),
(35179755, 'MAOLIN SKARLET', 'BUITRAGO SALCEDO', '2025-2026', '2do U', 1, 19),
(36023554, 'SALOMON DAVID', 'FERNANDEZ GARCIA', '2025-2026', '1ero U', 1, 18),
(36035499, 'BETMARY JOSSIBETH', 'MORENO MUJICA', '2025-2026', '2do U', 1, 19),
(36087305, 'GUSTAVO ALEJANDRO', 'PARRA CASTRO', '2025-2026', '3ero U', 1, 22),
(36092601, 'MARIANGEL NICOL', 'HERRERA ROJAS', '2025-2026', '3ero U', 1, 22),
(36122770, 'SOPHIA ANTHONIETA', 'PONTE PELAYO', '2025-2026', '1ero U', 1, 18),
(36164778, 'JOSE MANUEL', 'RODRIGUEZ SANCHEZ', '2025-2026', '2do U', 1, 19),
(36308539, 'MAXIMILIANO', 'VALERA GUANDA', '2025-2026', '1ero U', 1, 18),
(36390927, 'JOHENNYS DARIAM', 'MARTINEZ MEJIAS', '2025-2026', '2do U', 1, 19),
(36401448, 'GERMARYS ESTEFANIA', 'DELGADO GUEDEZ', '2025-2026', '1ero U', 1, 18),
(36619124, 'DANNA SARID', 'TESORERO AREVALO', '2025-2026', '1ero U', 1, 18),
(36747114, 'ORIANNI DESSIRET', 'PELLONIS PARRA', '2025-2026', '1ero U', 1, 18),
(36901399, 'OLIVER ALEJANDRO', 'LINARES RAMIREZ', '2025-2026', '1ero U', 1, 18),
(36940803, 'ANGEL JOSE', 'GUDIÑO SUAREZ', '2025-2026', '3ero U', 1, 22),
(36947726, 'ANTUAN ARTURO', 'RUIZ VARGAS', '2025-2026', '1ero U', 1, 18),
(36991757, 'DIEGO ISAHATH JOSE', 'SEGUERI BARCO', '2025-2026', '1ero U', 1, 18);

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

--
-- Volcado de datos para la tabla `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`, `receso`) VALUES
(7432, NULL, 18, 'EF', 25, 'B1J', ' ', NULL, 7, NULL),
(7433, NULL, 19, 'EF', 25, 'B2J', ' ', NULL, 7, NULL),
(7434, NULL, 18, 'EF', 25, 'B3J', ' ', NULL, 7, NULL),
(7435, NULL, 19, 'CA', 26, 'B1J', ' ', NULL, 7, NULL),
(9218, 22, 20, 'FSN', 29, 'B1MM', ' ', 14399700, 6, NULL),
(9219, 22, 21, 'EF', 28, 'B1J', ' ', 14399700, 6, NULL),
(9220, 22, 20, 'EF', 29, 'B1V', ' ', 14399700, 6, NULL),
(9221, 22, 20, 'FSN', 29, 'B2MM', ' ', 14399700, 6, NULL),
(9222, 22, 21, 'EF', 28, 'B2J', ' ', 14399700, 6, NULL),
(9223, 22, 20, 'EF', 29, 'B2V', ' ', 14399700, 6, NULL),
(9224, 22, 21, 'OC', 28, 'B3MM', ' ', 14399700, 6, NULL),
(9225, 22, 21, 'EF', 28, 'B3J', ' ', 14399700, 6, NULL),
(9226, 22, 20, 'EF', 29, 'B3V', ' ', 14399700, 6, NULL),
(9227, 22, 18, 'CN', 25, 'B4MM', ' ', 14399700, 6, NULL),
(9228, 22, 18, 'CN', 25, 'B4J', ' ', 14399700, 6, NULL),
(9229, 22, 22, 'EF', 27, 'B4V', ' ', 14399700, 6, NULL),
(9230, 22, 21, 'FSN', 28, 'B5MM', ' ', 14399700, 6, NULL),
(9231, 22, 18, 'CN', 25, 'B5J', ' ', 14399700, 6, NULL),
(9232, 22, 22, 'EF', 27, 'B5V', ' ', 14399700, 6, NULL),
(9233, 22, 21, 'FSN', 28, 'B6MM', ' ', 14399700, 6, NULL),
(9234, 22, 18, 'CN', 25, 'B6J', ' ', 14399700, 6, NULL),
(9235, 22, 22, 'EF', 27, 'B6V', ' ', 14399700, 6, NULL),
(9236, 22, 19, 'EF', 26, 'B7MM', ' ', 14399700, 6, NULL),
(9237, 22, 21, 'PGCRP', 28, 'B7J', ' ', 14399700, 6, NULL),
(9238, 22, 18, 'EF', 25, 'B7V', ' ', 14399700, 6, NULL),
(9239, 22, 19, 'EF', 26, 'B8MM', ' ', 14399700, 6, NULL),
(9240, 22, 21, 'PGCRP', 28, 'B8J', ' ', 14399700, 6, NULL),
(9241, 22, 18, 'EF', 25, 'B8V', ' ', 14399700, 6, NULL),
(9242, 22, 19, 'EF', 26, 'B9MM', ' ', 14399700, 6, NULL),
(9243, 22, 21, 'PGCRP', 28, 'B9J', ' ', 14399700, 6, NULL),
(9244, 22, 18, 'EF', 25, 'B9V', ' ', 14399700, 6, NULL),
(9795, 22, 18, 'CIVICO', 25, 'B1L', ' ', 14091761, 6, NULL),
(9796, 22, 21, 'QU', 28, 'B1MM', ' ', 14091761, 6, NULL),
(9797, 22, 21, 'QU', 28, 'B2L', ' ', 14091761, 6, NULL),
(9798, 22, 21, 'QU', 28, 'B2MM', ' ', 14091761, 6, NULL),
(9799, 22, 21, 'QU', 28, 'B3L', ' ', 14091761, 6, NULL),
(9800, 22, 20, 'CT', 29, 'B3MM', ' ', 14091761, 6, NULL),
(9801, 22, 22, 'QU', 27, 'B4MM', ' ', 14091761, 6, NULL),
(9802, 22, 20, 'QU', 29, 'B5L', ' ', 14091761, 6, NULL),
(9803, 22, 22, 'QU', 27, 'B5MM', ' ', 14091761, 6, NULL),
(9804, 22, 20, 'QU', 29, 'B6L', ' ', 14091761, 6, NULL),
(9805, 22, 20, 'QU', 29, 'B6MM', ' ', 14091761, 6, NULL),
(9806, 22, 22, 'QU', 27, 'B7L', ' ', 14091761, 6, NULL),
(9807, 22, 20, 'QU', 29, 'B7MM', ' ', 14091761, 6, NULL),
(9808, 22, 22, 'QU', 27, 'B8L', ' ', 14091761, 6, NULL),
(9809, 22, 20, 'CT', 29, 'B9L', ' ', 14091761, 6, NULL),
(9810, 22, 19, 'CIVICO', 27, 'B1L', ' ', 15214479, 6, NULL),
(9811, 22, 19, 'AP', 26, 'B1M', ' ', 15214479, 6, NULL),
(9812, 22, 19, 'AP', 26, 'B1MM', ' ', 15214479, 6, NULL),
(9813, 22, 18, 'AP', 25, 'B1J', ' ', 15214479, 6, NULL),
(9814, 22, 21, 'GHC', 28, 'B1V', ' ', 15214479, 6, NULL),
(9815, 22, 18, 'OC', 25, 'B2L', ' ', 15214479, 6, NULL),
(9816, 22, 19, 'AP', 26, 'B2M', ' ', 15214479, 6, NULL),
(9817, 22, 19, 'AP', 26, 'B2MM', ' ', 15214479, 6, NULL),
(9818, 22, 18, 'AP', 25, 'B2J', ' ', 15214479, 6, NULL),
(9819, 22, 21, 'GHC', 28, 'B2V', ' ', 15214479, 6, NULL),
(9820, 22, 21, 'GHC', 28, 'B3V', ' ', 15214479, 6, NULL),
(9821, 22, 18, 'AP', 25, 'B4M', ' ', 15214479, 6, NULL),
(9822, 22, 22, 'GHC', 27, 'B4J', ' ', 15214479, 6, NULL),
(9823, 22, 19, 'GHC', 26, 'B4V', ' ', 15214479, 6, NULL),
(9824, 22, 19, 'GHC', 26, 'B5L', ' ', 15214479, 6, NULL),
(9825, 22, 18, 'AP', 25, 'B5M', ' ', 15214479, 6, NULL),
(9826, 22, 18, 'GHC', 25, 'B5MM', ' ', 15214479, 6, NULL),
(9827, 22, 22, 'GHC', 27, 'B5J', ' ', 15214479, 6, NULL),
(9828, 22, 19, 'GHC', 26, 'B5V', ' ', 15214479, 6, NULL),
(9829, 22, 19, 'GHC', 26, 'B6L', ' ', 15214479, 6, NULL),
(9830, 22, 20, 'GHC', 29, 'B6M', ' ', 15214479, 6, NULL),
(9831, 22, 18, 'GHC', 25, 'B6MM', ' ', 15214479, 6, NULL),
(9832, 22, 22, 'GHC', 27, 'B6J', ' ', 15214479, 6, NULL),
(9833, 22, 19, 'GHC', 26, 'B6V', ' ', 15214479, 6, NULL),
(9834, 22, 19, 'GHC', 26, 'B7L', ' ', 15214479, 6, NULL),
(9835, 22, 20, 'GHC', 29, 'B7M', ' ', 15214479, 6, NULL),
(9836, 22, 18, 'GHC', 25, 'B7MM', ' ', 15214479, 6, NULL),
(9837, 22, 18, 'PGCRP', 25, 'B7J', ' ', 15214479, 6, NULL),
(9838, 22, 18, 'GHC', 25, 'B8L', ' ', 15214479, 6, NULL),
(9839, 22, 22, 'GHC', 27, 'B8M', ' ', 15214479, 6, NULL),
(9840, 22, 18, 'OC', 25, 'B8MM', ' ', 15214479, 6, NULL),
(9841, 22, 18, 'PGCRP', 25, 'B8J', ' ', 15214479, 6, NULL),
(9842, 22, 20, 'GHC', 29, 'B8V', ' ', 15214479, 6, NULL),
(9843, 22, 18, 'GHC', 25, 'B9L', ' ', 15214479, 6, NULL),
(9844, 22, 22, 'GHC', 27, 'B9M', ' ', 15214479, 6, NULL),
(9845, 22, 18, 'PGCRP', 25, 'B9J', ' ', 15214479, 6, NULL),
(9846, 22, 20, 'GHC', 29, 'B9V', ' ', 15214479, 6, NULL),
(9847, 22, 22, 'CIVICO', 26, 'B1L', ' ', 15071661, 6, NULL),
(9848, 22, 20, 'BI', 29, 'B1M', ' ', 15071661, 6, NULL),
(9849, 22, 20, 'BI', 29, 'B2L', ' ', 15071661, 6, NULL),
(9850, 22, 20, 'BI', 29, 'B2M', ' ', 15071661, 6, NULL),
(9851, 22, 20, 'BI', 29, 'B3L', ' ', 15071661, 6, NULL),
(9852, 22, 22, 'BI', 27, 'B4L', ' ', 15071661, 6, NULL),
(9853, 22, 22, 'BI', 27, 'B4M', ' ', 15071661, 6, NULL),
(9854, 22, 22, 'BI', 27, 'B5L', ' ', 15071661, 6, NULL),
(9855, 22, 22, 'BI', 27, 'B5M', ' ', 15071661, 6, NULL),
(9856, 22, 21, 'BI', 28, 'B6L', ' ', 15071661, 6, NULL),
(9857, 22, 19, 'CN', 26, 'B6M', ' ', 15071661, 6, NULL),
(9858, 22, 21, 'BI', 28, 'B7L', ' ', 15071661, 6, NULL),
(9859, 22, 19, 'CN', 26, 'B7M', ' ', 15071661, 6, NULL),
(9860, 22, 19, 'CN', 26, 'B8L', ' ', 15071661, 6, NULL),
(9861, 22, 21, 'BI', 28, 'B8M', ' ', 15071661, 6, NULL),
(9862, 22, 19, 'CN', 26, 'B9L', ' ', 15071661, 6, NULL),
(9863, 22, 21, 'BI', 28, 'B9M', ' ', 15071661, 6, NULL),
(9900, 22, 21, 'ILE', 28, 'B1M', ' ', 18928013, 6, NULL),
(9901, 22, 20, 'ILE', 29, 'B1J', ' ', 18928013, 6, NULL),
(9902, 22, 22, 'TC', 27, 'B1V', ' ', 18928013, 6, NULL),
(9903, 22, 21, 'ILE', 28, 'B2M', ' ', 18928013, 6, NULL),
(9904, 22, 20, 'ILE', 29, 'B2J', ' ', 18928013, 6, NULL),
(9905, 22, 22, 'TC', 27, 'B2V', ' ', 18928013, 6, NULL),
(9906, 22, 21, 'ILE', 28, 'B3M', ' ', 18928013, 6, NULL),
(9907, 22, 20, 'ILE', 29, 'B3J', ' ', 18928013, 6, NULL),
(9908, 22, 19, 'OC', 26, 'B4L', ' ', 18928013, 6, NULL),
(9909, 22, 19, 'ILE', 26, 'B4M', ' ', 18928013, 6, NULL),
(9910, 22, 19, 'ILE', 26, 'B4J', ' ', 18928013, 6, NULL),
(9911, 22, 19, 'ILE', 26, 'B5M', ' ', 18928013, 6, NULL),
(9912, 22, 19, 'ILE', 26, 'B5J', ' ', 18928013, 6, NULL),
(9913, 22, 21, 'ILE', 28, 'B5V', ' ', 18928013, 6, NULL),
(9914, 22, 18, 'ILE', 25, 'B6L', ' ', 18928013, 6, NULL),
(9915, 22, 18, 'ILE', 25, 'B6M', ' ', 18928013, 6, NULL),
(9916, 22, 19, 'ILE', 26, 'B6J', ' ', 18928013, 6, NULL),
(9917, 22, 21, 'ILE', 28, 'B6V', ' ', 18928013, 6, NULL),
(9918, 22, 18, 'ILE', 25, 'B7L', ' ', 18928013, 6, NULL),
(9919, 22, 18, 'ILE', 25, 'B7M', ' ', 18928013, 6, NULL),
(9920, 22, 19, 'PGCRP', 26, 'B7J', ' ', 18928013, 6, NULL),
(9921, 22, 22, 'ILE', 27, 'B7V', ' ', 18928013, 6, NULL),
(9922, 22, 18, 'ILE', 25, 'B8M', ' ', 18928013, 6, NULL),
(9923, 22, 19, 'PGCRP', 26, 'B8J', ' ', 18928013, 6, NULL),
(9924, 22, 22, 'ILE', 27, 'B8V', ' ', 18928013, 6, NULL),
(9925, 22, 19, 'OC', 26, 'B9M', ' ', 18928013, 6, NULL),
(9926, 22, 19, 'PGCRP', 26, 'B9J', ' ', 18928013, 6, NULL),
(9927, 22, 22, 'ILE', 27, 'B9V', ' ', 18928013, 6, NULL),
(9962, 22, 20, 'CIVICO', 29, 'B1L', ' ', 5945553, 6, NULL),
(9963, 22, 18, 'MA', 25, 'B1M', ' ', 5945553, 6, NULL),
(9964, 22, 22, 'MA', 27, 'B1MM', ' ', 5945553, 6, NULL),
(9965, 22, 22, 'FI', 27, 'B1J', ' ', 5945553, 6, NULL),
(9966, 22, 18, 'MA', 25, 'B1V', ' ', 5945553, 6, NULL),
(9967, 22, 22, 'OC', 27, 'B2L', ' ', 5945553, 6, NULL),
(9968, 22, 18, 'MA', 25, 'B2M', ' ', 5945553, 6, NULL),
(9969, 22, 22, 'MA', 27, 'B2MM', ' ', 5945553, 6, NULL),
(9970, 22, 22, 'FI', 27, 'B2J', ' ', 5945553, 6, NULL),
(9971, 22, 18, 'MA', 25, 'B2V', ' ', 5945553, 6, NULL),
(9972, 22, 19, 'MA', 26, 'B4MM', ' ', 5945553, 6, NULL),
(9973, 22, 21, 'MA', 28, 'B5L', ' ', 5945553, 6, NULL),
(9974, 22, 20, 'FI', 29, 'B5M', ' ', 5945553, 6, NULL),
(9975, 22, 19, 'MA', 26, 'B5MM', ' ', 5945553, 6, NULL),
(9976, 22, 20, 'MA', 29, 'B5J', ' ', 5945553, 6, NULL),
(9977, 22, 20, 'FI', 29, 'B5V', ' ', 5945553, 6, NULL),
(9978, 22, 22, 'FI', 27, 'B6M', ' ', 5945553, 6, NULL),
(9979, 22, 19, 'MA', 26, 'B6MM', ' ', 5945553, 6, NULL),
(9980, 22, 20, 'MA', 29, 'B6J', ' ', 5945553, 6, NULL),
(9981, 22, 20, 'FI', 29, 'B6V', ' ', 5945553, 6, NULL),
(9982, 22, 20, 'MA', 29, 'B7L', ' ', 5945553, 6, NULL),
(9983, 22, 22, 'FI', 27, 'B7M', ' ', 5945553, 6, NULL),
(9984, 22, 21, 'FI', 28, 'B7MM', ' ', 5945553, 6, NULL),
(9985, 22, 22, 'PGCRP', 27, 'B7J', ' ', 5945553, 6, NULL),
(9986, 22, 20, 'FI', 29, 'B7V', ' ', 5945553, 6, NULL),
(9987, 22, 20, 'MA', 29, 'B8L', ' ', 5945553, 6, NULL),
(9988, 22, 19, 'MA', 26, 'B8M', ' ', 5945553, 6, NULL),
(9989, 22, 21, 'FI', 28, 'B8MM', ' ', 5945553, 6, NULL),
(9990, 22, 22, 'PGCRP', 27, 'B8J', ' ', 5945553, 6, NULL),
(9991, 22, 21, 'MA', 28, 'B8V', ' ', 5945553, 6, NULL),
(9992, 22, 22, 'MA', 27, 'B9L', ' ', 5945553, 6, NULL),
(9993, 22, 21, 'FI', 28, 'B9MM', ' ', 5945553, 6, NULL),
(9994, 22, 22, 'PGCRP', 27, 'B9J', ' ', 5945553, 6, NULL),
(9995, 22, 21, 'MA', 28, 'B9V', ' ', 5945553, 6, NULL),
(9996, 22, 21, 'CIVICO', 28, 'B1L', ' ', 10143237, 6, NULL),
(9997, 22, 22, 'CA', 27, 'B1M', ' ', 10143237, 6, NULL),
(9998, 22, 18, 'CA', 25, 'B1MM', ' ', 10143237, 6, NULL),
(9999, 22, 19, 'TC', 26, 'B1J', ' ', 10143237, 6, NULL),
(10000, 22, 19, 'CA', 26, 'B1V', ' ', 10143237, 6, NULL),
(10001, 22, 19, 'CA', 26, 'B2L', ' ', 10143237, 6, NULL),
(10002, 22, 22, 'CA', 27, 'B2M', ' ', 10143237, 6, NULL),
(10003, 22, 18, 'CA', 25, 'B2MM', ' ', 10143237, 6, NULL),
(10004, 22, 19, 'TC', 26, 'B2J', ' ', 10143237, 6, NULL),
(10005, 22, 19, 'CA', 26, 'B2V', ' ', 10143237, 6, NULL),
(10006, 22, 20, 'TC', 29, 'B3M', ' ', 10143237, 6, NULL),
(10007, 22, 18, 'TC', 25, 'B3V', ' ', 10143237, 6, NULL),
(10008, 22, 18, 'CA', 25, 'B4L', ' ', 10143237, 6, NULL),
(10009, 22, 18, 'TC', 25, 'B4V', ' ', 10143237, 6, NULL),
(10010, 22, 18, 'CA', 25, 'B5L', ' ', 10143237, 6, NULL),
(10011, 22, 21, 'TC', 28, 'B5M', ' ', 10143237, 6, NULL),
(10012, 22, 20, 'OC', 29, 'B5MM', ' ', 10143237, 6, NULL),
(10013, 22, 21, 'CA', 28, 'B5J', ' ', 10143237, 6, NULL),
(10014, 22, 18, 'TC', 25, 'B5V', ' ', 10143237, 6, NULL),
(10015, 22, 22, 'CA', 27, 'B6L', ' ', 10143237, 6, NULL),
(10016, 22, 21, 'TC', 28, 'B6M', ' ', 10143237, 6, NULL),
(10017, 22, 22, 'CA', 27, 'B6MM', ' ', 10143237, 6, NULL),
(10018, 22, 21, 'CA', 28, 'B6J', ' ', 10143237, 6, NULL),
(10019, 22, 18, 'TC', 25, 'B6V', ' ', 10143237, 6, NULL),
(10020, 22, 21, 'TC', 28, 'B7M', ' ', 10143237, 6, NULL),
(10021, 22, 22, 'CA', 27, 'B7MM', ' ', 10143237, 6, NULL),
(10022, 22, 20, 'PGCRP', 29, 'B7J', ' ', 10143237, 6, NULL),
(10023, 22, 21, 'TC', 28, 'B7V', ' ', 10143237, 6, NULL),
(10024, 22, 21, 'CA', 28, 'B8L', ' ', 10143237, 6, NULL),
(10025, 22, 20, 'CA', 29, 'B8M', ' ', 10143237, 6, NULL),
(10026, 22, 20, 'CA', 29, 'B8MM', ' ', 10143237, 6, NULL),
(10027, 22, 20, 'PGCRP', 29, 'B8J', ' ', 10143237, 6, NULL),
(10028, 22, 21, 'CA', 28, 'B9L', ' ', 10143237, 6, NULL),
(10029, 22, 20, 'CA', 29, 'B9M', ' ', 10143237, 6, NULL),
(10030, 22, 20, 'CA', 29, 'B9MM', ' ', 10143237, 6, NULL),
(10031, 22, 20, 'PGCRP', 29, 'B9J', ' ', 10143237, 6, NULL);

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
(12, 12710000, '$2y$10$bCOZpNIaa2JLIHAfHT9kjO9qMcr6qRT1R.DiPqK6gFYN0Wes4oemi', '¿Cuál es el nombre de tu primera mascota?', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '$2y$10$TJBIYuFvf4oaJduH2o6UKu4F2sQQAPToZq9Qv96DGijtVTxbVte66', '$2y$10$uaKzIagIgBMm3YkdcPieQuZhexxeU1q7SZrBSefRiIRcmSFpQ41vW', '$2y$10$wtJTCbBSryZBDqLMNDuPVuYcMo4lPlQUyMQxIGtj3nde1iVzd3s3m', 'admin', 'active'),
(22, 4608560, '$2y$10$kYE/QOWeyuOwsZVyZrYMVeRKDb0WLM7fl7BuJP.Wt5w/RC4lnxkg2', '', '', '', '', '', '', 'admin', 'new'),
(23, 27576598, '$2y$10$ejPPrAWqtZCISNZyvEZeV.Ow7H.SQn3GQE7fHILVuxS/T/Q.nia8m', '¿En qué ciudad naciste?', '¿Cuál es el nombre de tu mejor amigo de la infancia?', '¿Cuál es el nombre de tu escuela primaria?', '$2y$10$oyreTRaPRJIJpcvrlgCn8uGreex5GTAkYifkGdtw0Qlwdvv8/S4JS', '$2y$10$wCOboA6GSoqSlNxwmkQAuOQvA8MvHIiEetAXgq7EwVmBaQSFbFqOe', '$2y$10$N2VPQmeU/PThXn9LBwtTDOcbrAN7zI3RH.928zd2BWn9y4YJC5RCG', 'admin', 'active'),
(24, 5950682, '$2y$10$zQPpvq5dO1ChBMDTCKB2tuMg8dQ4lFz5FWJ7iPZAgNKSNfOEZ1r6a', '', '', '', '', '', '', 'coordinador', 'new'),
(27, 10143237, '$2y$10$Du6UXIOVGAz..T3lHVxb/u2Kq5RpQqj/7p7NH1yoqGcRnr4vbAz8O', '', '', '', '', '', '', 'profesor', 'new'),
(28, 15071661, '$2y$10$YGG58k7.e6MEVpMNScWSvuSLjl1IloJEAkzUz4eINw1/SeM5jzaBW', '', '', '', '', '', '', 'profesor', 'new'),
(29, 18928013, '$2y$10$fQZ5iAgXQVpjkVoOAdPCD.uuTMOGS3C9fgOQHWWFWDEOhczfNzArq', '', '', '', '', '', '', 'profesor', 'new'),
(30, 14399700, '$2y$10$1Su6HXKz9jBC9FMZSGx9q.3XPO.GtILIAi2NHiMEtu9QysE2gySrC', '', '', '', '', '', '', 'profesor', 'new'),
(31, 14091761, '$2y$10$5LbRkUWQkhQC3F9l0WZvJuvBDb5NtITNmFsjtI6K3eLzQkdFmix3m', '', '', '', '', '', '', 'profesor', 'new'),
(32, 15214479, '$2y$10$Nw2EWA92D1YZqy2z48Rmw.i9VhaDYfW8afN6ybncbyyRP6BNVf8Ha', '', '', '', '', '', '', 'profesor', 'new'),
(33, 5945553, '$2y$10$sVww8ieBy0pEcqWXJdWEBuOKCngewZX45gCf/FTyNfH9tiKxnI7Xe', '', '', '', '', '', '', 'profesor', 'new'),
(34, 29629080, '$2y$10$ZdhT6Gse08CaDxJIaI67SOmoQ4YH5q0ZcGgNKElNdYlCQq9NjUu9q', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$0qGi4rAfZv.Gn4Lrwd6Iw.tbguhVURQ/WZMk447wAPNEOrNmPyx3K', '$2y$10$LI7Vqg4qZ.dBCoItqhYLq.4Bwj06apcIwysXRPEma2aw1YP/qtUr6', '$2y$10$EA0BekiwasYVn3oBaSrBJe/A0VGtAkHT53JwhQhYOMAZ51obE2iz6', 'admin', 'active');

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
(95, 'ILE', '1ero', 0),
(96, 'ILE', '2do', 0),
(97, 'ILE', '3ero', 0),
(98, 'ILE', '4to', 0),
(99, 'ILE', '5to', 0),
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
(136, 'EF', '1ero', 0),
(137, 'EF', '2do', 0),
(138, 'EF', '3ero', 0),
(139, 'EF', '4to', 0),
(140, 'EF', '5to', 0),
(149, 'BI', '3ero', 0),
(150, 'BI', '4to', 0),
(151, 'BI', '5to', 0),
(152, 'TC', '1ero', 0),
(153, 'TC', '2do', 0),
(154, 'TC', '3ero', 0),
(155, 'TC', '4to', 0),
(156, 'TC', '5to', 0),
(168, 'FI', '3ero', 0),
(169, 'FI', '4to', 0),
(170, 'FI', '5to', 0),
(171, 'AP', '1ero', 0),
(172, 'AP', '2do', 0),
(173, 'CN', '1ero', 0),
(174, 'CN', '2do', 0),
(175, 'CT', '5to', 0),
(176, 'FSN', '4to', 0),
(177, 'FSN', '5to', 0),
(178, 'GHC', '1ero', 0),
(179, 'GHC', '2do', 0),
(180, 'GHC', '3ero', 0),
(181, 'GHC', '4to', 0),
(182, 'GHC', '5to', 0),
(183, 'OC', '1ero', 0),
(184, 'OC', '2do', 0),
(185, 'OC', '3ero', 0),
(186, 'OC', '4to', 0),
(187, 'OC', '5to', 0),
(188, 'QU', '3ero', 0),
(189, 'QU', '4to', 0),
(190, 'QU', '5to', 0),
(191, 'CIVICO', '1ero', 0),
(192, 'CIVICO', '2do', 0),
(193, 'CIVICO', '3ero', 0),
(194, 'CIVICO', '4to', 0),
(195, 'CIVICO', '5to', 0),
(200, 'CA', '1ero', 0),
(201, 'CA', '2do', 0),
(202, 'CA', '3ero', 0),
(203, 'CA', '4to', 0),
(204, 'CA', '5to', 0);

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
(104, 18, 'agosto', 30.00),
(105, 22, 'noviembre', 75.00),
(106, 22, 'diciembre', 75.00),
(107, 22, 'enero', 75.00),
(108, 22, 'febrero', 75.00),
(109, 22, 'marzo', 75.00),
(110, 22, 'abril', 75.00),
(111, 22, 'mayo', 75.00),
(112, 22, 'junio', 75.00),
(113, 22, 'julio', 75.00),
(114, 22, 'agosto', 75.00),
(115, 22, 'octubre', 75.00);

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
(34811560, 115, 22, 19, 75.00);

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
  `dolarBCV` decimal(20,2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`idPago`, `cedula_estudiante`, `cedula_representante`, `fecha`, `referencia_id`, `ano_escolar`, `mes`, `detalles`, `descuento`, `nombres_estudiante`, `nombres_representante`, `telefono`, `direccion`, `monto`, `tipo_pago`, `dolarBCV`, `fecha_creacion`) VALUES
(9, 34811560, 17796268, '10-11-2025', '50788961', '2025-2026', 115, 'Pago Octubre', 1.00, 'CESAR DAVID FIGUEREDO BALLESTER', 'GLORIMAR BALLESTER VIERA', '4123764398', 'URBANIZACION VILLAS DEL PILAR CALLE 10 TETRA 1042A', 75.00, 'bolivar', 227.56, '2025-11-10 11:54:29');

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
  `correo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo`, `estado`) VALUES
(4608560, 'VICTOR', 'MENDOZA', 'ACARIGUA', '04121864925', 'correo', 1),
(5945553, 'PABLO', 'GONZALEZ', 'ACARIGUA', '04120317710', 'CORREO', 1),
(5950682, 'JULIO ALBERTO', 'SALóN', 'ACARIGUA', '04245687482', 'correo', 1),
(10143237, 'WILMER', 'GARCIA', 'ACARIGUA', '04128681905', 'wizi15@gmail.com', 1),
(12710000, 'TAHIRIS', 'VARGAS', 'EN UNA URBANIZACION', '04121541222', 'TahirisVargas@gmail.com', 1),
(14091761, 'MAYURI ', 'RIVEROS', 'ACARIGUA', '04261105755', 'CORREO', 1),
(14399700, 'RICARDO ', 'ALVAREZ', 'ACARIGUA', '04125539743', 'CORREO', 1),
(15071661, 'WILLIAMS', 'LUGO', 'ACARIGUA', '04245409631', 'willugo09@gmail.com', 1),
(15214479, 'AURORA', 'RIOS', 'ACARIGUA', '04145342254', 'CORREO', 1),
(18928013, 'JHIMMY ', 'TORRES', 'ACARIGUA', '04145640216', 'CORREO', 1),
(27576598, 'VICTOR JULIO', 'MENDOZA VARGAS', 'ACARIGUA', '04125157986', 'correo', 1),
(29629080, 'ANGEL', 'MENDEZ', 'URBANIZACION LA CORTEZA', '04122696463', 'angeles7595@gmail.com', 1);

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
(379, 14091761, 'CT'),
(380, 14091761, 'QU'),
(381, 15071661, 'BI'),
(382, 15071661, 'CN'),
(383, 10143237, 'CA'),
(384, 10143237, 'OC'),
(385, 10143237, 'PGCRP'),
(386, 10143237, 'TC'),
(387, 15214479, 'AP'),
(388, 15214479, 'GHC'),
(389, 15214479, 'OC'),
(390, 15214479, 'PGCRP'),
(391, 5945553, 'FI'),
(392, 5945553, 'MA'),
(393, 5945553, 'OC'),
(394, 5945553, 'PGCRP'),
(395, 18928013, 'ILE'),
(396, 18928013, 'OC'),
(397, 18928013, 'PGCRP'),
(398, 14399700, 'CN'),
(399, 14399700, 'EF'),
(400, 14399700, 'FSN'),
(401, 14399700, 'OC'),
(402, 14399700, 'PGCRP'),
(403, 5945553, 'CIVICO'),
(404, 10143237, 'CIVICO'),
(405, 14091761, 'CIVICO'),
(406, 15071661, 'CIVICO'),
(407, 15214479, 'CIVICO'),
(408, 18928013, 'CIVICO'),
(409, 18928013, 'TC');

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
  `telefono_2` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `ocupacion` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `parentesco` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `representante`
--

INSERT INTO `representante` (`cedula_representante`, `nombres`, `apellidos`, `correo`, `direccion`, `telefono`, `telefono_2`, `ocupacion`, `parentesco`) VALUES
(4196185, 'CARLOS ALBERTO', 'YEPEZ ALBARRECINO', 'JESUSYEPEZ2693@GMAIL.COM', 'CALLE 24 ENTRE AV 38/39 N°38-55 REJA DE GUANARE', '4145661980', '4125591155', 'COMERCIANTE', 'ABUELO'),
(4607738, 'BOGAR MARCELINO', 'VARGAS CORDONES', 'vargasbogar777@gmail.com', 'AV 38 ENTRE CALLE 25 Y 24 N°34 REJA DE GUANARE', '04168215132', '4168215132', 'TECNICO', 'ABUELO'),
(5953959, 'PASTOR DEL CARMEN', 'ROSALES  ARENAS', 'ROSALESPASTOR1987@GMAIL.COM', 'BELLA VISTA I CALLE 37A CON AV 40Y 45', '4141579194', '4141579194', 'COMERCIANTE', 'ABUELO'),
(7546770, 'JOSEFINA', 'RODRIGUEZ MARGARITA', 'rodriguezmargaritajosefina@gmail.com', 'EL LIMONCITO', '4168559934', '4168559934', 'COMERCIANTE', 'MADRE'),
(8658979, 'CARMEN ALICIA', 'PELAYO  SEQUERA', 'NEYDABRITO@GMAIL.COM', 'BARRIO LA ROMANA', '4162501305', '4162501305', 'COMERCIANTE', 'ABUELO'),
(9840733, 'LIGIA SOFIA', 'GRANDA DE PEREZ', 'YOSEPEREZ826@GMAIL.COM', 'BARRIO 5 DE DICIEMBRE', '4125519983', '4125519983', 'HOGAR', 'ABUELA'),
(10137270, 'MARIA ALCIRA', 'GOMEZ  ESCALONA', 'MARIAALCIRAJK@GMAIL.COM', 'AV 15 N°1-111 BARRIO SAN PABLO ARAURE', '4125561198', '4125561198', 'COMERCIANTE', 'MADRE'),
(10144134, 'LILIBETH DEL CARMEN', 'RODRIGUEZ  MENDOZA', 'lili.cookes2024@gmail.com', 'URB PRADOS DEL SOL', '4140578837', '4140578837', 'COMERCIANTE', 'MADRE'),
(10634181, 'JONATAN RAMON', 'ANDRADE RATIA', 'JONATANANDRADE42011@GMAIL.COM', 'PROLG AV LIBERTADOR CALLE 03/04 N°44-69 B. BOLIVAR', '4125569543', '4125569543', 'COMERCIANTE', 'PADRE'),
(11082601, 'ZULY DEL VALLE', 'LANDAETA  MEJIAS', 'ZDELVALLELANDAETA@GMAIL.COM', 'URB PRADOS DEL SOL CALLE 07 # 27 ARAURE', '4245789492', '4245789492', 'HOGAR', 'MADRE'),
(11082618, 'ELBA JOSEFINA', 'RODRIGUEZ MORENO', 'ALBAJOSEFINARODRIGUEZ@GMAIL.COM', 'URB 24 DE JULIO CALLE 13 N°13 SECTOR 3', '4125594526', '4125594526', 'COMERCIANTE', 'MADRE'),
(11542587, 'PEREZ RODRIGUEZ', 'ARGELIA DEL CARMEN', 'argedetorrez61@gmail.com', 'CALLE 25 ENTRE AV 37 Y 38 N° 37-15 REJA DE GUANARE', '4145069386', '4145069386', 'COMERCIANTE', 'ABUELA'),
(11549723, 'JOSE DEL CARMEN', 'HERRERA SOLORZANO', '', 'BARRIO SIMON BOLVAR AV 01 CON CALLE 1 Y 2 N°226', '4167012312', '4264608692', 'COMERCIANTE', 'PADRE'),
(11720890, 'MAIYELIN COROMOTO', 'SALCEDO GONZALEZ', 'MAYYELIN74@HOTMAIL.COM', 'URB PRADOS DEL SOL SECT. MORICHAL N°18 AV 02 /C02', '4124914834', '4124914834', 'COMERCIANTE', 'MADRE'),
(11851723, 'AMAHILYS YELIART', 'MARTINEZ  GUEDEZ', 'amahilys@gmail.com', 'URB BRISAS DE SOFIA', '4162927301', '4162927301', 'COMERCIANTE', 'MADRE'),
(12264035, 'RUBEN ALBERTO', 'PEREZ  GONZALEZ', 'IZLA1203@GMAIL.COM', 'URBANIZACION LAS PALMAS AV 06 CASA # 358', '4145567159', '4145567159', 'COMERCIANTE', 'MADRE'),
(12264046, 'NERYS ANGELINA', 'MELENDEZ PAEZ', '', 'AV 37 CON CALLE 27-28 BARRIO PARAGUAY', '4245352299', '4245352299', 'HOGAR', 'MADRE'),
(12266792, 'CESAR AUGUSTO', 'ROMERO GUTIERREZ', 'CARG@GMAIL.COM', 'URBANIZACION GONZALO BARRIOS', '4125417285', '4122640364', 'COMERCIANTE', 'PADRE'),
(12823094, 'RAMONA DEL CARMEN', 'GUERRERO  MENDEZ', 'vargasjoseroberto9@gmail.com', 'BARRIO 5 DE DICIEMBRE CALLE PRINCIPAL CALLE1 N°02', '04145004982', '04149504587', 'COMERCIANTE', 'MADRE'),
(13073254, 'YORAIMA ANTONIA', 'SOTELDO  MENDOZA', 'yorasoteldo123@gmail.com', 'CALLE 28 ENTRE AV 39 Y 40 BARRIO PARAGUAY', '4121560548', '4121560548', 'COMERCIANTE', 'MADRE'),
(13228955, 'ENDER JOSE', 'ROJAS', '', 'URB LA CORTEZA', '4245340991', '', 'COMERCIANTE', 'PADRE'),
(13485024, 'DORIS ELENA', 'SANCHEZ  MORA', 'd_ori_sanchez@gmail.com', 'URB PACHOS SOL', '4126785673', '4126785673', 'COMERCIANTE', 'MADRE'),
(13555117, 'MAYRA CAROLINA', 'MAMBEL  HERNANDEZ', 'dc.jd11_07@hotmail.com', 'URB 24 DE JULIO', '4145596199', '4145596199', 'COMERCIANTE', 'MADRE'),
(13556079, 'KEILA KATIUSKA', 'PALACIOS DE RODRIGUEZ', 'KEILAKATUISKAPALACIOSDIAZ@GMAIL.COM', 'BARRIO SAN VICENTE AV 51A # 18-28 ACARIGUA', '4125125115', '4121525115', 'HOGAR', 'ABUELA'),
(13702356, 'MARCALIS COROMOTO', 'BLANCO MENDEZ', 'marcalisblanco13@gmail.com', 'CALLE 25 ENTRE 36 Y 37 REJA DE GUANARE', '4145335957', '4145335957', 'COMERCIANTE', 'TIA'),
(13702588, 'BEATRIZ', 'SANCHEZ PARRA', 'SANCHEZBEATRIZ44@GMAIL.COM', 'PRADOS DEL SOL SECTOR VZLA MANZANA H N°20', '4125469052', '4125469052', 'COMERCIANTE', 'MADRE'),
(13774121, 'MAIRYN CORINA', 'RODRIGUEZ  VARGAS', 'corina262@gmail.com', 'URBANIZACION DESARROLLO CAMBURITO CALLE 07', '4127818811', '4127818811', 'COMERCIANTE', 'MADRE'),
(13965888, 'AMARO TORRES', 'KENNI EMILIA', 'vladimirnd@gmail.com', 'BARRIO PARAGUAY CALLE 29 ENTRE AV 38 Y 39 #38--40', '4120923628', '4120923628', 'DOCENTE', 'MADRE'),
(14000503, 'PELLONIS ARVELO', 'LULIO DESSIDERY', '88luliopa@gmail.com', 'SAN CARLOS ESTADO COJEDES', '4144729497', '4144729497', 'ABOGADO', 'MADRE'),
(14091113, 'ANA MARIA', 'TERAN  VARGAS', 'anamariateran951@gmail.com', 'AV CIRCUNVALACION SECTOR EL TRIUNFO', '4245216182', '4245216182', 'COMERCIANTE', 'TIA'),
(14092828, 'ERIKA OKARINA', 'CASTRO SANCHEZ', 'ALIGUSTAVOPARRA08@GMAIL.COM', 'URB SANTA RITA CALLE 04 N°86', '4145160011', '4145583161', 'COMERCIANTE', 'MADRE'),
(14178840, 'YURBI CAROLINA', 'RIVERO NAVEA', 'YURCARIV@GMAIL.COM', 'URB PRADO DEL SOL SECTOR MERCALTIL MANZ E N°05', '4245297314', '4264636787', 'COMERCIANTE', 'MADRE'),
(14271731, 'JACQUELINE', 'RICO  EVILA', 'RICOEVILA28@GMAIL.COM', 'BARRIO 5 DE DICIEMBRE CALLE 02 ESQ AV 11 N°47', '4144205209', '4125225087', 'COMERCIANTE', 'MADRE'),
(14347315, 'JEANNAHYR', 'ACOSTA  TORREZ', 'jeannahyra@gmail.com', 'URB BOSQUES DE CAMORUCO COND 4 CASA 4- 32', '4145579950', '4245117402', 'COMERCIANTE', 'MADRE'),
(14426660, 'EMILY MARIA', 'MENDOZA  DE TORREALBA', 'EMILYMENDOZA1980@GMAIL.COM', 'URB STA RITA AV 5 CALLE 1 N°339', '4147858178', '4245518807', 'COMERCIANTE', 'MADRE'),
(14541143, 'SILVANA YORISBETH', 'LOZADA MENDEZ', 'SILVANALOZADA2506@GMAIL.COM', 'AV 09 CON CALLE 01#13 SECTOR MALABE VILLALBA', '4145685774', '4145685774', 'TECNICO', 'MADRE'),
(14541687, 'ERIKA', 'PASTERNAK  VILLEGAS', '', 'URB PRADOS DEL SOL SECT. MORICHAL CASA 06', '04145275253', '4147117939', 'COMERCIANTE', 'MADRE'),
(14676653, 'YOLY COROMOTO', 'VILORIA  PINEDA', 'yolyviloria8@gmail.com', 'VEREDA 18 CASA N° 04 URB LA GOAJIRA', '04163586862', '04245452354', 'COMERCIANTE', 'MADRE'),
(14749332, 'ELIZABETH DEL CARMEN', 'VALERA  CHIRINOS', 'ELIZABETHVALERA2025@GMAIL.CON', 'URB PRADOS DEL SOL CALLE 03 ENTRE TRANSV 01-02 MANZ H #28', '04161577871', '04145598819', 'INGENIERO', 'MADRE'),
(14773318, 'CARMEN LISBETH', 'RONDON  DE PALMA', 'carmenl.rondon@gmail.com', 'SAN JOSÉ II', '4163514186', '4163514186', 'COMERCIANTE', 'MADRE'),
(14773857, 'VARGAS ESCALONA', 'RINA ANGELICA', 'rinacejean@gmail.com', 'URB GONZALO BARRIOS', '4145174877', '4145174877', 'COMERCIANTE', 'MADRE'),
(14980920, 'JOHANNY AIDA', 'HERNANDEZ VERA', 'johannyh2407@gmail.com', 'URBANIZACION PRADOS DEL SOL SECTOR MERCANTILMANZANA D CASA N°24', '02556633562', '4125543913', 'HOGAR', 'MADRE'),
(14981508, 'LUIS ALBERTO', 'SOSA FIGUEROA', 'ASOSA_1981@GMAIL.COM', 'URB PRADOS DEL SOL SECTOR MORICHAL CALLE 02 CASA 12 MANZANA Q', '4249540336', '4249540336', 'INGENIERO', 'PADRE'),
(15309662, 'NANCY SOREIDA', 'MORALES', 'SOREIDA0379@GMAIL.COM', 'URB PRADOS DEL SOL', '4161518258', '4161518258', 'COMERCIANTE', 'ABUELA'),
(15491427, 'YOSMARY BELMAR', 'RODRIGUEZ DE BARCO', 'EDBRX2100@GMAIL.COM', 'BARRIO MALAVE VILLALBA  AV 1 CASA #17', '4245570453', '4245570453', 'COMERCIANTE', 'MADRE'),
(15492877, 'ELIOMAR JOSÉ', 'RODRIGUEZ  GRATEROL', 'rodriguezeliomar@hotmail.com', 'BOSQUEZ DE CAMORUCO', '4122664835', '4122664835', 'COMERCIANTE', 'PADRE'),
(15690031, 'LEIBIS DEL CARMEN', 'COLMENAREZ  GARRIDO', 'LEIBISCOLMENAREZG@HOTMAIL.COM', 'CALLE 2 AV 46 N° 56 ANDRES ELOY BLANCO', '4245393923', '4245393923', 'COMERCIANTE', 'MADRE'),
(15691455, 'VICDELIA DEL CARMEN', 'GUEVARA RAMOS', 'denpared@hotmail.com', 'URB PRADOS DEL SOL TRANSV 04/05 CAL 9 TERZ 9 N°30', '4168555195', '4168555195', 'COMERCIANTE', 'MADRE'),
(15692536, 'YANETSIS CAROLINA', 'CARDENAS  PEREZ', 'capyc_g@hotmail.com', 'URB PRADOS DEL SOL', '4266556105', '4266556105', 'COMERCIANTE', 'MADRE'),
(15693553, 'ANGELICA MARIA', 'SIRA  SEGURA', 'angelyecerra01@gmail.com', 'AV 07 BARRIO LIMONCITO N° 03-08', '4125584192', '4245286141', 'COMERCIANTE', 'MADRE'),
(15820828, 'ANGELA ANTONIA', 'NIÑO  ESCALONA', 'angelanoe292@gmail.com', 'URB SAN JOSE 02 CALLE 03 N° 25', '02556228907', '04121544452', 'COMERCIANTE', 'MADRE'),
(15866412, 'YAMILA DEL CARMEN', 'RODRIGUEZ  AGUILAR', 'migueykami1586@gmail.com', 'TRANSVERSAL 7 MANZANA F N°12 MORICHAL P. DEL SOL', '4261548586', '4145748402', 'COMERCIANTE', 'MADRE'),
(15869795, 'ANA ROSA', 'BARCO PEREZ', 'ANABARCO2004@GMAIL.COM', 'ALCALDIA DE PIRITU', '4145766319', '4145766319', 'COMERCIANTE', 'MADRE'),
(15869830, 'MARBELIS DEL CARMEN', 'SANCHEZ HENRIQUEZ', 'marbe2525@hotmail.com', 'BARRIO BICENTENARIO DE PAEZ CALLE 3 CASA Nº 19', '4268063779', '4268063779', 'COMERCIANTE', 'MADRE'),
(16040701, 'GEORGINA REBECA', 'ADAM', '', 'URB PRADOS DEL SOL SECTOR VZLA N° 16 TRANSVERSAL 05 ENTRE CALLE 11-12', '4245663019', '4245663019', 'COMERCIANTE', 'MADRE'),
(16043221, 'KEIDY CAROLINA', 'RODRIGUEZ  RAMOS', 'RODRIGUEZKEIDY378@GMAIL.COM', 'URB VILLAS DEL SUR CALLE 02 N° 11 VIA GONZALO B.', '4127678377', '4125102237', 'COMERCIANTE', 'MADRE'),
(16278156, 'YOLIMAR CAROLINA', 'VIRGUEZ', 'TORINYOLIMAR76@GMAIL.COM', 'URB PRADO DEL SOL MANZ M CASA N0 5 SECT MERCANTIL', '2556633808', '4126748314', 'COMERCIANTE', 'MADRE'),
(16292180, 'CESMAR ELIZABETH', 'LEON  DE KIENZLER', 'CESMARLK24@GMAIL.COM', 'URBANIZACION LA GOAJIRA 01 CALLE D #05', '4169598955', '4169598955', 'COMERCIANTE', 'MADRE'),
(16292798, 'VIANNEY JOAN', 'DURAN  DE LIMA', 'durantae1@gmail.com', 'URB PRADOS DEL SOL TRANSV 04/05 CAL 9 TERZ 9 N°30', '4145700238', '4145700238', 'COMERCIANTE', 'PADRE'),
(16414069, 'DJAMILE ANAYANSI', 'JIMENEZ  DE PEREZ', 'ruben54@hotmail.com', 'URB PRADOS DEL SOL TRANSVERSAL 3 ENTRE CALLE 3 Y 4', '2556634772', '4245080912', 'COMERCIANTE', 'MADRE'),
(16414242, 'LENNYS', 'URDANETA', '', 'BARRIO AMERICA', '4122689393', '4122689393', 'COMERCIANTE', 'MADRE'),
(16567095, 'ALEXANDRA CAROLINA', 'PRIMERA  HERRERA', 'alexacph88@gmail.com', 'COMPLEJ HAB SIMON BOLIVAR ZONA 4 TORRE D APTO 03', '4121514183', '4129167222', 'COMERCIANTE', 'MADRE'),
(16860175, 'JOSE LUIS', 'LINAREZ MUÑOZ', 'REPRESENTACIONESLANDINEZ@GMAIL.COM', 'URB LOMAS DE SANTA SOFIA CONJ 13 N°53 ARAURE', '4145390428', '4267584063', 'COMERCIANTE', 'PADRE'),
(16861538, 'MARIA DE LOS ANGELES', 'YECERRA DE HURTADO', 'MARIAYECERRA84@GMAIL.COM', 'AV 57 BARRIO LIMONCITO ARAURE N°03-88', '4125588487', '4245517786', 'COMERCIANTE', 'MADRE'),
(16966047, 'YORBELYS EUSTOQUIA', 'CORDERO', 'yorbelyscorderj@gmail.com', 'AGUA BLANCA CALLE 12 BARRIO BICENTENARIO CASA N° 01', '416053846', '4126053846', 'HOGAR', 'MADRE'),
(17276035, 'NAGDY ANAHIS', 'TORRES  DE ESCALONA', 'ANAHIS_0907@HOTMAIL.COM', 'URB SANTA RITA CALLE 5 CASA 353', '4245512837', '4245943693', 'COMERCIANTE', 'MADRE'),
(17276273, 'LEIDA DEL CARMEN', 'ALVARADO', 'leidadelcarmenalvarado@gmail.com', 'PARROQUIA RIO ACARIGUA', '4261526325', '4261526325', 'COMERCIANTE', 'MADRE'),
(17362058, 'ALEJANDRO', 'SANCHEZ RONDON', 'ALEJOSANRON@GMAIL.COM', 'URBANIZACION LOS ROBLES', '4241597419', '4241597419', 'COMERCIANTE', 'PADRE'),
(17362529, 'SANIELYS MARIA', 'SALCEDO MIQUILENA', 'SANIELYS86@GMAIL.COM', 'GONZALO BARRIOS SECTOR 07 CALLE 05 AV 04 N° 08', '4245168110', '4245168110', 'COMERCIANTE', 'MADRE'),
(17362807, 'MARIA EUGENIA', 'GUEDEZ QUIROZ', 'TORNOCARACASCA@GMAIL.COM', 'URB VALLE ARRIBA CASA #445', '4125102976', '4125102976', 'COMERCIANTE', 'MADRE'),
(17363685, 'IUSMARY ELIMAR', 'RODRIGUEZ SIRA', 'rodriguezelimar68@gmail.com', 'BARRIO MALABE', '4245070198', '4245070198', 'COMERCIANTE', 'MADRE'),
(17599014, 'YAIDEHT DEL CARMEN', 'LOPEZ JIMENEZ', 'LOPEZYAIDEHT@GMAIL.COM', 'URB GONZALO BARRIOS CALLE 05 N°53 SECTOR 3', '4245639586', '4245557352', 'COMERCIANTE', 'MADRE'),
(17600113, 'JOSE GREGORIO', 'HERNANDEZ', 'hernandezjose144@gmail.com', 'URB PRADOS DEL SOL MORICHAL # H11 ARAURE', '4245157920', '4245157920', 'COMERCIANTE', 'PADRE'),
(17796166, 'ANGELICA VIRGINIA', 'HERNANDEZ LUCENA', 'LUISTORREZ1974@GMAIL.COM', 'URB SANTA RITA AV 3 CASA 197', '4245115913', '4163531529', 'COMERCIANTE', 'MADRE'),
(17796268, 'GLORIMAR', 'BALLESTER VIERA', 'GLORIMARBALLESTER25@GMAIL.COM', 'URBANIZACION VILLAS DEL PILAR CALLE 10 TETRA 1042A', '4123764398', '4264557692', 'COMERCIANTE', 'MADRE'),
(17796844, 'MAITHE AURELIS', 'MONTILLA JIMENEZ', 'montillamaithe@gmail.com', 'URB 24 DE JULIO CALLE 13 N°13 SECTOR 3', '4245610511', '4245610511', 'COMERCIANTE', 'MADRE'),
(17797974, 'NIEVES ARELYS', 'LOPEZ LINAREZ', 'ML7473288@GMAIL.COM', 'URBANIZACION PRADOS DEL SOL SECTOR MORICHAL', '4125248570', '4125248570', 'COMERCIANTE', 'MADRE'),
(17813240, 'RUALYS ELIZABETH', 'PIÑA ALVAREZ', 'ivalys17@gmail.com', 'URBANIZACION PRADOS DEL SOL SECTOR MERCANTIL CALLE 14 T# 26', '4168589486', '4168589486', 'COMERCIANTE', 'MADRE'),
(17944115, 'SANTA GLORIBER', 'LINAREZ LEON', 'REPRESENTACIONESLANDINEZ@GMAIL.COM', 'URB LOMAS DE STA SOFIA CONJ 13 N°53', '4267584063', '4145390428', 'COMERCIANTE', 'MADRE'),
(18672986, 'EUKARIS CAROLINA', 'DOMINGUEZ  GONZALEZ', 'eukarisdominguez986@gmail.com', 'BARRIO LA FRANJA VIA MIJAGUITO', '4245073500', '4143532323', 'COMERCIANTE', 'MADRE'),
(18731117, 'BRIANNY CAROLINA', 'ORTIZ  PERALTA', 'brianny.ortiz1984@gmail.com', 'BARRIO BELLA VISTA II', '4127592876', '4127592876', 'COMERCIANTE', 'MADRE'),
(18731886, 'DALIANA CECILIA', 'GARCIA PEREZ', '', 'BARRIO PARAGUAY', '4245017217', '4245017217', 'COMERCIANTE', 'MADRE'),
(18871184, 'ROSSIANNYS MARIA', 'MORA  HERRERA', 'rosiannysmora0@gmail.com', 'LAS DELICIAS AV PRINCIPAL VIA ESPINITAL', '4245225813', '4245225813', 'COMERCIANTE', 'MADRE'),
(18911840, 'EDUARDO', 'ANZOLA', 'ejanzolame@gmail.com', 'FUNDACION MENDOZA AV 03N°D-23', '4245399798', '4245399798', 'COMERCIANTE', 'MADRE'),
(19052619, 'MARIAJOSE VANESSA', 'BARCO DE SEGUERI', 'mariajosebarco@hotmail.com', 'URB PRADOS DEL SOL SECTOR MORICHAL', '4126704183', '4126704183', 'COMERCIANTE', 'MADRE'),
(19052898, 'YARLENYS BEATRIZ', 'OLIVEROS  MENDOZA', 'oliveroy550@gmail.com', 'SAN JOSÉ I', '4245032318', '4245032318', 'COMERCIANTE', 'MADRE'),
(19053656, 'JOSE DANIEL', 'MARTINEZ', 'ingjosedanielmartinez83@gmail.com', 'URB PRADOS DEL SOL CALLE 04 MANZ P CASA N°09 LAS', '4125236028', '4125236028', 'TECNICO', 'MADRE'),
(19053912, 'BETSALIX SEKENNY', 'MUJICA AGUILAR', 'b_sekenny_05@hotmail.com', 'BARRIO AMERICA AV 40B ENTRE CALLE 23 Y 24 CASA 23-20 ACARIGUA', '4245644669', '4245644669', 'COMERCIANTE', 'MADRE'),
(19170038, 'DANETZIS CAROLINA', 'AREVALO RIVERO', '', 'URBANIZACION LOMAS DE SANTA SOFIA CONJUNTO 16 CASA N°43', '4143532886', '4143532886', 'COMERCIANTE', 'MADRE'),
(19283247, 'ANAIS CAROLINA', 'HERRERA HERRERA', 'STIVENCH2307@GMAIL.COM', 'BELLA VISTA II LICORERIA LOS  PEPITONES', '4245655470', '4245655470', 'COMERCIANTE', 'MADRE'),
(19637478, 'YUDITH JOSEFINA', 'TORRES YAJURE', 'TORRESYAJURE@GMAIL.COM', 'URBANIZACION PRADOS DEL SOL SECTOR TURAGUA CALLE 05 P# 27', '4245799328', '4245799328', 'HOGAR', 'MADRE'),
(19799972, 'GENESIS MIRGELUIS', 'SANCHEZ CORDERO', 'SANCHEZGENESIS158@GMAIL.COM', 'AVENIDA 6 LA ROMANA', '4120594586', '4120594586', 'COMERCIANTE', 'MADRE'),
(20024000, 'MARIANNY STEPHANNY', 'LINAREZ  VARGAS', 'STEPHANNYLNRZ@GMAIL.COM', 'URB LAS PALMAS CALLE D#148 1 ERA ETAPA ARAURE', '4245143744', '4245133744', 'HOGAR', 'MADRE'),
(20024630, 'GREYSSI Y', 'VILLAREAL VARGAS', '', 'BARRIO AMERICA', '4145770478', '4145770478', 'HOGAR', 'MADRE'),
(20024866, 'MARBELIS JOHANNA', 'DELGADO DE NOGUERA', 'delgadomarbelis2@gmail.com', 'URBANIZACION PRADOS DEL SOL SECOR MORICHAL CASA K-27', '04245580356', '4245580356', 'HOGAR', 'MADRE'),
(20156428, 'KATHERINE YESDERLIN', 'AVENDAÑO DE GARRIDO', 'katherinaagarrido89@gmail.com', 'URB GONZALO BARRIOS SECTOR 06 AV 04 N°26', '4125306563', '4245044728', 'COMERCIANTE', 'MADRE'),
(20498969, 'KEYLA JOANA', 'SALAS RICO', 'keylasalasrico@gmail.com', 'BARRIO 5 DE DICIEMBRE', '4244213343', '4244213343', 'COMERCIANTE', 'MADRE'),
(20640050, 'LAISMAR YANISBETH', 'GUTIERREZ CHIRINOS', 'laisyanisbethgutie04@gmail.com', 'URB DURIGUA  VEREDA 29 N°10', '4245827893', '4245827893', 'COMERCIANTE', 'MADRE'),
(20640935, 'CARMARI YULIETH', 'PELAYO ORTIZ', 'carmari2bb@gmail.com', 'MESETA DE ARAURE CALLE 01 N°194', '4149560385', '4125238943', 'COMERCIANTE', 'MADRE'),
(20644518, 'GABRIELA ANDREINA', 'GUANDA ESCOBAR', 'gabrielaguanda@gmail.com', 'URBANIZACION PRADOS DEL SOL SECTOR LAS TUCURAGUAS CALLE 04 N°T18', '04167769717', '4167769717', 'HOGAR', 'MADRE'),
(20811499, 'MARIA DE LOS ANGELES', 'TORO  VALERA', 'MARIATORO19912015@GMAIL.COM', 'URB BOSQUE DE CAMORUCO MICRO 3 #19', '4245735176', '4245735176', 'HOGAR', 'MADRE'),
(21056383, 'FRANCIS MARIA', 'BOLIVAR DE ANGULO', 'bolivarcastillofrancismaria@gmail.com', 'COMUNIDAD ESPINITAL', '4245211224', '4245211224', 'COMERCIANTE', 'MADRE'),
(21057257, 'CIPLENIMAR', 'FALCON  COHIL', 'FALCONCIPLENIMAR@GMAIL.COM', 'CALLE 28 AV 45 Y 46 SECTOR BELLA VISTA 2', '4125513050', '4125513050', 'ABOGADO', 'MADRE'),
(21058737, 'YELIGRE KATRIN', 'ARAUJO  RIVERO', 'yelygrek24@gmail.com', 'COMUNIDAD LA DEMOCRACIA CALLE 03 CASA # 13', '4160510639', '4160510639', 'COMERCIANTE', 'MADRE'),
(21058738, 'JOSELIN CORAIMA', 'ARAUJO RIVERO', 'JOSELIN09ARAUJO@GMAIL.COM', 'BARRIO LA DEMOCRACIA AV 03 CALLE 01-02 N°13', '4145286847', '4145226847', 'COMERCIANTE', 'MADRE'),
(21059491, 'DANIELIS ENILMAR', 'PÉREZ MORALES', 'CESARASEC14@GMAIL.COM', 'URB GONZALO BARRIOS MANUELITA SAENZ', '4122687288', '4122687288', 'COMERCIANTE', 'MADRE'),
(21148129, 'ALVARADO PAGUA', 'RENE DANIEL', 'RENEALVARADO3006@GMAIL.COM', 'URB LA CORTEZA CALLE 3 N° 16', '4126787962', '4126787962', 'TECNICO', 'PADRE'),
(21395758, 'DAYANARA TERESA', 'MEDINA  CASTELLANO', 'dayanara_399@hotmail.com', 'MALAVE VILLALBA AV 9 CASA N° 10', '4145267569', '4245295323', 'COMERCIANTE', 'MADRE'),
(22098187, 'EMMA VALENTINA', 'BASTIDAS  MASS', 'EMMABASTIDAS85@GMAIL.COM', 'COMP. HABITACIONAL SIMON BOLIVAR 1B APTO 2-5', '4121668502', '4145094136', 'COMERCIANTE', 'MADRE'),
(23053077, 'ROSANGELA DEL CARMEN', 'GONZALEZ LOYO', 'manuelandres262@gmail.com', 'BARRIO 23 DE ENERO', '4120571153', '4120571153', 'COMERCIANTE', 'MADRE'),
(23053315, 'MARIELI ROSANYELIS', 'GONZALEZ LOYO', '', 'BARRIO AMERICA', '4120571153', '4120571153', 'HOGAR', 'MADRE'),
(24320202, 'YORGELYS KARELYS', 'COHIL  DOMINGUEZ', '', 'URB GONZALO BARRIOS', '4121530776', '4121530776', 'COMERCIANTE', 'MADRE'),
(24428959, 'ASNEY ANDREINA', 'SUAREZ CORDERO', 'ASNEYSUAREZ5@GMAIL.COM', 'URB CAMORUQUITOS CALLE 7 CASA N°1', '4145596411', '4245979906', 'COMERCIANTE', 'MADRE'),
(24654049, 'DARGLENIS YARILY', 'ALVAREZ BRACHO', 'egildabracho@gmail.com', 'CALLE 02 SECTOR EL SAMAN RIO ACARIGUA', '4245986925', '4245986925', 'HOGAR', 'MADRE'),
(24795342, 'GLEISIS OLMARIS', 'RAMIREZ SALAS', 'glei.ramirez342@gmail.com', 'URBANIZACION CAMPO ALEGRE CALLE PRINCIPAL CASA N°117', '04125519453', '4125519452', 'HOGAR', 'MADRE');

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
(33485436, 4196185),
(36947726, 4607738),
(34224205, 5953959),
(34458851, 7546770),
(34208742, 8658979),
(34633558, 9840733),
(33252644, 10137270),
(33306143, 10144134),
(34276347, 10634181),
(33306573, 11082601),
(33880380, 11082618),
(34223693, 11542587),
(36092601, 11549723),
(34343212, 11720890),
(33349422, 11851723),
(33414638, 12264035),
(33414641, 12264035),
(35162879, 12264046),
(33778602, 12266792),
(33084424, 12823094),
(33306236, 13073254),
(34634039, 13228955),
(34389261, 13485024),
(34458961, 13555117),
(34722484, 13556079),
(34892828, 13556079),
(33778697, 13702356),
(36164778, 13702588),
(34209319, 13774121),
(34208775, 13965888),
(36747114, 14000503),
(33349771, 14091113),
(36087305, 14092828),
(34722694, 14178840),
(34224087, 14271731),
(33002091, 14347315),
(33168912, 14426660),
(34572386, 14541143),
(33414159, 14541687),
(33175090, 14676653),
(33002566, 14749332),
(34169617, 14773318),
(34224002, 14773857),
(34487294, 14980920),
(34893034, 14981508),
(35030218, 15309662),
(34388569, 15491427),
(34959720, 15492877),
(35079515, 15690031),
(33175330, 15691455),
(32777011, 15692536),
(33948349, 15693553),
(33002547, 15820828),
(33169289, 15866412),
(34400906, 15869795),
(34722924, 15869830),
(34168961, 16040701),
(34388926, 16043221),
(34169023, 16278156),
(35030694, 16292180),
(34275610, 16292798),
(33710201, 16414069),
(34223742, 16414242),
(32922586, 16567095),
(34343007, 16860175),
(34458527, 16861538),
(34208687, 16966047),
(34276293, 17276035),
(34389441, 17276273),
(34458860, 17362058),
(35179755, 17362529),
(36401448, 17362807),
(34304471, 17363685),
(33175127, 17599014),
(34343401, 17600113),
(34722745, 17796166),
(34811560, 17796268),
(34459056, 17796844),
(34304391, 17797974),
(34811726, 17813240),
(33485451, 17944115),
(33175175, 18672986),
(34209204, 18731117),
(36023554, 18731886),
(34208869, 18871184),
(32838191, 18911840),
(33493695, 19052619),
(36991757, 19052619),
(34303906, 19052898),
(34486772, 19053656),
(36390927, 19053656),
(36035499, 19053912),
(36619124, 19170038),
(33777714, 19283247),
(34723236, 19637478),
(33948358, 19799972),
(33879996, 20024000),
(35079838, 20024630),
(34811537, 20024866),
(34633400, 20156428),
(34389227, 20498969),
(34169524, 20640050),
(34224321, 20640935),
(36122770, 20640935),
(36308539, 20644518),
(33485222, 20811499),
(33999685, 21056383),
(33947848, 21057257),
(33947844, 21058737),
(35126833, 21058738),
(34208827, 21059491),
(34224185, 21148129),
(34458464, 21395758),
(34223407, 22098187),
(34458550, 23053077),
(34458556, 23053315),
(34459000, 24320202),
(36940803, 24428959),
(33947595, 24654049),
(36901399, 24795342);

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
  ADD KEY `FK_estudiante_ano_escolar` (`ano`),
  ADD KEY `estudiante_ano_seccion_fk` (`cod_ano_seccion`);

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
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=719;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10032;

--
-- AUTO_INCREMENT de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `materia_ano`
--
ALTER TABLE `materia_ano`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ano_seccion_fk` FOREIGN KEY (`cod_ano_seccion`) REFERENCES `ano_seccion` (`codigo`),
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
