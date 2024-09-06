/* Sistemas de Bases de Datos II
   Semana 3. DML-Lenguaje de Manipulación de Datos
   Script 6 - Manipulación de datos en las Tablas  
   Profesor: Irma Rebeca Andalón García
   -----------------------------------------------
   ESQUEMA #2 - DML dbProyectos
   Agregar, eliminar y modificar datos en las  
   tablas: j, p, s, sp, spj
*/

###############################################################
# INSERT. Agregar registros en las Tablas.
# UPDATE. Modificar los datos de los registros en las Tablas. 
# DELETE. Eliminar registros en las Tablas. 
###############################################################

-- 1. Lista las bases de datos
show databases;

-- 2. Abrir o Usar la base de datos
use dbProyecto;

-- 3. Mostrar las tablas de la base de datos
show tables;

-- ==================================================
-- 1) TABLA  S
-- ==================================================

-- 4. Lista los datos de la tabla. Empty set – no tiene datos 
select * from S;		

-- 5. Consultar la estructura de la tabla 
describe S;		

-- 6. Agrega un registro a la tabla
insert into S (Sno, Snombre, Situacion, Sciudad)
       values ('S1','SALAZAR',20,'LONDREEES');

-- 7. Actualiza el contenido de la tabla bajo cierta condición
update S 
	set Sciudad='LONDRES' 
	where sno='S1';

-- 8. Agrega un registro a la tabla
insert into S (Sno, Snombre, Situacion, Sciudad)
       values ('S2','JAIMES',10,'PARIS');

-- 9. Agrega un registro a la tabla
insert into S (Sno, Snombre, Situacion, Sciudad)
       values ('S3','BERNAL',30,'PARIS');

-- 10. Lista los registros de la tabla
select  *  from  S;  

-- 11. Crea una tabla a partir de una consulta
create  table  temporal  
		select  *  from  S;

-- 12. Lista las tablas de la base de datos
show tables;

-- 13. Lista los registros de la tabla
select  *  from  temporal;

-- 14. Lista la estructura de la tabla
describe temporal;

-- 15. Eliminar el registro bajo cierta condición 
delete from temporal  
		where sno='S1';

-- 16. Lista los registros de la tabla
select  *  from  temporal;

-- 17. Eliminar los registros bajo cierta condición 
delete  from  temporal 
		where  sciudad='PARIS';

-- 18. Agrega registros a la tabla a partir de una consulta
insert into temporal  
		select  *  from S;

-- 19. Lista los registros de la tabla
select  *  from  temporal;

-- 20. Lista los registros de la tabla
select  *  from  S;

-- ==================================================
-- 2) TABLA  P
-- ==================================================

-- 21. Lista los registros de la tabla. Empty set – no tiene datos 
select * from P;		

-- 22. Consultar la estructura de la tabla 
describe P;		

-- 23. Agrega un registro a la tabla
insert  into  P  
		values('P1','TUERCA','ROJO',12,'LONDRES');

-- 24. Agrega un registro a la tabla
insert  into  P  
		values('P2','PERNO','VERDE',17,'PARIS');

-- 25. Lista los registros de la tabla
select  *  from  P;

-- ==================================================
-- 3) TABLA  J
-- ==================================================

-- 26. Lista los registros de la tabla. Empty set – no tiene datos 
select * from J;		

-- 27. Consultar la estructura de la tabla 
describe J;		

-- 28. Agrega un registro a la tabla
insert into J 
		values('J1','Clasificador','Paris');

-- 29. Agrega un registro a la tabla
insert into J 
		values('J2','Perforadora','Roma');

-- 30. Lista los registros de la tabla
select * from J;

-- ==================================================
-- 4) TABLA  SP
-- ==================================================

-- 31. Lista los registros de la tabla. Empty set – no tiene datos 
select * from SP;		

-- 32. Consultar la estructura de la tabla 
describe SP;		

-- 33. Agrega un registro a la tabla
insert into SP values('S1','P1',500);

-- 34. Agrega un registro a la tabla
insert into SP values('S2','P2',700);

-- 35. Lista los registros de la tabla
select  *  from SP;

-- ==================================================
-- 5) TABLA  SPJ
-- ==================================================

-- 36. Lista los registros de la tabla. Empty set – no tiene datos 
select * from SPJ;		

