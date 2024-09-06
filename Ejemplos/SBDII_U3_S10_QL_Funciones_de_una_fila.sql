/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana 5. Consultas MySQL
   Script 10 - Consultas usando funciones de una sola fila
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #4 - dbRH   
*/
###############################################################
## a) Funciones de una sola fila
## 		Estas funciones actúan sólo en filas únicas 
##		y devuelven un resultado por fila. 
## 		Aceptan uno o varios argumentos y devuelven un valor 
##  	para cada fila devuelta por la consulta.
## b) Un argumento puede ser uno de los siguientes elementos:
## 		Una constante
## 		Valor variable
## 		Nombre de columna
## 		Expresión
## c) Las funciones de una sola fila se pueden utilizar 
##    	en cláusulas SELECT, WHERE y ORDER BY; 
##		con posibilidad de anidamiento.
## d) Existen distintos tipos de funciones:
## 		Carácter
## 		Fecha
## 		Conversión
## 		General
## 		Número
###############################################################

-- ==================================================
-- Funciones de carácter. 
-- --------------------------------------------------
-- Aceptan la entrada de caracteres y 
-- pueden devolver valores de número y de carácter.
-- ==================================================

-- 1. Abrir o Usar la base de datos
-- --------------------------------------------------
use  dbRH;

-- 2. Consultar el apellido a mayúsculas de todos los empleados. 
-- --------------------------------------------------
Select upper(last_name), last_name 
	from employees;

Select ucase(last_name), last_name 
	from employees;

-- 3. Consultar el puesto en minúscula de todos los empleados. 
-- --------------------------------------------------
Select lower(job_id), job_id 
	from employees;

Select lcase(job_id), job_id 
	from employees;

-- 4. Consultar la longitud del nombre de todos los empleados. 
-- --------------------------------------------------
Select length(first_name), first_name 
	from employees;

Select bit_length(first_name), first_name 
	from employees;

Select char_length(first_name), first_name 
	from employees;

-- 5. Consultar la posición del carácter '_' en el puesto de todos los empleados. 
-- --------------------------------------------------
Select locate('a', job_id), job_id 
	from employees;

Select position('_' in job_id), job_id 
	from employees;

Select instr(job_id,'_'), job_id 
	from employees;

-- 6. Consultar los empleados con puesto SA_MAN, SA_REP. 
-- --------------------------------------------------
Select  find_in_set(job_id, 'SA_MAN,SA_REP'), job_id 
	from employees;

-- 7. Consultar los primeros 2 caracteres del puesto de todos los empleados. 
-- --------------------------------------------------
Select left(job_id,2), job_id 
	from employees;
    
Select job_id 
	from employees 
		where left(job_id,2) = 'ST';

-- 8. Consultar los últimos 3 caracteres del puesto de todos los empleados. 
-- --------------------------------------------------
Select right(job_id,3), job_id 
	from employees;
    
-- 9. Consultar del segundo al cuarto carácter del nombre de todos los empleados. 
-- --------------------------------------------------
Select mid(first_name,2,3), first_name 
	from employees;

Select substring(first_name,2,3), first_name 
	from employees;

Select substring(first_name from 2 for 3), first_name 
	from employees;

-- 10. Consultar los caracteres del puesto de todos 
-- 		los empleados a partir de la posición 4. 
-- --------------------------------------------------
Select substring(job_id,4), job_id 
	from employees;

-- 11. Consultar nombre y apellidos de todos los empleados 
-- 		colocando 2 espacios entre ellos. 
-- --------------------------------------------------
Select  concat(first_name, space(2), last_name ) 
	from employees;

-- 12. Consultar nombre de todos los empleados en triplicado. 
-- --------------------------------------------------
Select repeat(first_name,3) 
	from employees;

-- 13. Consultar nombre de todos los empleados. 
-- 		Colocar un largo de 9 caracteres, rellenar izquierda con _ 
-- --------------------------------------------------
Select  lpad(first_name,9,'_'), first_name
	from employees;

-- 14. Consultar nombre de todos los empleados. 
-- 		Colocar un largo de 9 caracteres, rellenar derecha con # 
-- --------------------------------------------------
Select rpad(first_name,9,'#') 
	from employees;

-- ==================================================
-- Funciones de fecha. 
-- --------------------------------------------------
-- Operan en valores de tipo DATE. 
-- Todas las funciones de fecha devuelven un valor 
-- 	de tipo de dato DATE o un número.
-- ==================================================

-- 15. Consultar el nombre del día de la fecha de contratación
-- 		de los empleados (dar formato a fecha). 
-- --------------------------------------------------
Select date_format(hire_date,'%a' ), first_name, hire_date 
	from employees;

-- 16. Consultar la fecha + 2 años en que fueron contratados los empleados.
-- --------------------------------------------------
Select date_add(hire_date,interval 30 day), hire_date 
	from employees;

-- 17. Consultar la fecha + 30 días en que fueron contratados los empleados.
-- --------------------------------------------------
Select  adddate(hire_date,30), hire_date 
	from employees;

-- 18. Consultar la diferencia en días entre la fecha actual 
--  	y la fecha de contratación de los empleados.
-- --------------------------------------------------
Select datediff(current_date, hire_date), hire_date, current_date 
	from employees;
    
select abs(datediff(current_date, '2024-09-12'));

-- 19. Consultar el número de día del mes en que 
-- 		fueron contratados los empleados.
-- --------------------------------------------------
Select day(hire_date), dayofmonth(hire_date), hire_date 
	from employees;

-- 20. Consultar el número del día de la semana en que 
-- 		fueron contratados los empleados.
-- --------------------------------------------------
Select dayofweek(hire_date), first_name, hire_date 
	from employees;

-- 21. Consultar el número de mes en que fueron contratados los empleados.
-- --------------------------------------------------
Select month(hire_date), hire_date 
	from employees;

-- 22. Consultar la semana del año en que fueron contratados los empleados.
-- --------------------------------------------------
Select weekofyear(hire_date), hire_date
	from employees;

-- 23. Consultar el número del cuarto del año en que fueron contratados los empleados.
-- --------------------------------------------------
Select quarter(hire_date), hire_date 
	from employees;

-- 24. Consultar el nombre del mes en que fueron contratados los empleados.
-- --------------------------------------------------
Select month(hire_date),monthname(hire_date), hire_date 
	from employees;

-- 25. Consultar el nombre del día en que fueron contratados los empleados.
-- --------------------------------------------------
Select dayname(hire_date), hire_date 
	from employees;

-- 26. Consultar el día del año en que fueron contratados los empleados.
-- --------------------------------------------------
Select dayofyear(hire_date), hire_date 
	from employees order by 1; 

-- 27. Consultar el año en que fueron contratados los empleados.
-- --------------------------------------------------
Select year(hire_date), hire_date 
	from employees;

-- ==================================================
-- Funciones numéricas. 
-- --------------------------------------------------
-- Aceptan valores de entrada numéricos 
-- 	y devuelven valores numéricos.
-- ==================================================

-- 28. Consultar el valor absoluto del salario mínimo de todos los puestos. 
-- --------------------------------------------------
Select abs(min_salary), min_salary 
	from jobs;

-- 29. Consultar el salario mínimo de todos los puestos / 10000 truncado a 1 decimal. 
-- --------------------------------------------------
Select round(min_salary/100000,1), truncate(min_salary/100000,1),  min_salary/100000 
	from jobs;

-- 30. Consultar el salario mínimo de todos los puestos / 10000 redondeado a 1 decimal. 
-- --------------------------------------------------
Select round(min_salary/10000,1),  min_salary/10000 
	from jobs;

-- fin de archivo