/* Sistemas de Bases de Datos II
   Semana 4. Consultas Básicas MySQL
   Script 7 - Sentencia Select básica  
   Profesor: Irma Rebeca Andalón García
   -----------------------------------------------
   ESQUEMA #4 - dbRH   
*/

###############################################################
#  1. Selección de todas las columnas.
#  2. Selección de columnas concretas.
#  3. Uso de operadores aritméticos.
#  4. Uso de valores NULL.
#  5. Uso de alias de columna.
#  6. Concatenación de campos.
#  7. Eliminación de filas duplicadas.
#  8. Cláusula WHERE.
#  9. Condiciones de comparación.
# 10. Condiciones lógicas.
# 11. Cláusula ORDER BY.
# 12. Variables de sustitución.
###############################################################

-- ==================================================
-- Base de datos dbRH
-- ==================================================

-- 1. Lista las bases de datos
show databases;

-- 2. Abrir o Usar la base de datos
use  dbRH;

-- 3. Mostrar las tablas de la base de datos
show tables;

-- ==================================================
-- Selección de todas las columnas
-- ==================================================

-- 4. Consultar la estructura de la tabla empleados
describe countries;

-- 5. Consultar todos los datos de la tabla empleados
select * 
from countries;

-- 6. Consultar la estructura de la tabla empleados
describe departments;

-- 7. Consultar todos los datos de la tabla empleados
select * 
from departments;

-- 8. Consultar la estructura de la tabla empleados
describe employees;

-- 9. Consultar todos los datos de la tabla empleados
select * 
from employees;

-- 10. Consultar la estructura de la tabla empleados
describe job_history;

-- 11. Consultar todos los datos de la tabla empleados
select * 
from job_history;

-- 12. Consultar la estructura de la tabla empleados
describe jobs;

-- 13. Consultar todos los datos de la tabla empleados
select * 
from jobs;

-- 14. Consultar la estructura de la tabla empleados
describe locations;

-- 15. Consultar todos los datos de la tabla empleados
select * 
from locations;

-- 16. Consultar la estructura de la tabla empleados
describe regions;

-- 17. Consultar todos los datos de la tabla empleados
select * 
from regions;

-- ==================================================
-- Selección de columnas concretas
-- ==================================================

-- 18. Consultar nombre, apellido y fecha de contratación 
--     de todos los empleados
select first_name, last_name, hire_date  
from  employees;

-- ==================================================
-- Uso de operadores aritméticos
-- ==================================================

-- 19. Consultar nombre y salario anual de todos los empleados
select first_name, salary*12 
from employees;

-- 20. Consultar apellido y el salario incrementado en 500, 
--    de todos los empleados
select last_name, salary+500 
from employees;

-- ==================================================
-- Manipulación de Nulos
-- ==================================================

-- 21. Consultar la comisión de todos los empleados
select  commission_pct  
from  employees;

-- 22. Consultar el nombre y la comisión anual 
--     de todos los empleados
select first_name, (12 * salary * commission_pct) 
from employees;

-- ==================================================
-- Usar alias en los nombres de columnas
-- ==================================================

-- 23. Consultar el nombre y la comisión anual 
--     de todos los empleados
select first_name, commission_pct 
from employees;

-- 24. Consultar el nombre y la comisión anual 
--     de todos los empleados, renombrando las columnas
select first_name Nombre, 
	   commission_pct "Porcentaje de Comisión"
from employees;

-- 25. Consultar el apellido, nombre, código de puesto,
--     porcentaje de comisión, salario y salario más comisión 
--     de todos los empleados, renombrando las columnas
select last_name Apellido, 
       first_name as "Nombre del Empleado", 
       job_id as "Puesto", 
       commission_pct "Porcentaje de comision", 
       salary "Salario Mensual", 
       salary+(commission_pct*salary) as "Salario Integrado" 
from employees;

-- ==================================================
-- Concatenación de varios campos
-- ==================================================

-- 26. Consultar el nombre y el apellido de todos los empleados, 
--     en una sola columna con alias
select concat(first_name,' ',last_name) as 'Nombre de Empleado' 
from employees;

-- 27. Consultar el apellido y el código de puesto 
--     de todos los empleados, en una sola columna con alias
select concat(last_name,' es ',job_id) as "Puestos del Empleado" 
from employees;

-- 28. Consultar el apellido y el salario de todos los empleados, 
--     en una sola columna con alias
select concat(last_name," : salario anual ", salary*12) 
       as "Salario Anual del Empleado" 
from employees;

-- ==================================================
-- Eliminación de filas duplicadas 
-- ==================================================

-- 29. Consultar el código del Departamento de todos los empleados
select department_id 
from employees;

-- 30. Consultar el código del Departamento de todos los empleados 
--     SIN Duplicados
select DISTINCT department_id  
from employees;

-- ==================================================
-- Cláusula where 
-- ==================================================

-- 31. Consultar los datos de todos los empleados del Departamento 90
select *   
from employees  
where department_id=90;

-- 32. Consultar código de empleado, apellido, código de puesto 
--     y código de departamento
--     de todos los empleados del Departamento 90 (campo numérico)
select employee_id, last_name, job_id, department_id 
from employees 
where department_id=90;

-- 33. Consultar apellido, código de puesto y código de departamento 
--     de todos los empleados con apellido Whalen (campo cadena)
select last_name, job_id, department_id 
from employees 
where last_name="Whalen";

