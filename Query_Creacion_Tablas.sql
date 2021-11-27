
use DB_Consolidado;

create table Estudiante (
		Codigo char(10) not null primary key,
		DNI char(8) not null,
		Sexo char(1) CHECK (Sexo IN('F', 'M')) not null,
		Direccion varchar(40) not null,
		Telefono char(9) not null,
		P_Nombre varchar(20) not null,
		Apellido_P varchar(20) not null,
		Apellido_M varchar(20) not null,
		Categoria char(1) CHECK (Categoria IN('A','B','C','D','E','F')) not null,
		Tipo_Matricula varchar(10) CHECK (Tipo_Matricula IN('Regular','Especial 1','Especial 2')) not null);

create table Docente (
		Codigo char(4) not null primary key,
		DNI char(8) not null,
		Telefono char(9) not null,
		Apellido_P varchar(20) not null,
		P_Nombre varchar(20) not null,
		Apellido_M varchar(20) not null,
		Sexo char(1) CHECK (Sexo IN('F', 'M')) not null,
		Direccion varchar(40) not null,
		Tipo varchar(10) CHECK (Tipo IN('Invitado','Contratado','Auxiliar','Principal','Asociado')) not null);

create table Escuela_Profesional (
		Codigo_EP char(2) not null primary key,
		Escuela_Prof varchar(30) not null);

create table Asignatura (
		Codigo char(7) not null primary key,
		Sede varchar(10) not null,
		Nombre varchar(55) not null,
		Grupo smallint null,
		Seccion char(1) null,
		CR as (CR_PRA + CR_TEO),
		Tipo varchar(20) not null,
		CR_PRA smallint null,
		CR_TEO smallint null,
		Codigo_EP char(2) not null foreign key references Escuela_Profesional(Codigo_EP));
ALTER TABLE Asignatura ADD  FOREIGN KEY (Codigo_EP) REFERENCES Escuela_Profesional(Codigo_EP);

create table Inscribe (
		Codigo_Asignatura char(7) not null,
		Codigo_Estudiante char(10) not null,
		Vez smallint not null);
alter table Inscribe add primary key(Codigo_Asignatura, Codigo_Estudiante);
ALTER TABLE Inscribe ADD  FOREIGN KEY (Codigo_Asignatura) REFERENCES Asignatura(Codigo);
ALTER TABLE Inscribe ADD  FOREIGN KEY (Codigo_Estudiante) REFERENCES Estudiante(Codigo);


create table Impartido_Por (
		Codigo_Asignatura char(7) not null,
		Codigo_Docente char(4) not null)
alter table Impartido_Por add primary key(Codigo_Asignatura, Codigo_Docente);
ALTER TABLE Impartido_Por ADD  FOREIGN KEY (Codigo_Docente) REFERENCES Docente(Codigo);
ALTER TABLE Impartido_Por ADD  FOREIGN KEY (Codigo_Asignatura) REFERENCES Asignatura(Codigo);


create table Cabecera_Consolidado (
		Codigo_Estudiante char(10) not null,
		Codigo_EP char(2) not null,
		Semestre_Base char(2) CHECK (Semestre_Base > 0 AND Semestre_Base < 15) not null,
		Semestre_Acad varchar(20) not null,
		Tot_Creditos smallint null,
		Pond_General numeric(6,4) not null,
		Pond_Semestre decimal(4, 2) not null,
		Ord_Merito varchar(15) not null);
alter table Cabecera_Consolidado add primary key(Codigo_Estudiante);
ALTER TABLE Cabecera_Consolidado ADD  FOREIGN KEY (Codigo_Estudiante) REFERENCES Estudiante(Codigo);
ALTER TABLE Cabecera_Consolidado ADD  FOREIGN KEY (Codigo_EP) REFERENCES Escuela_Profesional(Codigo_EP);


