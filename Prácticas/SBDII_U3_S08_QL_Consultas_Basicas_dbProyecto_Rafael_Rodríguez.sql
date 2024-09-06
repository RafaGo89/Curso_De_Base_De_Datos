-- Jueves 15 de febrero del 2024
-- Rafael Rodríguez Gómez
-- ACTIVIDAD #4 - Consultas Básicas dbProyecto
-- Elabora en un script las 10 consultas del Esquema de Datos "dbProyecto"

-- dbProyecto
use dbProyecto;

-- 1. Obtener todos los datos de los suministradores (tabla S).
select * from s;

-- 2. Obtener el nombre y número de los suministradores (tabla S).
select sno, snombre from s;

-- 3. Obtener los números de pieza diferentes -sin repetir- (tabla SP).
select pno from sp group by pno;

-- 4. Obtener los números de pieza y el peso de las piezas (tabla P),
-- ordenados por peso.
select pno, peso from p order by peso desc;

-- 5. Obtener los nombres y ciudades de los suministradores (tabla
-- S), ordenados por ciudad y nombre en forma ascendente.
select sciudad, snombre from s order by sciudad ASC, snombre ASC;

-- 6. Obtener el número de suministrador, ciudad y situación (tabla
-- S) de la ciudad de ‘Paris’ y con una situación mayor que 20.
select sno, sciudad, situacion from s where sciudad = "Paris"
	and situacion > 20;
    
-- 7. Obtener número de suministrador, ciudad y situación (tabla S),
-- donde la ciudad sea ‘Paris’, ordenados por número de
-- suministrador.
select sno, sciudad, situacion from s where sciudad in ("Paris")
	order by sno asc;
    
-- 8. Obtener todos los datos de las piezas (tabla P), donde el
-- nombre de la pieza empiece con B y el nombre de la ciudad no
-- tenga alguna E.
select * from p where pnombre like "B%" and pciudad not like "%E%";

-- 9. Obtener el número de suministrador y la cantidad (tabla SP)
-- ordenados por número de suministrador en forma
-- descendente para aquellos cuya cantidad sea igual a 500.
select sno, cant from sp where cant = 500 order by sno desc;

-- 10. Obtener el nombre y color de todas las piezas (tabla P),
-- desplegadas en un solo campo con alias.
select concat(pnombre, "-", color) as "Pieza-color" from p;