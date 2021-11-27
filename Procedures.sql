CREATE PROCEDURE Consolidados_Aplazados			
as
				Select I.Codigo_Estudiante, E.P_Nombre, E.Apellido_P, E.Apellido_M,I.Codigo_Asignatura, A.Nombre
				from Detalle_Consolidado I
				inner join Estudiante E
				on E.Codigo = I.Codigo_Estudiante
				inner join Asignatura A
				on I.Codigo_Asignatura = A.Codigo
				where I.APL != 'NC'
				order by I.Codigo_Estudiante
GO

CREATE PROCEDURE Mostrar_Todo_Alimentado_Por
AS
BEGIN
SELECT *FROM Alimentado_Por;
END
GO

CREATE PROCEDURE Mostrar_Todo_Asignatura
AS
BEGIN
SELECT *FROM Asignatura;
END
GO

CREATE PROCEDURE Mostrar_Todo_Cabecera_Consolidado
AS
BEGIN
SELECT *FROM Cabecera_Consolidado;
END
GO

CREATE PROCEDURE Mostrar_Todo_Cabecera_Listado
AS
BEGIN
SELECT *FROM Cabecera_Listado;
END
GO

CREATE PROCEDURE Mostrar_Todo_Detalle_Consolidado
AS
BEGIN
SELECT *FROM Detalle_Consolidado;
END
GO

CREATE PROCEDURE Mostrar_Todo_Detalle_Listado
AS
BEGIN
SELECT *FROM Detalle_Listado;
END
GO
CREATE PROCEDURE Mostrar_Todo_Docente
AS
BEGIN
SELECT *FROM Docente;
END
GO

CREATE PROCEDURE Mostrar_Todo_Escuela_Profesional
AS
BEGIN
SELECT *FROM Escuela_Profesional;
END
GO

CREATE PROCEDURE Mostrar_Todo_Estudiante
AS
BEGIN
SELECT *FROM Estudiante;
END
GO

CREATE PROCEDURE Mostrar_Todo_Impartido_Por
AS
BEGIN
SELECT *FROM Impartido_Por;
END
GO

CREATE PROCEDURE Mostrar_Todo_Inscribe
AS
BEGIN
SELECT *FROM Inscribe;
END
GO

create procedure Muestra_Asignatura_porCodigoDocente
				@codigo char(4)
as
				Select I.Codigo_Docente, D.Apellido_P, D.P_Nombre, I.Codigo_Asignatura, A.Nombre 
				from Impartido_Por I
				inner join Docente D
				on I.Codigo_Docente = D.Codigo
				inner join Asignatura A
				on I.Codigo_Asignatura = A.Codigo
				where Codigo_Docente = @codigo
				order by I.Codigo_Docente
GO

create procedure Muestra_asignaturas_por_EP
as
				select count(*) as 'Cantidad de Docentes'
				from Docente
GO

create procedure Muestra_NotaFinal_Consolidado
				@Codigo char(10)
as
				Select I.Codigo_Estudiante, E.P_Nombre, E.Apellido_P,
				E.Apellido_M,I.Codigo_Asignatura, A.Nombre,I.P_Final
				from Detalle_Consolidado I
				inner join Estudiante E
				on E.Codigo = I.Codigo_Estudiante
				inner join Asignatura A
				on I.Codigo_Asignatura = A.Codigo
				where Codigo_Estudiante=@Codigo
				order by I.Codigo_Estudiante
GO

create procedure Muestra_notas_por_Asignatura
				@codigo char(7)
as
				Select E.Apellido_P,E.Apellido_M,E.P_Nombre,
				D.TEO_N1,D.TEO_N2,D.TEO_N3,
				D.PRA_N1,D.PRA_N2,D.PRA_N3,
				A.Nombre
				from Detalle_Consolidado D
				inner join Asignatura A
				on D.Codigo_Asignatura = A.Codigo
				inner join Estudiante E
				on D.Codigo_Estudiante = E.Codigo
				where Codigo_Asignatura = @codigo
				order by E.Apellido_P
GO
create procedure Muestra_Prom_por_Alumno
				@codigo char(10)
as
				select E.Apellido_P,E.Apellido_M,E.P_Nombre,
				D.P_Final,A.Nombre
				from Detalle_Consolidado D
				inner join Estudiante E
				on D.Codigo_Estudiante = E.Codigo
				INNER JOIN Asignatura A
				on D.Codigo_Asignatura = A.Codigo
				where Codigo_Estudiante = @codigo
				order by A.Nombre
GO

create procedure Muestra_PromP_por_Codigo
				@codigo char(10)
