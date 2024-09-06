-- ***********************************************
-- Sistemas de Bases de Datos II
-- Semana: 5
-- Script: 13
-- Funciones y Operadores de Comparación y Lógicos
-- ***********************************************

select  2 = 2;
-- 1) Compara 1 (verdad)

select 6 / 0;
-- Compara NULL (Unknown)
select 2 > 2;
-- 2) Compara 0 (falso)

select 2 < 2;
-- 3) Compara 0 (falso)

select 2 <> 2;
-- 4) Compara 0 (falso)

select 2 != 2;
-- 5) Compara 0 (falso)

select 2 >= 2;
-- 6) Compara 1 (verdad)

select 1 is TRUE, 0 is FALSE, NULL is UNKNOWN;
-- 7) Compara 1 (verdad), 1 (verdad), 1 (verdad)

select 1 between 2 and 3; 
-- 8) Compara 0 (falso)

select 'b' between 'a' and 'c';
-- 9) Compara 1 (verdad)

select greatest( 2, 0, 4, 3);
-- 10) El mayor de todos 4

select greatest(2.4, 8.7, 5.3);
-- 11) El mayor de todos 8.7

select greatest('B','A','C');
-- 12) El mayor de todos C

select  2 in  (0,3,4,5,6,9);
-- 13) Compara si está en el conjunto 0 (falso)

select 'A' in (0,3,'A',5,6,9);
-- 14) Compara si está en el conjunto 1 (verdad)

select isnull(1/0);
-- 15) Compara si es nulo 1 (verdad)

select isnull(1/1);
-- 16) Compara si es nulo 0 (falso)

select least( 2, 0, 4, 3 );
-- 17) Obtiene el menor de todos 0

select least( 2.4, 8.7, 5.3 );
-- 18) Obtiene el menor de todos 2.4

select least( 'B', 'A', 'C' );
-- 19) Obtiene el menor de todos A

select 1 && 1;
-- 20) Obtiene el resultado del operador lógico and  1(verdad)

select 1 and 0;
-- 21) Obtiene el resultado del operador lógico and  0(falso)

select not 5;
-- 22) Obtiene la negación 0(falso)

select not 0;
-- 23) Obtiene la negación 1(verdad)

select  1 OR 0 ;
-- 24) Obtiene el resultado del operador lógico or  1(verdad)

select  0 || 0 ;
-- 25) Obtiene el resultado del operador lógico or  0(falso)

select  1 XOR 1;
-- 26) Obtiene el resultado del operador lógico xor  0(falso)

select  0 XOR 1;
-- 27) Obtiene el resultado del operador lógico xor  1(verdad)

-- Fin del script