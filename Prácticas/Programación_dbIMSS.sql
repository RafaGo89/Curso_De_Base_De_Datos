-- Fecha: 19 de mayo de 2024
-- Autores: Rodriguez Gomez Rafael, Otero Barragan Nahomi Natalia 
-- Proyecto Final: Base de Datos IMSS, Analisis Clinicos

	-- Procedimientos almacenados
    
-- Seleccionamos la base de datos
USE dbImss;

-- Crear un procedimiento almacenado que regrese cuantos días faltan
-- o han pasado para la entrega de los resultados en relación a la fecha de hoy,
-- del examen de un paciente cuyo clave de análisis es recibida como parametro de entrada
DELIMITER //
CREATE PROCEDURE PA_diasRestantes (IN codigoAn CHAR(5), OUT respuesta VARCHAR (60))
BEGIN 
	-- Declaración de variables para guardar la fecha de resultados
    DECLARE resultados date;
    DECLARE dias INT;
    
    -- Obtener la fecha del análisis con codigoAn
    SELECT fecResultados INTO resultados
    FROM analisis WHERE claveAnalisis = codigoAn;
    
    -- Obtener diferencia de dias con base a la fecha del día de hoy
    SELECT DATEDIFF(resultados, CURRENT_DATE()) INTO dias;
    
    -- Clasificar la diferencia de dias
    IF dias = 0 THEN
		SET respuesta = "Hoy es la fecha de entrega de los análisis";
        
	ELSEIF dias > 0 THEN
		SET respuesta = CONCAT("Faltan ", dias, " día(s) para la entrega de análisis");
	
    ELSE 
		SET respuesta = CONCAT("Han pasado ", ABS(dias), " día(s) de la fecha de entrega de análisis");
	END IF;
END //

Delimiter ;

-- Llamamos al procedimiento
CALL PA_diasRestantes("AN001", @resultado);

-- Consultar el contenido de la variable
SELECT @resultado;


	-- Procedimiento almacenado con condicionales
    
    
delimiter // 
-- Crear un procedimiento que valore los años de servicio del médico para posteriormente hacer 
-- una clasificación, cuya clave es recibida como parámetro de entrada. La clasificación será devuelta en un 
-- parámetro de salida 

create procedure PA_clasificacionMed (in medico char(6), out clasificacion varchar(15)) 
begin 
	
	-- Declaración de variables 
    declare años int; 
    
    -- Investigar los años de servicio del médico con médico
    select tiempoServicio into años
    from medicos 
    where claveMed = medico; 
    
    -- Clasificar los años de cada médico 
    if años < 10 then 
		set clasificacion = 'Residente'; 
	elseif (años >= 10 and años <= 20) then 
		set clasificacion = 'Interno';
	else 
		set clasificacion = 'Especialista'; 
	end if; 
    
end // 

delimiter ; 

-- Ejecutar el procedimiento 
call PA_clasificacionMed('MED006', @clasificacion);

-- Mostrar el contenido de la variable 
select @clasificacion as "Clasificacion del medico";

-- Crear una Función Almacenada llamada Examen que reciba la clave
-- de un examen y devuelva el nombre si existe o "No encontrado" 
-- en caso de que no exista 

DELIMITER // 

CREATE FUNCTION Examen (clave char(7))
				RETURNS VARCHAR (40)
                DETERMINISTIC
BEGIN 
	DECLARE nombreEx varchar(40);
    
    SELECT nombreExam into nombreEx
    FROM examenes
    WHERE claveExam = clave;
    
    SET nombreEx = ifnull (nombreEx, "Clave no encontrada");
    
    RETURN (nombreEx);
END // 

delimiter ;

-- Ejecutar la Función 
SELECT examen ('EXAM004');
SELECT examen ('EXAM000'); 


-- Crear una Función Almacenada que reciba un número real de entrada
-- que representa el costo de un Examen, y regrese un mensaje señalando
-- una clasificación que diga si el costo es bajo (menos de $200), 
-- regular (entre $200 y 699$), elevado (entre $700 y $1199),
-- muy elevado (entre $1200 y $1599) o execesivo (mayor a $1599). 
DELIMITER // 
CREATE FUNCTION CostoEx (Ecosto real) 
			RETURNS VARCHAR(100)
			DETERMINISTIC

BEGIN 
	DECLARE nivelCosto varchar(100);
		CASE 
			WHEN (Ecosto < 200) THEN
				RETURN 'Bajo Costo'; 
			WHEN (Ecosto >= 200 and Ecosto <= 699) THEN
				RETURN 'Costo regular';
			WHEN (Ecosto > 699 and Ecosto <= 1199) THEN
				RETURN 	'Costo elevado'; 
			WHEN (Ecosto > 1199 AND Ecosto <= 1599 ) THEN 
				RETURN 'Costo muy elevado';
			ELSE 
				RETURN 'Costo excesivo'; 
		END CASE; 
        
END // 

delimiter ;

-- Ejecutar la función 
SELECT nombreExam, CostoEx(costo) as 'Clasificación de Costo' from examenes; 


-- Crear un trigger que deberá implementarse antes de la inserción de
-- registros en la tabla unidades medicas. El trigger deberá
-- crear la clave de la unidad medica (claveUnidad) con el siguiente formato:
-- UMF-'numero del clinica''nombre del municipio abrevido'
-- Ejemplo = UMF-03TON
DELIMITER //

CREATE TRIGGER IF NOT EXISTS TR_clave_unidad
	BEFORE INSERT ON unidadesMedicas
    FOR EACH ROW	
BEGIN
	CASE
		WHEN NEW.municipio = "Guadalajara" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "GDL");
            
		WHEN NEW.municipio = "Tonala" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "TON");
            
		WHEN NEW.municipio = "Tlaquepaque" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "TLAQ");
            
		WHEN NEW.municipio = "Zapopan" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "ZAP");
            
		WHEN NEW.municipio = "Zapotlanejo" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "ZAPOT");
		
        ELSE
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "---");
    END CASE;
END //

DELIMITER ; 