as
				Select E.P_Nombre,E.Apellido_P,E.Apellido_M,C.Pond_General,C.Pond_Semestre
				from Cabecera_Consolidado C
				inner join Estudiante E
				on C.Codigo_Estudiante = E.Codigo
				where Codigo_Estudiante = @codigo
				order by Apellido_P
GO

create procedure Numero_Docente
as
				select count(*) as 'Cantidad de Docentes'
				from Docente
GO
create procedure sp_actualizar_ApellidoM_Docente
@codigo_docente char (4),
@Apellido_M varchar(20)
as
update Docente set Apellido_M = @Apellido_M where Codigo = @codigo_docente
GO
create procedure sp_actualizar_ApellidoP_Docente
@codigo_docente char (4),
@Apellido_P_nuevo varchar(20)
as
update Docente set Apellido_P = @Apellido_P_nuevo where Codigo = @codigo_docente
GO

create procedure sp_actualizar_Direccion_Docente
@codigo_docente char (4),
@Direccion_nueva varchar(40)
as
update Docente set Direccion = @Direccion_nueva where Codigo = @codigo_docente
GO

create procedure sp_actualizar_DNI_Docente
@codigo_docente char (4),
@DNI_nuevo char(8)
as
update Docente set DNI = @DNI_nuevo where Codigo = @codigo_docente
GO
create procedure sp_actualizar_Pnombre_Docente
@codigo_docente char (4),
@P_nombre varchar(20)
as
update Docente set P_Nombre = @P_nombre where Codigo = @codigo_docente
GO

create procedure sp_actualizar_Sexo_Docente
@codigo_docente char (4),
@Sexo char(1)
as
update Docente set Sexo = @Sexo where Codigo = @codigo_docente
GO
create procedure sp_actualizar_Telefono_Docente
@codigo_docente char (4),
@Telefono_nuevo char(9)
as
update Docente set Telefono = @Telefono_nuevo where Codigo = @codigo_docente
GO

create procedure sp_actualizar_Tipo_Docente
@codigo_docente char (4),
@tipo_nuevo varchar(40)
as
update Docente set Tipo = @tipo_nuevo where Codigo = @codigo_docente
GO
create procedure sp_Alimentado_Por
	@Codigo_Estudiante char(10),
	@Codigo_Asignatura char(7),
	@Codigo_Docente char(4)
as
	insert into Alimentado_Por values (@Codigo_Estudiante,@Codigo_Asignatura,@Codigo_Docente)
GO

create procedure sp_categoria
@codigo char(10)
as
select categoria from Estudiante where Codigo = @codigo
GO

CREATE procedure sp_elimina_Alimentado_Por
@codigoDocente char(4)
AS
   delete from Alimentado_Por
   from Alimentado_Por
   where Alimentado_Por.Codigo_Docente = @codigoDocente
GO

CREATE procedure sp_elimina_Cabecera_Listado
@codigoDocente char(4)
AS
   delete from Cabecera_Listado
   from Cabecera_Listado
   where Cabecera_Listado.Codigo_Docente = @codigoDocente
GO

CREATE procedure sp_elimina_Detalle_Listado
@codigoDocente char(4)
AS
   delete from Detalle_Listado
   from Detalle_Listado
   where Detalle_Listado.Codigo_Docente = @codigoDocente
GO

CREATE procedure sp_elimina_docente 
@codigo char(4)
AS
   delete from Detalle_Listado
   from Detalle_Listado
   where Detalle_Listado.Codigo_Docente = @codigo
   delete from Alimentado_Por
   from Alimentado_Por
   where Alimentado_Por.Codigo_Docente = @codigo
   delete from Cabecera_Listado
   from Cabecera_Listado
   where Cabecera_Listado.Codigo_Docente = @codigo
   delete from Impartido_Por
   from Impartido_Por
   where Impartido_Por.Codigo_Docente = @codigo
   delete from Docente
   from Docente
   where Docente.Codigo = @codigo;
GO
CREATE procedure sp_elimina_Impartido_Por
@codigoDocente char(4)
AS
   delete from Impartido_Por
   from Impartido_Por
   where Impartido_Por.Codigo_Docente = @codigoDocente

GO

CREATE procedure sp_Elimina_Inscribe_2  @codigo_e char(10),  @codigo_a char(7)
AS

	delete from Inscribe
	from Inscribe
    where Inscribe.Codigo_Asignatura = @codigo_a AND Inscribe.Codigo_Estudiante = @codigo_e

GO

create procedure sp_eliminacion_alimentado_por_completo
	@codigoestudiante char(10)
