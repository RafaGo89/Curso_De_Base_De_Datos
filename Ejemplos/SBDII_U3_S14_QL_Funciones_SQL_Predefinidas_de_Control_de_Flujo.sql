-- **********************************
-- Sistemas de Bases de Datos II
-- Semana: 5
-- Script: 14
-- Funciones de Control de Flujo
-- **********************************

select  if (1<2, '1 es menor que 2', '1 no es menor que 2');
-- 1) Obtiene el resultado de la estructura de control if  es menor

select first_name, job_id, if(job_id = 'IT_PROG', "Es programador", "No es programador")
	from employees;

select if (12<2, 'es menor', 'no es menor');
-- 2) Obtiene el resultado de la estructura de control if   no es menor

select if ( strcmp('Hola','Holas'), 'no iguales', 'iguales');
-- 3) Obtiene el resultado de la estructura de control if   no iguales

select if ( strcmp('Hola','Hola'), 'no iguales', 'iguales');
-- 4) Obtiene el resultado de la estructura de control if   iguales

select  if (0.1, 1, 0);
-- 5) Obtiene el resultado de la estructura de control if   1

select case 2
 when 1 then 'uno'
 when 2 then 'dos'
 else 'otro'
end;
-- 6) Obtiene el resultado de la estructura de control case  dos


-- Fin del script