-- 34. Consultar apellido, código de puesto, código de departamento y 
--     fecha de contratación de todos los empleados contratados 
--     el 21/09/1989 (campo fecha)
select last_name, job_id, department_id, hire_date 
from employees  
where hire_date="1989-09-21";

-- ==================================================
-- Condiciones de comparación (OPERADORES)
-- ==================================================

-- 35. Consultar apellido, código de puesto y salario
--     de todos los empleados con un salario menor o igual a 3000
-- OPERADORES RELACIONALES: <=, <, >=, >, <>, !=, =
select last_name, job_id, salary 
from employees 
where salary <= 3000;          

-- 36. Consultar apellido, código de puesto y salario de todos los empleados
--     con un salario entre 2500 y 3500, incluidos (campo numérico)
-- Operador between
select last_name,  job_id, salary 
from employees 
where salary BETWEEN 2500 and 3500;

select last_name,  job_id, salary 
from employees 
where salary>=2500 and salary<=3500;

-- 37. Consultar apellido y salario de todos los empleados 
--     cuyo apellido esté entre King y Smith, incluidos (campo cadena)
-- Operador BETWEEN
select last_name, salary 
from employees 
where last_name BETWEEN "King" and "Smith";

select last_name, salary 
from employees 
where last_name>="King" and last_name<="Smith";

-- 38. Consultar apellido y salario de todos los empleados 
--     cuyo apellido sea King o Smith
-- Operador IN
select last_name, salary 
from employees 
where last_name IN ("King", "Smith");

select last_name, salary 
from employees 
where last_name="King" or last_name="Smith";

select last_name, salary, hire_date
from employees
where hire_date between "1989-01-01" and "1993-12-31";

-- 39. Consultar código de empleado, apellido y código del jefe  
--     de todos los empleados cuyo jefe tenga el código 100, 101 o 201
-- Operador IN
select employee_id, last_name, manager_id 
from employees 
where manager_id IN (100,101,201);

select employee_id, last_name, manager_id 
from employees 
where manager_id=100 or manager_id=101 or manager_id=201;

-- 40. Consultar nombre y apellido de todos los empleados 
--     cuyo apellido inicie con una W 
--     (comodín % - cualquier número de carácteres)
-- Operador LIKE
select first_name, last_name  
from employees  
where last_name LIKE "W%";

-- 41. Consultar nombre y apellido de todos los empleados 
--     cuyo apellido inicie con una H y tenga una longitud de 6 
--     (comodín _ un único carácter)
-- Operador LIKE
select first_name, last_name  
from employees  
where last_name LIKE "H_____";

-- 42. Consultar nombre y código del jefe de todos los empleados 
--     que no tienen jefe
-- Operador IS 
select first_name, manager_id  
from employees  
where manager_id is NULL;

-- 43. Consultar nombre y comisión de todos los empleados 
--     que no tienen comisión
-- Operador IS 
select first_name, commission_pct  
from employees 
where commission_pct is not NULL; 

-- ==================================================
-- Condiciones lógicas
-- ==================================================

-- 44. Consultar nombre, apellido, código de puesto y salario 
--     de todos los empleados cuyo salario sea mayor o igual a 10000
--     y su código de puesto contenga la cadena MAN
-- Operador AND (conjunción) 
select first_name, last_name, job_id, salary  
from employees  		
where salary>=10000 
  AND job_id LIKE '%MAN%' ;

-- 45. Consultar nombre, apellido, código de puesto y salario 
--     de todos los empleados cuyo salario sea mayor o igual a 10000
--     o su código de puesto contenga la cadena MAN
-- Operador OR (disyunción) 
select first_name, last_name, job_id, salary  
from employees  	
where salary >= 10000 
OR job_id like '%MAN%' ;

-- 46. Consultar nombre, apellido, código de puesto y salario 
--     de todos los empleados cuyo código de puesto sea diferente 
--     al de programador IT_PROG
-- Operador NOT (negación) 
select first_name, last_name, job_id, salary  
from employees  	
where job_id not IN ('IT_PROG');

-- ==================================================
-- Cláusula Order by
-- ==================================================

-- 47. Consultar nombre, apellido, código de puesto, salario y 
--     fecha de contratación de todos los empleados ordenados 
--     en forma ascendente por fecha de contratación
select first_name, last_name, job_id, salary, hire_date  
from employees 
order by hire_date;

-- 48. Consultar nombre, apellido, código de puesto, salario y 
--     fecha de contratación de todos los empleados ordenados 
--     en forma ascendente por fecha de contratación
select first_name, last_name, job_id, salary, hire_date
from employees 
order by hire_date ASC;

-- 49. Consultar nombre, apellido, código de puesto, salario y 
--     fecha de contratación de todos los empleados ordenados 
--     en forma descendente por fecha de contratación
select first_name, last_name, job_id, salary, hire_date
from employees 
order by hire_date DESC;
      
-- ==================================================
-- Variables de sustitución
-- ==================================================

-- 50. Crear una variable de sustitución
--     SET para asignación 
set @empleado = 202;

-- 51. Consultar nombre, apellido, código de empleado y salario
--     de todos los empleados cuyo código de empleado sea igual a la 
--     variable @empleado 
select first_name, last_name, employee_id, salary  
from employees 
where employee_id = @empleado;

-- fin de archivo