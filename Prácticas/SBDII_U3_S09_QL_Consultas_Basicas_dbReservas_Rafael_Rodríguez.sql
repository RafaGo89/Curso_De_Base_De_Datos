-- Jueves 15 de febrero del 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #5 - Consultas Básicas dbReservas
-- Entrega en un script las 10 consultas del Esquema de Datos "dbReservas"

-- dbReservas
USE dbReservas;

-- 1. Obtener todos los datos de la tabla clientes.
SELECT * FROM clientes;

-- 2. Obtener todos los datos de la tabla reservas cuya fecha de
-- inicio de la reservación sea del mes de agosto.
SELECT * FROM reservas WHERE MONTH(fec_ini) = 8;

-- 3. Obtener todos los datos de los coches ordenados por el
-- precio de alquiler en forma ascendente.
SELECT * FROM coches ORDER BY precio_alquiler ASC;

-- 4. Obtener todos los datos de los coches ordenados por el
-- precio de alquiler en forma descendente.
SELECT * FROM coches ORDER BY precio_alquiler DESC;

-- 5. Obtener los nombres de los clientes cuyo nombre contenga
-- una G.
SELECT nomCli FROM clientes WHERE nomCli LIKE "%G%";

-- 6. Obtener en una sola columna la marca y modelo de los
-- coches, con alias.
SELECT CONCAT(marca, "-", modelo) as "Marca y modelo" FROM coches;

-- 7. Obtener matricula, modelo y color de los coches de color
-- negro.
SELECT matricula, modelo, color FROM coches WHERE color = "negro";

-- 8. Obtener los nombres de las agencias ordenados por
-- nombre en forma descendente.
SELECT nomAge FROM agencias ORDER BY nomAge DESC;

-- 9. Obtener las matrículas de los coches que terminen en 3.
SELECT matricula FROM coches WHERE matricula LIKE "%3";

-- 10. Obtener matrícula, modelo, marca y precio de alquiler de
-- los coches cuyo precio sea mayor de 500 ordenados por
-- precio.
SELECT matricula, modelo, marca, precio_alquiler FROM coches
	WHERE precio_alquiler > 500 
		ORDER BY precio_alquiler DESC;