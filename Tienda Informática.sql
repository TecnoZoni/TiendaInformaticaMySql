CREATE TABLE `fabricantes` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `fabricantes` (`codigo`, `nombre`, `direccion`) VALUES
(1, 'Samsung', 'Belvert 123'),
(2, 'Motorola', 'Juan Castle 321'),
(3, 'LG', 'marcelo 231');

CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` double NOT NULL,
  `fk_fabricante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `productos` (`codigo`, `nombre`, `precio`, `fk_fabricante`) VALUES
(1, 'Samsung A23 ', 3000, 1),
(2, 'Samsung A30', 27000, 1),
(3, 'Motorola G8', 15000, 2),
(4, 'LG K40', 12000, 3),
(5, 'Samsung A50', 30000, 1),
(6, 'Motorola G9', 2000, 2),
(7, 'LG K50', 13000, 3),
(8, 'Samsung A70', 35000, 1),
(9, 'Motorola G10', 25000, 2),
(10, 'LG K60', 14000, 3),
(11, 'Samsung A90', 40000, 1);

ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`codigo`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_fabricante` (`fk_fabricante`);

ALTER TABLE `fabricantes`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `productos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `productos`
  ADD CONSTRAINT `fk_fabricante` FOREIGN KEY (`fk_fabricante`) REFERENCES `fabricantes` (`codigo`);
COMMIT;

SELECT * FROM `productos` ORDER BY(precio) ASC;

SELECT * FROM `fabricantes` ORDER BY(nombre) ASC;

SELECT `nombre`,`precio` FROM `productos` WHERE precio > 10000;

SELECT `nombre`,`precio` FROM `productos` WHERE precio = (SELECT MIN(`precio`) FROM `productos`);