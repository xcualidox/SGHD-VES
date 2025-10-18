-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-10-2025 a las 15:19:34
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
(21, '2025-2026', '2025-10-01', '2026-07-31', 0),
(22, '2025-2026 (1)', '2025-10-05', '2026-07-31', 1);

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
(679, '2025-10-17 11:15:41', 27576598, 'insertar', 'Agregó al profesor 29629080.', 'Tahiris-PC');

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
(1, 129.05);

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

--
-- Volcado de datos para la tabla `horario_estudiante`
--

INSERT INTO `horario_estudiante` (`codigo`, `codigo_a_escolar`, `codigo_a_y_seccion`, `codigo_asignatura`, `codigo_aula`, `codigo_dia`, `grupo`, `profesor`, `intervalo`, `receso`) VALUES
(7432, 21, 18, 'EF', 25, 'B1J', ' ', NULL, 7, NULL),
(7433, 21, 19, 'EF', 25, 'B2J', ' ', NULL, 7, NULL),
(7434, 21, 18, 'EF', 25, 'B3J', ' ', NULL, 7, NULL),
(7435, 21, 19, 'CA', 26, 'B1J', ' ', NULL, 7, NULL),
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
(34, 29629080, '$2y$10$yEiDhJ7bS5IBbmwgE.Rk3.qkr58Pbn5tfyuOE2WcwwBj4BuwyDBSi', '', '', '', '', '', '', 'admin', 'new');

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
(195, 'CIVICO', '5to', 0);

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
(5945553, 'PABLO', 'GONZALEZ', 'ACARIGUA', '04120317710', 'CORREO'),
(5950682, 'JULIO ALBERTO', 'SALóN', 'ACARIGUA', '04245687482', 'correo'),
(10143237, 'WILMER', 'GARCIA', 'ACARIGUA', '04128681905', 'wizi15@gmail.com'),
(12710000, 'TAHIRIS', 'VARGAS', 'EN UNA URBANIZACION', '04121541222', 'TahirisVargas@gmail.com'),
(14091761, 'MAYURI ', 'RIVEROS', 'ACARIGUA', '04261105755', 'CORREO'),
(14399700, 'RICARDO ', 'ALVAREZ', 'ACARIGUA', '04125539743', 'CORREO'),
(15071661, 'WILLIAMS', 'LUGO', 'ACARIGUA', '04245409631', 'willugo09@gmail.com'),
(15214479, 'AURORA', 'RIOS', 'ACARIGUA', '04145342254', 'CORREO'),
(18928013, 'JHIMMY ', 'TORRES', 'ACARIGUA', '04145640216', 'CORREO'),
(27576598, 'VICTOR JULIO', 'MENDOZA VARGAS', 'ACARIGUA', '04125157986', 'correo'),
(29629080, 'ANGEL', 'MENDEZ', 'URBANIZACION LA CORTEZA', '04122696463', 'angeles7595@gmail.com');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

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
