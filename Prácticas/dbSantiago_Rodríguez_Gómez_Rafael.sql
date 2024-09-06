/* Sistemas de Bases de Datos II
   ACTIVIDAD #2 - DDL  dbSantiago 
   Rafael Rodríguez Gómez
*/

-- 1) Creamos la base de datos
create database dbSantiago;

-- 2) Creamos la tabla CAMINO
create table camino (
	nombreC varchar (40),
    kilometrosT double,
    tiempoE double,
    primary key (nombreC)
);

-- 3) Creamos tabla CIUDADES
create table ciudades (
	ciudad varchar (30),
    comunidadAut varchar (30),
    codigoP int,
    primary key (ciudad)
);

-- 4) Creamos tabla RECORRIDO
create table recorrido (
	nombreC varchar (40),
    numero int,
    ciudad varchar (30),
    foreign key (nombreC) references camino(nombreC)
		on update cascade on delete restrict,
	foreign key (ciudad) references ciudades(ciudad)
		on update cascade on delete restrict
);

-- 5) creamos tabla ALBERGUE
create table albergue (
	nombreA varchar (40),
    capacidad int,
    precio double,
    ciudad varchar (30),
    primary key (nombreA),
    foreign key (ciudad) references ciudades(ciudad)
		on update cascade on delete restrict
);

-- 6) creamos la tabla PEREGRINO
create table peregrino (
	numeroID int,
    nombreCompleto varchar (40),
    direccion varchar (30),
    primary key (numeroID)
);

-- 7) Creamos tabla ETAPA
create table etapa (
	nombreC varchar (40),
    numero int,
    kilometrosP double,
    tiempoP double,
    ciudadS varchar (30),
    ciudadLL varchar (30),
    foreign key (nombreC) references camino(nombreC)
		on update cascade on delete restrict,
	foreign key (ciudadS) references ciudades(ciudad)
		on update cascade on delete restrict,
	foreign key (ciudadLL) references ciudades(ciudad)
		on update cascade on delete restrict
);