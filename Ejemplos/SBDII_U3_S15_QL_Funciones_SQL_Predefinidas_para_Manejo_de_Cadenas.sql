-- **********************************************
-- Sistemas de Bases de Datos II
-- Semana: 5
-- Script: 15
-- Funciones para Manejo de Cadenas de Caracteres
-- **********************************************

select  ASCII('A');
-- 1) Obtiene el código ascii   65

select  bit_length('Hola');
-- 2) Obtiene la longitud en bits  32 (8 x 4)

select  bit_length('H');
-- 3) Obtiene la longitud en bits  8 (8 x 1)

select  cast(char(65) as char);
-- 4) Obtiene el carácter con ese código ASCII   A

select  char_length('hola mundo');
-- 5) Obtiene la longitud en caracteres 10

select  repeat('a',10);
-- 6) Repite el carácter n veces  aaaaaaaaaa

select  concat('hola ','mundo');
-- 7) Concatenar cadenas 'hola mundo'

select  conv('14',8,2);
-- 8) Convierte el número 14 de base 8 a base 2    1100

select  find_in_set('juan','maria,pedro,juan,lupita');
-- 9) Localiza 'juan' en la lista   3

select  find_in_set('juan','juan,maria,pedro,lupita');
-- 10) Localiza 'juan' en la lista   1

select  insert('MEXICO',4,2,'GDL');
-- 11) Substituye a partir de la posición 4, 2 caracteres   MEXGDLO

select  insert('MEXICO',4,0,'GDL');
-- 12) Substituye a partir de la posición 4, 0 caracteres   MEXGDLICO

select  insert('MEXICO',4,100,'GDL');
-- 13) Substituye a partir de la posición 4, 100 caracteres   MEXGDL

select  instr('MEXICO','XI');
-- 14) Localiza la segunda cadena en la  primera. Regresa la posición  3

select  instr('MEXICO','CO');
-- 15) Localiza la segunda cadena en la  primera. Regresa la posición  5

select  lower('ADMINIstracion');
-- 16) Convierte a minúscula la cadena  administracion

select  lcase('ADMINIstracion');
-- 17) Convierte a minúscula la cadena  administracion

select length('HOLA');
-- 18) Obtiene la longitud en caracteres 4

select locate('laja','Guadalajara');
-- 19) Localiza la primer cadena en la segunda. Regresa la posición  6

select position('laja' in 'Guadalajara');
-- 20) Localiza la primer cadena en la segunda. Regresa la posición  6

select ltrim('    Mexico');
-- 21) Quita los blancos a la izquierda 'Mexico'

select mid('AMIGOS',2,2);
-- 22) Obtiene una subcadena, a partir de la posición 2, 2 caracteres  MI

select substring('AMIGOS',2,2);
-- 23) Obtiene una subcadena, a partir de la posición 2, 2 caracteres  MI

select substring('AMIGOS' from 2 for 2);
-- 24) Obtiene una subcadena, a partir de la posición 2, 2 caracteres  MI

select substring('AMIGOS',2);
-- 25) Obtiene la subcadena a partir de la posición 2   MIGOS

select substring('AMIGOS' from 2);
-- 26) Obtiene la subcadena a partir de la posición 2   MIGOS

select repeat ('HOLA',3);
-- 27) Repite la cadena 3 veces HOLAHOLAHOLA

select replace('MAMA','A','I');
-- 28) Reemplaza las A por I  en la cadena  MIMI

select reverse('123'); 
-- 29) Obtiene la cadena invertida  321

select right('holaamigos',6);
-- 30) Obtiene los 6 caracteres de la derecha   amigos

select rtrim('Jalisco    ');
-- 31) Quita los blancos de la derecha 'Jalisco'

select space(5);
-- 32) Obtiene 5 espacios  _____

select trim('    respeto   ');
-- 33) Quita los blancos de ambos lados 'respeto'

select ucase('vida');
-- 34) Convierte a mayúscula   VIDA

select upper('vida');
-- 35) Convierte a mayúscula   VIDA

select 1 + '1';	
-- 36) Convierte a número la cadena  2

select concat(1,'1');			
-- 37) Convierte a cadena el número 11

select 25.5, cast(25.5 as char);
-- 38) Convierte de flotante a carácter

select  'CHIHUAHUA'  LIKE   'CH_H%';
-- 39) Busca un patrón _(1 carácter)  %(Cualquier carácter)    1(verdad)

select  'CHIHUAHUA'  LIKE   'CH_H_';
-- 40) Busca un patrón _(1 carácter)  %(Cualquier carácter)    0(falso)

select  'VERDAD!'  LIKE   'VERDAD\_';
-- 41) Busca un patrón _(1 carácter)  %(Cualquier carácter)    0(falso)

select  'VERDAD_'  LIKE   'VERDAD\_';
-- 42) Busca un patrón _(1 carácter)  %(Cualquier carácter).   1(verdad)

select  'VERDAD%'  LIKE   'VERDAD\%';
-- 43) Busca un patrón _(1 carácter)  %(Cualquier carácter)    1(verdad)

select  'paz'  LIKE  'PAZ';
-- 44) Busca un patrón _(1 carácter)  %(Cualquier carácter)    1(verdad)

select  'paz'  LIKE  BINARY  'PAZ';
-- 45) Busca un patrón _(1 carácter)  %(Cualquier carácter)    0(falso)

select   strcmp('amor','amor');
-- 46) Compara las cadenas 0(iguales)

select   strcmp('amar','amor');
-- 47) Compara las cadenas -1(menor)

select   strcmp('amor','amar');                  
-- 48) Compara las cadenas 1(mayor)

-- Fin del script