create table Detalle_Consolidado (
		Codigo_Asignatura char(7) not null,
		Codigo_Estudiante char(10) not null,
		TEO_N1 varchar(3) CHECK (TEO_N1 IN('NSP') OR (TEO_N1 >= 0 AND TEO_N1 <= 20)) null,
		TEO_N2 varchar(3) CHECK (TEO_N2 IN('NSP') OR (TEO_N2 >= 0 AND TEO_N2 <= 20)) null,
		TEO_N3 varchar(3) CHECK (TEO_N3 IN('NSP') OR (TEO_N3 >= 0 AND TEO_N3 <= 20)) null,
		PRA_N1 varchar(3) CHECK (PRA_N1 IN('NSP') OR (PRA_N1 >= 0 AND PRA_N1 <= 20)) null,
		PRA_N2 varchar(3) CHECK (PRA_N2 IN('NSP') OR (PRA_N2 >= 0 AND PRA_N2 <= 20)) null,
		PRA_N3 varchar(3) CHECK (PRA_N3 IN('NSP') OR (PRA_N3 >= 0 AND PRA_N3 <= 20)) null,
		P_PRA varchar(3) CHECK (P_PRA >= 0 AND P_PRA <= 20) not null,
		P_PAR varchar(3) CHECK (P_PAR >= 0 AND P_PAR <= 20) not null,
		APL varchar(3) CHECK (APL IN('NC') OR (APL >= 0 AND APL <= 20)) not null,
		P_Final varchar(2) CHECK (P_Final IN('NSP') OR (P_Final >= 0 AND P_Final <= 20)) not null);
alter table Detalle_Consolidado add primary key(Codigo_Asignatura, Codigo_Estudiante);
ALTER TABLE Detalle_Consolidado ADD  FOREIGN KEY (Codigo_Asignatura) REFERENCES Asignatura(Codigo);
ALTER TABLE Detalle_Consolidado ADD  FOREIGN KEY (Codigo_Estudiante) REFERENCES Cabecera_Consolidado(Codigo_Estudiante);



create table Cabecera_Listado (
		Codigo_Docente char(4) not null,
		Codigo_Asignatura char(7) not null,
		Semestre varchar(20) not null);
alter table Cabecera_Listado add primary key(Codigo_Docente, Codigo_Asignatura);
ALTER TABLE Cabecera_Listado ADD  FOREIGN KEY (Codigo_Docente) REFERENCES Docente(Codigo);
ALTER TABLE Cabecera_Listado ADD  FOREIGN KEY (Codigo_Asignatura) REFERENCES Asignatura(Codigo);


create table Detalle_Listado (
		Codigo_Estudiante char(10) not null,
		Codigo_Asignatura char(7) not null,
		Codigo_Docente char(4) not null,
		Subsa varchar(3) CHECK (Subsa IN('NSP') OR (Subsa >= 0 AND Subsa <= 20)) not null,
		Nota1 varchar(3) CHECK (Nota1 IN('NSP') OR (Nota1 >= 0 AND Nota1 <= 20)) not null,
		Nota2 varchar(3) CHECK (Nota2 IN('NSP') OR (Nota2 >= 0 AND Nota2 <= 20)) not null,
		Nota3 varchar(3) CHECK (Nota3 IN('NSP') OR (Nota3 >= 0 AND Nota3 <= 20)) not null,
		Vez smallint CHECK (Vez > 0 AND Vez < 4) not null,
		Prom varchar(3) CHECK (Prom IN('NP') OR (Prom >= 0 AND Prom <= 20)) not null);
alter table Detalle_Listado add primary key(Codigo_Estudiante, Codigo_Asignatura, Codigo_Docente);
ALTER TABLE Detalle_Listado ADD  FOREIGN KEY (Codigo_Docente,Codigo_Asignatura) REFERENCES Cabecera_Listado(Codigo_Docente,Codigo_Asignatura);
ALTER TABLE Detalle_Listado ADD  FOREIGN KEY (Codigo_Estudiante) REFERENCES Estudiante(Codigo);



create table Alimentado_Por (
		Codigo_Estudiante char(10) not null,
		Codigo_Asignatura char(7) not null,
		Codigo_Docente char(4) not null)
alter table Alimentado_Por add primary key(Codigo_Estudiante, Codigo_Asignatura, Codigo_Docente);
ALTER TABLE Alimentado_Por ADD  FOREIGN KEY (Codigo_Docente,Codigo_Asignatura) REFERENCES Cabecera_Listado(Codigo_Docente,Codigo_Asignatura);
ALTER TABLE Alimentado_Por ADD  FOREIGN KEY (Codigo_Estudiante) REFERENCES Cabecera_Consolidado(Codigo_Estudiante);


