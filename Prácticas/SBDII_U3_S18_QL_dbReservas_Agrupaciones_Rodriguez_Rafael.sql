-- Viernes 23 de Febrero de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #6 - Agrupaciones
-- Elabora un script con las 10 consultas del Esquema 
-- de Datos "dbReservas" solicitadas en el archivo

-- Seleccionamos la base de datos dbReservas
use dbReservas;

-- 1. Consultar cuántos coches hay de color rojo o con matrícula
-- cuya terminación en 3.
SELECT count(*) AS "Coches rojos o terminación matricula 3" 
FROM coches WHERE color = "Rojo" OR matricula LIKE "%3";

-- 2. Consultar el precio de alquiler mínimo de los coches, de
-- cada color.
SELECT color, MIN(precio_alquiler) AS "Precio minimo"
FROM coches GROUP BY color;

-- 3. Contar el número de coches que hay asignados a cada
-- garaje.
SELECT garaje, COUNT(*) AS "Total de coches por garaje"
FROM coches GROUP BY garaje;

-- 4. Sumar los litros de gasolina de los coches del garaje B.
SELECT SUM(l_gasolina) FROM coches WHERE garaje = "B";

-- 5. Consultar el precio máximo, el precio mínimo y el promedio
-- de alquiler de los coches, usar alias en las columnas.
SELECT MAX(precio_alquiler) AS "Precio máximo del alquiler", 
MIN(precio_alquiler) AS "Precio mínimo del alquiler", 
AVG(precio_alquiler) AS "Precio medio del alquiler"
FROM coches;

-- 6. Contar el número de clientes cuyo nombre tenga una f.
SELECT COUNT(*) FROM clientes WHERE nomCli LIKE "%f%";

-- 7. Contar cuántos clientes no tienen aval.
SELECT COUNT(*) AS "Cliente sin aval" FROM clientes WHERE codAval IS NULL;

-- 8. Contar el número de clientes que tiene cada aval (tabla
-- clientes).
SELECT codAval, COUNT(codCli) AS "Clientes por aval" FROM clientes GROUP BY codAval;

-- 9. Contar cuántas reservaciones se hicieron en el mes de
-- agosto y se deben entregar en el mes de septiembre.
SELECT COUNT(*) 
FROM reservas 
WHERE MONTH(fec_ini) = 8 AND MONTH(fec_fin) = 9;

-- 10. Obtener la suma de los pagos totales de las
-- reservaciones de cada cliente.
SELECT codCli, SUM(pag_total) AS "Pago total por cliente"
FROM reservas GROUP BY codCli;