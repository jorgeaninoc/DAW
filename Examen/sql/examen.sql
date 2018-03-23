-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2018 a las 21:49:56
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `status` varchar(25) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`idEntrada`, `number`, `status`, `date`) VALUES
(1, '12345', 'SYSTEM FAILURE', '2018-03-23 08:36:55'),
(6, '2143', 'SYSTEM FAILURE', '2018-03-23 09:24:26'),
(7, '123', 'SYSTEM FAILURE', '2018-03-23 09:38:43'),
(8, '4 8 15 16 23 42', 'SUCCESS', '2018-03-23 09:39:03'),
(9, '4 8 15 16 23 42', 'SUCCESS', '2018-03-23 09:39:31'),
(10, '4 8 15 16 23 42', 'SUCCESS', '2018-03-23 09:39:38'),
(11, '4 8 15 16 23 42', 'SUCCESS', '2018-03-23 09:40:31'),
(12, '1', 'SYSTEM FAILURE', '2018-03-23 09:43:34'),
(13, '4 8 15 16 23 42', 'SUCCESS', '2018-03-23 09:43:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idEntrada`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `idEntrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
