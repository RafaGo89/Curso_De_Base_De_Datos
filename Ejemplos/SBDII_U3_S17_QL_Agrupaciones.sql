/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana 6. Consultas MySQL
   Script 17.Consultas usando agrupaciones 
			 Cláusulas GROUP BY  ...  HAVING
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/
###############################################################
## CONSULTAS USANDO agrupaciones
## GROUP BY
## HAVING
###############################################################

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- 2. Consultar el promedio del salario de los empleados POR departamento. 
select  department_id, avg(salary)
from employees 
group by department_id
order by department_id ASC;

-- 3. Contar cuántos empleados tiene CADA jefe (manager_id). 
select manager_id, count(last_name) 
from employees 
group by manager_id
order by manager_id;

-- 4. Consultar el promedio del salario de los empleados 
-- 		para CADA puesto, de CADA departamento. 
select  department_id,  job_id,  avg(salary)  
from  employees
group by department_id,  job_id
order by department_id ASC;

-- 5. Consultar el promedio del salario de los empleados 
-- 		para CADA puesto, de CADA departamento 
-- 		con código de departamento mayor o igual que 80. 
select department_id, job_id, avg(salary) 
from employees
where department_id  >= 80 
group by department_id, job_id
order by department_id ASC;

-- =====================================
-- Restricción de Resultados de Grupo
-- Cláusula HAVING
-- =====================================

-- 6. Consultar el "máximo" salario de los empleados 
--  	AGRUPADOS POR departamento para aquellos departamentos 
-- 		con un "máximo" de salario mayor que 10000. 
select  department_id, max(salary) 
from employees 
group by department_id
having max(salary) > 10000
order by department_id ASC; 


-- 7. Consultar la "suma" de salarios de los empleados 
-- 		AGRUPADOS POR puesto para aquellos puestos 
-- 		con una "suma" de salario mayor que 12000. 
select  job_id, sum(salary) 
from employees 
group by job_id 
having  sum(salary) > 12000
order by sum(salary) ASC;

-- fin de archivo