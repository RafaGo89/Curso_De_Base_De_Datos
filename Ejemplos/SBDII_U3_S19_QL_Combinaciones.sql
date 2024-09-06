/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana  7. Consultas MySQL
   Script 19. Consultas usando combinaciones (joins)
			  Cláusulas INNER JOIN - LEFT JOIN - RIGHT JOIN
                         NATURAL JOIN - CROSS JOIN
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/
###############################################################
## CONSULTAS USANDO combinaciones
## JOINS
###############################################################

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- =====================================
-- INNER JOIN Implícito
-- =====================================

-- 2. Consultar los países y sus continentes asignados (forma implícita).
SELECT * 
FROM countries, regions 
WHERE countries.region_id = regions.region_id;

-- 3. Consultar los países y sus continentes asignados (forma explícita).
SELECT countries.country_name, regions.region_name 
FROM countries-- (se inicia con countries porque es la tabla secundaria)
JOIN regions 
ON countries.region_id = regions.region_id;

-- =====================================
-- INNER JOIN Explícito
-- =====================================
-- 4. Consultar los países y sus continentes asignados (forma explícita).
SELECT * 
FROM countries 
INNER JOIN regions 
ON countries.region_id = regions.region_id;

-- 5. Consultar los países y sus continentes asignados (forma explícita).
SELECT * 
FROM countries 
INNER JOIN regions 
USING(region_id);

-- =====================================
-- THETA JOIN 
-- =====================================
-- 6. Consultar los países (countries) para los que el código del continente (regions) asignado sea menor.
SELECT * 
FROM countries, regions 
WHERE countries.region_id <  regions.region_id;

/* Las operaciones INNER-JOIN pueden ser clasificadas como:
	a. De equivalencia (equi-join)
	b. Naturales (natural join)
	c. Cruzadas (cross join)
*/
-- =====================================
-- EQUI-JOIN 
-- =====================================
-- 7. Consultar los países y sus continentes asignados (forma explícita).
SELECT * 
FROM countries 
INNER JOIN regions 
ON countries.region_id = regions.region_id;

-- =====================================
-- NATURAL JOIN 
-- =====================================
-- 8. Consultar los continentes (regions) con los datos de sus países (countries).
SELECT * 
FROM countries 
NATURAL JOIN regions;

-- =====================================
-- CROSS JOIN 
-- =====================================
-- 9. Consultar los continentes (regions) en combinación cruzada con los países (countries), de forma explícita.
SELECT * 
FROM regions 
CROSS JOIN countries;

-- 10. Consultar los continentes (regions) en combinación cruzada con los países (countries), de forma implícita.
SELECT * 
FROM regions, countries;

-- =====================================
-- SELF JOIN 
-- =====================================
-- 11. Consultar código y nombre de los empleados (employees) y 
-- 		los códigos y nombres de los jefes de los empleados (employees).
SELECT emp.employee_id as "Id del empleado", emp.first_name as Empleado, 
	   "Tiene como jefe a " as "",
       jef.employee_id as "Id del jefe", jef.first_name as Jefe
FROM employees as jef, employees as emp  
WHERE jef.employee_id = emp.manager_id;

-- =====================================
-- LEFT OUTER JOIN
-- =====================================
-- 12. Consultar los continentes (regions) 
-- 		aunque no tengan países (countries).
SELECT * 
FROM regions 
LEFT JOIN countries 
ON regions.region_id = countries.region_id;

SELECT * 
FROM regions 
LEFT OUTER JOIN countries 
ON regions.region_id = countries.region_id;

-- =====================================
-- RIGHT OUTER JOIN
-- =====================================
-- 13. Consultar todos los continentes (regions) 
-- 		aunque no tengan países (countries).
SELECT * 
FROM countries 
RIGHT JOIN regions 
ON countries.region_id = regions.region_id;

SELECT * 
FROM countries 
RIGHT OUTER JOIN regions 
ON countries.region_id = regions.region_id;

-- =====================================
-- CLAÚSULA LIMIT
-- =====================================
-- 14. Consultar todos los países (countries) 
-- 		con los datos del continente al que pertenecen (regions).
SELECT * 
FROM regions  
JOIN countries 
ON regions.region_id = countries.region_id;

SELECT * 
FROM regions  
JOIN countries 
ON regions.region_id = countries.region_id
LIMIT 2;

-- =====================================
-- COMBINACIÓN DE VARIAS TABLAS
-- =====================================
-- 15. Consultar todos los domicilios, 
-- 		el nombre del país y el nombre del continente donde se localizan.
SELECT street_address, country_name, region_name 
FROM locations 
JOIN countries 
    ON locations.country_id = countries.country_id 
JOIN regions 
   ON countries.region_id = regions.region_id;
select * from locations;
-- =====================================
-- EJERCICIO EN CLASE
-- =====================================
-- 16. Consultar nombre y apellido de los empleados, 
-- 		el nombre del departamento al que pertenecen, la ciudad, 
-- 		así como el nombre del país y el nombre del continente, 
-- 		ordenados por apellido y nombre.
SELECT first_name, last_name, department_name, city,
	   country_name, region_name
FROM employees
INNER JOIN departments USING(department_id)
INNER JOIN locations USING(location_id)
INNER JOIN countries USING(country_id)
INNER JOIN regions USING(region_id)
ORDER BY last_name ASC, first_name ASC;

-- fin de archivo