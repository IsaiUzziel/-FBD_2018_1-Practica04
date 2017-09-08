Isai Uzziel Garcia Perez 
31 30 61 25-1
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

Punto extra:
Tipos de datos en postgres:
Nombre				Alias				Descripcion
bigint					int8		entero con signo de ocho bytes
bigserial				serial8		entero autoincremental de ocho bytes
bit [ (n) ]	 					cadena de bits de longitud fija
bit varying [ (n) ]			varbit		cadena de bits de longitud variable
boolean				bool		Booleano lógico (verdadero/falso)
box	 						rectángulo en un plano
bytea	 						datos binarios ("arreglo de bytes")
character varying [ (n) ]		varchar [ (n) ] 	cadena de caracteres de longitud variable
character [ (n) ]			        char [ (n) ]           cadena de caracteres de longitud fija
cidr	 						dirección de red IPv4 o IPv6
circle	 						circulo en un plano
date	 						fecha de calendario (año, mes, día)
double precision		float8	   número de punto flotante de precisión doble (8 bytes)
inet	 						dirección de equipo de IPv4 o IPv6
integer					int, int4		entero con signo de cuatro bytes
interval [ fields ] [ (p) ]	 				lapso de tiempo
line	 						linea infinita en un plano
lseg						 	segmento de linea en un plano
macaddr					 	Dirección MAC (Media Access Control)
money						 	importe monetario
numeric [ (p, s) ]             	decimal [ (p, s) ]     numérico exacto de precisión seleccionable
path	 						camino geométrico en un plano
point	 						punto geométrico en un plano
polygon	 					camino cerrado geométrico en un plano
real				  	float4 	  	número de punto flotante de precisión 								simple (4 bytes)
smallint					int2		entero con signo de dos bytes
serial					serial4		entero autoincremental de cuatro bytes
text	 				            	cadena de caracteres de longitud 								variable
time [ (p) ] [ without time zone ]	 			hora del día (sin zona horaria)
time [ (p) ] with time zone				timetz	gora del día, incluyendo zona 								horaria
timestamp [ (p) ] [ without time zone ]	 	fecha y hora (sin zona horaria)
timestamp [ (p) ] with time zone	timestamptz	fecha y hora, incluyendo zona horaria
tsquery	 						consulta de búsqueda de texto
tsvector						 	documento de búsqueda de texto
txid_snapshot	 			instantánea de ID de transacción a nivel de usuario
uuid	 						identificador universalmente único
xml						 	datos XML