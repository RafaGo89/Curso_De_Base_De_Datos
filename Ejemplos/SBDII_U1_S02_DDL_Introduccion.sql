/* Sistemas de Bases de Datos II
   Sesión 2 - DDL Lenguaje de Definición de Datos
   Script 2 - DDL Introducción 
   Irma Rebeca Andalón García
*/

###############################################################
# CREATE. Crear un objeto dentro del gestor de base de datos.
# ALTER. Modificar la estructura de un objeto. 
# DROP. Eliminar un objeto de la base de datos. 
# RENAME: Renombrar objetos.
###############################################################

-- 1. Lista las bases de datos
show databases;

-- 2. Usa la base de datos
use mysql;

-- 3. Nombre de la Base de datos en uso
select database( );

-- 4. Muestra como se creó la base de datos
show create database mysql;

-- 5. Lista las tablas de la base de datos
show tables;

-- 6. Lista las tablas que se han abierto
show open tables;

-- 7. Lista la estructura de la tabla
describe user;

-- 8. Lista la estructura de la tabla
show columns from user;

-- 9. Verifica el estado de la tabla
check table user;

-- 10. Verifica el estado de la tabla
analyze table user;

-- 11. Crea una base de datos
create database dbPrueba;

-- 12. Lista las bases de datos
show databases;

-- 13. Elimina la base de datos
drop database dbPrueba;

## Fin de archivo