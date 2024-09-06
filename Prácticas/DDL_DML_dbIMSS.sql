-- Fecha: 19 de mayo de 2024 
-- Autores: Rodriguez Gomez Rafael, Otero Barragan Nahomi Natalia 
-- Proyecto Final: Base de Datos IMSS, Analisis Clinicos

-- crear base de datos 
create database dbIMSS; 

-- seleccionar base de datos 
use dbimss; 

-- crear tabla Unidades Medicas 
create table UnidadesMedicas (
claveUnidad char(20),
nombreUnidad varchar(30) not null,
municipio varchar(20),
direccion varchar(50) not null,
telefono char(10),
primary key (claveUnidad)); 


-- Crear un trigger que deberá implementarse antes de la inserción de
-- registros en la tabla unidades medicas. El trigger deberá
-- crear la clave de la unidad medica (claveUnidad) con el siguiente formato:
-- UMF-'numero del clinica''nombre del municipio abrevido'
-- Ejemplo = UMF-03TON
DELIMITER //

CREATE TRIGGER IF NOT EXISTS TR_clave_unidad  -- trigger necesario para crear la tabla, se incluye también
	BEFORE INSERT ON unidadesMedicas          -- en la parte de programación
    FOR EACH ROW	
BEGIN
	CASE
		WHEN NEW.municipio = "Guadalajara" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "GDL");
            
		WHEN NEW.municipio = "Tonala" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "TON");
            
		WHEN NEW.municipio = "Tlaquepaque" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "TLAQ");
            
		WHEN NEW.municipio = "Zapopan" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "ZAP");
            
		WHEN NEW.municipio = "Zapotlanejo" THEN
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "ZAPOT");
		
        ELSE
			SET NEW.claveUnidad = CONCAT ("UMF-", 
			SUBSTR(NEW.nombreUnidad, 9, 2), "---");
    END CASE;
END //

DELIMITER ;

-- crear tabla Afiliados
create table afiliados (
nss char(11), 
nombre varchar(15) not null,
apellido varchar(15) not null,
fecNacimiento date not null,
tipoSangre char(3) not null,
sexo enum("Masculino", "Femenino") not null,
unidadMedica char(10) not null,
turno enum("Matutino", "Vespertino"),
primary key (nss),
foreign key (unidadMedica) references unidadesMedicas (claveUnidad)
on update cascade on delete restrict); 

-- Crear tabla Medicos 
create table medicos (
claveMed char(6),
nombre varchar(15) not null,
apellido varchar(15) not null,
tiempoServicio int default 0,
especialidad varchar(15) not null,
primary key (claveMed));

-- Crear tabla Laboratorios
create table laboratorios (
claveLab char(6),
nombreLab varchar(40) not null,
area varchar(30),
horaInicio time default "7:00:00",
horaCierre time default "17:00:00",
primary key (claveLab)); 

-- Crear tabla examenes
create table examenes (
claveExam char(7),
nombreExam varchar(20) not null,
descripcion varchar(50),
costo real not null,
laboratorio char(6) not null, 
primary key (claveExam), 
foreign key (laboratorio) references laboratorios(claveLab) 
on update cascade on delete restrict); 

-- Crear tabla Analisis 
create table analisis (
claveAnalisis char(5), 
tipoExam char(7) not null,
ordenMedico char(6) not null,
paciente char(11) not null,
fecha date not null,
fecResultados date not null,
observaciones varchar(40),
check (fecResultados >= fecha),
primary key (claveAnalisis),
foreign key (tipoExam) references examenes(claveExam)
on update cascade on delete restrict, 
foreign key (ordenMedico) references medicos(claveMed)
on update cascade on delete restrict,
foreign key (paciente) references afiliados(nss)
on update cascade on delete restrict);

-- =============================================================
-- Tabla Unidades Medicas
-- =============================================================

-- Agregar registros a la tabla 
insert into unidadesMedicas values ('', 'Clinica 78 IMSS-JALISCO', 'Guadalajara', 'Av. San Jacinto #578', '8006232323');
insert into unidadesMedicas values ('', 'Clinica 93 IMSS-JALISCO', 'Tonala', 'Av. Tonaltecas #131', '8006812525');
insert into unidadesMedicas values ('', 'Clinica 52 IMSS-JALISCO', 'Guadalajara', 'Boulevar Marcelino Garcia Barragan #1596', '3339420000');
insert into unidadesMedicas values ('', 'Clinica 03 IMSS-JALISCO', 'Guadalajara', 'Belisario Dominguez #815', '3336188936');
insert into unidadesMedicas values ('', 'Clinica 92 IMSS-JALISCO', 'Guadalajara', 'Av.Gobernador Luis G.Curiel #4218', '3336704878');
insert into unidadesMedicas values ('', 'Clinica 54 IMSS-JALISCO', 'Tlaquepaque', 'Vicente Guerrero #875', '3336804239');

-- Mostrar todos los registros 
select * from unidadesMedicas; 

-- =============================================================
-- Tabla Afiliados
-- =============================================================

