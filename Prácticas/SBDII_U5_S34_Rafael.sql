-- Viernes 12 DE Abril de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #12 - Procedimientos Almacenados (repetitivas)
-- Elabora en un script sql
-- con los 3 procedimientos solicitados (base de datos dbProyecto)

-- Seleccionamos la base de datos dbReservas
use dbProyecto;

/*
1. Crear un procedimiento almacenado llamado PA_esPrimo_V1 
   Que recibirá como parámetro: un número entero. 
   Deberá mostrar si el número recibido es primo o no es primo.
   Implementar el procedimiento con WHILE.
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE PA_esPrimo_V1(IN numero INT)
BEGIN
	-- Declarar variable divisor
    DECLARE divisor INT;
    DECLARE mensaje char(20);
    
    SET mensaje = CONCAT(numero, " es primo");
	
    IF numero < 2 THEN
		-- Caso A
        SET mensaje = CONCAT(numero, " no es primo");
	ELSE
		-- Caso B
        SET divisor = 2;
        ciclo: WHILE divisor < numero DO
			-- Verificamos si el número no es primo
			IF numero % divisor = 0 THEN
				SET mensaje = CONCAT(numero, " no es primo");
                LEAVE ciclo;
			END IF;
            SET divisor = divisor + 1;
        END WHILE;
        
    END IF;
		
	-- Mostrar el mensaje
	SELECT mensaje AS 'Respuesta';
END //

delimiter ;

-- LLamamos al procedimiento
CALL PA_esPrimo_V1(23);

/*
2. Crear una procedimiento almacenado llamado PA_esPrimo_V2 
Que recibirá como parámetro: un número entero. 
Deberá mostrar si el número recibido es primo o no es primo.
Implementar el procedimiento con REPEAT.
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE PA_esPrimo_V2(IN numero INT)
BEGIN
	-- Declarar variable divisor
    DECLARE divisor INT;
    DECLARE mensaje char(20);
    
    SET mensaje = CONCAT(numero, " es primo");
	
    IF numero < 2 THEN
		-- Caso A
        SET mensaje = CONCAT(numero, " no es primo");
	ELSE
		-- Caso B
        SET divisor = 2;
        ciclo: REPEAT
			-- Verificamos si el número no es primo
			IF numero % divisor = 0 THEN
				SET mensaje = CONCAT(numero, " no es primo");
                LEAVE ciclo;
			END IF;
            SET divisor = divisor + 1;
        UNTIL divisor = numero
        END REPEAT;
        
    END IF;
		
	-- Mostrar el mensaje
	SELECT mensaje as "Respuesta";
END //

delimiter ;

-- LLamamos al procedimiento
CALL PA_esPrimo_V2(13);

/*
3. Crear una procedimiento almacenado llamado  PA_esPrimo_V3 
Que recibirá como parámetro: un número entero. 
Deberá mostrar si el número recibido es primo o no es primo.
Implementar el procedimiento con LOOP.
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE PA_esPrimo_V3(IN numero INT)
BEGIN
	-- Declarar variable divisor
    DECLARE divisor INT;
    DECLARE mensaje char(20);
    
    SET mensaje = CONCAT(numero, " es primo");
    
    -- Inicializamos el divisor en 1
    SET divisor = 1;
    
    -- Caso A
	IF numero < 2 THEN
        SET mensaje = CONCAT(numero, " no es primo");
	ELSE
		-- Caso B 
		ciclo: LOOP
        
			-- Aumentamos el contador
			SET divisor = divisor + 1;
            
            -- Verificamos si el divisor ya llegó al número
			IF divisor = numero THEN
				LEAVE ciclo;
			END IF;
            
            -- Verificamos si el número no es primo
            IF numero % divisor = 0 THEN
				SET mensaje = CONCAT(numero, " no es primo");
                LEAVE ciclo;
			ELSE  -- De otra manera, damos una vuelta
                ITERATE ciclo;
			END IF;
            
        END LOOP ciclo;
	END IF;
    
	-- Mostrar el mensaje
	SELECT mensaje as "Respuesta";
END //

delimiter ;

-- LLamamos al procedimiento
CALL PA_esPrimo_V3(73);