-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-09-2017 a las 02:18:05
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `admoux_prourban`
--
CREATE DATABASE IF NOT EXISTS `admoux_prourban` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `admoux_prourban`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientocontable`
--

DROP TABLE IF EXISTS `asientocontable`;
CREATE TABLE `asientocontable` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `numero_referencia` varchar(45) DEFAULT NULL,
  `debito` decimal(15,2) NOT NULL,
  `credito` decimal(15,2) NOT NULL,
  `diferencia` decimal(15,2) NOT NULL,
  `factura_id` int(11) DEFAULT NULL,
  `cuentaxpagar_id` int(11) DEFAULT NULL,
  `debitocuenta` int(11) NOT NULL,
  `creditocuenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptopago`
--

DROP TABLE IF EXISTS `conceptopago`;
CREATE TABLE `conceptopago` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `saldo_inicial` decimal(15,2) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  `tipocuenta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaxasiento`
--

DROP TABLE IF EXISTS `cuentaxasiento`;
CREATE TABLE `cuentaxasiento` (
  `id` int(11) NOT NULL,
  `cuenta_id` int(11) NOT NULL,
  `asientocontable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaxcobrar`
--

DROP TABLE IF EXISTS `cuentaxcobrar`;
CREATE TABLE `cuentaxcobrar` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_maxima_pago` date NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentaxpagar`
--

DROP TABLE IF EXISTS `cuentaxpagar`;
CREATE TABLE `cuentaxpagar` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha` date NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `numero_referencia` varchar(20) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `subtotal` decimal(6,2) NOT NULL,
  `iva` decimal(6,2) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `formapago_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturadetalle`
--

