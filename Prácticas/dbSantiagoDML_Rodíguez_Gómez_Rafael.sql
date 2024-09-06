/* Sistemas de Bases de Datos II
   ACTIVIDAD #3 - DML  dbSantiago 
   Rafael Rodríguez Gómez
*/

-- 1 Seleccionamos la base de datos
use dbsantiago;

-- 2 Insertamos datos en la tabla CAMINO
insert into camino values ("Camino Frances", 764, 5.5);

insert into camino values ("Camino Portugues", 620, 4.5);

insert into camino values ("Camino del norte", 824, 8);

insert into camino values ("Camino Primitivo", 313, 2);

insert into camino values ("Camino Ingles", 119, 1.5);

-- 3 Insertamos datos en la tabla PEREGRINO
insert into peregrino values (1, "Georgina Ramirez", "Prolongación medrano 145");

insert into peregrino values (2, "Juan Gomez", "Andador del bosque 78");

insert into peregrino values (3, "Felipe Rodriguez", "Calle Constitución 70");

insert into peregrino values (4, "Natalia Valdez", "Calle Hidalgo 9");

insert into peregrino values (5, "Luis Mendoza", "Calle Revolucion 89");

-- 4 Insertamos datos en la tabla CIUDADES
insert into ciudades values ("Pamplona", "Asturias", 45789);

insert into ciudades values ("Roncesvalles", "Zubiri", 45009);

insert into ciudades values ("San sebastian", "Deba", 43798);

insert into ciudades values ("Markina", "Gernika", 45700);

insert into ciudades values ("Coruña", "Portugalete", 42789);

-- 5 Insertamos datos en la tabla ALBERGUE
insert into albergue values ("El rinconcito", 5000, 800, "Coruña");

insert into albergue values ("El desamparado", 5500, 750, "Markina");

insert into albergue values ("El Peregrinito", 3900, 500, "Coruña");

insert into albergue values ("Casa Pedro", 4000, 890, "Roncesvalles");

insert into albergue values ("Casa hopedaje San sebastian", 7000, 100, "San sebastian");

-- 6 Insertamos datos en la tabla RECORRIDO
insert into recorrido values ("Camino del norte", 1, "Coruña");

insert into recorrido values ("Camino frances", 2, "Pamplona");

insert into recorrido values ("Camino del norte", 3, "San sebastian");

insert into recorrido values ("Camino ingles", 4, "Coruña");

insert into recorrido values ("Camino Primitivo", 5, "Markina");

-- 7 Insertamos datos en la tabla ETAPA
insert into etapa values ("Camino Primitivo", 1, 200, 1.2, "Markina", "Pamplona");

insert into etapa values ("Camino ingles", 2, 150, 1.5, "Coruña", "San sebastian");

insert into etapa values ("Camino frances", 3, 100, 2.3, "Pamplona", "Roncesvalles");

insert into etapa values ("Camino del norte", 4, 200, 2.5, "Markina", "San sebastian");

insert into etapa values ("Camino ingles", 5, 150, 3, "Pamplona", "Coruña");
