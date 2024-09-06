/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión 11. Rutinas MySQL
   Script 31. Procedimientos Almacenados
			   con Estructuras Repetitivas 
	1.	Sentencia while
	2.	Sentencia repeat
	3.	Sentencia loop
		•	Iterate
		•	Leave
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/
###############################################################
## Procedimientos Almacenados
## Uso de Ciclos
###############################################################

-- 1. Abrir o Usar la base de datos
use DBPROYECTO;

-- ========================================================
-- a) PROCEDIMIENTO ALMACENADO SENTENCIA while 
-- ========================================================

-- 2. Cambiar el delimitador de instrucción
delimiter //

-- 3. Crear un procedimiento almacenado que guarde en una cadena 
--    los digitos del 0 hasta el 9 y los muestre

CREATE PROCEDURE paDigitos ( )
BEGIN
    -- Declaración de variables
	DECLARE  num  INT;
	DECLARE  cadena  varchar(25);
	
	-- Inicialización de variables
	SET cadena='';
	SET num=0;
	
	-- Crea una cadena con los dígitos del 0 al 9
	WHILE  num <= 9 DO
		SET cadena = CONCAT(cadena, num ,  ' ');
		SET num = num + 1;
	END WHILE;
	
	-- Muestra la cadena con los dígitos
	SELECT cadena;
END //

-- 4. Cambiar el delimitador de instrucción
DELIMITER ;

-- 5. Ejecutar el procedimiento
call paDigitos();

-- ========================================================
-- b) PROCEDIMIENTO ALMACENADO SENTENCIA repeat 
-- ========================================================

-- 6. Abrir o Usar la base de datos
use DBPROYECTO;

-- 7. Cambiar el delimitador de instrucción
delimiter  //

-- 8. Crear un procedimiento almacenado que guarde en una cadena 
--    los digitos del 9 hasta el 0 y los muestre

CREATE PROCEDURE paDigitosRev ( )
BEGIN
    -- Declaración de variables
	DECLARE  x  INT;
	DECLARE  cadena  varchar(25);
	
	-- Inicialización de variables
	SET  cadena='';
	SET x = 9; 

	-- Crea una cadena con los dígitos del 9 al 0
	REPEAT 
		SET cadena = CONCAT( cadena, x, ',' );
		SET  x = x - 1;
	UNTIL x < 0
	END REPEAT;
	
	-- Muestra la cadena con los dígitos
	SELECT cadena;
END //

-- 9. Cambiar el delimitador de instrucción
delimiter  ;

-- 10. Ejecutar el procedimiento
call paDigitosRev();

-- ========================================================
-- c) PROCEDIMIENTO ALMACENADO SENTENCIAS LOOP, LEAVE e ITERATE 
-- ========================================================

-- 11. Abrir o Usar la base de datos
use DBPROYECTO;

-- 12. Cambiar el delimitador de instrucción
delimiter //

-- 13. Crear un procedimiento almacenado que guarde en una cadena
--     los números pares del 2 al 20 y los muestre

CREATE PROCEDURE paPares ( )
BEGIN
    -- Declaración de variables
	DECLARE x INT;
	DECLARE cadena varchar(250);

	-- Inicialización de variables
	SET cadena='';
	SET x=0;

	-- Crea una cadena con los pares del 2 al 20
	etiqueta : LOOP
		IF  ( x  >  20 ) THEN
			LEAVE etiqueta;
		END IF;
		SET x = x + 1;
		IF  ( x % 2  > 0 ) THEN
			ITERATE etiqueta;	
		ELSE
			SET cadena = CONCAT( cadena, x, ' ' );
		END IF;
	END LOOP etiqueta;
	
	-- Muestra la cadena con los números pares del 2 hasta 20
	SELECT cadena;
END //

-- 14. Cambiar el delimitador de instrucción
DELIMITER ;

-- 15. Ejecutar el procedimiento
call paPares();

-- 16. Muestra la instrucción con la que se creó el procedimiento almacenado
show create procedure paPares;

-- ========================================================
-- d) ELIMINAR PROCEDIMIENTOS ALMACENADOS drop procedure
-- ========================================================

-- 17. Eliminar un procedimiento almacenado
drop procedure if exists paPares;    

-- ========================================================
-- e) MODIFICAR PROCEDIMIENTOS ALMACENADOS alter procedure
--    -interacción con el servidor
--    -usuario de seguridad
--    -comentarios
-- ========================================================

-- 18. Muestra las principales características de los procedimientos almacenados
show procedure status 
	where name like 'pa%';

-- 19. Modificar el comentario de un procedimiento almacenado
ALTER PROCEDURE paPares 
    	COMMENT 'Ejemplo del uso del LOOP, ITERATE and LEAVE';

-- 20. Modificar la seguridad de un procedimiento almacenado
--     para que al ejecutarse lo haga con los derechos del usuario
--     que lo ejecuta.
ALTER PROCEDURE paPares
		SQL SECURITY INVOKER;

-- 21. Muestra las principales características de los procedimientos almacenados
show procedure status 
	where name like 'pa%';

-- fin de archivo