/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión 12. Rutinas MySQL
   Script 35. Funciones Almacenadas
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/

###############################################################
## Funciones Almacenadas
###############################################################

-- Abrir la base de datos 
use DBPROYECTO;

-- Cambiar el delimitador de instrucción 
DELIMITER  //

-- ========================================================
-- 1) Crear una función llamada holaMundo que devuelva hola mundo. 
-- ========================================================
CREATE  FUNCTION  holaMundo( )
	RETURNS  TEXT
    DETERMINISTIC
BEGIN
	RETURN concat("Hola Mundo, la fecha de hoy es ",curdate());
END //

-- Cambiar el delimitador de instrucción 
DELIMITER ;

-- Ejecutar la función
Select holaMundo();

-- Cambiar el delimitador de instrucción 
delimiter    //

-- ========================================================
-- 2) Crear una función llamada NivelPrecio que devuelva 
-- si el precio de la pieza es bajo, medio o alto.
-- ========================================================
CREATE FUNCTION NivelPrecio(preciopieza  double)
	RETURNS VARCHAR(15)
    DETERMINISTIC
BEGIN
	DECLARE nivel VARCHAR(15);
	
    IF preciopieza < 14 THEN 
		SET nivel = 'PRECIO BAJO';
	ELSEIF ( preciopieza>=14 AND preciopieza<=20 ) THEN
		SET nivel = 'PRECIO MEDIO';
	ELSE
		SET nivel = 'PRECIO ALTO';
	END IF;

	RETURN (nivel);
END //

-- Cambiar el delimitador de instrucción 
DELIMITER  ;

-- Ejecutar la función
SELECT pnombre, precio, NivelPrecio(precio) 
FROM p;

-- Cambiar el delimitador de instrucción 
DELIMITER   //

-- ========================================================
-- 3) Crear un procedimiento almacenado ObtenerNivel, 
-- utilizando dentro de éste, la función que NivelPrecio.
-- ========================================================
CREATE PROCEDURE ObtenerNivel( IN no_pieza char(2), OUT nivel VARCHAR(15) )
BEGIN
	DECLARE  preciopieza  DOUBLE   DEFAULT  0;

	SELECT precio INTO preciopieza  
	FROM p
	WHERE pno = no_pieza ;

	SELECT NivelPrecio(preciopieza) INTO  nivel;

END //

-- Cambiar el delimitador de instrucción 
DELIMITER ;

-- Ejecutar el Procedimiento Almacenado
call ObtenerNivel ('P4', @nivel);

-- Consultar el contenido de la variable
select @nivel;

-- Cambiar el delimitador de instrucción 
delimiter  $$

-- ========================================================
-- 4) Crear una función almacenada llamada ExisteSuministrador 
-- que reciba el código de un sumistrador (tabla S) 
-- y devuelva su nombre si existe, o “No encontrado” en caso de que no exista.
-- ========================================================
CREATE FUNCTION ExisteSuministrador(codigo char(2))
		RETURNS  VARCHAR(40)
		DETERMINISTIC
BEGIN
	DECLARE nombre VARCHAR(40);

	SELECT snombre into nombre
	FROM  S
	WHERE sno = codigo;

	Set nombre = ifnull(nombre, "Codigo No encontrado");

	RETURN (nombre);
END $$

-- Cambiar el delimitador de instrucción 
DELIMITER ;

-- Ejecutar la función
Select ExisteSuministrador('S2');
Select ExisteSuministrador('S8');

-- ========================================================
-- Mostrar como fue creada una función
-- ========================================================
show create function ExisteSuministrador;

-- ========================================================
-- Eliminar una función creada por el usuario
-- ========================================================
drop function ExisteSuministrador;

-- ========================================================
-- Modificar una función de usuario
-- ========================================================

-- Mostrar las bases de datos
show databases;

-- Abrir una base de datos
use information_schema;

-- Mostrar las tablas de la base de datos abierta
show tables;

-- Consultar la estructura de la tabla 
describe routines;

-- Mostrar información de las rutinas creadas en la 
-- base de datos dbproyecto
select routine_schema, routine_type, routine_comment, 
       definer, specific_name, created, security_type 
from INFORMATION_SCHEMA.routines 
where routine_schema='DBPROYECTO';

-- Abrir la base de datos
use dbproyecto;

-- Modificar comentario a la función
ALTER  FUNCTION ExisteSuministrador
    COMMENT  'Ejemplo de funcion';

-- Abrir una base de datos
use information_schema;

-- Mostrar información de las rutinas creadas en la 
-- base de datos dbproyecto
select routine_schema, routine_type, routine_comment,
       definer, specific_name, created, security_type 
from routines
where routine_schema="DBPROYECTO";

-- Cambiar el delimitador de instrucción 
delimiter   $$

-- ========================================================
-- 5) Crear una función que recibe como parámetros
-- dos valores tipo fecha y regresa la diferencia en años 
-- entre las fechas recibidas.
-- ========================================================
CREATE FUNCTION edad (fecha1 DATE, fecha2 DATE) 
	RETURNS INT 
    deterministic 
BEGIN 
	DECLARE  axos  INT; 

	SET axos = ( ( YEAR(fecha2)- YEAR(fecha1)) - IF( RIGHT(fecha2,5) < RIGHT(fecha1,5), 1, 0) ) ; 
   		
	RETURN axos; 
END $$ 

-- Cambiar el delimitador de instrucción 
delimiter ;

-- Ejecutar la función
SELECT  edad('2003-09-13', CURDATE( ));

-- Consultar los datos de la tabla
select * from s;

-- Agregar un campo a la tabla 
alter table S 
	add fecNac date;

-- Consultar los datos de la tabla
select * from s;

-- Consultar la estructura de la tabla 
describe s;

-- Actualizar el campo fecNac
update  S  
set  fecNac='2005-01-12'
where   sno='S1';

update  S  
set  fecNac='2001-01-30'   
where  sno='S2';

update  S  
set  fecNac='1999-03-01'   
where sno='S3';

update  S  set  
fecNac='2015-05-10'  
where  sno='S4';

update  S  set  
fecNac='2000-12-31'  
where  sno='S5';

select edad(fecNac,curdate()) from s;

-- Consultar nombre y edad de los suministradores
select  sNombre, fecNac, 
        edad( fecNac,current_date( ))  as  'EDAD'  
from  S;

-- Eliminar el procedimiento almacenado
Drop procedure if exists lista_suministradores;

-- Cambiar el delimitador de instrucción 
delimiter $$

-- ========================================================
-- 6) Crear un procedimiento que muestra los datos de 
-- los suministradores
-- ========================================================
create procedure lista_suministradores( )
begin
	select  *  from  S;
end $$

-- Cambiar el delimitador de instrucción 
delimiter ;

-- Ejecutar el procedimiento almacenado
call lista_suministradores();

-- Fin de Archivo