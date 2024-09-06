/* -------------------------------------------------------
   Sistemas de Bases de Datos II
   Sesión 14. Transacciones y Usuarios MySQL
   Script 40. Transacciones, Usuarios y Derechos
   Profesor.. Irma Rebeca Andalón García
   -------------------------------------------------------
*/

###############################################################
## Transacciones
###############################################################

-------------------
-- SESIÓN 1 - root
-------------------

-- Consultar usuarios
select user from mysql.user;

-- 1) Crear un usuario y asignarle password
CREATE USER 'juan'@'localhost' 
IDENTIFIED BY 'juanpass';

-------------------
-- SESIÓN 2 - juan
-------------------
-- Abrir otra sesión de mysql
-- cd \program files\mysql\mysql server 8.0\bin
-- mysql -u juan -p

-- No es posible Abrir una base de datos
use dbrh;

-------------------
-- SESIÓN 1 - root
-------------------
-- 2) Otorgar al usuario juan privilegios
GRANT select, insert 
ON dbRH.* 
TO 'juan'@'localhost' ;

-------------------
-- SESIÓN 2 - juan
-------------------
-- Ya es posible Abrir una base de datos
use dbrh;

-------------------
-- SESIÓN 1 - root
-------------------
-- Establecer nivel de aislamiento para la sesión
set session transaction isolation level read uncommitted;

-- Desactivar modo autocommit 
set autocommit = 0;

-- Consultar la tabla continentes
select * from regions;

-- Iniciar transacción
start transaction;

insert into regions
    values (5,'Continente 5');

select * from regions;

-------------------
-- SESIÓN 1 - root
-------------------
insert into countries
    values ('MX','Mexico',2);

select * from regions;

select * from countries;

------------------
-- SESIÓN 2 - juan
-------------------
select * from regions;

select * from countries;

-- Cerrar sesión
exit

-- Volver a entrar

-- Establecer nivel de aislamiento para la sesión
set session transaction isolation level read uncommitted;

use dbrh;

select * from regions;

select * from countries;

-------------------
-- SESIÓN 1 - root
-------------------
rollback;

select * from regions;

select * from countries;

start transaction;

insert into regions
    values (5,'Continente 5');

insert into countries
    values ('MX','Mexico',2);

select * from regions;

select * from countries;

------------------
-- SESIÓN 2 - juan
-------------------
select * from regions;

select * from countries;

-------------------
-- SESIÓN 1 - root
-------------------
commit;

------------------
-- SESIÓN 2 - juan
-------------------
select * from regions;

select * from countries;


###############################################################
## Usuarios y Derechos
###############################################################

-- 3) Crear un usuario y asignarle password
CREATE USER 'rebeca'@'localhost' 
IDENTIFIED BY 'andalon';

-- 4) Otorgar al usuario rebeca privilegios
GRANT ALL PRIVILEGES 
ON *.* 
TO 'rebeca'@'localhost'
WITH GRANT OPTION;

-- 5) Mostrar privilegios de usuarios
SHOW GRANTS for 'juan'@'localhost';

-- 6) Revocar derechos a usuarios
REVOKE INSERT 
ON  dbRH.* 
FROM 'juan'@'localhost';

-- 7) Revocar derechos a usuarios
REVOKE SELECT 
ON dbRH.* 
FROM 'juan'@'localhost';

-- 8) Eliminar un usuario de un servidor de bases de datos
DROP USER 'juan'@'localhost';

-- 9) Eliminación de usuarios de todos los servidores
DROP USER juan;

-- 10) Actualiza la tabla de privilegios de los usuarios
FLUSH PRIVILEGES;

-- Fin de Archivo