-- Agregar registros a la tabla
insert into afiliados values ('93905032778', 'Pedro', 'Ramirez', '1950/01/14', 'O-', 'Masculino', 'UMF-93TON', 'Vespertino');
insert into afiliados values ('54018885623', 'Javier', 'Hernandez', '1988/06/01', 'A+', 'Masculino', 'UMF-54TLAQ', 'Matutino');
insert into afiliados values ('93089593286', 'Victor', 'Guzman', '1995/02/03', 'O+', 'Masculino', 'UMF-93TON', 'Vespertino');
insert into afiliados values ('92996034781', 'America', 'Cortez', '1960/09/01', 'A-', 'Femenino', 'UMF-92GDL', 'Matutino');
insert into afiliados values ('03150332877', 'Daniela', 'Paredes', '2003/03/26', 'AB+', 'Femenino', 'UMF-03GDL', 'Vespertino');
insert into afiliados values ('78160447382', 'Vianey', 'Gomez', '2004/06/29', 'B+', 'Femenino', 'UMF-78GDL', 'Matutino');
insert into afiliados values ('54221683941', 'Renata', 'Lopez', '2016/02/28', 'O-', 'Femenino', 'UMF-54TLAQ', 'Vespertino');


-- Mostrar todos los registros
select * from afiliados; 

-- =============================================================
-- Tabla Medicos
-- =============================================================

-- Agregar registros a la tabla 
insert into medicos values ('MED001', 'Jose', 'Covarrubias', '18', 'Oftalmologia');
insert into medicos values ('MED002', 'Martha', 'Figueroa', '10', 'Dermatologia');
insert into medicos values ('MED003', 'Raul', 'Vazquez', '23', 'Cardiologia');
insert into medicos values ('MED004', 'Roberta', 'Aguilar', '7', 'Pediatria');
insert into medicos values ('MED005', 'Ernesto', 'Cruz', '15', 'Neurologia');
insert into medicos values ('MED006', 'Lucrecia', 'Villalobos', '21', 'Urologia');

-- Mostra todos los registros de la tabla 
select * from medicos; 

-- =============================================================
-- Tabla Laboratorios
-- =============================================================

-- Agregar registros a la tabla 
insert into laboratorios values ('LAB001', 'Laboratorio de Analisis Clinicos', 'Hospitalizacion', '8:00.00', '16:00:00'); 
insert into laboratorios values ('LAB002', 'Laboratorio de Hematologia', 'Banco de Sangre', '7:00.00', '18:00:00'); 
insert into laboratorios values ('LAB003', 'Laboratorio de Uroanalisis', 'Hospitalizacion', '7:30.00', '16:30:00'); 
insert into laboratorios values ('LAB004', 'Laboratorio de Diagnostico Oftalmologico', 'Consultorios Externos', '8:00.00', '15:30:00'); 
insert into laboratorios values ('LAB005', 'Laboratorio de Dermatologia', 'Consultorios Externos', '8:00.00', '16:00:00'); 
insert into laboratorios (claveLab, nombreLab, area) values ('LAB006', 'Laboratorio de Diagnostico Neurologico', 'Consultorios Externos'); 

-- Mostra todos los registros de la tabla 
select * from laboratorios; 

-- =============================================================
-- Tabla Examenes
-- =============================================================

-- Agregar registros a la tabla 
insert into examenes values ('EXAM001', 'Examen de la Vista', 'Prueba de agudeza Visual', '100', 'LAB004');
insert into examenes values ('EXAM002', 'Electroencefalograma', 'Registro de actividad electrica cerebral', '1600', 'LAB006');
insert into examenes values ('EXAM003', 'Examen de Orina', 'Evaluación química y microscópica de la orina', '300', 'LAB003');
insert into examenes values ('EXAM004', 'Examen de Sangre', 'Análisis de células sanguíneas', '200', 'LAB002');
insert into examenes values ('EXAM005', 'Examen de Rutina', 'Prueba de salud estandar para infantes', '100', 'LAB001');
insert into examenes values ('EXAM006', 'Biopsia Cutanea', 'Extracción de muestra de piel', '1350', 'LAB005');

-- Mostra todos los registros de la tabla 
select * from examenes; 

-- =============================================================
-- Tabla Analisis
-- =============================================================

-- Agregar registros a la tabla 
insert into analisis (claveanalisis, tipoExam, ordenMedico, paciente, fecha, fecResultados) values ('AN001', 'EXAM005', 'MED004', '54221683941', '2024/03/28', '2024/03/28');
insert into analisis (claveanalisis, tipoExam, ordenMedico, paciente, fecha, fecResultados) values ('AN002', 'EXAM004', 'MED003', '54018885623', '2024/03/01', '2024/03/05');
insert into analisis (claveanalisis, tipoExam, ordenMedico, paciente, fecha, fecResultados) values ('AN003', 'EXAM006', 'MED002', '93905032778', '2024/02/14', '2024/03/03');
insert into analisis (claveanalisis, tipoExam, ordenMedico, paciente, fecha, fecResultados) values ('AN004', 'EXAM002', 'MED005', '78160447382', '2024/01/21', '2024/02/05');
insert into analisis values ('AN005', 'EXAM003', 'MED006', '03150332877', '2024/03/10', '2024/03/10', 'Orina de color anormal');
insert into analisis values ('AN006', 'EXAM001', 'MED001', '54018885623', '2023/10/18', '2023/10/18', 'Signos de Cataratas');


-- Mostrar todos los registros de la tabla 
select * from analisis; 