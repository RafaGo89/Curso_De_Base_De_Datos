/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana 10. Rutinas MySQL
   Script 29. Procedimientos Almacenados
			  Parámetros IN, OUT, INOUT
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/
###############################################################
## Procedimientos Almacenados
## Parámetros IN, OUT, INOUT
###############################################################

-- 1. Abrir o Usar la base de datos
use DBPROYECTO;

-- ========================================================
-- a) PROCEDIMIENTO ALMACENADO SIMPLE (sin parámetros)
-- ========================================================

-- 2. Cambiar el delimitador de instrucción
delimiter //

-- 3. Crear el procedimiento almacenado
create procedure PAsuminstradores( )
begin
    select "Hoy es viernes clase presencial CUCEA";
    select "NO tenemos acceso a MySQL";
	select snombre from S;
end //

-- 4. Cambiar el delimitador de instrucción
delimiter ;

-- 5. Llamar o ejecutar el procedimiento almacenado
call PAsuministradores( );

-- 6. Abrir la base de datos information_schema (Metadatos)
use information_schema;

-- 7. Mostrar las tablas de la base de datos information_schema
show tables;

-- 8. Mostrar el contenido de la tabla routines
select * from routines;

-- 9. Mostrar la estructura de la tabla routines
describe routines

-- 10. Mostrar datos de las rutinas existentes en la tabla routines 
select routine_schema, routine_name, routine_type 
from routines;

-- 11. Mostrar datos de las rutinas existentes en la tabla routines
select routine_schema, routine_name, routine_type, 
 routine_comment, routine_definition  
from routines 
where routine_schema='dbproyecto';

-- ========================================================
-- b) PROCEDIMIENTO ALMACENADO CON PARÁMETROS IN (entrada)
-- ========================================================

-- 12. Abrir o Usar la base de datos
use DBPROYECTO;

-- 13. Cambiar el delimitador de instrucción
delimiter //

-- 14. Crear el procedimiento almacenado
create procedure PAsumistradoresCiudad ( IN ciudad varchar(20) )  
begin
	select  *  
    from  S  
    where  sciudad = ciudad ; 
end //

-- 15. Cambiar el delimitador de instrucción
delimiter ;

-- 16. Llamar o ejecutar el procedimiento almacenado
call PAsuministradoresCiudad('LONDRES'); 

-- 17. Llamar o ejecutar el procedimiento almacenado
call PAsuministradoresCiudad('PARIS'); 

-- ========================================================
-- c) PROCEDIMIENTO ALMACENADO CON PARÁMETROS OUT (salida)
-- ========================================================

-- 18. Cambiar el delimitador de instrucción
delimiter //

-- 19. Llamar o ejecutar el procedimiento almacenado
create  procedure  PAcontarSuministradores ( OUT total INT)  
begin   
	select  count(*)  
	into total  
	from  S;
end //

-- 20. Cambiar el delimitador de instrucción
delimiter ;

-- 21. Llamar o ejecutar el procedimiento almacenado
call PAcontarSuministradores(@total) ;

-- 22. Consultar la variable de ambiente
select @total;
 
-- ===============================================================
-- d) PROCEDIMIENTO ALMACENADO CON PARÁMETROS INOUT (entrada-salida)
-- ===============================================================

-- 23. Cambiar el delimitador de instrucción
delimiter //

-- 24. Llamar o ejecutar el procedimiento almacenado
create procedure PAincrementa ( INOUT contador INT(4), IN incremento INT )  
begin 
	set  contador = contador + incremento ; 
end //

-- 25. Cambiar el delimitador de instrucción
delimiter ;

-- 26. Inicializar una variable de ambiente
set @contador = 1; 

-- 27. Llamar o ejecutar el procedimiento almacenado
call  PAincrementa (@contador, 3);

-- 28. Consultar la variable de ambiente
select @contador;

-- ===============================================================
-- e) Eliminar procedimientos almacenados
-- ===============================================================
-- 30. Abrir la base de datos information_schema (Metadatos)
use information_schema;

-- 31. Mostrar datos de las rutinas existentes en la tabla routines
select routine_schema, routine_name, routine_type, 
 routine_comment  
from routines 
where routine_schema='dbproyecto';

-- 32. Abrir o Usar la base de datos
use DBPROYECTO;

-- 33. Eliminar un procedimiento almacenado
drop procedure PAincrementa;

-- fin de archivo