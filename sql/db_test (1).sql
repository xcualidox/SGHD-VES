-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 02, 2024 at 03:25 AM
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
-- Database: `db_test`
--
CREATE DATABASE IF NOT EXISTS `db_test` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci;
USE `db_test`;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int NOT NULL,
  `username` bigint NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_1` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_2` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_q_3` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_1` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_2` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `security_a_3` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `rol` varchar(32) COLLATE utf8mb3_spanish_ci NOT NULL,
  `status` enum('active','inactive','new') CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `security_q_1`, `security_q_2`, `security_q_3`, `security_a_1`, `security_a_2`, `security_a_3`, `rol`, `status`) VALUES
(1, 27937454, '$2y$10$6LLM81Qpo8Qw/L0rwpv1l.VxzCx/S7ZqJe9w59OgUNPKF3HG6hm9.', '¿Cual es su color favorito?', '¿Cual es su comida favorita?', '¿Cual es su profesor favorito?', '$2y$10$1GL.mOB.jL29suGg74KlB.9p8A3xAghxojfPqVLBz3aAojnEg9M7q', '$2y$10$./BBNq3pjZwy1iFUtFqI.ORBaBRUlZOa/PwJMZHSMWnDejqnQM2y.', '$2y$10$ELm2TJjZOafp9clMgefI.uop22LG8yYN44ag13b.au9W/2xP3bFQW', 'master', 'active'),
(2, 8708088, '$2y$10$KUS.kZOop8H0.zCw0ZRITOgGKnrO8OU68PZy3RMXKM4bJAxcyBq9i', '', '', '', '', '', '', 'admin', 'active'),
(3, 26937454, '$2y$10$eQWCswrS7qkWfb1Rm7U2R.WlFcAR1dncWgMqkWnHJiSlc3XopQubO', '', '', '', '', '', '', 'profesor', 'new'),
(4, 27414644, '$2y$10$2LdbHmQeaN5.amJ86/gQFeZAK9Mb6fdZ2.bDZkqM9kWv5/1mXjERi', '¿Cuál es el nombre de tu primera mascota?', '¿Cuál es el nombre de tu escuela primaria?', '¿En qué ciudad naciste?', '$2y$10$nmlXTunPzLLb5VrsRBZ7y.rr.RO0rAhszWg.H5HQP4ORBeAwyO7X2', '$2y$10$yv6lnXbkvRPxsW/GjqWWmulj1wAxhfgHzb6n7SUciFngJWVbdCA6C', '$2y$10$PwpOMuTvWGFmKcVGwW41He90ksoCzKG6DyT0kCJo7WveqSBxBOoIi', 'profesor', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id` int NOT NULL,
  `cedula` bigint NOT NULL,
  `primer_nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `primer_nombre`, `apellido`) VALUES
(1, 27937454, 'Alexander', 'Cruz'),
(2, 8708088, 'Rosa', 'Vergara'),
(3, 26937454, 'Angel', 'Mendez'),
(4, 27414644, 'nataly', 'carmona');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
