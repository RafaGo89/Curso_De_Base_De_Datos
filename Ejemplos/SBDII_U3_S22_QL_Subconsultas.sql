/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión  8 - Consultas MySQL
   Script 22 - Consultas usando subconsultas o
			   Consultas anidadas
   Profesor  : Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/
###############################################################
## CONSULTAS USANDO subconsultas
## Consultas ANIDADAS
###############################################################

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- ========================================================
-- Subconsultas de una sola fila o Subconsultas Escalonadas
-- ========================================================

-- 2. Consultar apellido y salario de todos los empleados
-- 		 que ganan más que el salario del empleado 
-- 		 con apellido Abel.
SELECT last_name, salary 
FROM employees 
WHERE salary > (SELECT salary 
				FROM employees 
                WHERE last_name='Abel')
ORDER BY 2;

-- 3. Consultar apellido y código de puesto de todos los empleados cuyo código de puesto 
-- 		sea el mismo que el código de puesto del empleado con código de empleado 141
SELECT last_name, job_id, employee_id 
FROM employees 
WHERE job_id = (SELECT job_id
				FROM employees 
				WHERE employee_id=141)
AND employee_id != 141;

-- 4. Consultar apellido, salario y código de puesto de todos los empleados
-- 		con el mismo puesto que el del empleado con apellido Taylor, 
-- 		pero que ganen más que el mismo empleado Taylor.
SELECT last_name, salary, job_id  
FROM employees 
WHERE job_id = (SELECT job_id
				FROM employees 
				WHERE last_name = 'Taylor')
AND salary > (SELECT salary
				FROM employees 
				WHERE last_name = 'Taylor');


-- 5. Consultar apellido y salario de todos los empleados 
-- 		con un salario igual al salario mínimo de los empleados, 
-- 		es decir, los que ganan el mínimo.
SELECT last_name, salary 
FROM employees 
WHERE salary = (SELECT MIN(salary)
				FROM employees);

-- 6. Consultar todos los departamentos con un salario mínimo 
-- 		mayor que el salario mínimo del departamento con código 10.
SELECT department_id, MIN(salary)
FROM employees 
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
						FROM employees
						WHERE department_id = 10)
ORDER BY 1;

-- ========================================================
-- Subconsultas de varias filas o subsconsultas de lista
-- ========================================================

-- 7. Consultar apellido, salario y código de departamento
-- 		de los empleados que ganan el mismo salario 
-- 		que el salario mínimo de algún departamento.
SELECT last_name, salary, department_id
FROM employees 
WHERE salary IN (SELECT MIN(salary)
				 FROM employees
                 GROUP BY department_id);

-- 8. Consultar los empleados que NO son programadores de IT
-- 		 y cuyo salario es menor al salario de cualquier programador de IT.
SELECT last_name, salary, department_id, job_id 
FROM employees 
WHERE salary < ANY (SELECT salary
					FROM employees
                    WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG';

-- 9. Consultar los empleados cuyo salario es inferior al salario 
-- 		de todos los empleados con un puesto de IT_PROG 
-- 		y cuyo trabajo no es IT_PROG.
SELECT last_name, salary, job_id
FROM employees 
WHERE salary < ALL (SELECT salary
					FROM employees
                    WHERE job_id = 'IT_PROG')
AND job_id != 'IT_PROG';

-- ========================================================
-- Subconsultas CORRELACIONADAS
-- ========================================================

-- 10. Consultar los departamentos que NO tienen empleados.
SELECT  *
FROM departments 
WHERE NOT EXISTS (SELECT *
					FROM employees
					WHERE employees.department_id = departments.department_id);

-- Valores Nulos en una Subconsulta

-- 11. Consultar todos los empleados que NO tienen un subordinado.
SELECT emp.last_name 
FROM employees emp 
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id 
								FROM employees mgr);

SELECT emp.last_name, emp.employee_id  
FROM employees emp 
WHERE emp.employee_id NOT IN (SELECT mgr.manager_id 
								FROM employees mgr 
								WHERE manager_id IS NOT NULL);

-- 12. Consultar  apellido de los empleados que tienen subordinados.
SELECT emp.last_name, emp. employee_id  
FROM employees emp 
WHERE emp.employee_id IN (SELECT mgr.manager_id 
							FROM employees mgr
                            where manager_id is not null)
order by 2;
  
-- fin de archivo