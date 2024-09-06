/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana 6. Consultas MySQL
   Script 16.Consultas usando funciones de varias filas
             conocidas como funciones de agregación o 
             funciones de agrupación
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH     
*/
###############################################################
## CONSULTAS USANDO:
## FUNCIONES DE AGREGACIÓN o FUNCIONES DE AGRUPACIÓN o
## FUNCIONES DE VARIAS FILAS
###############################################################

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- 2. Consultar la suma de los salarios de los empleados. 
-- --------------------------------------------------
Select sum(salary) 
from employees; 

-- 3. Consultar la suma de los salarios de los empleados 
-- 		del departamento 50. 
-- --------------------------------------------------
Select sum(salary) 
from employees 
where department_id = 50;

-- 4. Contar los empleados existentes. 
-- --------------------------------------------------
Select count(*) 
from employees;

-- 5. Contar los empleados que tienen alguna comisión. 
-- --------------------------------------------------
Select count(commission_pct) 
from employees;

-- 6. Contar los empleados con puesto de empleado 
-- 		que contenga CLERK. 
-- --------------------------------------------------
Select count(*) as "Numero de Empleados con puesto Clerk"
from  employees 
where  job_id  like  "%CLERK%";

-- 7. Contar los diferentes departamentos 
-- 		en que trabajan los empleados. 
-- --------------------------------------------------
Select count(DISTINCT department_id) 
from employees;

-- 8. Consultar el salario máximo de los empleados. 
-- --------------------------------------------------
Select max(salary) 
from employees;

-- 9. Consultar la última fecha en que se contrató un empleado. 
-- --------------------------------------------------
Select max(hire_date) 
from employees;

-- 10. Consultar el apellido del empleado, 
-- 		que iría al final en orden alfabético. 
-- --------------------------------------------------
Select max(last_name) 
from employees;

-- 11. Consultar el salario mínimo de los empleados. 
-- --------------------------------------------------
Select min(salary) 
from employees;

-- 12. Consultar la fecha en que se contrató al primer empleado. 
-- --------------------------------------------------
Select min(hire_date) 
from employees;

-- 13. Consultar el nombre del empleado, 
-- 		que iría primero en orden alfabético. 
-- --------------------------------------------------
Select min(first_name) 
from employees;
	
-- 14. Consultar el promedio del salario de todos los empleados. 
-- --------------------------------------------------
Select avg(salary) 
from employees;

-- 15. Consultar la varianza de los salarios de los empleados. 
-- --------------------------------------------------
Select  variance(salary)  
from employees;

-- 16. Consultar la desviación estándar de los 
-- 		salarios de los empleados. 
-- --------------------------------------------------
Select  stddev(salary)  
from employees;

-- fin de archivo
