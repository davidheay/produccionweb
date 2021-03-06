USE [master]
GO
/****** Object:  Database [Analisis]    Script Date: 07/10/2019 14:53:22 ******/
CREATE DATABASE [Analisis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Analisis', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Analisis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Analisis_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Analisis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Analisis] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Analisis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Analisis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Analisis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Analisis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Analisis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Analisis] SET ARITHABORT OFF 
GO
ALTER DATABASE [Analisis] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Analisis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Analisis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Analisis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Analisis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Analisis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Analisis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Analisis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Analisis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Analisis] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Analisis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Analisis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Analisis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Analisis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Analisis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Analisis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Analisis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Analisis] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Analisis] SET  MULTI_USER 
GO
ALTER DATABASE [Analisis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Analisis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Analisis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Analisis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Analisis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Analisis] SET QUERY_STORE = OFF
GO
USE [Analisis]
GO
/****** Object:  User [admin]    Script Date: 07/10/2019 14:53:22 ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Centros_Trabajo]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centros_Trabajo](
	[Id_CT] [varchar](5) NOT NULL,
	[Descripcion] [varchar](20) NULL,
	[Unidades] [int] NULL,
	[Tiempo] [int] NULL,
	[Id_MP] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_CT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demanda]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demanda](
	[Id_Demanda] [varchar](5) NULL,
	[Id_Producto] [varchar](5) NULL,
	[Cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[Id_Inventario] [varchar](5) NULL,
	[Descripcion] [varchar](20) NULL,
	[Id_Producto] [varchar](5) NULL,
	[Unidades] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias_Primas]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias_Primas](
	[Id_MP] [varchar](5) NOT NULL,
	[Descripcion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_MP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[Id_Orden] [varchar](5) NULL,
	[Orden] [varchar](30) NULL,
	[fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id_Producto] [varchar](5) NOT NULL,
	[Id_Tipo] [varchar](5) NULL,
	[Id_Tamaño] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[Id_Receta] [varchar](5) NULL,
	[Id_Tamaño] [varchar](5) NULL,
	[RollosPapel] [int] NULL,
	[Hojas] [int] NULL,
	[Cartulina] [int] NULL,
	[Tapas] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tamaños]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tamaños](
	[Id_Tamaño] [varchar](5) NOT NULL,
	[Tamaño] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Tamaño] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos](
	[Id_Tipo] [varchar](5) NOT NULL,
	[Tipo] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Centros_Trabajo] ([Id_CT], [Descripcion], [Unidades], [Tiempo], [Id_MP]) VALUES (N'CT1', N'Prod Papel', 100, 3, N'MP2')
INSERT [dbo].[Centros_Trabajo] ([Id_CT], [Descripcion], [Unidades], [Tiempo], [Id_MP]) VALUES (N'CT2', N'Prod Cartulina', 12, 1, N'MP3')
INSERT [dbo].[Centros_Trabajo] ([Id_CT], [Descripcion], [Unidades], [Tiempo], [Id_MP]) VALUES (N'CT3', N'Transf  Hojas', 1000, 2, N'MP4')
INSERT [dbo].[Centros_Trabajo] ([Id_CT], [Descripcion], [Unidades], [Tiempo], [Id_MP]) VALUES (N'CT4', N'Transf Tapas', 25, 3, N'MP5')
INSERT [dbo].[Centros_Trabajo] ([Id_CT], [Descripcion], [Unidades], [Tiempo], [Id_MP]) VALUES (N'CT5', N'Ensamblaje', 50, 6, N'PT')
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P1', 20)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P2', 40)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P3', 10)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P4', 20)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P5', 5)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P6', 4)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P7', 8)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P8', 5)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'1', N'P9', 40)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P1', 50)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P2', 50)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P3', 50)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P4', 40)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P5', 5)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P6', 5)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P7', 10)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P8', 4)
INSERT [dbo].[Demanda] ([Id_Demanda], [Id_Producto], [Cantidad]) VALUES (N'2', N'P9', 40)
INSERT [dbo].[Inventarios] ([Id_Inventario], [Descripcion], [Id_Producto], [Unidades]) VALUES (N'1', N'Madera', N'MP1', 1000)
INSERT [dbo].[Inventarios] ([Id_Inventario], [Descripcion], [Id_Producto], [Unidades]) VALUES (N'2', N'RollosPapel', N'MP2', 20)
INSERT [dbo].[Inventarios] ([Id_Inventario], [Descripcion], [Id_Producto], [Unidades]) VALUES (N'3', N'Cartulina', N'MP3', 20)
INSERT [dbo].[Inventarios] ([Id_Inventario], [Descripcion], [Id_Producto], [Unidades]) VALUES (N'4', N'Hojas', N'MP4', 1000)
INSERT [dbo].[Inventarios] ([Id_Inventario], [Descripcion], [Id_Producto], [Unidades]) VALUES (N'5', N'tapas', N'MP5', 50)
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'MP1', N'Madera')
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'MP2', N'Rollos Papel')
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'MP3', N'Cartulina')
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'MP4', N'Hojas')
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'MP5', N'Tapas')
INSERT [dbo].[Materias_Primas] ([Id_MP], [Descripcion]) VALUES (N'PT', N'Cuaderno')
INSERT [dbo].[Ordenes] ([Id_Orden], [Orden], [fecha]) VALUES (N'1', N'1', CAST(N'2019-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P1', N'CC', N'P')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P2', N'CC', N'M')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P3', N'CC', N'G')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P4', N'CR', N'P')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P5', N'CR', N'M')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P6', N'CR', N'G')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P7', N'CF', N'P')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P8', N'CF', N'M')
INSERT [dbo].[Productos] ([Id_Producto], [Id_Tipo], [Id_Tamaño]) VALUES (N'P9', N'CF', N'G')
INSERT [dbo].[Receta] ([Id_Receta], [Id_Tamaño], [RollosPapel], [Hojas], [Cartulina], [Tapas]) VALUES (N'R1', N'P', 5, 100, 2, 2)
INSERT [dbo].[Receta] ([Id_Receta], [Id_Tamaño], [RollosPapel], [Hojas], [Cartulina], [Tapas]) VALUES (N'R2', N'M', 7, 100, 3, 2)
INSERT [dbo].[Receta] ([Id_Receta], [Id_Tamaño], [RollosPapel], [Hojas], [Cartulina], [Tapas]) VALUES (N'R3', N'G', 9, 100, 4, 2)
INSERT [dbo].[Tamaños] ([Id_Tamaño], [Tamaño]) VALUES (N'G', N'Grande')
INSERT [dbo].[Tamaños] ([Id_Tamaño], [Tamaño]) VALUES (N'M', N'Mediano')
INSERT [dbo].[Tamaños] ([Id_Tamaño], [Tamaño]) VALUES (N'P', N'Pequeño')
INSERT [dbo].[Tipos] ([Id_Tipo], [Tipo]) VALUES (N'CC', N'Cuadriculado')
INSERT [dbo].[Tipos] ([Id_Tipo], [Tipo]) VALUES (N'CF', N'Ferrocarril')
INSERT [dbo].[Tipos] ([Id_Tipo], [Tipo]) VALUES (N'CR', N'Rayado')
ALTER TABLE [dbo].[Centros_Trabajo]  WITH CHECK ADD FOREIGN KEY([Id_MP])
REFERENCES [dbo].[Materias_Primas] ([Id_MP])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Id_Tamaño])
REFERENCES [dbo].[Tamaños] ([Id_Tamaño])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([Id_Tipo])
REFERENCES [dbo].[Tipos] ([Id_Tipo])
GO
/****** Object:  StoredProcedure [dbo].[GetCentrosTrabajo]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCentrosTrabajo]
as begin 
select * from Centros_Trabajo
end
GO
/****** Object:  StoredProcedure [dbo].[GetCentroTrabajo]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCentroTrabajo]
@Id_CT varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_CT, Descripcion, Unidades, Tiempo,Id_MP from Centros_Trabajo where @Id_CT = Id_CT

 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH

GO
/****** Object:  StoredProcedure [dbo].[GetDemanda]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetDemanda]
@Id_Demanda varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_Demanda, Id_Producto, Cantidad from Demanda where @Id_Demanda = Id_Demanda

 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH

GO
/****** Object:  StoredProcedure [dbo].[GetDemandas]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetDemandas]
as begin 
select * from Demanda
end
GO
/****** Object:  StoredProcedure [dbo].[GetInventario]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetInventario]
@Id_Inventario varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_Inventario, Descripcion, Id_Producto, Unidades from Inventarios where @Id_Inventario = Id_Inventario

 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetInventarios]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetInventarios]
as begin 
select * from Inventarios
end
GO
/****** Object:  StoredProcedure [dbo].[GetMateria_Prima]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMateria_Prima]
@Id_MP varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_MP, Descripcion from Materias_Primas where @Id_MP = Id_MP
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
 
GO
/****** Object:  StoredProcedure [dbo].[GetMateriasPrimas]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMateriasPrimas]
as begin 
select * from Materias_Primas
end
GO
/****** Object:  StoredProcedure [dbo].[GetOrden]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetOrden]
@Id_Orden varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_Orden, Orden, fecha from Ordenes where @Id_Orden = Id_Orden
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetOrdenes]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetOrdenes]
as begin 
select * from Ordenes
end
GO
/****** Object:  StoredProcedure [dbo].[GetProducto]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProducto]
@Id_Producto varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_Producto, Id_Tipo, Id_Tamaño from Productos where @Id_Producto = Id_Producto
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetProductos]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetProductos]
as begin 
select * from Productos
end
GO
/****** Object:  StoredProcedure [dbo].[GetReceta]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetReceta]
@Id_Receta varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select Id_Receta, Id_Tamaño, RollosPapel,Hojas, Cartulina, Tapas from Receta where @Id_Receta = Id_Receta
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetRecetas]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRecetas]
as begin 
select * from Receta
end
GO
/****** Object:  StoredProcedure [dbo].[GetTamaño]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTamaño]
@Id_Tamaño varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select  Id_Tamaño, Tamaño from Tamaños where @Id_Tamaño = Id_Tamaño
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetTamaños]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTamaños]
as begin 
select * from Tamaños
end
GO
/****** Object:  StoredProcedure [dbo].[GetTipo]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTipo]
@Id_Tipo varchar(5)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 select  Id_Tipo, Tipo from Tipos where @Id_Tipo = Id_Tipo
 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'ha ocurrido un error'

 END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetTipos]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTipos]
as begin 
select * from Tipos
end
GO
/****** Object:  StoredProcedure [dbo].[insertarDemnda]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure [dbo].[insertarDemnda] @c1 int,@c2 int,@c3 int,@c4 int,@c5 int,@c6 int,@c7 int,@c8 int,@c9 int
as
declare @max int
select @max = max([Id_Demanda])+1 from Demanda
insert into  demanda values(@max ,'P1',@c1);
insert into  demanda values(@max ,'P2',@c2);
insert into  demanda values(@max ,'P3',@c3);
insert into  demanda values(@max ,'P4',@c4);
insert into  demanda values(@max ,'P5',@c5);
insert into  demanda values(@max ,'P6',@c6);
insert into  demanda values(@max ,'P7',@c7);
insert into  demanda values(@max ,'P8',@c8);
insert into  demanda values(@max ,'P9',@c9);
GO
/****** Object:  StoredProcedure [dbo].[UpdateDemanda]    Script Date: 07/10/2019 14:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[UpdateDemanda] (@Id_Demanda varchar(5) ,@Id_Producto varchar(5), @Cantidad int)
 AS 

 BEGIN TRANSACTION

 BEGIN TRY

 IF EXISTS(select Id_Demanda from Demanda where Id_Demanda = @Id_Demanda) 
	begin 

		update Demanda set Cantidad=@Cantidad where Id_Demanda = @Id_Demanda

		save transaction UpdateEstado
	end
ELSE
	BEGIN
	
		print 'No existe el ID especificado para actualizar el estado'
	END 

 COMMIT TRANSACTION

 END TRY

 BEGIN CATCH

 rollback transaction
 print 'Ha ocurrido un error al actualizar la Demanda'

 END CATCH
GO
USE [master]
GO
ALTER DATABASE [Analisis] SET  READ_WRITE 
GO
