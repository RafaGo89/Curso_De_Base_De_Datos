-- Viernes 12 DE Abril de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #11 - Procedimientos Almacenados (condicionales) 
-- Elabora en un script sql con los 3 procedimientos solicitados 
-- (base de datos dbProyecto)

-- Seleccionamos la base de datos dbReservas
use dbProyecto;

/*
1. Crea un procedimiento almacenado PiezaCodigoIF para la (tabla P),
	que reciba el número de pieza,
	si el color de la pieza es rojo, devolver código 1, 
	si la pieza es de color verde devolver código 2 
	si la pieza es azul devolver código 3, 
	y en cualquier otro caso devolver en código un 0.
	El código será una variable de salida de tipo entero. 
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE PiezaCodigoIF(IN numPieza CHAR(2), OUT codigoPieza INT)
BEGIN
	-- Declarar variable de paso
	DECLARE colorPieza CHAR(15);
    
    -- obtener el color de la pieza que recibo
    SELECT color INTO colorPieza FROM p 
    WHERE pno = numPieza;
    
    -- Asignar codigo en base a color
    IF colorPieza = "Rojo" THEN
		SET codigoPieza = 1;
	ELSEIF colorPieza = "Verde" THEN
		SET codigoPieza = 2;
	ELSEIF ColorPieza = "Azul" THEN
		SET codigoPieza = 3;
	ELSE
		SET codigoPieza = 0;
	END IF;
		
END //

delimiter ;

-- Llamar al procedimiento
CALL PiezaCodigoIF("P1", @resultado);

-- Mostrar el contenido de la variable
SELECT @resultado;


/*
2. Crea un procedimiento almacenado PiezaCodigoCS para la (tabla P), 
	con las mismas características del procedimiento anterior: 
	que reciba como entrada el número de pieza,
	si el color de la pieza es rojo, devolver código 1, 
	si la pieza es de color verde devolver código 2 
	si la pieza es azul devolver código 3, 
	y en cualquier otro caso devolver en código un 0.
	El código será una variable de salida de tipo entero.
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE PiezaCodigoCS(IN numPieza CHAR(2), OUT codigoPieza INT)
BEGIN
	-- Declarar variable de paso
	DECLARE colorPieza CHAR(15);
    
    -- obtener el color de la pieza que recibo
    SELECT color INTO colorPieza FROM p 
    WHERE pno = numPieza;
    
    -- Asignar codigo en base a color
    CASE colorPieza
		WHEN "Rojo" THEN
			SET codigoPieza = 1;
		WHEN "Verde" THEN
			SET codigoPieza = 2;
		WHEN "Azul" THEN
			SET codigoPieza = 3;
		ELSE
			SET codigoPieza = 0;
	END CASE;
END //

delimiter ;

-- Llamar al procedimiento
CALL PiezaCodigoCS("P3", @resultado);

-- Mostrar el contenido de la variable
SELECT @resultado;

/*
3. Crea un procedimiento almacenado PA_Factible para la (table SP),
que reciba como entrada un número de suministrador y un número de pieza, 
si cantidad (cant) es menor o igual que 1000, deberá regresar “FACTIBLE”, 
y si cantidad (cant) es mayor que 1000, deberá regresar  “NO FACTIBLE”.  
*/
delimiter //
-- Crear procedimiento
CREATE PROCEDURE PA_Factible(IN numSum CHAR(2), IN numPieza CHAR(2), OUT letrero varchar(12))
BEGIN
	-- Declarar variable de paso
	DECLARE cantidad CHAR(15);
    
    -- Buscamos la cantidad en base a numSum y numPieza
    SELECT cant INTO cantidad FROM SP
    WHERE sno = numSum AND pno = numPieza;
    
    -- Decidir si es factible o no factible
    CASE
		WHEN cantidad <= 1000 THEN
			SET letrero = "FACTIBLE";
    ELSE 
		SET letrero = "NO FACTIBLE";
	END CASE;
    
END //

delimiter ;

-- Llamar al procedimiento
CALL PA_Factible("S5", "P3", @resultado);

-- Mostrar el contenido de la variable
SELECT @resultado;