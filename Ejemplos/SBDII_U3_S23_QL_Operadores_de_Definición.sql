/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión  8. Consultas MySQL
   Script 23. Consultas usando Operadores de Definición
			   UNION, INTERSECT, MINUS
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/
###############################################################
## CONSULTAS USANDO OPERADORES DE DEFINICIÓN
## Union, Intersect, Minus
###############################################################

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- ========================================================
-- UNION
-- ========================================================

-- 2. Consultar los nombres de los países (countries) 
-- 		junto con los nombres de los continentes (regions).
SELECT country_name 
FROM countries 
UNION 
SELECT region_name
FROM regions;

-- 3. Consultar los nombres de los países (countries) 
-- 		junto con los nombres de los continentes (regions) 
-- 		y junto con los salarios de los empleados (employees).

SELECT country_name 
	FROM countries 
	UNION 
SELECT region_name 
	FROM regions 
	UNION 
SELECT salary 
	FROM employees;

-- 4. Consultar los nombres de los países (countries) 
-- 		junto con los nombres de los continentes (regions) 
-- 		junto con los salarios de los empleados (employees) 
-- 		ordenados por el nombre del país.

SELECT country_name 
	FROM countries 
	UNION 
SELECT region_name 
	FROM regions 
	UNION ALL
SELECT salary 
	FROM employees
ORDER BY country_name;

-- ========================================================
-- INTERSECT
-- ========================================================

-- SQL SERVER
/* 	SELECT value 
		FROM table_a 
		INTERSECT 
	SELECT value 
		FROM table_b
*/

-- Alternativa del operador INTERSECT en MySQL
/* SELECT value 
FROM table_a 
WHERE (value) IN ( SELECT value 
					FROM table_b);
*/

-- 5. Consultar los empleados que han tenido varios puestos
-- 		en la empresa.
SELECT employee_id, first_name, last_name 
FROM employees 
WHERE employee_id IN (SELECT employee_id 
						FROM job_history);

-- ========================================================
-- MINUS
-- ========================================================

-- 6. Consultar los empleados que no han cambiado de puesto
-- 		ni una sola vez en la empresa.

-- SQL Server
/* SELECT employee_id 
FROM employees 
	MINUS 
SELECT employee_id 
FROM job_history
*/

-- Alternativa del operador MINUS en MySQL:
SELECT employee_id, first_name, last_name 
FROM employees 
WHERE employee_id NOT IN (SELECT employee_id 
							FROM job_history);

-- fin de archivo