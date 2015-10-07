-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2015 a las 17:30:40
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `conferencia`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarInvitado`(IN valor INT(1))
BEGIN

	 DELETE 
		from invitados                
                WHERE id=valor;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `empresas_TT`()
BEGIN
	
	select * from empresas;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `empresas_TxId`(IN id INT(1))
BEGIN
	
	select * from empresas where idEmpresa=id;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarInvitados`(IN nomb VARCHAR(25), IN ape VARCHAR(25), IN d INT(8), IN sex VARCHAR(1),IN idEmp INT(1))
BEGIN 

    INSERT INTO invitados(nombre,apellido,dni,sexo,idEmpresa)   VALUES(nomb,ape,d,sex,idEmp);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `invitados_TT`()
BEGIN
	SELECT * FROM invitados;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `invitadoTxId`(IN `paramId` INT)
    NO SQL
SELECT * FROM invitados WHERE id=paramId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarInvitado`(IN `paramId` INT(1), IN `paramNom` VARCHAR(25), IN `paramApe` VARCHAR(25), IN `paramDni` INT(8), IN `paramSexo` VARCHAR(1), IN `paramIdEmp` INT(1))
BEGIN
	
	UPDATE invitados 
                set nombre=paramNom,
                apellido=paramApe,
                dni=paramDni,
                sexo=paramSexo,
                idEmpresa=paramIdEmp
                WHERE id=paramId;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_TxNombre`(IN nom VARCHAR(25))
BEGIN

SELECT * FROM usuarios where nombre=nom;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `idEmpresa` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`idEmpresa`, `nombre`) VALUES
(1, 'Probrando S.A.'),
(2, 'Funciona SRL'),
(3, '3er Empresa ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

CREATE TABLE IF NOT EXISTS `invitados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `apellido` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `dni` int(8) NOT NULL,
  `sexo` varchar(1) COLLATE latin1_spanish_ci NOT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `invitados`
--

INSERT INTO `invitados` (`id`, `nombre`, `apellido`, `dni`, `sexo`, `idEmpresa`) VALUES
(54, 'Gabi', 'Fresco', 38404676, 'M', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `contraseña` varchar(25) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contraseña`) VALUES
(3, 'Gabifresco09', 'valida123'),
(4, 'Gabi', '202cb962ac59075b964b07152');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indices de la tabla `invitados`
--
ALTER TABLE `invitados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `invitados`
--
ALTER TABLE `invitados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;