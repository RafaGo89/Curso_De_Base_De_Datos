/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión 13. Desencadenadores MySQL
   Script 38. Desencadenadores, Disparadores, Triggers
    Profesor. Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/

###############################################################
## Desencadenadores, Disparadores, Triggers
###############################################################

-- Abrir la base de datos 
use dbrh;

-- Mostrar los disparadores 
SHOW TRIGGERS;

-- Mostrar los disparadores 
SELECT * FROM INFORMATION_SCHEMA.TRIGGERS ;

-- ========================================================
-- 1) DESENCADENADOR DE INSERCIÓN (INSERT) 
-- Implementar un trigger que deberá activarse antes de 
-- realizar una inserción en la tabla de empleados (employees).
-- El desencadenador deberá calcular el contenido del campo email. 
-- ========================================================
-- Abrir la base de datos 
use dbrh;

-- Cambiar el delimitador de instrucción 
DELIMITER // 

-- Crear el trigger INSERT
CREATE TRIGGER BIemployees 
	BEFORE INSERT ON employees 
	FOR EACH ROW 
BEGIN  
	SET new.email = CONCAT(Left(NEW.first_name,1),UPPER(NEW.last_name));  
END // 

-- Cambiar el delimitador de instrucción 
DELIMITER ;

-- Agregar un nuevo registro a la tabla empleados
insert into 
	employees(employee_id, first_name, last_name, email, hire_date,job_id)
	values (777, "Marina", "Mendez", "", "2021/11/12", "AD_VP");

-- ========================================================
-- 2) DESENCADENADOR DE ACTUALIZACIÓN (UPDATE) 
-- Implementar un trigger que deberá activarse antes de realizar 
-- una actualización en la tabla de empleados (employees). 
-- El desencadenador deberá calcular y actualizar la 
-- antigüedad del empleado (years_job) basado en el campo hire_date.
-- ========================================================

-- Abrir la base de datos 
USE  dbRH;  

-- Consultar Antigüedad de los empleados
select employee_id, first_name, last_name, email, 
	   hire_date, job_id, years_job 
from employees;

-- Modificar los años de antigüedad de los empleados, ponerlos en 0.
update employees
   set years_job = 0;

-- Cambiar el delimitador de instrucción 
delimiter  //

-- Crear el trigger UPDATE
CREATE TRIGGER BUemployees
	BEFORE UPDATE ON EMPLOYEES
	FOR EACH ROW 
BEGIN
	SET new.years_job = ( YEAR(CURDATE( )) - YEAR(NEW.HIRE_DATE) ) 
		- IF( RIGHT(CURDATE( ) , 5) < RIGHT(new.HIRE_DATE , 5), 1, 0);
END //

-- Cambiar el delimitador de instrucción 
delimiter ;

-- Mostrar los disparadores 
show triggers;

-- Consultar Antigüedad de los empleados
select employee_id, first_name, last_name, 
	hire_date, job_id, years_job 
from employees;

-- Modificar los años de antigüedad de los empleados, "ponerlos en 0".
update  employees  
   set  years_job = 0;

-- Consultar Antigüedad de los empleados
select employee_id, first_name, last_name, 
	hire_date, job_id, years_job 
from employees;

-- ========================================================
-- 3) DESENCADENADOR DE BORRADO (DELETE)
-- Implementar un trigger que deberá activarse antes de 
-- realizar una eliminación un registro en la tabla 
-- departamentos (departments). El desencadenador deberá 
-- eliminar todos los registros de la tabla de empleados 
-- (employees) cuyo campo department_id coincida con 
-- el que se está eliminando en la tabla departamentos 
-- (departments).  
-- ========================================================

-- Abrir la base de datos 
USE  dbRH;  

-- Agregar un nuevo Departamento 9
INSERT INTO 
	departments(department_id, department_name, manager_id, location_id) 
	VALUES (9, 'Nuevo Departamento', '202', '1400');

-- Agregar dos empleados al Departamento 9
insert into 
	employees (department_id, employee_id, hire_date, first_name, last_name, job_id) 
    values ( 9,  44, '2021-11-08', 'Juan', 'Perez', 'AD_VT');

insert into 
	employees (department_id, employee_id, hire_date, first_name, last_name, job_id) 
	values ( 9,  55, '2021-11-08', 'Maria', 'Lopez', 'AD_VT');

-- Cambiar el delimitador de instrucción 
delimiter //

-- Crear el trigger
create trigger BDdepartments
	before delete on departments 
	for each row 
begin 
	delete from employees 
	where department_id = old.department_id;  
end //

-- Cambiar el delimitador de instrucción 
delimiter ;

-- ========================================================
-- 4) Mostrar los disparadores 
-- ========================================================
show triggers;

-- Mostrar los disparadores de la base de datos dbrh
SHOW TRIGGERS FROM dbRH;

-- Mostrar los disparadores de la base de datos dbrh
-- de la tabla empleados
SELECT * 
FROM information_schema.triggers
WHERE trigger_schema = 'dbrh'
  AND event_object_table = 'employees';

-- ========================================================
-- 5) Mostrar como fue creado un trigger
-- ========================================================
show create trigger BDdepartments;

-- Consultar la tabla departamentos
select * 
from departments;

-- Consultar la tabla empleados
select * 
from employees;

-- Eliminar el departamento con id igual a 9
delete from departments 
where department_id = 9;

-- Consultar la tabla departamentos
select * 
from departments;

-- Consultar la tabla empleados
select * 
from employees; 

-- ========================================================
-- 6) Eliminar un trigger
-- ========================================================

-- Eliminar el trigger
DROP TRIGGER  employees.BDdepartments;

-- ========================================================
-- 7) Modificar un trigger.
-- No existe una sentencia MySQL (ALTER TRIGGER) 
-- para modificar un desencadenador por el momento. 
-- ========================================================

-- ========================================================
-- 8) Habilitar / Deshabilitar un trigger.
-- La activación y desactivación de desencadenadores se 
-- debe considerar en el desarrollo futuro de MySQL.
-- ========================================================

-- Fin de Archivo