DROP TABLE IF EXISTS `facturadetalle`;
CREATE TABLE `facturadetalle` (
  `id` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `impuesto_id` int(11) NOT NULL,
  `factura_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarioatencion`
--

DROP TABLE IF EXISTS `horarioatencion`;
CREATE TABLE `horarioatencion` (
  `id` int(11) NOT NULL,
  `fecha` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarioatencion`
--

INSERT INTO `horarioatencion` (`id`, `fecha`) VALUES
(1, 'Lunes - Viernes : 8:00 - 21:00 / Sabado - Domingo: 9:00 - 13:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariomantenimiento`
--

DROP TABLE IF EXISTS `horariomantenimiento`;
CREATE TABLE `horariomantenimiento` (
  `id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
CREATE TABLE `inmueble` (
  `id` int(11) NOT NULL,
  `manzana` int(11) NOT NULL,
  `numero_villa` int(11) NOT NULL,
  `numero_pisos` int(11) NOT NULL,
  `numero_cuartos` int(11) NOT NULL,
  `numero_banios` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `iconclass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id`, `descripcion`, `iconclass`) VALUES
(1,'SEGURIDAD','fa fa-cogs'),
(2,'PAGOS','fa fa-bar-chart'),
(3,'RESERVA','fa fa-calendar'),
(4,'ADMINSITRACION','fa fa-home');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

DROP TABLE IF EXISTS `opcion`;
CREATE TABLE `opcion` (
  `id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `url` varchar(70) DEFAULT NULL  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id`, `modulo_id`, `nombre`, `url`) VALUES
(1,1,'CREAR ROL','#!/rol'),
(2,1,'ASIGNAR USUARIO','#!/usuarios'),
(3,2,'PROVEEDORES','#!/proveedores'),
(4,2,'CUENTAS POR PAGAR','#!/cxp'),
(5,2,'CUENTAS POR COBRAR','#!/cxc'),
(6,2,'FACTURACION','#!/factura'),
(7,1,'ASIGNAR OPCION','#!/opcionrol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcionxrol`
--

DROP TABLE IF EXISTS `opcionxrol`;
CREATE TABLE `opcionxrol` (
  `id` int(11) NOT NULL,
  `opcion_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opcionxrol`
--

INSERT INTO `opcionxrol` (`id`, `opcion_id`, `rol_id`) VALUES
(1,1,1),
(2,2,1),
(8,3,1),
(9,4,1),
(10,5,1),
(11,6,1),
(12,3,3),
(13,4,3),
(14,5,3),
(15,6,3),
(16,7,1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametro`
--

DROP TABLE IF EXISTS `parametro`;
CREATE TABLE `parametro` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valor` decimal(4,2) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametro`
--

INSERT INTO `parametro` (`id`, `descripcion`, `valor`, `estado`) VALUES
(2, 'Alicuota', '30.00', 'ACTIVO'),
(4, 'Reserva', '10.00', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `cedula` varchar(45) NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `cedula`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `telefono`, `correo`, `estado`) VALUES
(1, '0926068081', 'CHRISTIAN', 'ANDRES', 'RAMOS', 'URQUIZO', '4546078', 'uramos@espol.edu.ec', 'ACTIVO'),
(2, '0956565688', 'RONNY', NULL, 'SABANDO', NULL, '6128455', 'rsabando@espol.edu.ec', 'ACTIVO'),
(3, '0955551212', 'Andres', 'Roberto', 'Roman', 'Aguilar', '7846555', 'aroman@espol.edu.ec', 'ACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `ruc` varchar(13) NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `descripcion`, `ruc`, `estado`) VALUES
(2, 'uiui', '54', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `fecha_reserva` date NOT NULL,
     `desde` time DEFAULT NULL,
  `hasta` time DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` int(2) NOT NULL DEFAULT '1' COMMENT '1: Activo; 2:Inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`, `estado`) VALUES
(1,'SISTEMAS',1),
(2,'RESIDENTE',1),
(3,'ADMINISTRADOR',1),
(4,'PRESIDENTE',1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocuenta`
--

DROP TABLE IF EXISTS `tipocuenta`;
CREATE TABLE `tipocuenta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre_usuario`, `clave`, `estado`, `persona_id`, `rol_id`) VALUES
(1, 'admin', 'admin', 'ACTIVO', 1, 1),
(3, 'rsabando', '123', 'ACTIVO', 3, 2),
(4, 'lucero', '123', 'ACTIVO', 3, 3),
(5, 'aroman', '123', 'ACTIVO', 3, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asientocontable`
--
ALTER TABLE `asientocontable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `debitocuenta` (`debitocuenta`),
  ADD KEY `creditocuenta` (`creditocuenta`);

--
-- Indices de la tabla `conceptopago`
--
ALTER TABLE `conceptopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuenta_tipocuenta` (`tipocuenta_id`);

--
-- Indices de la tabla `cuentaxasiento`
--
ALTER TABLE `cuentaxasiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuentaxasiento_cuenta` (`cuenta_id`),
  ADD KEY `fk_cuentaxasiento_asientocontable` (`asientocontable_id`);

--
-- Indices de la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuentaxcobrar_usuario` (`usuario_id`);

--
-- Indices de la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cuentasxpagar_proveedor` (`proveedor_id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facturadetalle_formapago` (`formapago_id`),
  ADD KEY `fk_factura_usuario` (`usuario_id`);

--
-- Indices de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facturadetalle_impuesto` (`impuesto_id`),
  ADD KEY `fk_facturadetalle_factura` (`factura_id`);

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarioatencion`
--
ALTER TABLE `horarioatencion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horariomantenimiento`
--
ALTER TABLE `horariomantenimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_horariomantenimiento_area` (`area_id`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_inmueble_usuario` (`usuario_id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_opcion_modulo` (`modulo_id`);

--
-- Indices de la tabla `opcionxrol`
--
ALTER TABLE `opcionxrol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_opcionxrol_opcion` (`opcion_id`),
  ADD KEY `fk_opcionxrol_rol` (`rol_id`);

--
-- Indices de la tabla `parametro`
--
ALTER TABLE `parametro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reserva_usuario` (`usuario_id`),
  ADD KEY `fk_reserva_area` (`area_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_persona` (`persona_id`),
  ADD KEY `fk_usuario_rol` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `asientocontable`
--
ALTER TABLE `asientocontable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `conceptopago`
--
ALTER TABLE `conceptopago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentaxasiento`
--
ALTER TABLE `cuentaxasiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `horariomantenimiento`
--
ALTER TABLE `horariomantenimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `opcion`
--
ALTER TABLE `opcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `opcionxrol`
--
ALTER TABLE `opcionxrol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `parametro`
--
ALTER TABLE `parametro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipocuenta`
--
ALTER TABLE `tipocuenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asientocontable`
--
ALTER TABLE `asientocontable`
  ADD CONSTRAINT `asientocontable_ibfk_1` FOREIGN KEY (`debitocuenta`) REFERENCES `cuenta` (`id`),
  ADD CONSTRAINT `asientocontable_ibfk_2` FOREIGN KEY (`creditocuenta`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `fk_cuenta_tipocuenta` FOREIGN KEY (`tipocuenta_id`) REFERENCES `tipocuenta` (`id`);

--
-- Filtros para la tabla `cuentaxasiento`
--
ALTER TABLE `cuentaxasiento`
  ADD CONSTRAINT `fk_cuentaxasiento_asientocontable` FOREIGN KEY (`asientocontable_id`) REFERENCES `asientocontable` (`id`),
  ADD CONSTRAINT `fk_cuentaxasiento_cuenta` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`id`);

--
-- Filtros para la tabla `cuentaxcobrar`
--
ALTER TABLE `cuentaxcobrar`
  ADD CONSTRAINT `fk_cuentaxcobrar_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `cuentaxpagar`
--
ALTER TABLE `cuentaxpagar`
  ADD CONSTRAINT `fk_cuentasxpagar_proveedor` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `fk_factura_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `fk_facturadetalle_formapago` FOREIGN KEY (`formapago_id`) REFERENCES `formapago` (`id`);

--
-- Filtros para la tabla `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD CONSTRAINT `fk_facturadetalle_factura` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `fk_facturadetalle_impuesto` FOREIGN KEY (`impuesto_id`) REFERENCES `parametro` (`id`);

--
-- Filtros para la tabla `horariomantenimiento`
--
ALTER TABLE `horariomantenimiento`
  ADD CONSTRAINT `fk_horariomantenimiento_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `fk_inmueble_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `fk_opcion_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`);

--
-- Filtros para la tabla `opcionxrol`
--
ALTER TABLE `opcionxrol`
  ADD CONSTRAINT `fk_opcionxrol_opcion` FOREIGN KEY (`opcion_id`) REFERENCES `opcion` (`id`),
  ADD CONSTRAINT `fk_opcionxrol_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `fk_reserva_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`);
  
DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `limpieza` ON SCHEDULE EVERY 3 HOUR STARTS '2017-09-17 15:22:20' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM  reserva where estado = 'pre-reserva'$$

CREATE DEFINER=`root`@`localhost` EVENT `limpieza` ON SCHEDULE EVERY 3 HOUR STARTS '2017-09-17 15:22:20' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM  reserva where estado = 'pre-reserva'

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
