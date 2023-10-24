-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2023 a las 07:01:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liceo_nº1bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administra`
--

CREATE TABLE `administra` (
  `Ci_a` int(11) NOT NULL,
  `Id_pagina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Ci_a` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL,
  `Contrasenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Ci_a`, `Nombre`, `Apellido`, `Contrasenia`) VALUES
(14689247, 'Luis', 'Hernandez', 'Luisitozap'),
(14698355, 'Manuel', 'Curtis', 'molche'),
(24685931, 'Isabella', 'Martinez', 'Isamar12'),
(25479631, 'Mariana', 'Paredes', 'MARIANITAdelcap'),
(28465936, 'Carolina', 'Rivera', 'Caroriv55'),
(28796531, 'Valeria', 'Rojas', 'Valuhermu'),
(28967543, 'Angel', 'Di maria', 'angelito11'),
(37695246, 'Pedro', 'Ortega', 'Pedroorti15'),
(45219863, 'Regina', 'Soto', 'sotoreg'),
(48036593, 'Fausto', 'Nunez', 'nunezfu56'),
(58612436, 'Perla', 'Soffia', 'Perlaclase'),
(71235964, 'Mariano', 'Fernandez', 'Lolitomiidolo'),
(78612496, 'Camila', 'Espinosa', 'Espicamilita'),
(98452376, 'Emilio', 'Amarillo', 'emiama'),
(98657213, 'Ernesto', 'Medina', 'Medierni5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviso`
--

CREATE TABLE `aviso` (
  `Id_pagina` int(11) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Contenido` varchar(1500) NOT NULL,
  `Fecha` date NOT NULL,
  `Categoria` enum('Administrador','Profesor','Estudiante','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `Id_pagina` int(11) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Contenido` varchar(1500) NOT NULL,
  `Fecha` date NOT NULL,
  `Categoria` enum('Administrador','Profesor','Estudiante') NOT NULL,
  `Hora` time NOT NULL,
  `Likes` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`Id_pagina`, `Titulo`, `Contenido`, `Fecha`, `Categoria`, `Hora`, `Likes`) VALUES
