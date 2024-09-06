-- Viernes 25 de Abril de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #14 - Disparadores, Triggers o Desencadenadores 

-- Seleccionamos la base de datos dbReservas
use dbRH;

/*
1. Implementa un trigger (AUlocations) que deberá activarse 
después de realizar una actualización en la tabla de localidades (locations). 
El desencadenador deberá actualizar el campo (location_id) en la 
tabla departamentos (departments) de aquellos registros que coincidan con 
el código de la localidad actualizada 
en la tabla locations. (AFTER UPDATE)
*/

-- Cambiamos el delimitador
DELIMITER //

-- Creamos el trigger
CREATE TRIGGER AUlocations
	AFTER UPDATE ON locations
    FOR EACH ROW
    
    BEGIN
		UPDATE departments SET location_id = NEW.location_id
        WHERE location_id = OLD.location_id;
    END //


-- Cambiamos el delimitador
DELIMITER ;
/*
2. Implementa un trigger (ADjobs) que deberá activarse después de eliminar un registro 
en la tabla puestos (jobs). El desencadenador deberá actualizar el campo (job_id) 
de la tabla historial_de_puestos (job_history), con el valor de "BORRADO” para 
aquellos registros que coincidan con el valor del puesto que se ha eliminado en la 
tabla de puestos (jobs).  (AFTER DELETE)
*/

-- Cambiamos el delimitador
DELIMITER //

-- Creamos el trigger
CREATE TRIGGER ADjobs
	AFTER DELETE ON jobs
    FOR EACH ROW
		
    BEGIN
		UPDATE job_history SET job_id = "BORRADO"
        WHERE job_id = OLD.job_id;
    END //

DELIMITER ;