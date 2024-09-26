-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-09-2024 a las 13:21:01
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
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ano_escolar`
--

INSERT INTO `ano_escolar` (`codigo`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
(18, '2024-2025', '2024-10-01', '2025-07-17');

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
('QU', 'QUIMICA');

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
(31, 'Laboratorio', 'laboratorio', 1);

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
(27, '2024-09-26 09:14:10', 29629080, 'login', '29629080 ha ingresado al sistema.', 'DESKTOP-F3R7OPU');

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
(2, 11716900, '$2y$10$KUS.kZOop8H0.zCw0ZRITOgGKnrO8OU68PZy3RMXKM4bJAxcyBq9i', '', '', '', '', '', '', 'admin', 'active'),
(5, 29629080, '$2y$10$iztSmb7xT9arACvPGNiLmuVu.IPZfpPCRrquHgPpKXfkWMrCOU7f6', '¿Cual es su color favorito?', '¿Cual es fue su primera mascota?', '¿Cual es su comida favorita?', '$2y$10$MKhsRwZ/V6pN2POJ3eete..IigsrkWdUtDOVRA7.Tlfy9ZGp4w.8O', '$2y$10$T6PjmXUjButQzVO8FIV0UOvnYsD2Em153oEi9Cv6J/0Pdk5EGdelm', '$2y$10$llAi/KhMxhEj5YtessVBe.vfpnESeMO16Sh0NdoDnfhcWSPoWGS.2', 'admin', 'active'),
(12, 12710000, '$2y$10$rk1LVXZoN56cdb1UOT7VO.J3j4Vi39g.1LqGaNEiN6dPB17UDTh1G', '', '', '', '', '', '', 'admin', 'new'),
(13, 565656, '$2y$10$EM/j7xhsrfP.fMJad/2EAOMkS2/Ezc3sj/sYLimQt9rgBggdxmrgG', '', '', '', '', '', '', 'administrador', 'new');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
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
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`, `correo`) VALUES
(565656, 'VICTOR', 'JULIO', 'FASDF', '56565', '656f5asdf'),
(11716900, 'JOHN ENMANUEL', 'RAMIREZ VALERO', 'Enrique Segoviano', '+584169919122', 'cojggeo@equisde.com'),
(12710000, 'TAHIRIS', 'VARGAS', 'EN UNA URBANIZACION', '04121541222', 'TahirisVargas@gmail.com'),
(29629080, 'ANGEL', 'MENDEZ', 'ENRIQUE SEGOVIANO', '0424', 'angeles7595@gmail.com');

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ano_escolar`
--
ALTER TABLE `ano_escolar`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ano_seccion`
--
ALTER TABLE `ano_seccion`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `horario_estudiante`
--
ALTER TABLE `horario_estudiante`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `intervalo`
--
ALTER TABLE `intervalo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `preguntas_seguridad`
--
ALTER TABLE `preguntas_seguridad`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- Restricciones para tablas volcadas
--

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
-- Filtros para la tabla `profesores_materias`
--
ALTER TABLE `profesores_materias`
  ADD CONSTRAINT `FK_profesores_materias_asignatura` FOREIGN KEY (`materia`) REFERENCES `asignatura` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_profesores_materias_personas` FOREIGN KEY (`profesor`) REFERENCES `personas` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