as
	delete from Alimentado_Por
	from Alimentado_Por
	where Alimentado_Por.Codigo_Estudiante = @codigoestudiante

GO

create procedure sp_eliminacion_alimentado_por_registro
	@codigoestudiante char(10),
	@codigoasignatura char(7)
as
	delete from Alimentado_Por
	from Alimentado_Por
	where Alimentado_Por.Codigo_Estudiante = @codigoestudiante 
	and Alimentado_Por.Codigo_Asignatura = @codigoasignatura

GO
create procedure sp_eliminacion_cabecera_consolidado_v2
	@codigo_estudiante char(10)
as	
	exec sp_eliminacion_alimentado_por_completo @codigoestudiante = @codigo_estudiante
	exec sp_eliminacion_detalle_consolidado_completo @codigo_estudiante = @codigo_estudiante
	delete from Cabecera_Consolidado
	from Cabecera_Consolidado
	where Cabecera_Consolidado.Codigo_Estudiante = 	@codigo_estudiante
GO
create procedure sp_eliminacion_detalle_consolidado_completo
	@codigo_estudiante char(10)
as
	delete from Detalle_Consolidado
	from Detalle_Consolidado
	where Detalle_Consolidado.Codigo_Estudiante = @codigo_estudiante

GO

create procedure sp_eliminacion_detalle_consolidado_por_registro
	@codigoestudiante char(10),
	@codigoasignatura char(7)
as
	delete from Detalle_Consolidado
    from Detalle_Consolidado
    where Detalle_Consolidado.Codigo_Estudiante = @codigoestudiante 
	and Detalle_Consolidado.Codigo_Asignatura = @codigoasignatura
GO

create procedure sp_Escuela_profesional
@codigo char(10)
as
select C.Codigo_EP,E.Escuela_Prof from Cabecera_Consolidado C 
inner join Escuela_Profesional E
on Codigo_Estudiante = @codigo
GO

CREATE PROCEDURE sp_estudiante_actualiza_Apellido_M @codigo char(10), @Apellido_M char (20)
AS
	UPDATE Estudiante SET Apellido_M=@Apellido_M WHERE Codigo=@codigo
GO

CREATE PROCEDURE sp_estudiante_actualiza_Apellido_P @codigo char(10), @Apellido_P char (20)
AS
	UPDATE Estudiante SET Apellido_P=@Apellido_P WHERE Codigo=@codigo
GO

CREATE PROCEDURE sp_estudiante_actualiza_Categoria @codigo char(10), @Categoria char (1)
AS
	UPDATE Estudiante SET Categoria=@Categoria WHERE Codigo=@codigo
GO
CREATE PROCEDURE sp_estudiante_actualiza_Direccion @codigo char(10), @Direccion char (40)
AS
	UPDATE Estudiante SET Direccion=@Direccion WHERE Codigo=@codigo
GO

CREATE PROCEDURE sp_estudiante_actualiza_P_Nombre @codigo char(10), @P_Nombre char (20)
AS
	UPDATE Estudiante SET P_Nombre=@P_Nombre WHERE Codigo=@codigo
GO

CREATE PROCEDURE sp_estudiante_actualiza_Telefono @codigo char(10), @Telefono char (9)
AS
	UPDATE Estudiante SET Telefono=@Telefono WHERE Codigo=@codigo
GO
CREATE PROCEDURE sp_estudiante_actualiza_Tipo_Matricula @codigo char(10), @Tipo_Matricula char (10)
AS
	UPDATE Estudiante SET Tipo_Matricula=@Tipo_Matricula WHERE Codigo=@codigo
GO

create procedure sp_estudiante_nombre
@codigo char(10)
as
select Apellido_P, Apellido_M, P_Nombre from estudiante where Codigo = @codigo
GO

create procedure sp_estudiantes_asignatura
                @codigo char(7)
as
                Select E.codigo,E.Apellido_P,E.Apellido_M,E.P_Nombre
                from Inscribe D
                inner join Asignatura A
                on D.Codigo_Asignatura = A.Codigo
                inner join Estudiante E
                on D.Codigo_Estudiante = E.Codigo
                where Codigo_Asignatura = @codigo
                order by E.Apellido_P
GO

create procedure sp_Impartido_Por
	@Codigo_Asignatura char(7),
	@Codigo_Docente char(4)
as
	insert into Impartido_Por values (@Codigo_Asignatura,@Codigo_Docente)
GO

create procedure sp_Inscribe
	@Codigo_Asignatura char(7),
	@Codigo_Estudiante char(10),
	@Vez smallint
