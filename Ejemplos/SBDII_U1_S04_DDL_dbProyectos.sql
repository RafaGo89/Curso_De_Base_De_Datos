/* Sistemas de Bases de Datos II
   Sesión 2 - DDL Lenguaje de Definición de Datos
   Script 4 - Creación del Modelo de Datos dbProyecto 
   Irma Rebeca Andalón García
   -----------------------------------------------
   ESQUEMA #2 - DDL dbProyecto
   Crear el esquema de base de datos relacional, 
   con las tablas: S, P, J, SP, SPJ.
   S - Suministradores o Proveedores (tabla primaria)
   P - Productos o Piezas  (tabla primaria)
   J - Proyectos (tabla primaria)
   SP - Suministradores y Productos (tabla secundaria)
   SPJ - Suministradores, Productos, Proyectos (tabla secundaria)
*/

###############################################################
# CREATE. Crear un objeto dentro del gestor de base de datos.
# ALTER. Modificar la estructura de un objeto. 
# DROP. Eliminar un objeto de la base de datos. 
# RENAME: Renombrar objetos.
###############################################################

-- 1. Lista las bases de datos
show databases;

-- 2. Crea una base de datos
create database dbProyecto;

-- 3. Lista las bases de datos
show databases;

-- 4. Elimina la base de datos
drop database dbProyecto;

-- 5. Crea una base de datos
create database dbProyecto;

-- 6. Abre la base de datos
use dbProyecto;

-- 7. Obtiene la base de datos en uso
select database( );

-- 8. Lista las tablas de la base de datos
show tables;

-- 9. Crea la tabla suministra
create table suministra (
     sno char(2), 
     snombre varchar(40), 
     ciudad varchar(15) 
);

-- 10. Lista las tablas de la base de datos
show tables;

-- 11. Modifica la estructura de la tabla (CAMBIA NOMBRE A LA TABLA)
alter table  suministra
      rename suministrador;

-- 12. Cambiar el nombre de la tabla suministrador
rename table suministrador  to  suministradores;

-- 13. Lista la estructura de la tabla
describe suministradores;

-- 14. Obtiene la instrucción con la cual se creo la tabla
show  create table  suministradores;

-- 15. Modifica la estructura de la tabla (CAMBIA NOMBRE A UN CAMPO)
alter table suministradores  
      change ciudad 
      sciudad varchar(20);

describe suministradores;

alter table suministradores
      modify sciudad varchar(30);
      
describe suministradores;

alter table suministradores
      modify sciudad varchar(30);

-- 16. Lista la estructura de la tabla
describe suministradores;

-- 17. Modifica la estructura de la tabla (AGREGA UN CAMPO)
alter table suministradores 
      add situacion INT;

-- 18. Lista la estructura de la tabla
describe suministradores;

-- 19. Modifica la estructura de la tabla (AGREGA UN INDICE)
alter table suministradores 
      add index(snombre);

-- 20. Lista la estructura de la tabla
describe suministradores;

-- 21. Modifica la estructura de la tabla (ELIMINA UN CAMPO)
alter table suministradores 
      drop column situacion;

-- 22. Lista la estructura de la tabla
describe suministradores;

-- 23. Modifica la estructura de la tabla (AGREGA UN CAMPO)
alter table suministradores 
      add situacion INT;

-- 24. Modifica la estructura de la tabla (AGREGA  UNA LLAVE PRIMARIA)
alter table suministradores
      add PRIMARY KEY (sno);

-- 25. Lista la estructura de la tabla
describe suministradores;

-- 26. Cambiar el nombre de la tabla
rename  table  suministradores to S;

-- 27. Crea la tabla tempo 
create table tempo (  
   clave char(2)  
);

-- 28. Lista las tablas de la base de datos
show  tables;

-- 29. Elimina una tabla
drop  table  tempo;

-- 30. Lista las tablas de la base de datos
show  tables;

-- 31. Crea la tabla P
create table P ( 
   pno char(2), 
   pnombre varchar(40), 
   color char(15), 
   peso int, 
   pciudad varchar(20), 
   PRIMARY KEY (pno), 
   KEY( pnombre ASC) 
);

-- 31. Lista la estructura de la tabla
describe P;

-- 32. Crea la tabla  J
create table J ( 
   jno char(2), 
   jnombre varchar(40), 
   jciudad varchar(20), 
   constraint PRIMARY KEY (jno) 
);

-- 33. Crea la tabla SP
create table SP ( 
   sno char(2) not null,
   pno char(2) not null, cant int,
   constraint foreign key(sno) references S(sno)
	     on update cascade  on delete restrict,
   constraint foreign key(pno) references P(pno)
	     on update cascade on delete restrict 
);

-- 34. Crea la tabla SPJ
create table SPJ ( 
   sno char(2) not null,
   pno char(2) not null,  
   jno char(2) not null, 
   cant int,
   constraint foreign key(sno) references S(sno)
		on update cascade  on delete restrict,
   constraint foreign key(pno) references P(pno)
		on update cascade  on delete restrict,
   constraint foreign key(jno) references J(jno)
		on update cascade  on delete restrict 
);

-- 35. Lista las tablas de la base de datos
show tables;

-- 36. Crea un índice en la tabla
create index jnombre on J(jnombre);

-- 37. Lista los índices de la tabla
show index from J;

-- 38. Lista la estructura de la tabla
describe J;

-- 39. Elimina un índice de la tabla
drop index jnombre on J;

-- 40. Lista la estructura de la tabla
describe J;

-- 41. Lista los índices de la tabla
show keys from J;

## Fin de archivo