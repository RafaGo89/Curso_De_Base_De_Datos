-- *****************************
-- Sistemas de Bases de Datos II
-- Semana: 5
-- Script: 11
-- Funciones de Fecha y Hora
-- *****************************

select current_date;
-- 1) Fecha actual 

select current_date();
-- 2) Fecha actual 

select curdate();
-- 3) Fecha actual 

select  curtime();
-- 4) Hora actual 

select  current_time;
-- 5) Hora actual 

select  current_time();
-- 6) Hora actual 

select now();
-- 7) Fecha y hora actual  

select current_timestamp();
-- 8) Fecha y hora actual  

select current_timestamp;
-- 9) Fecha y hora actual  

select date( now( ) );
-- 10) Fecha actual 

select adddate(current_date,30);
-- 11) Fecha actual + 30 días     

select datediff( now( ), adddate(current_date,30) );
-- 12) -30

select date_add(current_date, interval 30 day);
-- 13) Fecha actual + 30 días     

select date_add(current_date, interval 2 week);
-- 14) Fecha actual + 14 días     

select date_add(current_date, interval 3 year);
-- 15) Fecha actual + 3 años     

select date_add(current_date, interval 2 month);
-- 16) Fecha actual + 2 meses     

select date_add(now( ), interval 3 hour);
-- 17) Fecha y hora actual + 3 horas    
 
select date_format( now( ), '%a');
-- 18) Nombre del día de la semana 

select date_format( now( ), '%d');
-- 19) Día en número

select date_format( now( ), '%b');
-- 20) Nombre del mes 

select date_format( now( ), '%w  %/  %m %/  %y');
-- 21) día   mes  año

select date_format( now( ), '%W  %M  %Y');
-- 22) día    mes   año

select date_format( now( ), '%h %: %i %: %s %p');
-- 23) hora:minutos:segundos  AM/PM

select time_format( now( ), '%H  %: %i %: %s');
-- 24) Hora actual en un formato hora:minutos:segundos
 
 select day(current_date);
-- 25) Número de día  

 select dayname(current_date);
-- 26) Nombre del día de la semana 

 select dayofmonth(current_date); 
-- 27) Día del mes  

 select dayofweek(current_date);
-- 28) Día de la semana   

 select dayofyear(current_date);
-- 29) Día del año   

 select last_day(current_date);
-- 30) Último día del mes  

 select hour(now( ));
-- 31) Hora 

 select localtime( );
-- 32) Fecha y hora actual  

 select localtime;
-- 33) Fecha y hora actual  

 select localtimestamp;
-- 34) Fecha y hora actual  

 select localtimestamp( );
-- 35) Fecha y hora actual  

 select makedate(2020,360);
-- 36) Convierte a Fecha 

 select maketime(12,30,45);
-- 37) Convierte a Hora  

 select minute(now( ));
-- 38) Minuto de la hora actual  

 select month(current_date);
-- 39) Número de mes de la fecha actual 

 select monthname(current_date);
-- 40) Nombre del mes de la fecha actual  

 select quarter(current_date);
-- 41) Número de cuarto del año   

 select second(now( ));
-- 42) Segundos de la hora actual  

 select sysdate( );
-- 43) Fecha y hora actual  

 select time(now( ));
-- 44) Hora actual  

 select weekofyear(current_date);
-- 45) Semana del año  

 select year(sysdate( ));
-- 46) Año de la fecha   
 
select  get_format(date, 'USA');
-- 47) formato fecha en Estados Unidos

--- Fin de archivo

