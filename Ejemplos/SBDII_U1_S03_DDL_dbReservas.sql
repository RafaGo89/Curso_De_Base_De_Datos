/* Sistemas de Bases de Datos II
   Sesión 2 - DDL Lenguaje de Definición de Datos
   Script 3 - Creación del Modelo de Datos dbReservas  
   Irma Rebeca Andalón García
   -----------------------------------------------
   ESQUEMA #1 - DDL dbReservas
   Crear el esquema de base de datos relacional, 
   con las tablas: clientes, coches, reservas y agencias.
*/

###############################################################
# CREATE. Crear un objeto dentro del gestor de base de datos.
# ALTER. Modificar la estructura de un objeto. 
# DROP. Eliminar un objeto de la base de datos. 
# RENAME: Renombrar objetos.
###############################################################

--  1. Lista las bases de datos
show databases;

--  2. Crea una base de datos con el nombre de dbReservas
create database dbReservas;

--  3. Abre por omisión la base de datos
use dbReservas;

--  4. Crea la tabla clientes
create table clientes (
   codCli char(5), 
   DNI int unsigned not null AUTO_INCREMENT, 
   nomCli char(40), 
   domCli char(45), 
   telCli char(15), 
   codAval char(5), 
   PRIMARY KEY (codCli),  
   KEY(DNI),  
   KEY(nomCli ASC), 
   constraint foreign key(codAval) references clientes(codCli) 
      on  update  cascade   on  delete  restrict
);

--  5. Lista las tablas de la base de datos
show tables;

--  6. Lista la estructura de la tabla
describe clientes;

--  7. Crea la tabla agencias
create table agencias (
   codAge char(10), 
   nomAge char(40), 
   constraint   PRIMARY   KEY (codAge) 
); 

--  8. Crea la tabla reservas
create table reservas (
   codRes int unsigned not null AUTO_INCREMENT, 
   fec_ini date, 
   fec_fin date, 
   pag_total real(12,2), 
   indicador enum('S','N') default 'N', 
   codCli char(5), 
   codAge char(10), 
   constraint primary key(codRes), 
   constraint foreign key(codCli) references clientes(codCli), 
   constraint foreign key(codAge) references agencias(codAge) 
       on update cascade on delete restrict
);

--  9. Obtiene la instrucción con la cual se creo la tabla
show create table reservas;

--  10. Lista la estructura de la tabla
describe reservas;

--  11. Lista la estructura de la tabla
describe clientes;

--  12. Elimina un índice de la tabla
drop index  nomcli  on  clientes;

--  13. Lista la estructura de la tabla
describe clientes;

--  14. Modifica la estructura de la tabla (ELIMINA UNA LLAVE FORÁNEA)
alter table reservas  
      drop foreign key reservas_ibfk_1;

--  15. Obtiene la instrucción con la cual se creó la tabla
show  create  table  reservas;

--  16. Modifica la estructura de la tabla (AGREGA LLAVE FORÁNEA CON REGLA INTEGRIDAD)
alter table  reservas  
      add foreign key(codcli) references clientes( codcli) 
	      on  delete  restrict  on  update   cascade;

-- 17. Obtiene la instrucción con la cual se creó la tabla
show  create  table  reservas ;

-- 18. Crea la tabla coches
create table coches (
   matricula char(10), 
   modelo char(20), 
   color enum('ROJO','VERDE','NEGRO','AZUL','BLANCO'), 
   marca char(12),
   precio_alquiler float, 
   codRes int unsigned, 
   l_gasolina int DEFAULT 10, 
   garaje enum('A','B','C'), 
   PRIMARY KEY(matricula), 
   constraint foreign key(codres) references reservas(codres) 
      on update cascade on delete restrict
);

-- 19. Muestra las tablas de la Base de Datos en uso
show tables;

## Fin de archivo