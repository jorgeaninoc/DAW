-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2018 a las 03:03:29
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
-- Base de datos: `jambe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor_titulo`
--

CREATE TABLE `autor_titulo` (
  `idAutor` int(11) NOT NULL,
  `idTitulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `idCredencial` int(11) NOT NULL,
  `idVisitante` int(11) NOT NULL,
  `fechaExpedicion` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombreTrabajo` varchar(50) NOT NULL,
  `telefonoTrabajo` varchar(12) NOT NULL,
  `coloniaTrabajo` varchar(50) NOT NULL,
  `calleTrabajo` varchar(50) NOT NULL,
  `numeroTrabajo` varchar(50) NOT NULL,
  `cpTrabajo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial_fiador`
--

CREATE TABLE `credencial_fiador` (
  `idCredencial` int(11) NOT NULL,
  `idFiador` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `idEjemplar` int(11) NOT NULL,
  `ISBN` char(13) NOT NULL,
  `estante` varchar(10) NOT NULL,
  `editorial` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `volumen` int(11) DEFAULT NULL,
  `idTitulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idVisitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`timestamp`, `idVisitante`) VALUES
('2018-03-05 23:59:07', 13),
('2018-03-06 00:19:42', 14),
('2018-03-06 00:19:46', 15),
('2018-03-06 01:38:41', 16),
('2018-03-06 01:40:51', 18),
('2018-03-06 01:49:57', 19),
('2018-03-06 02:01:17', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_ejemplar`
--

CREATE TABLE `estado_ejemplar` (
  `idEjemplar` int(11) NOT NULL,
  `idEstado` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fiador`
--

CREATE TABLE `fiador` (
  `idFiador` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `cp` int(5) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombreTrabajo` varchar(50) NOT NULL,
  `telefonoTrabajo` varchar(12) NOT NULL,
  `coloniaTrabajo` varchar(50) NOT NULL,
  `calleTrabajo` varchar(50) NOT NULL,
  `numeroTrabajo` varchar(50) NOT NULL,
  `cpTrabajo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradoestudios`
--

CREATE TABLE `gradoestudios` (
  `idGrado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gradoestudios`
--

INSERT INTO `gradoestudios` (`idGrado`, `nombre`) VALUES
(1, 'Ninguno'),
(2, 'Primaria'),
(3, 'Secundaria'),
(4, 'Preparatoria'),
(5, 'Universidad'),
(6, 'Maestria'),
(7, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `idOperacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idCredencial` int(11) NOT NULL,
  `idEjemplar` int(11) NOT NULL,
  `fechaPrestamo` date NOT NULL,
  `fechaDevolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_operacion`
--

CREATE TABLE `rol_operacion` (
  `idOperacion` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sancion`
--

CREATE TABLE `sancion` (
  `idSancion` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `idVisitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo`
--

CREATE TABLE `titulo` (
  `idTitulo` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo_categoria`
--

CREATE TABLE `titulo_categoria` (
  `idTitulo` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(25) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `nombre`, `password`) VALUES
('jorge', 'Jorge Niño', 'awdvcft13509');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE `usuario_rol` (
  `idUsuario` varchar(25) NOT NULL,
  `idRol` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `idVisitante` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitante`
--

INSERT INTO `visitante` (`idVisitante`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `fechaNacimiento`, `genero`) VALUES
(12, 'eduardo', 'cuesta', 'córdova', '0000-00-00', 'O'),
(13, 'ed', 'cu', 'co', '2018-03-08', 'O'),
(14, 'ed', 'cu', 'co', '2018-03-08', 'O'),
(15, 'ed', 'cu', 'co', '2018-03-08', 'O'),
(16, 'angie', 'perez', 'cordasdfasdf', '2018-04-07', '7'),
(17, 'angie', 'perez', 'cordasdfasdf', '2018-04-07', 'O'),
(18, 'oasdf', 'asdf', 'casdf', '2018-03-22', 'M'),
(19, 'eduasdf', 'asdfasdf', 'asdf', '2018-03-15', 'M'),
(20, 'edasdfasdf', 'asdfasdfasd', 'asdfasdfasdf', '2018-03-24', 'O');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante_gradoestudios`
--

CREATE TABLE `visitante_gradoestudios` (
  `idVisitante` int(11) NOT NULL,
  `idGrado` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitante_gradoestudios`
--

INSERT INTO `visitante_gradoestudios` (`idVisitante`, `idGrado`, `fecha`) VALUES
(12, 2, '0000-00-00'),
(13, 3, '2018-03-05'),
(14, 3, '2018-03-05'),
(15, 3, '2018-03-05'),
(18, 3, '2018-03-05'),
(19, 2, '2018-03-05'),
(20, 3, '2018-03-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indices de la tabla `autor_titulo`
--
ALTER TABLE `autor_titulo`
  ADD PRIMARY KEY (`idAutor`,`idTitulo`),
  ADD KEY `idAutor` (`idAutor`),
  ADD KEY `idTitulo` (`idTitulo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`idCredencial`),
  ADD KEY `idVisitante` (`idVisitante`);

--
-- Indices de la tabla `credencial_fiador`
--
ALTER TABLE `credencial_fiador`
  ADD PRIMARY KEY (`idCredencial`,`idFiador`,`fecha`),
  ADD KEY `idCredencial` (`idCredencial`),
  ADD KEY `idFiador` (`idFiador`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`idEjemplar`),
  ADD KEY `idTitulo` (`idTitulo`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`timestamp`,`idVisitante`),
  ADD KEY `idVisitante` (`idVisitante`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `estado_ejemplar`
--
ALTER TABLE `estado_ejemplar`
  ADD PRIMARY KEY (`idEjemplar`,`idEstado`,`fecha`),
  ADD KEY `idEjemplar` (`idEjemplar`),
  ADD KEY `idEstado` (`idEstado`);

--
-- Indices de la tabla `fiador`
--
ALTER TABLE `fiador`
  ADD PRIMARY KEY (`idFiador`);

--
-- Indices de la tabla `gradoestudios`
--
ALTER TABLE `gradoestudios`
  ADD PRIMARY KEY (`idGrado`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`idOperacion`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idCredencial`,`idEjemplar`,`fechaPrestamo`),
  ADD KEY `idCredencial` (`idCredencial`),
  ADD KEY `idEjemplar` (`idEjemplar`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `rol_operacion`
--
ALTER TABLE `rol_operacion`
  ADD PRIMARY KEY (`idOperacion`,`idRol`,`fecha`),
  ADD KEY `idOperacion` (`idOperacion`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `fecha` (`fecha`);

--
-- Indices de la tabla `sancion`
--
ALTER TABLE `sancion`
  ADD PRIMARY KEY (`idSancion`),
  ADD KEY `idVisitante` (`idVisitante`);

--
-- Indices de la tabla `titulo`
--
ALTER TABLE `titulo`
  ADD PRIMARY KEY (`idTitulo`);

--
-- Indices de la tabla `titulo_categoria`
--
ALTER TABLE `titulo_categoria`
  ADD PRIMARY KEY (`idTitulo`,`idCategoria`),
  ADD KEY `idTitulo` (`idTitulo`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD PRIMARY KEY (`idUsuario`,`idRol`,`fecha`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`idVisitante`);

--
-- Indices de la tabla `visitante_gradoestudios`
--
ALTER TABLE `visitante_gradoestudios`
  ADD PRIMARY KEY (`idVisitante`,`idGrado`,`fecha`),
  ADD KEY `idVisitante` (`idVisitante`),
  ADD KEY `idGrado` (`idGrado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credencial`
--
ALTER TABLE `credencial`
  MODIFY `idCredencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  MODIFY `idEjemplar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fiador`
--
ALTER TABLE `fiador`
  MODIFY `idFiador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gradoestudios`
--
ALTER TABLE `gradoestudios`
  MODIFY `idGrado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `idOperacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sancion`
--
ALTER TABLE `sancion`
  MODIFY `idSancion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `titulo`
--
ALTER TABLE `titulo`
  MODIFY `idTitulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitante`
--
ALTER TABLE `visitante`
  MODIFY `idVisitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor_titulo`
--
ALTER TABLE `autor_titulo`
  ADD CONSTRAINT `fkAutor` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  ADD CONSTRAINT `fkTituloAutor` FOREIGN KEY (`idTitulo`) REFERENCES `titulo` (`idTitulo`);

--
-- Filtros para la tabla `credencial_fiador`
--
ALTER TABLE `credencial_fiador`
  ADD CONSTRAINT `fkCredencial` FOREIGN KEY (`idCredencial`) REFERENCES `credencial` (`idCredencial`),
  ADD CONSTRAINT `fkFiador` FOREIGN KEY (`idFiador`) REFERENCES `fiador` (`idFiador`);

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `fkTituloEjemplar` FOREIGN KEY (`idTitulo`) REFERENCES `titulo` (`idTitulo`);

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fkVisitanteEntra` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`);

--
-- Filtros para la tabla `estado_ejemplar`
--
ALTER TABLE `estado_ejemplar`
  ADD CONSTRAINT `fkEjemplar` FOREIGN KEY (`idEjemplar`) REFERENCES `ejemplar` (`idEjemplar`),
  ADD CONSTRAINT `fkEstado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`idEstado`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fkPrestamoCredencial` FOREIGN KEY (`idCredencial`) REFERENCES `credencial` (`idCredencial`),
  ADD CONSTRAINT `fkPrestamoEjemplar` FOREIGN KEY (`idEjemplar`) REFERENCES `ejemplar` (`idEjemplar`);

--
-- Filtros para la tabla `rol_operacion`
--
ALTER TABLE `rol_operacion`
  ADD CONSTRAINT `fkOperacion` FOREIGN KEY (`idOperacion`) REFERENCES `operacion` (`idOperacion`),
  ADD CONSTRAINT `foreignKeyRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`);

--
-- Filtros para la tabla `sancion`
--
ALTER TABLE `sancion`
  ADD CONSTRAINT `fkVisitanteSancion` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`);

--
-- Filtros para la tabla `titulo_categoria`
--
ALTER TABLE `titulo_categoria`
  ADD CONSTRAINT `fkCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `fkTitulo` FOREIGN KEY (`idTitulo`) REFERENCES `titulo` (`idTitulo`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `fkRol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`),
  ADD CONSTRAINT `fkUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `visitante_gradoestudios`
--
ALTER TABLE `visitante_gradoestudios`
  ADD CONSTRAINT `fkGrado` FOREIGN KEY (`idGrado`) REFERENCES `gradoestudios` (`idGrado`),
  ADD CONSTRAINT `fkVisitanteG` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`idVisitante`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
