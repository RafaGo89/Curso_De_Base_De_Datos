-- 1 Obtener el precio promedio de todos los artículos cuyo nombre de fabricante
-- inicie con una A. Usar alias.
SELECT AVG(precio) "Precio promedio"
FROM articulos, fabricantes
WHERE articulos.codFab =fabricantes.codFab
AND nombre LIKE "A%";

-- 2 Obtener el total de artículos cuyo precio esté entre los 80 y los 120 pesos
-- (ambas cantidades incluidas) de los fabricantes de la ciudad de Guadalajara.
-- Usar alias.
SELECT COUNT(*) as "Total de artículos con precio entre
80 y 210" 
FROM  articulos
INNER JOIN fabricantes
USING(codFab)
WHERE precio BETWEEN 80 AND 120
AND ciudad = "Guadalajara";

-- 3 Obtener la descripción y precio de los artículos cuyo precio sea menor o igual a
-- 100, ordenarlos descendentemente por precio, y luego ascendentemente por la
-- descripción de los artículos cuyos fabricantes sean de la ciudad de Saltillo.
SELECT descripcion, precio
FROM fabricantes 
INNER JOIN articulos
USING(CodFab)
WHERE precio <= 100 AND ciudad = "Saltillo"
ORDER BY precio DESC, descripcion ASC;

-- Obtener un listado completo de artículos, incluyendo por cada artículo los datos
-- de su fabricante (INNER JOIN).
SELECT *
FROM articulos
INNER JOIN fabricantes
USING(codFab);

-- 5 Obtener la descripción del artículo, su precio y el nombre de su fabricante,
-- incluyendo aquellos artículos que no tengan un fabricante registrado (RIGHT
-- OUTER JOIN).
SELECT descripcion, precio, nombre
FROM  fabricantes 
RIGHT JOIN articulos
USING(codFab);

-- 6 Obtener los datos de los fabricantes con los datos de los artículos que fabrican,
-- incluyendo aquellos fabricantes que no tienen artículos registrados (LEFT
-- OUTER JOIN).
SELECT * 
FROM fabricantes 
LEFT JOIN articulos
USING(codFab);

-- 7 Obtener el precio promedio de los productos de cada fabricante, mostrando el
-- nombre del fabricante
SELECT nombre, fabricantes.codFab, AVG(precio)
FROM articulos
INNER JOIN fabricantes
USING (codFab)
GROUP BY fabricantes.codFab;