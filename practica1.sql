create Schema Geografico;

create table Geografico.Estados(
	nombre varchar(10),
	id_estado varchar(10),
Primary key(id_estado)
);
select *from Geografico.Estados;
drop table Geografico.Estados;


create table Geografico.Distritos(
     nombre varchar(10),
     id_estado varchar(10),
     id_distrito bigint,
Primary key(id_distrito),
Foreign key(id_estado)
references Geografico.Estados(id_estado)
);

select *from Geografico.Distritos;
drop table Geografico.Distritos;



create Schema Casillas;

create table Casillas.CasillasSecciones(
     seccion varchar(10),
     id_estado bigint,
     id_distrito bigint,
     tipo_casilla varchar(10),
     aprobada boolean,     
Primary key(tipo_casilla)
);
drop table Casillas.CasillasSecciones;
select *from Casillas.CasillasSecciones;


create Schema Partidos_Politicos;

create table Partidos_Politicos.Partidos(   
     id_estado bigint,
     id_distrito bigint,
     id_partido bigint,
     nombre varchar(10),
     siglas boolean,
Primary key(id_partido),
Foreign key(id_distrito)
references Geografico.Distritos(id_distrito)
);
drop table Partidos_Politicos.Partidos;
select *from Partidos_Politicos.Partidos;


create Schema Representantes;

create table Representantes.R_aprobados(
     id_estado bigint,
     id_distrito bigint,
     id_partido bigint,
     nombre_rep varchar(10),
     siglas boolean,
     seccion varchar(10),
     tipo_casilla varchar(10),
Primary key(nombre_rep,id_partido),
Foreign key(id_partido)
references  Partidos_Politicos.Partidos(id_partido)
);
drop table Representantes.R_aprobados;
select *from Representantes.R_aprobados;


create table Representantes.R_preeliminares(
     id_estado bigint,
     id_distrito bigint,
     id_partido bigint,
     nombre varchar(10)   
);
drop table Representantes.R_preeliminares;
select *from Representantes.R_preeliminares;


create table Representantes.R_sustituciones(
       registro varchar(8),
       nombre_sust varchar(10),
       curpR     bigint,
Primary key(curpR)
);
drop table Representantes.R_sustituciones;
select *from Representantes.R_sustituciones;


create table Representantes.R_log_aprobados(
        id_rep_apr bigint,
        nombre varchar(8),
Primary key(id_rep_apr)
);
drop table Representantes.R_log_aprobados;
select *from Representantes.R_log_aprobados;


create table Representantes.R_asistencias(
     nombre varchar(10),
     id_distrito bigint,    
     id_estado varchar(10),
     asistencia boolean,
     asist bigint,
Primary key(asist) 
);
drop table Representantes.R_asistencias;
select *from Representantes.R_asistencias;


create table Representantes.R_datos(
     nombre varchar(10),
     id_distrito bigint,    
     id_estado varchar(10),
     seccion varchar(10),
     edad    bigint,
     curpD  bigint,
Primary key(curpD)   
);
drop table Representantes.R_datos;
select *from Representantes.R_datos;


create table Proponer (
	id_partido bigint,	
	foreign key(id_partido)  
	references Partidos_Politicos.Partidos(id_partido)
);
drop table Proponer;
select *from Proponer;


create table Describir(
     curpD  bigint,
Foreign key(curpD)
references Representantes.R_datos(curpD)
);
drop table Describir;
select *from Describir;
