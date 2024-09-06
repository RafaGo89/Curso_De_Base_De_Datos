-- Jueves 21 de Marzo de 2024
-- Rafael Rodríguez Gómez
-- Actividad #9 - QL / VISTAS 
-- Elaborar un script con las 20 
-- consultas solicitadas en el archivo

-- Seleccionamos la base de datos dbReservas
use dbReservas;

-- 1. Consultar los registros de la tabla clientes
SELECT * FROM clientes;

-- 2. Consultar los registros de la 
-- tabla clientes ordenados al azar
SELECT * FROM clientes ORDER BY RAND();

-- 3. Consultar todos los datos de las reservaciones
SELECT * FROM reservas;

-- 4. Contar los registros de la tabla coches
SELECT COUNT(*) FROM coches;

-- 5. Contar los coches de color ROJO
SELECT COUNT(*) FROM coches WHERE color IN ("Rojo");

-- 6. Contar los coches de cada color
SELECT color, COUNT(*) FROM coches GROUP BY color;

-- 7. Consultar los datos de los 
-- coches ordenados por precio de alquiler
SELECT * FROM coches ORDER BY precio_alquiler ASC;

-- 8. Consultar los datos de los coches ordenados
-- por precio de alquiler descendente
SELECT * FROM coches ORDER BY precio_alquiler DESC;

-- 9. Consultar el precio de alquiler 
-- máximo de los coches
SELECT MAX(precio_alquiler) FROM coches;

-- 10. Consultar los datos de los coches 
-- cuyo precio de alquiler es igual al precio mínimo
SELECT * FROM coches WHERE precio_alquiler = 
(SELECT MIN(precio_alquiler) FROM coches);

-- 11. Consultar el precio promedio de 
-- alquiler de los coches
SELECT AVG(precio_alquiler) FROM coches;

-- 12. Consultar la marca y modelo 
-- de los coches en un único campo
SELECT CONCAT(marca, "-", modelo) AS "Marca y modelo"
FROM coches;

-- 13. Consultar con acople (reunión, combinación o junta o join).
-- Consultar las reservaciones de la Agencia AGE-01.
SELECT * FROM agencias
INNER JOIN reservas
USING(codage)
WHERE codage = "AGE-01";

-- 14. Consultar los coches que se alquilan 
-- al menor precio
SELECT * FROM coches 
WHERE precio_alquiler = 
(SELECT MIN(precio_alquiler) FROM coches);

-- 15. Consultar las reservaciones de la Agencia AGE-01
SELECT * FROM agencias
INNER JOIN reservas
USING(codage)
WHERE codage = "AGE-01";

-- 16. Una vista que permita consultar 
-- las reservaciones con los datos de los
-- clientes (join forma implícita-where).
CREATE VIEW clientes_reservas_vw AS
SELECT clientes.*, reservas.codAge, reservas.codRes,
reservas.fec_fin, reservas.fec_ini, reservas.indicador, reservas.pag_total
FROM clientes, reservas
WHERE clientes.codCli = reservas.codCli;

-- 17. Una vista que permita consultar las reservaciones 
-- con los datos de los clientes (inner join).
CREATE VIEW clientes_reservas2_vw AS
SELECT * FROM reservas
INNER JOIN clientes
USING(codCli);

-- 18. Una vista que permita consultar a los clientes 
-- que tienen reservaciones. Incluir todas las 
-- reservaciones aunque no tengan registrado un 
-- cliente (left outer join).
CREATE VIEW clientes_con_reservas_vw AS
SELECT * FROM reservas
LEFT JOIN clientes
USING(codCli);

-- 19. Una vista que permita consultar los datos de los clientes y sus
-- reservaciones. Incluir todos los clientes aunque no tengan registrada una
-- reservación (right outer join).
CREATE VIEW clientes_con_reservas2_vw AS
SELECT * FROM reservas
RIGHT JOIN clientes
USING(codCli);

-- 20. Una vista que permita consultar el número de 
-- coches que tiene cada garaje (group by).
CREATE VIEW coches_por_garaje_vw AS
SELECT garaje, COUNT(*)
FROM coches
GROUP BY garaje;