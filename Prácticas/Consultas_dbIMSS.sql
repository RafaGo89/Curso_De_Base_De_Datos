-- Fecha: 19 de mayo de 2024
-- Autores: Rodriguez Gomez Rafael, Otero Barragan Nahomi Natalia 
-- Proyecto Final: Base de Datos IMSS, Analisis Clinicos

	-- Vistas
    
-- Seleccionamos la base de datos
USE dbImss;

-- Consultar NSS, nombre, apellido, año de nacimiento, nombre de la unidad,
-- costo de examen y nombre de examenes que se han realizado los afiliados
-- nacidos desde el año 2000 en adelante,
-- ordenados por año de nacimiento descendentemente
CREATE OR REPLACE VIEW VW_examsSligoXXI as
	SELECT NSS, nombre, apellido, 
	EXTRACT(YEAR FROM fecNacimiento) AS "Año de nacimiento",
	nombreUnidad, nombreExam, costo as "Costo del examen"
	FROM afiliados
	INNER JOIN unidadesMedicas
	ON afiliados.unidadMedica = unidadesMedicas.claveUnidad
	INNER JOIN analisis
	ON afiliados.NSS = analisis.paciente
	INNER JOIN examenes
	ON analisis.tipoExam = examenes.claveExam
	WHERE EXTRACT(YEAR FROM fecNacimiento) >= 2000
	ORDER BY EXTRACT(YEAR FROM fecNacimiento) DESC;
    
-- Llamamos a la vista
SELECT * FROM VW_examsSligoXXI;

-- Obtener el nombre, apellido, nombre de los examenes que se han realizado, 
-- fecha de entrega de los resultados de los examenes y costo de esos examenes 
-- con formato contabilidad y con el signo de pesos al comienzo ($#,###,###.##),
-- de aquellos pacientes cuya fecha de entrega de resultados haya sido en
-- marzo del 2024

CREATE OR REPLACE VIEW VW_examsMarzo24 as
	SELECT nombre, apellido, nombreExam, fecResultados, 
    CONCAT("$", FORMAT(costo, 2)) AS "Costo"
    FROM afiliados
    INNER JOIN analisis
    ON afiliados.nss = analisis.paciente
    INNER JOIN examenes
    ON analisis.tipoExam = examenes.claveExam
    WHERE YEAR(fecResultados) = "2024" AND 
    MONTH(fecResultados) = "03";
    
-- Llamamos a la vista
SELECT * FROM VW_examsMarzo24;

 -- Consultas con WHERE y ORDER BY 


-- Consultar el NSS, el nombre, el apellido, fecha de nacimiento
-- y el tipo de sangre de los afiliados 
-- cuyo tipo de sangre sea O- 
-- ordenados ascendentemente por fecha de nacimiento
SELECT NSS, nombre, apellido, fecNacimiento, tipoSangre
FROM afiliados
WHERE tipoSangre = "O-"
ORDER BY fecNacimiento ASC;

-- Consultar la clave, nombre, apellido y tiempo de servicio de la tabla médicos 
-- donde el tiempo de servicio sea mayor a 15 años, ordenados de manera descendente. 
select claveMed, nombre, apellido, tiempoServicio
from medicos 
where tiempoServicio > 15
order by (tiempoServicio) desc;


	-- Consultas con HAVING Y GROUP BY


-- Consultar el número de clinicas por municipio
-- para aquellos municipios con más de 2 clinicas
SELECT municipio, COUNT(*) as "Total de clinicas"
FROM unidadesMedicas
GROUP BY municipio
HAVING COUNT(*) > 2;

-- Consultar cuantos afiliados tiene cada unidad medica para aquellas unidades con 
-- más de un afiliado 
select unidadmedica, count(*) as "Numero de afiliados" 
from afiliados
group by unidadmedica
having count(*) > 1;

	-- Consultas con join ímplicito
    

-- Obtener el nombre del examen, el costo del examen,
-- el laboratorio donde se realiza el examen y su horario
-- para aquellos examenes donde su laboratorio abre a las 8:00
SELECT nombreExam, costo, nombreLab, horaInicio, horaCierre
FROM examenes, laboratorios
WHERE examenes.laboratorio = laboratorios.claveLab
AND horaInicio = "8:00:00";

-- Consultar la clave de análisis, el tipo de examen con el nombre, apellido y -- unidad médica del paciente cuyo apellido tenga una O. 
select claveAnalisis, tipoExam, nss, nombre, apellido, unidadMedica
from analisis, afiliados
where analisis.paciente = afiliados.nss
and apellido like '%O%';


	-- Consultas con join explícito
    
    
-- Obtener el nombre y apellido del paciente,
-- nombre y la dirección de su unidad Médica y el nombre y costo de los exámenes
-- que se hayan realizado, para aquellos paciente donde el costo
-- de su examen sea mayor a 1000 pesos
SELECT nombre, apellido, nombreUnidad, direccion, nombreExam, costo
FROM analisis
INNER JOIN afiliados
ON analisis.paciente = afiliados.nss
INNER JOIN unidadesMedicas
ON afiliados.unidadMedica = unidadesmedicas.claveUnidad
INNER JOIN examenes
ON analisis.tipoExam = examenes.claveExam
WHERE costo > 1000;

-- Obtener el nombre, apellido y especialidad de los doctores que hayan ordenado algun analisis 
-- analisis y obtener el nombre, descripcion y costo del examen 
select nombre, apellido, especialidad, ordenMedico, nombreExam, descripcion, costo, fecha from medicos 
inner join analisis
on medicos.claveMed = analisis.ordenMedico
inner join examenes
on analisis.tipoExam = examenes.claveExam; 


	-- Consultas con subconsultas y operadores de una fila


-- Consultar el nombre y apellidos de los medicos que tienen
-- un tiempo de servicio menor o igual
-- al del medico con código MED006, sin incluirlo
SELECT nombre, apellido, tiempoServicio
FROM medicos
WHERE tiempoServicio <= (SELECT tiempoServicio FROM medicos
					   WHERE claveMed = "MED006")
AND claveMed <> "MED006";

-- Consultar los datos de los examenes cuyo precio se encuentre por debajo – del promedio del costo
select * from examenes 
where costo < (select avg(costo) from examenes); 


	-- Consultas con subconcultas y operadores de varias filas
    
    
-- Obtener el nombre de unidad medica, municipio, dirección y telefono
-- de aquellas clinicas que tengan un afiliado con tipo de sangre AB+
SELECT nombreUnidad, municipio, direccion, telefono
FROM unidadesMedicas
WHERE claveUnidad IN (SELECT DISTINCT unidadMedica FROM afiliados
					 WHERE tipoSangre = "AB+");

-- Consultar el nss, nombre, apellido, tipo de sangre y turno de los afiliados 
-- cuya unidad Médica se  encuentre en el municipio de Guadalajara 
select nombre, apellido, tipoSangre, turno, unidadMedica from afiliados 
where unidadMedica in (select claveUnidad from unidadesmedicas
					   where municipio = 'Guadalajara');