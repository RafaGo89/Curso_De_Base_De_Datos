/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión  9. Consultas MySQL
   Script 25. Vistas
		      Tablas Virtuales
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- 2. Crear una vista (salesempl) con el apellido, 
-- 	nombre y código de los empleados del departamento de ventas
--  (department_id = 80) en orden alfabético por apellido y nombre.

CREATE OR REPLACE VIEW salesEmpl_vw 
AS 
SELECT department_id, last_name, first_name, employee_id 
FROM employees 
WHERE department_id = 80 
ORDER BY last_name, first_name;

-- 3. Mostrar las tablas (físicas y virtuales) de dbRH
show tables;

-- 4. Consultar la información de la vista salesEmpl.
SELECT  *  FROM  salesEmpl;

-- 5. Mostrar como fue creadas la vista salesEmpl.
SHOW CREATE VIEW salesEmpl;

####################################################
###	Modificación de Vistas
####################################################
-- 	Para modificar una vista se requiere que posea 
--  los permisos CREATE VIEW y DELETE para la vista, 
--  y algún privilegio en cada columna seleccionada 
--  por la sentencia SELECT.

-- 6. Modificar la vista (salesempl). Agregar el salario de los empleados.
ALTER VIEW salesEmpl_vw
	AS 
SELECT department_id, last_name, first_name, employee_id, salary
FROM employees 
WHERE department_id=80 
ORDER BY last_name, first_name;

CREATE OR REPLACE VIEW salesEmpl_vw
	AS 
SELECT department_id, last_name, first_name, employee_id, salary
FROM employees 
WHERE department_id =80 
ORDER BY last_name, first_name;

####################################################
###	Eliminación de Vistas
####################################################

-- 7. Eliminar la vista salesEmpl
DROP VIEW salesEmpl_vw;

-- fin de archivo