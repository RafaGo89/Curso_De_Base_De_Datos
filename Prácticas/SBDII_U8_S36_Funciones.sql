-- Viernes 19 de Abril de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #13 - Funciones

-- Seleccionamos la base de datos dbReservas
use dbReservas;

/*
1. Crea una función almacenada para la base de datos dbReservas llamada fnDias( )  
   Que reciba la fecha de inicio y la fecha de fin  como parámetros de entrada. 
   Devolver el número de días entre fechas de inicio y de fin 
   (esto es, por cuántos días se está alquilando el coche).
*/

-- Cambiamos el delimitador
DELIMITER //

-- Creamos el procedimiento almacenado
CREATE FUNCTION fnDias(fecInicio DATE, fecFinal DATE)
	RETURNS INT
    DETERMINISTIC
    
    BEGIN
		-- Declaramos una variable
		DECLARE resultado INT;
        
        -- Obtenemos la diferencia entre las fechas
        SET resultado = DATEDIFF(fecFinal, fecInicio);
        
        -- Regresamos el resultado
        RETURN resultado;
    END //

-- Cambiamos el delimitador
DELIMITER ;

-- Usamos la función en una query
SELECT codres, fnDias(fec_ini, fec_fin) AS "Días alquilados" FROM  reservas;

-- Cambiamos la base de datos
USE dbRH;

/*
2. Crea una función almacenada para la base de datos dbRH llamada fnSalario ( )
    Que reciba un número real de entrada, que representa el salario de un empleado,
     y regrese un mensaje indicando qué tan bueno es ese salario tomando en cuenta las siguientes condiciones: 

           ( ... 0) = Salario Incorrecto 
           [0 - 3000) = Salario Insuficiente
           [3000 - 5000) = Salario Mínimo
           [5000 - 8000) = Salario Suficiente
           [8000 -  11000) = Buen Salario
           [11000 - 20000)  = Muy buen Salario
           [20000 ...) = Excelente Salario

     En cualquier otro caso la nota no será válida. 
*/
-- Cambiamos el delimitador
DELIMITER //

-- Creamos la función
CREATE FUNCTION fnSalario(sueldo DECIMAL(8,2))
	RETURNS TEXT
    DETERMINISTIC
    
    BEGIN
		-- Dividmos el salario de acuerdo a su valor
		CASE
			WHEN sueldo < 0 THEN
				RETURN "Salario Incorrecto";
			WHEN sueldo <= 2999 THEN
				RETURN "Salario Insuficiente";
			WHEN sueldo <= 4999 THEN
				RETURN "Salario Mínimo";
			WHEN sueldo <= 7999 THEN
				RETURN "Salario Suficiente";
			WHEN sueldo <= 10999 THEN
				RETURN "Buen Salario";
			WHEN sueldo <= 19999 THEN
				RETURN "Muy buen Salario";
			ELSE
				RETURN "Excelente Salario";
		END CASE;
			
    END //

-- Cambiamos el delimitador
DELIMITER ;

-- Usamos la función con la siguiente query
SELECT first_name, last_name, salary, fnSalario(salary) AS "Clasificación de salario"
FROM employees;