as
	insert into Inscribe values (@Codigo_Asignatura,@Codigo_Estudiante,@Vez)
GO

create procedure sp_Insercion_Asignatura
		@Codigo char(7),
		@Sede varchar(10),
		@Nombre varchar(55),
		@Grupo smallint,
		@Seccion char(1),
		@Tipo varchar(20),
		@CR_PRA smallint,
		@CR_TEO smallint,
		@Codigo_EP char(2)
as
	insert into Asignatura values (@Codigo,@Sede,@Nombre,@Grupo, @Seccion, @Tipo, 
									@CR_PRA, @CR_TEO, @Codigo_EP)
GO

create procedure sp_Insercion_Cabecera_Consolidado
	@Codigo_Estudiante char(10),
	@Codigo_EP char(2),
	@Semestre_Base char(2),
	@Semestre_Acad varchar(20),
	@Tot_Creditos smallint,
	@Pond_General numeric(6,4),
	@Pond_Semestre decimal(4,2),
	@Ord_Merito varchar(15)
as
	insert into Cabecera_Consolidado values (@Codigo_Estudiante,@Codigo_EP,@Semestre_Base,
											 @Semestre_Acad,@Tot_Creditos, @Pond_General,@Pond_Semestre,@Ord_Merito)
GO

create procedure sp_Insercion_Cabecera_Listado
	@Codigo_Docente char(4) ,
	@Codigo_Asignatura char(7) ,
	@Semestre varchar(20)
as
	insert into Cabecera_Listado values (@Codigo_Docente,@Codigo_Asignatura,@Semestre)
GO

create procedure sp_Insercion_Detalle_Consolidado
	@Codigo_Asignatura char(7) ,
	@Codigo_Estudiante char(10) ,
	@TEO_N1 varchar(3) ,
	@TEO_N2 varchar(3) ,
	@TEO_N3 varchar(3) ,
	@PRA_N1 varchar(3) ,
	@PRA_N2 varchar(3) ,
	@PRA_N3 varchar(3) ,
	@P_PRA varchar(3) ,
	@P_PAR varchar(3) ,
	@APL varchar(3),
	@P_Final varchar(2)
as
	insert into Detalle_Consolidado values (@Codigo_Asignatura,@Codigo_Estudiante,@TEO_N1,@TEO_N2, @TEO_N3, @PRA_N1, @PRA_N2, 
									@PRA_N3, @P_PRA, @P_PAR,@APL,@P_Final)
GO


create procedure sp_Insercion_Detalle_Listado
	@Codigo_Estudiante char(10) ,
	@Codigo_Asignatura char(7) ,
	@Codigo_Docente char(4) ,
	@Subsa varchar(3) ,
	@Nota1 varchar(3) ,
	@Nota2 varchar(3) ,
	@Nota3 varchar(3) ,
	@Vez smallint ,
	@Prom varchar(3) 
as
	insert into Detalle_Listado values (@Codigo_Estudiante,@Codigo_Asignatura,@Codigo_Docente,@Subsa, @Nota1, @Nota2, @Nota3, 
									@Vez, @Prom)
GO

create procedure sp_Insercion_Docentes
	@Codigo char(4),
	@DNI char(8),
	@Telefono char(9),
	@Apellido_P varchar(20),
	@P_Nombre varchar(20),
	@Apellido_M varchar(20),
	@Sexo char(1),
	@Direccion varchar(40),
	@Tipo varchar(10)
as
	insert into Docente values (@codigo,@dni,@Telefono,@Apellido_P, @P_Nombre, @Apellido_M, @Sexo, @Direccion, @Tipo)
GO

create procedure sp_Insercion_Escuela_Profesional_fin
	@Codigo_EP char(2),
	@Escuela_Prof varchar(30)
as
	insert into Escuela_Profesional values (@Codigo_EP,@Escuela_Prof)
GO

create procedure sp_Insercion_estudiante
    @Codigo char (10),
    @dni char(8),
    @sexo char(1),
    @direccion varchar(40),
    @telefono char(9),
    @p_nombre varchar(20),
    @apellido_p varchar(20),
    @apellido_m varchar(20),
    @categoria char(1),
    @tipomatricula varchar(10)
as
    insert into Estudiante values (@codigo,@dni,@sexo,@direccion, @telefono, @p_nombre, @apellido_p, 
                                    @apellido_m, @categoria, @tipomatricula)
GO

create procedure sp_mostrar_Asignaturaa
AS
select Codigo,Nombre from Asignatura
GO

create procedure sp_mostrar_docentte
as 
select Codigo,P_Nombre,Apellido_P,Apellido_M from Docente
GO