-- 37. Consultar la estructura de la tabla 
describe SPJ;		

-- 38. Agrega un registro a la tabla
insert into SPJ 
		values('S1','P1','J1',200);

-- 39. Agrega un registro a la tabla (NO es posible, No existe J4 en la tabla J)
--     Constraint PK  FK, lo agregaremos posteriormente
insert into SPJ 
		values('S1','P1','J4',700);

-- 40. Lista los registros de la tabla
select * from SPJ;

-- ===================================
-- 1) Completar los datos tabla S
--    Agregar 2 registros más
-- ===================================

-- 41. Agrega un registro a la tabla
insert into  S (Sno, Snombre, Situacion, Sciudad) 
		values ('S4','CORONA',20,'LONDRES');

-- 42. Agrega un registro a la tabla
insert into  S (Sno, Snombre, Situacion, Sciudad) 
		values ('S5','ALDANA',30,'ATENAS');

-- 43. Lista los registros de la tabla (5 registros)
select * from S;

-- ===================================
-- 2) Completar los datos tabla P
--    Agregar 4 registros más
-- ===================================

-- 44. Agrega un registro a la tabla
insert into P values( 'P3','BIRLO','AZUL',17,'ROMA');

-- 45. Agrega un registro a la tabla
insert into P values( 'P4','BIRLO','ROJO',14,'LONDRES');

-- 46. Agrega un registro a la tabla
insert into P values( 'P5','LEVA','AZUL',12,'PARIS');

-- 47. Agrega un registro a la tabla
insert into P values( 'P6','ENGRANE','ROJO',19,'LONDRES');

-- 48. Lista los registros de la tabla (6 registros)
select * from P;

-- ===================================
-- 3) Completar los datos tabla J
--    Agregar 6 registros más
-- ===================================

-- 49. Agrega un registro a la tabla
insert into J values( 'J3','LECTORA','ATENAS');

-- 50. Agrega un registro a la tabla
insert into J  values( 'J4','CONSOLA','ATENAS');

-- 51. Agrega un registro a la tabla
insert into J values( 'J5','COMPAGINADOR','LONDRES');

-- 52. Agrega un registro a la tabla
insert into J values( 'J6','TERMINAL','OSLO');

-- 53. Agrega un registro a la tabla
insert into J values( 'J7','CINTA','LONDRES');

-- 54. Agrega un registro a la tabla
insert into J values( 'J8','GRABADORA','ROMA');

-- 55. Lista los registros de la tabla (8 registros)
select * from J;

-- ===================================
-- 4) Completar los datos tabla SP
--    Agregar 12 registros más
-- ===================================

-- 56. Agrega varios registros a la tabla
insert into SP values 
('S2','P3',850),
('S3','P4',900),   
('S2','P5',1100),
('S5','P6',650),
('S5','P1',890),
('S5','P2',500),
('S3','P2',60), 
('S4','P2',1200),
('S5','P4',1115),
('S5','P5',2005),
('S5','P3',1510),
('S2','P6',990);

-- 57. Lista los registros de la tabla (14 registros)
select * from SP;

-- ===================================
-- 5) Completar los datos tabla SPJ
--    Agregar 23 registros más
-- ===================================

-- 58. Agregar llave primaria compuesta a la tabla SPJ, para poder editar tabla
alter table SPJ 
      add primary key(sno, pno, jno);

-- 59. Agrega varios registros a la tabla
insert into SPJ  values 
('S1','P1','J4',700),
('S1','P1','J8',450),
('S2','P3','J1',400),
('S2','P3','J2',200),
('S2','P3','J3',200),
('S2','P3','J4',500),
('S2','P3','J5',600),
('S2','P3','J6',400),
('S2','P3','J7',800),
('S2','P5','J2',100),
('S3','P3','J1',200),
('S3','P4','J2',500),
('S4','P6','J3',300),
('S4','P6','J7',300),
('S5','P1','J4',100),
('S5','P2','J2',200),
('S5','P2','J4',100),
('S5','P3','J4',200),
('S5','P4','J4',800),
('S5','P5','J4',400),
('S5','P5','J5',500),
('S5','P5','J7',100),
('S5','P6','J4',500);

-- 60. Lista los registros de la tabla (24 registros)
select * from SPJ;

-- ====================================================