-- **********************************
-- Sistemas de Bases de Datos II
-- Semana: 5
-- Script: 12
-- Funciones y Operadores Matemáticos
-- **********************************

select mod(29,9);
-- 1) Operador módulo 

select oct(12);
-- 2) 12 en octal 

select bin(12);
-- 3) 12 en binario 

select abs(-8);
-- 4) Valor absoluto 

select acos(0);
-- 5) Función trigonométrica arco coseno 

select asin(0);
-- 6) Función trigonométrica arco seno 

select atan(0);
-- 7) Función trigonométrica arco tangente 

select ceiling(5.23);
-- 8) Entero más pequeño mayor que el número 

select ceil(5.23);
-- 9) Entero más pequeño mayor que el número 

select cos(0);
-- 10) Función trigonométrica  coseno 

select cot(1);
-- 11) Función trigonométrica cotangente 

select exp(1);			
-- 12) Elevar al exponente base e  2.7182 …

select floor(2.65);
-- 13) Entero más grande menor que el número 2

select ln(2.718281828459);
-- 14) Logaritmo natural base e  1.0000 …

select log(2.718281828459);
-- 15) Logaritmo natural base  e, es  1.0000

select log(2,16);
-- 16) Logaritmo del número 16 en base 2 es 4

select log(10,1000);
-- 17) Logaritmo del número 1000 en base 10  es  3

select PI( );
-- 18) PI     3.141593

select  power(2,3);
-- 19) Elevar base 2 al exponente 3  es 8

select  rand( );		
-- 20) Genera un número aleatorio

select  rand(2);		
-- 21) Genera un número aleatorio con semilla 2

select  round(4.56);
-- 22) Redondea   5

select  round(4.26);
-- 23) Redondea   4

select sign(-2);
-- 24) Signo -1 (negativo)

select sign(2);
-- 25) Signo 1 (positivo)

select sign(0);
-- 26) Signo 0 (cero)

select sin(1);
-- 27) Función trigonométrica  seno 0.8414 …

select tan(1);
-- 28) Función trigonométrica  tangente 1.5574

select sqrt(64);
-- 29) Raíz cuadrada 8

select truncate(1.234567,4);
-- 30) Trunca el número a 4 decimales 1.2345

select truncate(1.234567,5);
-- 31) Trunca el número a 5 decimales 1.23456

select truncate(1.234567,3);
-- 32) Trunca el número a 3 decimales 1.234

select (4+1)*5;
-- 33) Evalúa la expresión 25

select 1 + 2 * 3;
-- 34) 7

select (1+2) * 3;
-- 35) 9

select 3 – 5;
-- 36) -2

select  -  ( - 5 );
-- 37) 5

select  3 / 5;
-- 38) 0.6000

select  5 / (1-1);
-- 39) Null.  División entre cero no existe

select  5  div 2 ;
-- 40) División entera 2

select  5  mod 2 ;
-- 41) Operador módulo 1

select  5  %  2 ;
-- 42) Operador módulo 1

-- Fin del script