create procedure sp_mostrar_EP
as 
select * from Escuela_Profesional
GO

create procedure sp_mostrar_estudiante
as 
select Codigo,P_Nombre,Apellido_P,Apellido_M from Estudiante
GO

create procedure sp_Mostrar_Estudiante_Cabe @Codigo_Estudiante char(10)
as
	select * from Cabecera_Consolidado where Codigo_Estudiante=@Codigo_Estudiante
GO

create procedure sp_Mostrar_Estudiante_cod @Codigo_Estudiante char(10)
as
	select * from Cabecera_Consolidado where Codigo_Estudiante=@Codigo_Estudiante
GO

create procedure sp_Mostrar_Estudiante_Deta @Codigo_Estudiante char(10)
as
	select * from Detalle_Consolidado where Codigo_Estudiante=@Codigo_Estudiante
GO

create procedure sp_Mostrar_Estudiante_Detalle @Codigo_Estudiante char(10)
as
	select n.Nombre,n.Grupo,n.Seccion,m.* from Detalle_Consolidado m inner join Asignatura n
	on m.Codigo_Asignatura=n.Codigo
	where Codigo_Estudiante=@Codigo_Estudiante
GO

CREATE PROCEDURE sp_Obtener_Cantidad_Estudiantes_Curricula_Anterior
				@total INT OUTPUT
AS
				SELECT @total=COUNT(*)
				FROM Estudiante
				WHERE Cast(codigo As BIGINT)<2016000000
				RETURN @total
GO

CREATE PROCEDURE sp_Obtener_Cantidad_Estudiantes_Curricula_Anterior_
				
AS
				SELECT COUNT(*)
				FROM Estudiante
				WHERE Cast(codigo As BIGINT)<2016000000
GO

create procedure sp_semestre_academico
@codigo char(10)
as
select semestre_acad from Cabecera_Consolidado where Codigo_Estudiante = @codigo
GO

create procedure sp_semestre_base
@codigo char(10)
as
select semestre_base from Cabecera_Consolidado where Codigo_Estudiante =@codigo
GO

create procedure sp_tipo_matricula
@codigo char(10)
as
select tipo_matricula from Estudiante where Codigo = @codigo
GO

create procedure sp_total_Creditos
@codigo char(10)
as
select tot_creditos from Cabecera_Consolidado where Codigo_Estudiante = @codigo
GO

Create procedure Mayor_y_menor_nota_de_cada_asignatura
as
				SELECT Codigo_Asignatura, (select Nombre from Asignatura where Codigo=Codigo_Asignatura) 
				as Nombre_Asignatura, MIN(P_Final) Menor_Nota, MAX(P_Final) Mayor_Nota
				FROM Detalle_Consolidado 
				group by Codigo_Asignatura;
GO
create procedure Numero_Aprobados 
				@codigo char(7)
as	
				select count(*) as 'Aprobados'
				from Estudiante m 
				INNER JOIN Detalle_Consolidado n
				on m.Codigo = n.Codigo_Estudiante
				where n.P_Final >= '12' 
				and n.Codigo_Asignatura = @codigo
GO
create procedure Numero_Desaprobados
				@codigo char(7)
as
				select count(*) as 'Desaprobados'
				from Estudiante m 
				INNER JOIN Detalle_Consolidado n
				on m.Codigo = n.Codigo_Estudiante
				where n.P_Final <= '11'
				and n.Codigo_Asignatura = @codigo
GO

create procedure sp_elimina_estudiante @codigo char(10)
as
	delete from Inscribe
	from Inscribe
	where Inscribe. Codigo_Estudiante = @codigo
	delete from Detalle_Listado
	from Detalle_Listado
	where Detalle_Listado.Codigo_Estudiante = @codigo
	delete from Detalle_Consolidado
	from Cabecera_Consolidado
	where Cabecera_Consolidado. Codigo_Estudiante
	= @codigo
	delete from Alimentado_Por
	from Cabecera_Consolidado
	where Cabecera_Consolidado. Codigo_Estudiante = @codigo
	delete from Cabecera_Consolidado
	from Cabecera_Consolidado
	where Cabecera_Consolidado.Codigo_Estudiante= @codigo
	delete from Estudiante
	from Estudiante
	where Estudiante.Codigo=@codigo
GO
create procedure Estudiantes_que_cursan_mas_de_una_vez 
				
as
				
				select count(*) as 'Segunda o Tercera Vez'
				from Estudiante m INNER JOIN Inscribe n
				on m.Codigo = n.Codigo_Estudiante
				where n.Vez > 1;
GO
