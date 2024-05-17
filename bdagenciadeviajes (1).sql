-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2024 a las 02:44:21
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
-- Base de datos: `bdagenciadeviajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `nroActividad` int(11) NOT NULL,
  `nombreActividad` varchar(20) DEFAULT NULL,
  `descripcionActividad` varchar(100) DEFAULT NULL,
  `precioActividad` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alojamiento`
--

CREATE TABLE `alojamiento` (
  `idAlojamiento` int(11) NOT NULL,
  `nombreAlojamiento` varchar(20) DEFAULT NULL,
  `idTipoHabitacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `nombreCargo`) VALUES
(1, 'cliente'),
(2, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleviajepersonalizado`
--

CREATE TABLE `detalleviajepersonalizado` (
  `idDetalleViajePersonalizado` int(11) NOT NULL,
  `idViajePersonalizado` int(11) DEFAULT NULL,
  `idPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `idPaquete` int(11) NOT NULL,
  `nombrePaquete` varchar(20) DEFAULT NULL,
  `descripcionPaquete` varchar(150) DEFAULT NULL,
  `precioPaquete` double DEFAULT NULL,
  `imagen` varchar(150) NOT NULL,
  `categoria` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`idPaquete`, `nombrePaquete`, `descripcionPaquete`, `precioPaquete`, `imagen`, `categoria`) VALUES
(1, 'Paracas Ica', 'Full Day', 115, 'paracas.png', 'T'),
(2, 'Canta Cordillera de ', 'Full Day', 85, 'canta.png', 'T'),
(5, 'Marcapomacocha', 'Full Day', 105, 'marcapomacocha.png', 'T'),
(6, 'Lunahuaná', 'Full Day', 79, 'lunahuana.png', 'T'),
(7, 'Chancay', 'Full Day', 85, 'chancay.png', 'T'),
(8, 'Churin', 'Full Day', 85, 'churin.png', 'T'),
(9, 'Antioquía', 'Full Day', 59, 'antioquia.png', 'T'),
(10, 'Paracas Ica - Lunahu', '2 días 1 noche', 259, 'camp-lunahuana.png', 'T'),
(11, 'Lunahuaná', '2 días 1 noche', 199, 'lunahuana2d.png', 'T'),
(12, 'Paracas Ica Huacachi', 'Sanboarding - Deslizadores - Tubulares', 129, 'paracas.png', 'P'),
(13, 'Tour 4D/3N - Ayacuch', 'Ayacucho - Ciudad Religiosa', 699, 'ayacucho.png', 'P'),
(14, 'Tour 3D/2N - Selva C', 'Selva Central - Oxapampa', 579, 'selvaCentral.png', 'P'),
(15, '2D/1N Campamento - P', 'Playa Marcona - Líneas de Nazca', 279, 'marcona.png', 'P'),
(16, '2D/1N Camp. Playa la', 'Ica', 189, 'campamento-la-mina.png', 'P'),
(17, '2D/1N Camp. Playa Tu', 'Huarmey', 189, 'campamento-tuquillo.png', 'P'),
(18, 'Tour Full Day Lunahu', 'Cerro Azul - Canotaje - Cuatrimotos', 95, 'lunahuanapromo.png', 'P'),
(19, 'Tour Full Day Paraca', 'Islas Ballestas - Ica - Huacachina', 125, 'paracaspromo.png', 'P'),
(20, 'Lunahuaná', '2 días 1 noche', 199, 'lunahuana2d.png', 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `pedidoFecha` date DEFAULT NULL,
  `pedidoHora` time DEFAULT NULL,
  `valorPedido` double DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitacion`
--

CREATE TABLE `tipohabitacion` (
  `idTipoHabitacion` int(11) NOT NULL,
  `decripicionHabitacion` varchar(50) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nroCelular` int(9) NOT NULL,
  `nroDni` int(8) NOT NULL,
  `correoElectronico` varchar(40) NOT NULL,
  `clave` varchar(16) NOT NULL,
  `idCargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `apellido`, `nroCelular`, `nroDni`, `correoElectronico`, `clave`, `idCargo`) VALUES
(1, 'Jose', 'Caceres', 900547116, 57640997, 'jose45@gmail.com', '1234', 1),
(2, 'maria', 'garcia', 944027100, 44003366, 'maria123@hotmail.com', '456', 1),
(3, 'Sebastian', 'Misajel', 111444, 78945612, 'misajel456@hotmail.com', '123456', 1),
(4, 'Paul', 'Gallegos', 777444110, 87410000, 'paul456@ejemplo.com', 'gallegos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajepersonalizado`
--

CREATE TABLE `viajepersonalizado` (
  `idViajePersonalizado` int(11) NOT NULL,
  `codigoViaje` int(11) DEFAULT NULL,
  `idAlojamiento` int(11) DEFAULT NULL,
  `nroActividad` int(11) DEFAULT NULL,
  `nroPasakerps` int(11) DEFAULT NULL,
  `precioViaje` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `codigoViaje` int(11) NOT NULL,
  `nombreViaje` varchar(20) DEFAULT NULL,
  `clase` varchar(10) DEFAULT NULL,
  `precioViaje` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`nroActividad`);

--
-- Indices de la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`idAlojamiento`),
  ADD KEY `FK_Alojamiento_TipoHabi` (`idTipoHabitacion`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `detalleviajepersonalizado`
--
ALTER TABLE `detalleviajepersonalizado`
  ADD PRIMARY KEY (`idDetalleViajePersonalizado`),
  ADD KEY `FK_DetaVia_Pedido` (`idPedido`),
  ADD KEY `FK_DetaVia_viajePerso` (`idViajePersonalizado`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`idPaquete`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `FK_ped_usu` (`idUsuario`);

--
-- Indices de la tabla `tipohabitacion`
--
ALTER TABLE `tipohabitacion`
  ADD PRIMARY KEY (`idTipoHabitacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_user_cargo` (`idCargo`);

--
-- Indices de la tabla `viajepersonalizado`
--
ALTER TABLE `viajepersonalizado`
  ADD PRIMARY KEY (`idViajePersonalizado`),
  ADD KEY `FK_ViajePersonalizado_Viaje` (`codigoViaje`),
  ADD KEY `FK_ViajePersonalizado_Activi` (`nroActividad`),
  ADD KEY `FK_ViajePersonalizado_Alojamiento` (`idAlojamiento`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`codigoViaje`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `nroActividad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  MODIFY `idAlojamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleviajepersonalizado`
--
ALTER TABLE `detalleviajepersonalizado`
  MODIFY `idDetalleViajePersonalizado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paquete`
--
ALTER TABLE `paquete`
  MODIFY `idPaquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipohabitacion`
--
ALTER TABLE `tipohabitacion`
  MODIFY `idTipoHabitacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `viajepersonalizado`
--
ALTER TABLE `viajepersonalizado`
  MODIFY `idViajePersonalizado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `codigoViaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `FK_Alojamiento_TipoHabi` FOREIGN KEY (`idTipoHabitacion`) REFERENCES `tipohabitacion` (`idTipoHabitacion`);

--
-- Filtros para la tabla `detalleviajepersonalizado`
--
ALTER TABLE `detalleviajepersonalizado`
  ADD CONSTRAINT `FK_DetaVia_Pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`),
  ADD CONSTRAINT `FK_DetaVia_viajePerso` FOREIGN KEY (`idViajePersonalizado`) REFERENCES `viajepersonalizado` (`idViajePersonalizado`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_ped_usu` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_user_cargo` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`);

--
-- Filtros para la tabla `viajepersonalizado`
--
ALTER TABLE `viajepersonalizado`
  ADD CONSTRAINT `FK_ViajePersonalizado_Activi` FOREIGN KEY (`nroActividad`) REFERENCES `actividades` (`nroActividad`),
  ADD CONSTRAINT `FK_ViajePersonalizado_Alojamiento` FOREIGN KEY (`idAlojamiento`) REFERENCES `alojamiento` (`idAlojamiento`),
  ADD CONSTRAINT `FK_ViajePersonalizado_Viaje` FOREIGN KEY (`codigoViaje`) REFERENCES `viajes` (`codigoViaje`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
