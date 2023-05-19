-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2023 a las 16:53:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lotus_glamping`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `idcaracteristica` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `detalle` varchar(100) DEFAULT NULL,
  `cantidad` char(1) DEFAULT NULL,
  `estado` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domo`
--

CREATE TABLE `domo` (
  `Iddomo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `disponibilidad` char(1) DEFAULT NULL,
  `caracteristicas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` int(11) NOT NULL,
  `nombre_permiso` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_paquete`
--

CREATE TABLE `plan_paquete` (
  `idplan` int(11) NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio_plandoble` float DEFAULT NULL,
  `caracteristicas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendacion`
--

CREATE TABLE `recomendacion` (
  `idrecomendacion` int(11) NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecharegistro` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_hospedaje`
--

CREATE TABLE `reserva_hospedaje` (
  `cod` int(11) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `numero_personas` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  `paquete` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permisos`
--

CREATE TABLE `rol_permisos` (
  `idrol_permisos` int(11) NOT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idpermiso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` int(11) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `f_nacimiento` date DEFAULT NULL,
  `direccion_residencia` varchar(40) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventa` int(11) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`idcaracteristica`);

--
-- Indices de la tabla `domo`
--
ALTER TABLE `domo`
  ADD PRIMARY KEY (`Iddomo`),
  ADD KEY `caracteristicas` (`caracteristicas`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`);

--
-- Indices de la tabla `plan_paquete`
--
ALTER TABLE `plan_paquete`
  ADD PRIMARY KEY (`idplan`),
  ADD KEY `caracteristica` (`caracteristicas`);

--
-- Indices de la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  ADD PRIMARY KEY (`idrecomendacion`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `reserva_hospedaje`
--
ALTER TABLE `reserva_hospedaje`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `servicio` (`servicio`),
  ADD KEY `domo` (`domo`),
  ADD KEY `paquete` (`paquete`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD PRIMARY KEY (`idrol_permisos`),
  ADD KEY `idrol` (`idrol`),
  ADD KEY `idpermiso` (`idpermiso`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `rol` (`idrol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `cod` (`cod`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domo`
--
ALTER TABLE `domo`
  ADD CONSTRAINT `caracteristicas` FOREIGN KEY (`caracteristicas`) REFERENCES `caracteristicas` (`idcaracteristica`);

--
-- Filtros para la tabla `plan_paquete`
--
ALTER TABLE `plan_paquete`
  ADD CONSTRAINT `caracteristica` FOREIGN KEY (`caracteristicas`) REFERENCES `caracteristicas` (`idcaracteristica`);

--
-- Filtros para la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  ADD CONSTRAINT `cedula` FOREIGN KEY (`cedula`) REFERENCES `usuario` (`cedula`);

--
-- Filtros para la tabla `reserva_hospedaje`
--
ALTER TABLE `reserva_hospedaje`
  ADD CONSTRAINT `domo` FOREIGN KEY (`domo`) REFERENCES `domo` (`Iddomo`),
  ADD CONSTRAINT `paquete` FOREIGN KEY (`paquete`) REFERENCES `plan_paquete` (`idplan`),
  ADD CONSTRAINT `servicio` FOREIGN KEY (`servicio`) REFERENCES `servicios` (`idservicio`),
  ADD CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`cedula`);

--
-- Filtros para la tabla `rol_permisos`
--
ALTER TABLE `rol_permisos`
  ADD CONSTRAINT `idpermiso` FOREIGN KEY (`idpermiso`) REFERENCES `permisos` (`idpermiso`),
  ADD CONSTRAINT `idrol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `rol` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `cod` FOREIGN KEY (`cod`) REFERENCES `reserva_hospedaje` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
