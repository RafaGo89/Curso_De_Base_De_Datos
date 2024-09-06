/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión 12. Cursores MySQL
   Script 37. Procedimientos Almacenados con Cursores 
   Profesor.  Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/

###############################################################
## Procedimientos Almacenados
## Uso de Cursores
###############################################################

-- ========================================================
-- Ejemplo de Cursor en MySQL 
-- Implementar un procedimiento almacenado que genere 
-- una lista de correos de todos los empleados.
-- ========================================================
 
-- Cambiar el delimitador de instrucción 
DELIMITER $$

CREATE PROCEDURE PA_correos( INOUT lista_correos varchar(5000) )
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE correo VARCHAR(100) DEFAULT "";

	-- ========================================================
	-- 1. Declarar un cursor utilizando la sentencia DECLARE. 
	-- 	  DECLARE cursor_name CURSOR FOR SELECT … FROM … 
	-- ========================================================
	DECLARE cursor_correos CURSOR FOR 
		SELECT email FROM employees;

	-- ========================================================
	-- 2. Declarar un manejador NOT FOUND 
	-- DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished=1;
	-- ========================================================

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	-- ========================================================
	-- 3. Abrir el cursor con una sentencia OPEN. 
	-- OPEN cursor_name;
	-- ========================================================
	OPEN cursor_correos;

	-- ========================================================
	-- 4. Procesar todas las filas 
	-- FETCH [ [NEXT] FROM ] cursor_name INTO variables list;
	-- ========================================================
	lee_correo: LOOP     
		FETCH cursor_correos INTO correo;
		IF finished = 1 THEN
			LEAVE lee_correo;
		END IF;
		SET lista_correos = CONCAT(correo, "/", lista_correos);
	END LOOP lee_correo;

	-- ========================================================
	-- 5. Finalmente, cerrar el cursor cuando ya no se utiliza
	-- CLOSE cursor_name;
	-- ========================================================
	CLOSE cursor_correos;

END $$

-- Cambiar el delimitador de instrucción 
DELIMITER ;

-- Inicializar la variable 
SET @lista="";

-- Mandar a ejecutar el procedimiento 
CALL PA_correos(@lista);

-- Consultar el contenido de la variable 
SELECT  @lista;

-- Fin de Archivo