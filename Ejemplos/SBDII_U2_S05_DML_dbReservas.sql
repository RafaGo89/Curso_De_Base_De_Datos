/* Sistemas de Bases de Datos II
   Semana 3. DML-Lenguaje de Manipulación de Datos
   Script 5 - Manipulación de datos en las Tablas  
   Profesor: Irma Rebeca Andalón García
   -----------------------------------------------
   ESQUEMA #1 - DML dbReservas
   Agregar, eliminar y modificar datos en las  
   tablas: clientes, coches, reservas y agencias.
*/

###############################################################
# INSERT. Agregar registros en las Tablas.
# UPDATE. Modificar los datos de los registros en las Tablas. 
# DELETE. Eliminar registros en las Tablas. 
###############################################################

-- 1. Lista las bases de datos
show databases;

-- 2. Abrir o Usar la base de datos
use dbReservas;

-- 3. Mostrar las tablas de la base de datos
show tables;

-- ==================================================
-- 1) TABLA  CLIENTES
-- ==================================================

-- 4. Mostrar los registros de la tabla clientes
select * from clientes;

-- 5. Agrega un registro a la tabla
insert into clientes(CodCli, NomCli, DomCli, TelCli) 
values ('CL001', 'Francisco Gomez', 'Hidalgo 345', '123-456-456');

-- 6. Agrega un registro a la tabla
insert into clientes 
set CodCli='CL002', NomCli='Roberto Arreola',  DomCli='Juarez 456', TelCli='789-567??56';

-- 7. Lista los registros de la tabla (2 registros)
select * from clientes;

-- ==================================================
-- 2) TABLA  AGENCIAS
-- ==================================================
-- 8. Agrega un registro a la tabla
insert into agencias 
		values( 'AGE-01', 'DAOSA PLAZA PALOMAR');

-- 9. Agrega un registro a la tabla
insert into agencias 
		values( 'AGE-02', 'AUTOMOTORES CHAPALITA');

-- 10. Agrega un registro a la tabla
insert into agencias values( 'AGE-03', 'COVAL');

-- 11. Lista los registros de la tabla (3 registros)
select * from agencias;   

-- ==================================================
-- 3) TABLA  COCHES
-- ==================================================

-- 12. Agrega un registro a la tabla
insert into coches(matricula, modelo, color, marca, precio_alquiler, garaje)
 values('HGF-123','STRATUS 2015','ROJO','CHRYSLER',570,'A');

-- 13. Agrega un registro a la tabla
insert into coches(matricula, modelo, color, marca, precio_alquiler, garaje)
  values('DEF-123','PICKUP 2004','ROJO','CHRYSLER',500,'B');

-- 14. (ERROR) Al agregar un registro a la tabla, NO permite garaje Z, sólo A,B,C
insert into coches (matricula, modelo, color, marca, precio_alquiler, garaje)
 values('ABC-123','MONZA 2003', 'NEGRO','CHRYSLER',300,'Z');

-- 15. (OK) Agrega un registro a la tabla
insert into coches(matricula, modelo, color, marca, precio_alquiler, garaje)
 values('ABC-123','MONZA 2003','NEGRO','CHRYSLER',300,'B');

-- 16. Lista los registros de la tabla coches (3 registros)
select  *  from  coches;

-- ==================================================
-- 4) TABLA  RESERVAS
-- ==================================================

-- 17. Agrega un registro a la tabla
insert into reservas( fec_ini, fec_fin, codcli, codage)
	values('2021/9/1','2021/9/22','CL001','AGE-01');

-- 18. Lista los registros de la tabla
select  *  from  reservas;

-- ==================================================
-- Cláusula UPDATE
-- ==================================================

-- 19. Update, actualiza el contenido de la tabla bajo cierta condición
--     Modifica el teléfono del cliente con código CL002
update clientes 
		set  telCli='789-567-456' 
		where CodCli='CL002';

-- 20. Lista los registros de la tabla
select * from clientes;

-- 21. Lista los registros de la tabla
select * from reservas;

-- 22. Modifica el código del cliente en la tabla clientes y por 
--     integridad referencial, se MODIFICA EN CASCADA en la tabla reservas
update clientes 
		set codcli='CL003' 
		where codcli='CL001';

-- 23. Lista los registros de la tabla
select * from clientes;

-- 24. Lista los registros de la tabla
select * from reservas;

-- ==================================================
-- Cláusula DELETE
-- ==================================================

-- 25. Intenta eliminar un cliente (integridad referencial NO permite) 
--     RESTRINGE porque el cliente CL003 tiene reservaciones
delete  from  clientes  where codcli='CL003';

-- 26. Intenta eliminar el cliente CL002 (integridad referencial SÍ permite)
delete  from  clientes  where codcli='CL002';

-- 27. Lista los registros de la tabla
select  *  from  clientes;

-- 28. Agrega un registro a la tabla
insert into clientes(CodCli, NomCli, DomCli, TelCli)
       values ('CL001', 'Gerardo Lopez', 'Juarez 322', '32-42342354');

-- 29. Agrega un registro a la tabla
insert into clientes(CodCli, NomCli, DomCli, TelCli)
values ('CL002', 'Carlos fuentes', 'Alcalde 444', '444-456-456');

-- 30. Lista los registros de la tabla clientes (3 registros)
select * from clientes;

-- 31. Agrega un registro a la tabla
insert into reservas( fec_ini, fec_fin, codcli, codage)
		values('2021/08/15','2021/09/30','CL001','AGE-01');

-- 32. Agrega un registro a la tabla
insert into reservas( fec_ini, fec_fin, codcli, codage)
		values('2021/08/17','2021/08/30','CL002','AGE-01');

-- 33. Lista los registros de la tabla reservas (3 registros)
select * from reservas; 	

-- ==================================================
