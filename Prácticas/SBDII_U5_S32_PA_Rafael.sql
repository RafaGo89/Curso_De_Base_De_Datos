-- Viernes 12 DE Abril de 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #10 - Procedimientos Almacenados (parámetros) 
-- Elabora en un script sql con los 3 procedimientos solicitados 
-- (base de datos dbProyecto)

-- Seleccionamos la base de datos dbReservas
use dbProyecto;

/*
1. Crea un procedimiento almacenado llamado PesoMaximoPiezaColor
que regrese en un parámetro de salida el peso
máximo de las piezas (tabla P) de un
determinado color recibido como parámetro de entrada.
*/
delimiter //
-- Crear procedimiento
CREATE PROCEDURE PesoMaximoPiezaColor(IN colorPieza char(15), OUT pesoMax INT)
BEGIN
		-- Hacer query
		SELECT MAX(peso) INTO pesoMax FROM p
		WHERE color = colorPieza;
END //

delimiter ;

CALL PesoMaximoPiezaColor ("Rojo", @resultado);
select @resultado;

CALL PesoMaximoPiezaColor ("Azul", @resultado);
select @resultado;

CALL PesoMaximoPiezaColor ("Verde", @resultado);
select @resultado;

/*
2. Crea un procedimiento almacenado llamado NombreProyectosCiudad 
que muestre los nombres de los proyectos (tabla J) de una
determinada ciudad recibida como parámetro de entrada
y ordenados por el nombre del proyecto en orden ascendente.
*/

delimiter //
-- Crear procedimiento
CREATE PROCEDURE NombreProyectosCiudad(IN ciudad varchar(20))
BEGIN
		-- Hacer query
		SELECT jnombre FROM j WHERE jciudad = ciudad
        ORDER BY jnombre ASC;
END //

delimiter ;

CALL NombreProyectosCiudad ("Roma");

/*
3. Crea un procedimiento almacenado llamado NombreSuministradoresTop2
que muestre los primeros 2 nombres de los suministradores (tabla S) 
ordenados por su situacion en forma descendente.
*/
delimiter //
-- Crear procedimiento
CREATE PROCEDURE  NombreSuministradoresTop2()
BEGIN
		-- Hacer query
		SELECT snombre FROM s ORDER BY situacion DESC LIMIT 2;
END //

delimiter ;

CALL NombreSuministradoresTop2();