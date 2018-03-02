-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2018 a las 20:21:09
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
-- Base de datos: `lab14`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruit`
--

CREATE TABLE `fruit` (
  `name` varchar(30) NOT NULL,
  `units` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fruit`
--

INSERT INTO `fruit` (`name`, `units`, `quantity`, `price`, `country`) VALUES
('Manzana Roja', 'kg', 10, 50, 'México'),
('Manzana Verde', 'kg', 10, 55, 'USA'),
('Pera', 'kg', 15, 40, 'Colombia'),
('Platano', 'kg', 10, 30, 'Canada'),
('Uva', 'kg', 40, 70, 'Francia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
