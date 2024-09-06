-- 1. Obtener los títulos de libros con precios entre 200 y 250.
SELECT titulo FROM libros WHERE precio BETWEEN 200 AND 250;

-- 2. Obtener la cantidad total de libros.
SELECT COUNT(*) FROM libros;

-- 3. Obtener todos los datos de las editoriales de la ciudad 
-- de Guadalajara.
SELECT * FROM editoriales WHERE ciudad = "GDL";

-- 4. Obtener el título de todos los libros de tipo ‘Biología’,
-- ordenados por título.
SELECT titulo FROM libros WHERE tipo = "Biologia" ORDER BY titulo;

-- 5. Obtener el mínimo precio de los libros de tipo ‘Informática’.
SELECT MIN(precio) FROM libros WHERE tipo = "Informatica";

-- 6. Obtener todos los datos de los autores que viven en la ciudad de México,
-- ordenados por apellido en forma descendente.
SELECT * FROM autores WHERE ciudad = "MEX" ORDER BY aut_ape DESC;

-- 7. Obtener los teléfonos de los autores cuyo nombre empiece con M.
SELECT tel FROM autores WHERE aut_nom LIKE "M%";

-- 8. Obtener los nombres y apellidos de los autores que 
-- hayan publicado un libro de informática.
SELECT aut_nom, aut_ape FROM autores
INNER JOIN libro_autor
USING(aut_id)
INNER JOIN libros
USING(lib_id)
WHERE tipo = "informatica";

-- 9. Obtener los nombres y apellidos de los autores 
-- cuyo domicilio lleve algún 5 en el campo domicilio.
SELECT aut_nom, aut_ape FROM autores WHERE domicilio LIKE "%5%";

-- 10.Obtener los títulos de los libros cuyo precio 
-- sea mayor que el promedio de los anticipos.
SELECT titulo FROM libros 
WHERE precio > (SELECT AVG(anticipo) FROM libros);

-- ==========================================================

-- 1. Listar las descripciones de las plantas y el total de empleados para
-- aquellas plantas que tienen más de 10 empleados trabajando actualmente.
SELECT planta.idplanta, planta.descripcion, COUNT(idempleado)
FROM planta
INNER JOIN trabaja
USING(idplanta)
GROUP BY(idplanta)
HAVING COUNT(idempleado) > 10;

-- 2. Listar las descripciones de las plantas donde el empleado “Juan Pérez”
-- esté en condiciones de realizar alguna función.
SELECT planta.descripcion
FROM empleado
INNER JOIN empleado_funcion
USING(idempleado)
INNER JOIN organizacion
USING(idfuncion)
INNER JOIN planta
USING(idplanta)
WHERE nombre = "Juan Perez";

-- 3. Listar los nombres de los empleados y la descripción de la función que
-- realizan la misma función que la que realiza el empleado con nombre
-- “Esmeralda Garcia”.
SELECT nombre, descripcion
FROM empleado
INNER JOIN empleado_funcion
USING(idempleado)
INNER JOIN funcion
USING(idfuncion)
WHERE idfuncion = 
	(SELECT idfuncion FROM empleado
    INNER JOIN empleado_funcion
    USING(idempleado)
    WHERE nombre = "Esmeralda Garcia");
    
-- 4. Listar la descripción de la planta y la cantidad de empleados que
-- trabajan actualmente para cada planta, ordenados por la cantidad de
-- empleados en forma descendente.
SELECT descripcion, COUNT(idempleado)
FROM trabaja
INNER JOIN planta
USING(idplanta)
WHERE fecha_hasta IS NOT NULL
GROUP BY (idplanta)
ORDER BY COUNT(idempleado) DESC;

-- 5. Listar los nombres de los empleados que tienen una antigüedad superior
-- a la antigüedad promedio de los empleados de la localidad de
-- Guadalajara.
SELECT nombre
FROM empleado
WHERE antiguedad > 
(SELECT AVG(antiguedad) FROM empleado WHERE localidad = "Gudalajara");