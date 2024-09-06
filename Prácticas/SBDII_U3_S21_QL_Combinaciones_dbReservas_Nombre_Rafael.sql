-- Jueves 7 de Marzo de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #7 - Combinaciones
-- Elabora un script con las 5 
-- consultas del Esquema de Datos "dbReservas" solicitadas en el archivo

-- Seleccionamos la base de datos dbReservas
use dbReservas;

-- 1. Consultar las reservaciones incluyendo los datos del cliente de cada
-- reservación (inner join forma implícita-where)
SELECT * FROM reservas, clientes
where reservas.codCli = clientes.codCLi;

-- 2. Consultar las reservaciones incluyendo los datos completos del cliente
-- de cada reservación (inner join forma explícita)
SELECT * FROM reservas
INNER JOIN clientes
USING(codCli);

-- 3. Consultar los datos de los clientes incluyendo los datos de sus
-- reservaciones. Incluir todos los clientes tengan o no tengan registradas
-- reservaciones (outer join)
SELECT * FROM clientes
LEFT JOIN reservas
USING(codCLi);

-- 4. Consultar todas las reservaciones incluyendo los datos completos de
-- la agencia (natural join)
SELECT * FROM reservas
NATURAL JOIN agencias;

-- 5. Consultar código de la reservación, fecha de inicio y fecha de fin,
-- nombre del cliente y nombre de la agencia de las reservaciones cuyo
-- nombre del cliente contenga una ‘z’ (inner join)
SELECT codRes, fec_fin, fec_fin, nomCLi, nomAge
FROM agencias
INNER JOIN reservas
	USING(codAge)
INNER JOIN clientes
	USING(codCLi)
WHERE nomCli like "%z%";