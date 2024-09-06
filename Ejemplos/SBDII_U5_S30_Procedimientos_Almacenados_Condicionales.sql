/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Semana 10. Rutinas MySQL
   Script 30. Procedimientos Almacenados
			  con Enunciados Condicionales
	1.	Sentencia IF- ELSEIF- ELSE
	2.	Declarar variables
	3.	Sentencia CASE
		•	Simple
		•	Búsqueda
   Profesor: Irma Rebeca Andalón García
   -------------------------------------------------------
   ESQUEMA #2 - dbProyecto  
*/
###############################################################
## Procedimientos Almacenados
## Uso de Condicionales
###############################################################

-- 1. Abrir o Usar la base de datos
use DBPROYECTO;

-- 2. Consultar los datos de la tabla
select * 
from P;

-- 3. Agregar un nuevo campo a la tabla
alter table P 
add precio float(2);

-- 4. Consultar los datos de la tabla
select * from P;

-- 5. Actualizar el precio de UNA pieza
update P 
set precio=12 
where pno='P1';

-- 6. Consultar los datos de la tabla
select * 
from P;

-- 7. Actualizar el precio de TODAS las piezas
update P 
set precio=12;

-- 8. Consultar los datos de la tabla
select * 
from P;

-- 9. Cambiar el delimitador de instrucción
delimiter &&

-- 10. Crear un procedimiento almacenado que actualice 
--     el precio de las piezas de un color recibido como parámetro
-- 	   de entrada en un porcentaje también recibido como parámetro de entrada.

create procedure PA_ActualizarPrecio (IN colorM varchar(15), IN porcentaje INT)
begin
     update P 
     set precio = precio + (precio*porcentaje/100) 
     where P.color = colorM;
end &&

-- 11. Cambiar el delimitador de instrucción
delimiter ;

-- 12. Ejecutar el procedimiento
call PA_ActualizarPrecio('AZUL',100);

-- 13. Ejecutar el procedimiento
call PA_ActualizarPrecio('ROJO',50); 

-- 14. Ejecutar el procedimiento
call PA_ActualizarPrecio('VERDE',10);

-- ========================================================
-- a) PROCEDIMIENTO ALMACENADO SENTENCIA IF - ELSE 
--    DECLARAR VARIABLES
-- ========================================================

-- 15. Cambiar el delimitador de instrucción
DELIMITER //

-- 16. Crear un procedimiento almacenado que valore 
--     el nivel de precio de la pieza cuyo código es recibido como parámetro
-- 	   de entrada. El nivel del precio será devuelto en un parámetro de salida.

CREATE PROCEDURE PA_NivelPrecio(IN no_pieza char(2), OUT nivel VARCHAR(15))
BEGIN
    -- Declaración de variables
    DECLARE preciopieza DOUBLE;
         
    -- Investigar el precio de la pieza con código no_pieza
    SELECT precio INTO preciopieza 
  	FROM P 
	WHERE pno = no_pieza ;

	-- Clasificar el nivel del precio de la pieza
    IF preciopieza < 14 THEN 
		SET nivel = 'PRECIO BAJO';
    ELSEIF  (preciopieza >= 14 AND preciopieza <= 20) THEN
		SET nivel = 'PRECIO MEDIO';
    ELSE
     	SET nivel = 'PRECIO ALTO';
    END IF;

END //

-- 17. Cambiar el delimitador de instrucción
DELIMITER  ;

-- 18. Ejecutar el procedimiento
call PA_NivelPrecio('P4', @nivel);

-- 19. Mostrar el contenido de la variable
select @nivel;

-- ========================================================
-- b) PROCEDIMIENTO ALMACENADO SENTENCIA CASE SIMPLE 
-- ========================================================

-- 20. Cambiar el delimitador de instrucción
DELIMITER $$

-- 21. Crear un procedimiento almacenado que devuelva en un parámetro de salida 
--     el día de la semana que será atendido un suministrador de acuerdo a la ciudad
-- 	   del suministrador cuyo código se recibe en un parámetro de entrada.

CREATE PROCEDURE PA_DiaReunion ( IN snum CHAR(2), OUT dia VARCHAR(15) ) 
BEGIN 
	-- Declaración de variables  
    DECLARE ciudad VARCHAR(20);  

	-- Investigar la ciudad de un suministrador 
	SELECT sciudad INTO ciudad 
	FROM S 
	WHERE S.Sno = snum; 

	-- Seleccionar el día que se va a atender al proveedor 
    -- de acuerdo a su ciudad 
	CASE ciudad 
		WHEN 'LONDRES' THEN 
			SET dia = 'LUNES';
		WHEN 'PARIS' THEN 
			SET dia = 'JUEVES'; 
		WHEN 'ATENAS' THEN 
			SET dia = 'VIERNES'; 
		ELSE 
			SET dia = 'MARTES'; 
	END CASE; 
END $$ 

-- 22. Cambiar el delimitador de instrucción
DELIMITER ;

-- 23. Ejecutar el procedimiento
call PA_DiaReunion('S2',@dia);

-- 24. Mostrar el contenido de la variable
SELECT @dia;

-- ========================================================
-- C) PROCEDIMIENTO ALMACENADO SENTENCIA CASE DE BÚSQUEDA 
-- ========================================================

-- 25. Abrir o Usar la base de datos
USE DBPROYECTO;

-- 26. Cambiar el delimitador de instrucción
DELIMITER //

-- 27. Crear un procedimiento almacenado que valore 
--     el nivel de precio de la pieza cuyo código es recibido como parámetro
-- 	   de entrada. El nivel del precio será devuelto en un parámetro de salida.

CREATE PROCEDURE PA_NivelPrecioCase ( IN nopieza char(2), OUT nivel VARCHAR(15))
BEGIN
	DECLARE preciopieza DOUBLE;

	SELECT precio INTO preciopieza  
	FROM p
	WHERE pno = nopieza ;

	CASE
		WHEN (preciopieza < 14) THEN 
			SET nivel = 'PRECIO BAJO';
            
		WHEN (preciopieza >= 14 AND  preciopieza <= 20) THEN
			SET nivel = 'PRECIO MEDIO';
            
		ELSE
			SET nivel = 'PRECIO ALTO';

	END CASE;
END //

-- 28. Cambiar el delimitador de instrucción
DELIMITER  ;

-- 29. Ejecutar el procedimiento
call PA_NivelPrecioCase('P4', @nivel);

-- 30. Mostrar el contenido de la variable
select @nivel AS 'TIPO PRECIO PIEZA';

-- fin de archivo