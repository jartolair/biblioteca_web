-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2018 a las 13:36:48
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'libro.jpg',
  `sinopsis` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `imagen`, `sinopsis`) VALUES
(1, 'Harry Potte', 'J.K. Rowling', 'harry.jpg', 'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y el insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el Colegio Hogwarts de Magia. A partir de ese momento, la suerte de Harry da un vuelco espectacular. En esa escuela tan especial aprenderá encantamientos, trucos fabulosos y tácticas de defensa contra las malas artes. Se convertirá en el campeón escolar de quidditch, especie de fútbol aéreo que se juega montado sobre escobas, y hará un puñado de buenos amigos... aunque también algunos temibles enemigos. Pero, sobre todo, conocerá los secretos que le permitirán cumplir con su destino. Pues, aunque no lo parezca a primera vista, Harry no es un chico normal y corriente: ¡es un verdadero mago!'),
(2, 'El Señor de los Anillos', 'J.R.R. Tolkien', 'anillos.jpg', 'Los Anillos de Poder fueron forjados en antiguos tiempos por los herreros Elfos, y Sauron, el Señor Oscuro, forjó el Anillo Único. Pero en una ocasión se lo quitaron, y aunque lo buscó por toda la Tierra Media nunca pudo encontrarlo. Al cabo de muchos años fue a caer casualmente en manos del hobbit Bilbo Bolsón. Sauron llegó a reunir todos los Grandes Anillos, pero continuaba buscando el Anillo Único que completaría el dominio de Mordor. Bilbo desapareció durante la celebración de su centesimodecimoprimer cumpleaños, y dejó a Frodo a cargo del Anillo, y con una peligrosa misión por delante: atravesar la Tierra Media, internarse en las sombras del País Oscuro y destruir el Anillo arrojándolo en las Grietas del Destino.'),
(3, 'El Código da Vinci', 'Dan Brown', 'codigo_da_vinci.jpg', 'La mayor conspiración de los últimos 2000 años está a punto de ser desvelada.  Robert Langdon recibe una llamada en mitad de la noche: el conservador del museo del Louvre ha sido asesinado en extrañas circunstancias y junto a su cadáver ha aparecido un desconcertante mensaje cifrado. Al profundizar en la investigación, Langdon, experto en simbología, descubre que las pistas conducen a las obras de Leonardo Da Vinci…y que están a la vista de todos, ocultas por el ingenio del pintor.  Langdon une esfuerzos con la criptóloga francesa Sophie Neveu y descubre que el conservador del museo pertenecía al priorato de Sión, una sociedad que a lo largo de los siglos ha contado con miembros tan destacados como sir Isaac Newton, Botticelli, Victor Hugo o el propio Da Vinci, y que ha velado por mantener en secreto una sorprendente verdad histórica.  Una mezcla trepidante de aventuras, intrigas vaticanas, simbología y enigmas cifrados que provocó una extraordinaria polémica al poner en duda algunos de los dogmas sobre los que se asienta la Iglesia católica. Una de las novelas más leídas de todos los tiempos.'),
(4, 'El diario de Ana Frank', 'Anna Frank', 'annafrank.jpg', 'Ana Frank nació en Alemania en 1929 y se exilió junto a su familia a Holanda al comenzar las persecuciones nazis. Pasó una infancia feliz, jugueteando por las calles de Ámsterdam, al abrigo de sus padres y hermana, y rodeada de amigos, ajena a la magnitud de la tragedia que se estaba desarrollando, pero pronto hubo de abandonar la inocencia de la niñez para adentrarse en una nueva vida clandestina donde la privación de la libertad y la supervivencia se convertirían en dos constantes. A los trece años, Ana comenzó a escribir un diario en el que narraba la vida cotidiana durante la Segunda Guerra Mundial y las repercusiones de la ocupación nazi. Después de más de setenta años, el diario, del que ofrecemos la casi totalidad, sigue tan fresco, interesante, conmovedor y hondo como cuando quedó tirado en el piso del refugio de los Frank.'),
(5, 'gvbfds', 'ssss', 'libro.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla id neque aliquet, aliquam mi non, malesuada eros. Cras nec ante quis elit aliquet rutrum eget eu leo. Sed non vulputate eros. Nunc tellus elit, pellentesque id tempor faucibus, rutrum ac justo. Mauris malesuada placerat purus. Vivamus gravida facilisis tortor eu fermentum. Duis posuere et tortor ac vulputate. Curabitur posuere est nunc, eu auctor erat viverra sed. Proin dapibus nulla sit amet ex bibendum, ut ullamcorper est condimentum. Sed efficitur nisi a sagittis auctor. In et facilisis erat. Integer at ante ut magna lobortis feugiat a sed arcu. Nam nec sapien vehicula, dignissim neque luctus, maximus nunc.\r\n\r\nAliquam at nulla leo. Aliquam sagittis blandit accumsan. Aenean magna velit, viverra vitae lacinia eu, laoreet eget nibh. Suspendisse aliquet pretium elit, eu cursus eros ornare at. Suspendisse elementum lectus justo, eget imperdiet odio venenatis lacinia. Praesent convallis lectus id nibh mattis sollicitudin. Sed sed est augue. Suspendisse potenti. Etiam efficitur, urna in tristique semper, felis risus pharetra nisi, malesuada tincidunt sem lacus quis velit. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `entregado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_libro`, `id_usuario`, `fecha_prestamo`, `fecha_limite`, `entregado`) VALUES
(2, 1, 3, '2018-02-07', '2018-02-28', 1),
(3, 2, 1, '2017-12-05', '2018-02-28', 1),
(5, 3, 1, '2018-02-12', '2018-02-28', 0),
(6, 4, 8, '2018-02-07', '2018-02-28', 0),
(7, 1, 1, '2018-02-21', '2018-03-14', 1),
(8, 1, 1, '2018-02-21', '2018-03-14', 1),
(9, 1, 1, '2018-02-21', '2018-03-14', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `edad` int(11) NOT NULL,
  `dni` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `edad`, `dni`, `fecha_nac`) VALUES
(1, 'jon', 'jauregi', 21, '12345678A', '1992-03-21'),
(2, 'jon imanol', 'pinto', 22, '12345677B', '1995-04-02'),
(3, 'mauricio', 'diaz', 19, '12345688C', '1997-03-31'),
(7, 'jon', 'artola', 20, '12345621D', '1997-11-16'),
(8, 'patxi', 'zubeldia', 29, '12345614E', '1999-12-31'),
(9, 'elene', 'mendizabal', 12, '12378945F', '2000-01-01'),
(10, 'patxi', 'jajaja', 73, '12345678Q', '1997-11-16'),
(12, 'maite', 'lizarralde', 60, '12311678A', '1983-12-31'),
(13, 'lur', 'goenaga', 12, '12121212E', '1923-10-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_usuario` (`id_usuario`) USING BTREE,
  ADD KEY `id_libro` (`id_libro`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