(94, 'sdassdsaddsa', 'sadssdasd', '2023-10-08', 'Estudiante', '02:35:30', 0),
(122, 'qwe', 'wqe', '2023-10-08', 'Estudiante', '19:32:11', 45),
(124, 'wqeeqw', 'wqewqeew', '2023-10-08', 'Estudiante', '19:56:18', 0),
(130, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-08', 'Estudiante', '21:00:19', 0),
(131, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!ssssssssssssssssssssssLorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!sssssssssssssssssssssLorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-08', 'Estudiante', '21:00:54', 0),
(132, 'En un tranquilo pueb', 'En un tranquilo pueblo a las afueras de la ciudad, la vida transcurre a un ritmo pausado y apacible. Las calles adoquinadas están bordeadas de casas antiguas con techos de tejas rojas y jardines cuidadosamente mantenidos. Los habitantes del pueblo se conocen entre sí y se saludan con una sonrisa amable cuando se cruzan por la calle.  En el centro del pueblo se encuentra una plaza con una fuente de piedra y un banco de madera, donde los lugareños se reúnen para charlar y disfrutar del buen tiempo. Los niños corren y juegan en el parque cercano, riendo y persiguiéndose unos a otros.  La vida en este pueblo es sencilla pero satisfactoria. La panadería local siempre huele a pan recién horneado, y la tienda de comestibles tiene productos frescos de la granja de la región. Los agricultores trabajan en los campos cercanos, cultivando cosechas de maíz y verduras que abastecen a la comunidad.  En las noches de verano, la gente se reúne en el anfiteatro al aire libre para disfrutar de conciertos y representaciones teatrales. Las estrellas brillan en el cielo nocturno, y la música llena el aire, creando un ambiente mágico que transporta a todos a un mundo de ensueño.  Pero no todo es perfecto en este pueblo. Como en cualquier lugar, existen desafíos y preocupaciones. La escuela local lucha por mantener sus programas educativos debido a la falta de fondos, y algunos residentes se preocupan por la conservación del medio ambiente en la región.  Sin embargo, a pesar de estos desafíos, la co', '2023-10-08', 'Administrador', '21:03:35', 10),
(134, 'ala la kage', 'mateo la cago xd<br />\r\na<br />\r\nla cago <br />\r\n:(<br />\r\n', '2023-10-21', 'Estudiante', '21:18:52', 10),
(155, 'Hola', 'Este es mi blog', '2023-10-15', 'Estudiante', '19:47:16', 10),
(159, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador', '20:35:24', 0),
(160, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador', '20:35:27', 0),
(161, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador', '20:35:31', 0),
(162, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador', '20:35:39', 0),
(163, 'Lorem ipsum dolor si', 'wqe', '2023-10-15', 'Administrador', '20:35:42', 0),
(164, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador', '20:35:59', 0),
(165, 'wqe', 'w', '2023-10-15', 'Administrador', '20:36:03', 0),
(166, 'wqe', 'w', '2023-10-15', 'Administrador', '20:36:06', 0),
(167, 'qwe', 'wqe', '2023-10-15', 'Administrador', '20:36:10', 0),
(178, 'ala', 'ala', '2023-10-15', 'Profesor', '21:33:34', 0),
(179, 'arriba', 'arriba', '2023-10-15', 'Administrador', '21:37:04', 0),
(195, '1', '1', '2023-10-15', 'Administrador', '22:11:13', 0),
(196, '2', '2', '2023-10-15', 'Administrador', '22:11:17', 0),
(197, 'Admin', 'solo admins', '2023-10-16', 'Administrador', '02:37:11', 0),
(198, 'wwwwwwww', 'w', '2023-10-16', 'Administrador', '18:52:52', 0),
(199, 'w', 'w', '2023-10-16', 'Estudiante', '18:52:56', 0),
(200, 'w', 'w', '2023-10-16', 'Administrador', '18:53:00', 0),
(201, 'ee', 'e', '2023-10-16', 'Profesor', '18:53:05', 0),
(202, 'e', 'e', '2023-10-16', 'Estudiante', '18:53:08', 0),
(203, 'e', 'e', '2023-10-16', 'Estudiante', '18:53:11', 0),
(204, 'w', 'w', '2023-10-16', 'Estudiante', '18:53:15', 0),
(205, 'q', 'q', '2023-10-16', 'Estudiante', '18:53:18', 0),
(206, 'e', 'e', '2023-10-16', 'Profesor', '18:53:21', 0),
(207, 'r', 'r', '2023-10-16', 'Administrador', '18:53:25', 0),
(208, 'w', 'w', '2023-10-16', 'Estudiante', '18:53:28', 0),
(209, 'w', 'w', '2023-10-16', 'Estudiante', '18:53:31', 0),
(210, 'q', 'q', '2023-10-16', 'Profesor', '18:53:35', 0),
(211, 'e', 'r', '2023-10-16', 'Profesor', '18:53:38', 0),
(212, 'w', 'w', '2023-10-16', 'Estudiante', '18:53:41', 0),
(213, 'q', 'q', '2023-10-16', 'Estudiante', '18:53:44', 0),
(214, 'g', 'g', '2023-10-16', 'Estudiante', '18:53:47', 0),
(215, 'g', 'g', '2023-10-16', 'Profesor', '18:53:51', 0),
(216, 'g', 'd', '2023-10-16', 'Estudiante', '18:53:55', 0),
(217, 's', 's', '2023-10-16', 'Profesor', '18:53:58', 0),
(218, 'm', 'm', '2023-10-16', 'Profesor', '18:54:06', 0),
(219, 'b', 'b', '2023-10-16', 'Profesor', '18:54:09', 0),
(226, 'Hola', 'Hola mundo', '2023-10-20', 'Profesor', '01:28:44', 1),
(340, 'Soy un dunsparce', 'En un tranquilo día de primavera en el Bosque Verde, un Dunsparce llamado Duna, con su cuerpo en forma de serpentina y pequeñas alas inútiles, exploraba el suelo en busca de insectos y bayas. Duna siempre soñó con aventuras emocionantes, pero el Bosque Verde era su hogar y lo conocía como la palma de su mano. A pesar de ello, la curiosidad a menudo lo llevaba a descubrir rincones nuevos.<br />\r\n<br />\r\nUn día, mientras exploraba un área que rara vez visitaba, Duna se encontró con una enorme sombra que bloqueaba la luz del sol. Para su sorpresa, la sombra provenía de un inmenso Snorlax que yacía profundamente dormido. El gigante roncaba ruidosamente, haciendo temblar el suelo a su alrededor. Duna, sin embargo, no tenía idea de lo que era un Snorlax y se acercó con curiosidad.<br />\r\n<br />\r\nMientras examinaba al dormido Snorlax, Duna notó un pequeño arbusto cargado de bayas deliciosas a pocos pasos de distancia. Duna se sintió tentado por las bayas jugosas, pero el Snorlax bloqueaba el camino. Decidió buscar una manera de llegar a las bayas sin molestar al gigante.<br />\r\n<br />\r\nCon cuidado, Duna empezó a reptar alrededor de Snorlax, aprovechando las sombras y escondiéndose detrás de las rocas para evitar despertarlo. Pasaron horas, pero finalmente, Duna llegó al arbusto de bayas y comenzó a comer con alegría. Las bayas eran tan deliciosas como imaginó y estaba encantado con su hallazgo.<br />\r\n', '2023-10-22', 'Administrador', '18:50:54', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `Id_comentario` int(11) NOT NULL,
  `Id_pagina` int(11) NOT NULL,
  `Contenido` varchar(1000) NOT NULL,
  `Fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`Id_comentario`, `Id_pagina`, `Contenido`, `Fecha`) VALUES
(1, 134, 'la kage', '2023-10-11 03:50:54'),
(2, 134, 'wqeqwe', '2023-10-11 03:51:40'),
(4, 134, 'alaaaaa', '2023-10-11 03:52:19'),
(7, 134, 'sadas', '2023-10-11 03:53:15'),
(9, 134, 'wqewqe', '2023-10-12 02:17:56'),
(10, 134, 'wqeqwe', '2023-10-12 02:17:57'),
(11, 134, 'sasadasd', '2023-10-12 02:17:58'),
(12, 134, 'xzzxxzc', '2023-10-12 02:18:00'),
(13, 134, 'asdasdsda', '2023-10-12 02:18:01'),
(14, 134, 'wqeqweewq', '2023-10-12 02:18:02'),
(15, 134, '213213', '2023-10-12 02:18:03'),
(16, 134, 'qwewqe', '2023-10-12 02:18:33'),
(17, 134, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-12 02:54:42'),
(18, 134, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Vol', '2023-10-12 03:12:46'),
(19, 134, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-12 03:14:40'),
(20, 134, '2222222222222222222', '2023-10-12 03:16:21'),
(21, 134, '23123123', '2023-10-12 03:18:25'),
(22, 134, 'wq', '2023-10-12 03:19:33'),
(23, 134, 'w', '2023-10-12 03:20:17'),
(24, 134, 'wqe', '2023-10-12 03:20:27'),
(90, 155, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-15 19:47:37'),
(91, 155, 'wqeqwewqe', '2023-10-15 19:47:43'),
(102, 179, 'wqeqwewqe', '2023-10-16 06:07:58'),
(103, 340, 'Confirmo, yo era el snorlax', '2023-10-22 18:51:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursa`
--

CREATE TABLE `cursa` (
  `Id` int(11) NOT NULL,
  `Ci_e` int(11) NOT NULL,
  `Calificacion` int(12) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursa`
--

INSERT INTO `cursa` (`Id`, `Ci_e`, `Calificacion`, `Fecha`) VALUES
(42, 75462351, 10, '2023-09-24'),
(81, 45632975, 11, '2023-09-24'),
(42, 45632975, 7, '2023-09-24'),
(81, 45876215, 9, '2023-09-24'),
(42, 45876215, 5, '2023-09-24'),
(81, 54684866, 7, '2023-09-24'),
(42, 54684866, 4, '2023-09-24'),
(42, 52684126, 9, '2023-09-24'),
(81, 52684126, 7, '2023-09-24'),
(42, 12563549, 5, '2023-09-24'),
(81, 12563549, 11, '2023-09-24'),
(81, 12563549, 11, '2023-09-24'),
(42, 78965234, 7, '2023-09-24'),
(81, 78965234, 11, '2023-09-24'),
(42, 45862135, 6, '2023-09-24'),
(81, 45862135, 10, '2023-09-24'),
(42, 65982347, 7, '2023-09-24'),
(42, 52136549, 2, '2023-09-24'),
(81, 52136549, 4, '2023-09-24'),
(42, 85642135, 9, '2023-09-24'),
(81, 85642135, 11, '2023-09-24'),
(42, 45876235, 8, '2023-09-24'),
(81, 45876235, 5, '2023-09-24'),
(42, 45639841, 7, '2023-09-24'),
(81, 45639841, 6, '2023-09-24'),
(42, 62351245, 10, '2023-09-24'),
(81, 62351245, 12, '2023-09-24'),
(42, 12458796, 9, '2023-09-24'),
(81, 12458796, 11, '2023-09-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `Ci_e` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Contrasenia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Ci_e`, `Nombre`, `Apellido`, `Contrasenia`) VALUES
(12458796, 'Victoria', 'Valverde', 'Vicval5'),
(12563549, 'Lara', 'Bionda', 'laritalameju'),
(45632975, 'Carlos', 'Gustafson', 'Gustaf785'),
(45639841, 'Rodrigo', 'Rodriguez', 'Rodritrap5'),
(45862135, 'Mateo', 'Terra', 'GataThor'),
(45876215, 'Franco', 'Mourinho', 'Specialone'),
(45876235, 'Ramiro ', 'Lopez', 'ramilop'),
(52136549, 'Nahuel	', 'Castro', 'Nahuelelgrande'),
(52684126, 'Julieta', 'Rosas', 'juli54'),
(54684866, 'Juan Carlos', 'Perez ', 'Juanca17'),
(62351245, 'Sofia', 'Cuchitini', 'amoelfutbol'),
(65982347, 'Matias', 'Blas', 'TerraBlasMatias'),
(75462351, 'Carla', 'Costabel', 'costicarli'),
(78965234, 'Luca', 'Risha', 'Gastogod'),
(85642135, 'Penelope', 'Suarez', 'lupeloo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faq`
--

CREATE TABLE `faq` (
  `Id_pagina` int(11) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Contenido` varchar(1500) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `faq`
--

INSERT INTO `faq` (`Id_pagina`, `Titulo`, `Contenido`, `Fecha`) VALUES
(358, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-24'),
(359, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudanti', '2023-10-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `Id_pagina` int(11) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Contenido` varchar(1500) NOT NULL,
  `Ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`Id_pagina`, `Titulo`, `Contenido`, `Ruta`) VALUES
(345, 'a', 'a', '/Sitio_Liceo_Nº1/Imagen/Galeria/1698003899_14.PNG'),
(352, 'a', 'a', '/Sitio_Liceo_Nº1/Imagen/Galeria/1698010333_3.PNG'),
(354, 'a', 'a', '/Sitio_Liceo_Nº1/Imagen/Galeria/1698102638_10.PNG'),
(356, 'a', 'a', '/Sitio_Liceo_Nº1/Imagen/Galeria/1698107636_1.PNG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Horario` varchar(20) NOT NULL,
  `Ci_p` int(11) DEFAULT NULL,
  `Ci_a` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`Id`, `Nombre`, `Horario`, `Ci_p`, `Ci_a`) VALUES
(13, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 25479631),
(14, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 71235964),
(15, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 37695246),
(16, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 58612436),
(17, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 45219863),
(18, 'Matematicas', '13:30:00 / 14:05:00', 46598325, 28796531),
(22, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 28967543),
(23, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 78612496),
(24, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 28465936),
(25, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 98452376),
(26, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 98657213),
(27, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 48036593),
(28, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 24685931),
(29, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 14689247),
(30, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 14698355),
(31, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 25479631),
(32, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 71235964),
(33, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 37695246),
(34, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 58612436),
(35, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 45219863),
(36, 'Matematicas', '13:30:00 / 14:50:00', 86532496, 28796531),
(38, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 28967543),
(39, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 78612496),
(40, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 28465936),
(41, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 98452376),
(42, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 98657213),
(43, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 48036593),
(44, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 24685931),
(45, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 14689247),
(46, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 14698355),
(47, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 25479631),
(48, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 71235964),
(49, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 37695246),
(50, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 58612436),
(51, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 45219863),
(52, 'Matematicas', '14:50:00 / 16:15:00', 62986594, 28796531),
(54, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 28967543),
(55, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 78612496),
(56, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 28465936),
(57, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 98452376),
(58, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 98657213),
(59, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 48036593),
(60, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 24685931),
(61, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 14689247),
(62, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 14698355),
(63, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 25479631),
(64, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 71235964),
(65, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 37695246),
(66, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 58612436),
(67, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 45219863),
(68, 'Matematicas', '16:15:00 / 17:05:00', 54368654, 28796531),
(70, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 28967543),
(71, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 78612496),
(72, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 28465936),
(73, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 98452376),
(74, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 98657213),
(75, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 48036593),
(77, 'Matematicas', '17:05:00 / 17:45:00', 85645179, 24685931),
(79, 'Biologia', '13:30:00 / 16:15:00', 58956234, 28967543),
(80, 'Biologia', '13:30:00 / 16:15:00', 58956234, 78612496),
(81, 'Biologia', '13:30:00 / 16:15:00', 58956234, 28465936),
(82, 'Biologia', '13:30:00 / 16:15:00', 58956234, 98452376),
(83, 'Biologia', '13:30:00 / 16:15:00', 58956234, 98657213),
(84, 'Biologia', '13:30:00 / 16:15:00', 58956234, 48036593),
(85, 'Biologia', '13:30:00 / 16:15:00', 58956234, 24685931),
(86, 'Biologia', '13:30:00 / 16:15:00', 58956234, 14689247),
(87, 'Biologia', '13:30:00 / 16:15:00', 58956234, 14698355),
(88, 'Biologia', '13:30:00 / 16:15:00', 58956234, 25479631),
(89, 'Biologia', '13:30:00 / 16:15:00', 58956234, 71235964),
(90, 'Biologia', '13:30:00 / 16:15:00', 58956234, 37695246),
(91, 'Biologia', '13:30:00 / 16:15:00', 58956234, 58612436),
(92, 'Biologia', '13:30:00 / 16:15:00', 58956234, 45219863),
(93, 'Biologia', '13:30:00 / 16:15:00', 58956234, 28796531),
(94, 'Biologia', '13:30:00 / 16:15:00', 45623879, 28967543),
(95, 'Biologia', '13:30:00 / 16:15:00', 45623879, 78612496),
(96, 'Biologia', '13:30:00 / 16:15:00', 45623879, 28465936),
(97, 'Biologia', '13:30:00 / 16:15:00', 45623879, 98452376),
(98, 'Biologia', '13:30:00 / 16:15:00', 45623879, 98657213),
(99, 'Biologia', '13:30:00 / 16:15:00', 45623879, 48036593),
(100, 'Biologia', '13:30:00 / 16:15:00', 45623879, 24685931),
(101, 'Biologia', '13:30:00 / 16:15:00', 45623879, 14689247),
(102, 'Biologia', '13:30:00 / 16:15:00', 45623879, 14698355),
(103, 'Biologia', '13:30:00 / 16:15:00', 45623879, 25479631),
(104, 'Biologia', '13:30:00 / 16:15:00', 45623879, 71235964),
(105, 'Biologia', '13:30:00 / 16:15:00', 45623879, 37695246),
(106, 'Biologia', '13:30:00 / 16:15:00', 45623879, 58612436),
(107, 'Biologia', '13:30:00 / 16:15:00', 45623879, 45219863),
(108, 'Biologia', '13:30:00 / 16:15:00', 45623879, 28796531),
(109, 'Biologia', '13:30:00 / 16:15:00', 13546895, 28967543),
(110, 'Biologia', '13:30:00 / 16:15:00', 13546895, 78612496),
(111, 'Biologia', '13:30:00 / 16:15:00', 13546895, 28465936),
(112, 'Biologia', '13:30:00 / 16:15:00', 13546895, 98452376),
(113, 'Biologia', '13:30:00 / 16:15:00', 13546895, 98657213),
(114, 'Biologia', '13:30:00 / 16:15:00', 13546895, 48036593),
(116, 'Biologia', '13:30:00 / 16:15:00', 13546895, 14689247),
(117, 'Biologia', '13:30:00 / 16:15:00', 13546895, 14698355),
(118, 'Biologia', '13:30:00 / 16:15:00', 13546895, 25479631),
(119, 'Biologia', '13:30:00 / 16:15:00', 13546895, 71235964),
(120, 'Biologia', '13:30:00 / 16:15:00', 13546895, 37695246),
(121, 'Biologia', '13:30:00 / 16:15:00', 13546895, 58612436),
(122, 'Biologia', '13:30:00 / 16:15:00', 13546895, 45219863),
(123, 'Biologia', '13:30:00 / 16:15:00', 13546895, 28796531),
(124, 'Biologia', '13:30:00 / 16:15:00', 84635164, 28967543),
(125, 'Biologia', '13:30:00 / 16:15:00', 84635164, 78612496),
(126, 'Biologia', '13:30:00 / 16:15:00', 84635164, 28465936),
(127, 'Biologia', '13:30:00 / 16:15:00', 84635164, 98452376),
(128, 'Biologia', '13:30:00 / 16:15:00', 84635164, 98657213),
(129, 'Biologia', '13:30:00 / 16:15:00', 84635164, 48036593),
(130, 'Biologia', '13:30:00 / 16:15:00', 84635164, 24685931),
(131, 'Biologia', '13:30:00 / 16:15:00', 84635164, 14689247),
(132, 'Biologia', '13:30:00 / 16:15:00', 84635164, 14698355),
(133, 'Biologia', '13:30:00 / 16:15:00', 84635164, 25479631),
(134, 'Biologia', '13:30:00 / 16:15:00', 84635164, 71235964),
(135, 'Biologia', '13:30:00 / 16:15:00', 84635164, 37695246),
(136, 'Biologia', '13:30:00 / 16:15:00', 84635164, 58612436),
(137, 'Biologia', '13:30:00 / 16:15:00', 84635164, 45219863),
(138, 'Biologia', '13:30:00 / 16:15:00', 84635164, 28796531),
(139, 'Biologia', '13:30:00 / 16:15:00', 42365962, 28967543),
(140, 'Biologia', '13:30:00 / 16:15:00', 42365962, 78612496),
(141, 'Biologia', '13:30:00 / 16:15:00', 42365962, 28465936),
(142, 'Biologia', '13:30:00 / 16:15:00', 42365962, 98452376),
(143, 'Biologia', '13:30:00 / 16:15:00', 42365962, 98657213),
(144, 'Biologia', '13:30:00 / 16:15:00', 42365962, 48036593),
(145, 'Biologia', '13:30:00 / 16:15:00', 42365962, 24685931),
(146, 'Biologia', '13:30:00 / 16:15:00', 42365962, 14689247),
(147, 'Biologia', '13:30:00 / 16:15:00', 42365962, 14698355),
(148, 'Biologia', '13:30:00 / 16:15:00', 42365962, 25479631),
(149, 'Biologia', '13:30:00 / 16:15:00', 42365962, 71235964),
(150, 'Biologia', '13:30:00 / 16:15:00', 42365962, 37695246),
(151, 'Biologia', '13:30:00 / 16:15:00', 42365962, 58612436),
(152, 'Biologia', '13:30:00 / 16:15:00', 42365962, 45219863),
(153, 'Biologia', '13:30:00 / 16:15:00', 42365962, 28796531),
(154, 'Biologia', '13:30:00 / 16:15:00', 17468569, 28967543),
(155, 'Biologia', '13:30:00 / 16:15:00', 17468569, 78612496),
(156, 'Biologia', '13:30:00 / 16:15:00', 17468569, 28465936),
(157, 'Biologia', '13:30:00 / 16:15:00', 17468569, 98452376),
(158, 'Biologia', '13:30:00 / 16:15:00', 17468569, 98657213),
(159, 'Biologia', '13:30:00 / 16:15:00', 17468569, 48036593),
(160, 'Biologia', '13:30:00 / 16:15:00', 17468569, 24685931),
(161, 'Biologia', '13:30:00 / 16:15:00', 17468569, 14689247),
(162, 'Biologia', '13:30:00 / 16:15:00', 17468569, 14698355),
(163, 'Biologia', '13:30:00 / 16:15:00', 17468569, 25479631),
(164, 'Biologia', '13:30:00 / 16:15:00', 17468569, 71235964),
(165, 'Biologia', '13:30:00 / 16:15:00', 17468569, 37695246),
(166, 'Biologia', '13:30:00 / 16:15:00', 17468569, 58612436),
(167, 'Biologia', '13:30:00 / 16:15:00', 17468569, 45219863),
(168, 'Biologia', '13:30:00 / 16:15:00', 17468569, 28796531),
(169, 'Biologia', '13:30:00 / 16:15:00', 79861245, 28967543),
(170, 'Biologia', '13:30:00 / 16:15:00', 79861245, 78612496),
(171, 'Biologia', '13:30:00 / 16:15:00', 79861245, 28465936),
(172, 'Biologia', '13:30:00 / 16:15:00', 79861245, 98452376),
(173, 'Biologia', '13:30:00 / 16:15:00', 79861245, 98657213),
(174, 'Biologia', '13:30:00 / 16:15:00', 79861245, 48036593),
(175, 'Biologia', '13:30:00 / 16:15:00', 79861245, 24685931),
(176, 'Biologia', '13:30:00 / 16:15:00', 79861245, 14689247),
(177, 'Biologia', '13:30:00 / 16:15:00', 79861245, 14698355),
(178, 'Biologia', '13:30:00 / 16:15:00', 79861245, 25479631),
(179, 'Biologia', '13:30:00 / 16:15:00', 79861245, 71235964),
(180, 'Biologia', '13:30:00 / 16:15:00', 79861245, 37695246),
(181, 'Biologia', '13:30:00 / 16:15:00', 79861245, 58612436),
(182, 'Biologia', '13:30:00 / 16:15:00', 79861245, 45219863),
(183, 'Biologia', '13:30:00 / 16:15:00', 79861245, 28796531),
(199, 'Biologia', '13:30:00 / 16:15:00', 86591423, 28967543),
(200, 'Biologia', '13:30:00 / 16:15:00', 86591423, 78612496),
(201, 'Biologia', '13:30:00 / 16:15:00', 86591423, 28465936),
(202, 'Biologia', '13:30:00 / 16:15:00', 86591423, 98452376),
(203, 'Biologia', '13:30:00 / 16:15:00', 86591423, 98657213),
(204, 'Biologia', '13:30:00 / 16:15:00', 86591423, 48036593),
(205, 'Biologia', '13:30:00 / 16:15:00', 86591423, 24685931),
(206, 'Biologia', '13:30:00 / 16:15:00', 86591423, 14689247),
(207, 'Biologia', '13:30:00 / 16:15:00', 86591423, 14698355),
(208, 'Biologia', '13:30:00 / 16:15:00', 86591423, 25479631),
(209, 'Biologia', '13:30:00 / 16:15:00', 86591423, 71235964),
(210, 'Biologia', '13:30:00 / 16:15:00', 86591423, 37695246),
(211, 'Biologia', '13:30:00 / 16:15:00', 86591423, 58612436),
(212, 'Biologia', '13:30:00 / 16:15:00', 86591423, 45219863),
(213, 'Biologia', '13:30:00 / 16:15:00', 86591423, 28796531);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `Id_pagina` int(11) NOT NULL,
  `Titulo` varchar(20) NOT NULL,
  `Contenido` varchar(1500) NOT NULL,
  `Fecha` date NOT NULL,
  `Categoria` enum('Administrador','Profesor','Estudiante','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`Id_pagina`, `Titulo`, `Contenido`, `Fecha`, `Categoria`) VALUES
(82, 'wqewqe', 'qweqwe mateo', '2023-10-08', 'Estudiante'),
(83, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(84, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(85, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(86, 'asd', 'sad', '2023-10-08', 'Estudiante'),
(87, 'asdsad', 'asdasd', '2023-10-08', 'Estudiante'),
(88, 'sadsadsad', 'sadasdds', '2023-10-08', 'Estudiante'),
(89, 'asdsadsdads', 'sadsasddas', '2023-10-08', 'Estudiante'),
(90, 'sadasdsadsda', 'saddsadsad', '2023-10-08', 'Estudiante'),
(94, 'sdassdsaddsa', 'sadssdasd', '2023-10-08', 'Estudiante'),
(96, '1231231232', '213213221', '2023-10-08', 'Estudiante'),
(97, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(98, 'qwewqe', 'wqewqeewq', '2023-10-08', 'Estudiante'),
(99, 'asdsad', 'asdasddsa', '2023-10-08', 'Estudiante'),
(100, 'asdadsdas', 'asddsadas', '2023-10-08', 'Estudiante'),
(101, 'zxcxzc', 'zxczxczxc', '2023-10-08', 'Estudiante'),
(102, '213123', '21322323', '2023-10-08', 'Estudiante'),
(103, '3321321', '32333333333', '2023-10-08', 'Estudiante'),
(104, 'qwe', 'wqe', '2023-10-08', 'Estudiante'),
(105, 'qwe', 'qwewqe', '2023-10-08', 'Estudiante'),
(107, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(108, '11', '11', '2023-10-08', 'Estudiante'),
(109, '111', '111', '2023-10-08', 'Estudiante'),
(110, '213', '213', '2023-10-08', 'Estudiante'),
(111, '111', '111', '2023-10-08', 'Estudiante'),
(112, 'wewqe', 'qwewqeweq', '2023-10-08', 'Estudiante'),
(113, 'wqewqe', 'wqewqe', '2023-10-08', 'Estudiante'),
(114, 'wqewqe', 'wqewqe', '2023-10-08', 'Estudiante'),
(115, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(116, 'wqe', 'wqe', '2023-10-08', 'Estudiante'),
(117, 'qwe', 'wqe', '2023-10-08', 'Estudiante'),
(118, 'dsfdf', 'dsffsdf', '2023-10-08', 'Estudiante'),
(119, 'ccccc', 'cccc', '2023-10-08', 'Estudiante'),
(120, 'kkkkkkkk', 'kkkkkkkkk', '2023-10-08', 'Estudiante'),
(121, 'das', 'asdasd', '2023-10-08', 'Estudiante'),
(122, 'qwe', 'wqe', '2023-10-08', 'Estudiante'),
(123, 'eqweqwe', 'qwewqeqwe', '2023-10-08', 'Estudiante'),
(124, 'wqeeqw', 'wqewqeew', '2023-10-08', 'Estudiante'),
(125, 'wwwwww', 'wwwwwwww', '2023-10-08', ''),
(126, 'dsasss', 'ssss', '2023-10-08', ''),
(127, 'ssssssss', 'ssssssss', '2023-10-08', ''),
(128, 'ssssssss', 'sssssssss', '2023-10-08', 'Administrador'),
(129, 'ddddddddddd', 'dddddd', '2023-10-08', 'Profesor'),
(130, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-08', 'Estudiante'),
(131, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!ssssssssssssssssssssssLorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!sssssssssssssssssssssLorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-08', 'Estudiante'),
(132, 'En un tranquilo pueb', 'En un tranquilo pueblo a las afueras de la ciudad, la vida transcurre a un ritmo pausado y apacible. Las calles adoquinadas están bordeadas de casas antiguas con techos de tejas rojas y jardines cuidadosamente mantenidos. Los habitantes del pueblo se conocen entre sí y se saludan con una sonrisa amable cuando se cruzan por la calle.  En el centro del pueblo se encuentra una plaza con una fuente de piedra y un banco de madera, donde los lugareños se reúnen para charlar y disfrutar del buen tiempo. Los niños corren y juegan en el parque cercano, riendo y persiguiéndose unos a otros.  La vida en este pueblo es sencilla pero satisfactoria. La panadería local siempre huele a pan recién horneado, y la tienda de comestibles tiene productos frescos de la granja de la región. Los agricultores trabajan en los campos cercanos, cultivando cosechas de maíz y verduras que abastecen a la comunidad.  En las noches de verano, la gente se reúne en el anfiteatro al aire libre para disfrutar de conciertos y representaciones teatrales. Las estrellas brillan en el cielo nocturno, y la música llena el aire, creando un ambiente mágico que transporta a todos a un mundo de ensueño.  Pero no todo es perfecto en este pueblo. Como en cualquier lugar, existen desafíos y preocupaciones. La escuela local lucha por mantener sus programas educativos debido a la falta de fondos, y algunos residentes se preocupan por la conservación del medio ambiente en la región.  Sin embargo, a pesar de estos desafíos, la co', '2023-10-08', 'Administrador'),
(134, 'ala la kage', 'mateo la cago xd<br />\r\na<br />\r\nla cago <br />\r\n:(<br />\r\n', '2023-10-21', 'Estudiante'),
(135, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Estudiante'),
(136, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Administrador'),
(137, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Profesor'),
(138, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Administrador'),
(139, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Estudiante'),
(140, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Administrador'),
(141, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-13', 'Estudiante'),
(142, '2222222', 'wwwwwwwwwww', '2023-10-13', 'Estudiante'),
(143, '111111111', '1111111111', '2023-10-14', 'Profesor'),
(155, 'Hola', 'Este es mi blog', '2023-10-15', 'Estudiante'),
(159, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador'),
(160, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador'),
(161, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador'),
(162, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador'),
(163, 'Lorem ipsum dolor si', 'wqe', '2023-10-15', 'Administrador'),
(164, 'Lorem ipsum dolor si', 'qweqwe', '2023-10-15', 'Administrador'),
(165, 'wqe', 'w', '2023-10-15', 'Administrador'),
(166, 'wqe', 'w', '2023-10-15', 'Administrador'),
(167, 'qwe', 'wqe', '2023-10-15', 'Administrador'),
(178, 'ala', 'ala', '2023-10-15', 'Profesor'),
(179, 'arriba', 'arriba', '2023-10-15', 'Administrador'),
(195, '1', '1', '2023-10-15', 'Administrador'),
(196, '2', '2', '2023-10-15', 'Administrador'),
(197, 'Admin', 'solo admins', '2023-10-16', 'Administrador'),
(198, 'wwwwwwww', 'w', '2023-10-16', 'Administrador'),
(199, 'w', 'w', '2023-10-16', 'Estudiante'),
(200, 'w', 'w', '2023-10-16', 'Administrador'),
(201, 'ee', 'e', '2023-10-16', 'Profesor'),
(202, 'e', 'e', '2023-10-16', 'Estudiante'),
(203, 'e', 'e', '2023-10-16', 'Estudiante'),
(204, 'w', 'w', '2023-10-16', 'Estudiante'),
(205, 'q', 'q', '2023-10-16', 'Estudiante'),
(206, 'e', 'e', '2023-10-16', 'Profesor'),
(207, 'r', 'r', '2023-10-16', 'Administrador'),
(208, 'w', 'w', '2023-10-16', 'Estudiante'),
(209, 'w', 'w', '2023-10-16', 'Estudiante'),
(210, 'q', 'q', '2023-10-16', 'Profesor'),
(211, 'e', 'r', '2023-10-16', 'Profesor'),
(212, 'w', 'w', '2023-10-16', 'Estudiante'),
(213, 'q', 'q', '2023-10-16', 'Estudiante'),
(214, 'g', 'g', '2023-10-16', 'Estudiante'),
(215, 'g', 'g', '2023-10-16', 'Profesor'),
(216, 'g', 'd', '2023-10-16', 'Estudiante'),
(217, 's', 's', '2023-10-16', 'Profesor'),
(218, 'm', 'm', '2023-10-16', 'Profesor'),
(219, 'b', 'b', '2023-10-16', 'Profesor'),
(226, 'Hola', 'Hola mundo', '2023-10-20', 'Profesor'),
(340, 'Soy un dunsparce', 'En un tranquilo día de primavera en el Bosque Verde, un Dunsparce llamado Duna, con su cuerpo en forma de serpentina y pequeñas alas inútiles, exploraba el suelo en busca de insectos y bayas. Duna siempre soñó con aventuras emocionantes, pero el Bosque Verde era su hogar y lo conocía como la palma de su mano. A pesar de ello, la curiosidad a menudo lo llevaba a descubrir rincones nuevos.<br />\r\n<br />\r\nUn día, mientras exploraba un área que rara vez visitaba, Duna se encontró con una enorme sombra que bloqueaba la luz del sol. Para su sorpresa, la sombra provenía de un inmenso Snorlax que yacía profundamente dormido. El gigante roncaba ruidosamente, haciendo temblar el suelo a su alrededor. Duna, sin embargo, no tenía idea de lo que era un Snorlax y se acercó con curiosidad.<br />\r\n<br />\r\nMientras examinaba al dormido Snorlax, Duna notó un pequeño arbusto cargado de bayas deliciosas a pocos pasos de distancia. Duna se sintió tentado por las bayas jugosas, pero el Snorlax bloqueaba el camino. Decidió buscar una manera de llegar a las bayas sin molestar al gigante.<br />\r\n<br />\r\nCon cuidado, Duna empezó a reptar alrededor de Snorlax, aprovechando las sombras y escondiéndose detrás de las rocas para evitar despertarlo. Pasaron horas, pero finalmente, Duna llegó al arbusto de bayas y comenzó a comer con alegría. Las bayas eran tan deliciosas como imaginó y estaba encantado con su hallazgo.<br />\r\n', '2023-10-22', 'Administrador'),
(345, 'a', 'a', '0000-00-00', 'Administrador'),
(346, 'a', '', '0000-00-00', 'Administrador'),
(352, 'a', 'a', '0000-00-00', 'Administrador'),
(354, 'a', 'a', '0000-00-00', 'Administrador'),
(356, 'a', 'a', '0000-00-00', 'Administrador'),
(358, 'Lorem ipsum dolor si', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum, quae. Optio, laudantium veritatis? Distinctio veniam id odio aliquam excepturi suscipit adipisci voluptas nulla, illo commodi sint inventore assumenda itaque debitis!', '2023-10-24', 'Administrador'),
(359, 'Lorem ipsum dolor si', '', '0000-00-00', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Ci_p` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL,
  `Contrasenia` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Ci_p`, `Nombre`, `Apellido`, `Contrasenia`) VALUES
(13546895, 'Luis', 'Torres', 'NaciEn9/11'),
(17468569, 'Paula', 'Gonu', 'Amoelplaneta'),
(42365962, 'Patricia', 'Moreno', 'Morepatu7'),
(45623879, 'Laura', 'Guardiola', 'guaardilau'),
(46598325, 'Joaquin', 'Dominguez', 'Elfocas'),
(54368654, 'Guillermo', 'Doblas', 'Guillepatatudo'),
(58956234, 'Juan', 'Ramirez', 'leomucho'),
(62986594, 'Claudio', 'Ruiz', 'Alvarezsusi'),
(79861245, 'Pedro', 'Herrera', '00Hello45'),
(84635164, 'Miguel', 'Vargas', 'miguevar00'),
(85645179, 'Isabel', 'Silva', 'Isa879'),
(86532496, 'Andrea', 'Gonzalez', 'lupitalove'),
(86591423, 'Samuel', 'De luque', 'Samu777');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administra`
--
ALTER TABLE `administra`
  ADD KEY `Ci_a` (`Ci_a`),
  ADD KEY `Id_pagina` (`Id_pagina`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Ci_a`);

--
-- Indices de la tabla `aviso`
--
ALTER TABLE `aviso`
  ADD PRIMARY KEY (`Id_pagina`),
  ADD KEY `Id_pagina` (`Id_pagina`);

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`Id_pagina`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`Id_comentario`),
  ADD KEY `Id_pagina` (`Id_pagina`);

--
-- Indices de la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD KEY `Id` (`Id`),
  ADD KEY `Ci_e` (`Ci_e`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Ci_e`),
  ADD UNIQUE KEY `Contrasenia` (`Contrasenia`);

--
-- Indices de la tabla `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`Id_pagina`),
  ADD KEY `Id_pagina` (`Id_pagina`);

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`Id_pagina`),
  ADD KEY `Id_pagina` (`Id_pagina`),
  ADD KEY `Id_pagina_2` (`Id_pagina`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Ci_p` (`Ci_p`),
  ADD KEY `Ci_a` (`Ci_a`);

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`Id_pagina`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Ci_p`),
  ADD UNIQUE KEY `Contrasenia` (`Contrasenia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aviso`
--
ALTER TABLE `aviso`
  MODIFY `Id_pagina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `Id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- AUTO_INCREMENT de la tabla `pagina`
--
ALTER TABLE `pagina`
  MODIFY `Id_pagina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administra`
--
ALTER TABLE `administra`
  ADD CONSTRAINT `administra_ibfk_2` FOREIGN KEY (`Id_pagina`) REFERENCES `pagina` (`Id_pagina`),
  ADD CONSTRAINT `administra_ibfk_3` FOREIGN KEY (`Ci_a`) REFERENCES `administrador` (`Ci_a`);

--
-- Filtros para la tabla `aviso`
--
ALTER TABLE `aviso`
  ADD CONSTRAINT `aviso_ibfk_1` FOREIGN KEY (`Id_pagina`) REFERENCES `pagina` (`Id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`Id_pagina`) REFERENCES `pagina` (`Id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`Id_pagina`) REFERENCES `blog` (`Id_pagina`);

--
-- Filtros para la tabla `cursa`
--
ALTER TABLE `cursa`
  ADD CONSTRAINT `cursa_ibfk_2` FOREIGN KEY (`Ci_e`) REFERENCES `estudiante` (`Ci_e`),
  ADD CONSTRAINT `cursa_ibfk_3` FOREIGN KEY (`Id`) REFERENCES `materia` (`Id`);

--
-- Filtros para la tabla `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`Id_pagina`) REFERENCES `pagina` (`Id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD CONSTRAINT `galeria_ibfk_1` FOREIGN KEY (`Id_pagina`) REFERENCES `pagina` (`Id_pagina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`Ci_p`) REFERENCES `profesor` (`Ci_p`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`Ci_a`) REFERENCES `administrador` (`Ci_a`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
