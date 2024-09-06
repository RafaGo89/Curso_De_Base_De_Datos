-- Domingo 8 de marzo de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #8 - Subconsultas
-- Elabora un script con las 5 
-- consultas del Esquema de Datos "dbProyecto"

-- Seleccionamos la base de datos dbProyecto
use dbProyecto;

-- 1. Obtener todos los datos de los suministradores (tabla S)
-- situados en la misma ciudad que el número de
-- suministrador igual a ‘S1’. (SUBQUERY)
SELECT * FROM s 
WHERE sciudad = (SELECT sciudad FROM s WHERE sno = "S1");

-- 2. Obtener todos los datos de los suministradores (tabla S)
-- cuya situación sea menor que el valor máximo actual de
-- situación en la tabla S. (SUBQUERY)
SELECT * FROM s 
WHERE situacion < (SELECT MAX(situacion) FROM s);

-- 3. Obtener el nombre de los suministradores (tabla S) que no
-- suministran P2 (tabla SP). (SUBQUERY)
SELECT snombre FROM s 
WHERE sno NOT IN (SELECT sno FROM sp WHERE pno = "P2");

-- 4. Obtener el código del proyecto (jno) para los cuales el
-- suministrador S1 es el único suministrador (tabla SPJ).
-- (SUBQUERY)
SELECT jno FROM spj
WHERE sno = "S1"
AND jno NOT IN (SELECT jno FROM spj WHERE sno != "S1");

-- 5. Obtener el nombre de las piezas (tabla P) de color rojo con
-- un peso mayor que el peso mínimo de las piezas.
-- (SUBQUERY)
SELECT pnombre FROM p
WHERE peso > (SELECT MIN(peso) FROM p)
AND color = "Rojo";