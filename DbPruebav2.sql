USE [master]
GO
/****** Object:  Database [DbPrueba]    Script Date: 9/23/2023 3:23:22 AM ******/
CREATE DATABASE [DbPrueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbPrueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbPrueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbPrueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbPrueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbPrueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbPrueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbPrueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbPrueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbPrueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbPrueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbPrueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbPrueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbPrueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbPrueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbPrueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbPrueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbPrueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbPrueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbPrueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbPrueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbPrueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbPrueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbPrueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbPrueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbPrueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbPrueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbPrueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbPrueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbPrueba] SET RECOVERY FULL 
GO
ALTER DATABASE [DbPrueba] SET  MULTI_USER 
GO
ALTER DATABASE [DbPrueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbPrueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbPrueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbPrueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbPrueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbPrueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbPrueba', N'ON'
GO
ALTER DATABASE [DbPrueba] SET QUERY_STORE = OFF
GO
USE [DbPrueba]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [bigint] NOT NULL,
	[Identificacion] [varchar](100) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalle] [bigint] NOT NULL,
	[IdFactura] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[UnidadMedida] [varchar](50) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[IVA] [decimal](10, 2) NOT NULL,
	[Subtotal] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [bigint] NOT NULL,
	[IdCliente] [bigint] NOT NULL,
	[Establecimiento] [varchar](50) NOT NULL,
	[PuntoEmision] [varchar](50) NOT NULL,
	[NumeroFactura] [varchar](100) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Subtotal] [decimal](10, 2) NULL,
	[TotalIVA] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [bigint] NOT NULL,
	[Codigo] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Categoria] [varchar](100) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] NOT NULL,
	[NombreUsuario] [varchar](100) NOT NULL,
	[ClaveUsuario] [varchar](100) NOT NULL,
	[TipoUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cliente] ([IdCliente], [Identificacion], [Nombre], [Direccion], [Telefono], [Correo]) VALUES (1, N'0987654321', N'Steven Lazo', N'Venezuela y la 34', N'023486969', N'stlazoj@hotmail.com')
GO
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (20, 19, 1, 2, N'Kg', CAST(0.50 AS Decimal(10, 2)), CAST(0.06 AS Decimal(10, 2)), CAST(0.56 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (20, 19, 2, 3, N'Kg', CAST(0.33 AS Decimal(10, 2)), CAST(0.04 AS Decimal(10, 2)), CAST(0.37 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (21, 20, 1, 2, N'Kg', CAST(0.50 AS Decimal(10, 2)), CAST(0.06 AS Decimal(10, 2)), CAST(0.56 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (21, 20, 2, 7, N'Kg', CAST(0.33 AS Decimal(10, 2)), CAST(0.04 AS Decimal(10, 2)), CAST(0.37 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (21, 20, 1, 21, N'Kg', CAST(0.50 AS Decimal(10, 2)), CAST(0.06 AS Decimal(10, 2)), CAST(0.56 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (23, 22, 2, 6, N'Kg', CAST(1.98 AS Decimal(10, 2)), CAST(0.24 AS Decimal(10, 2)), CAST(2.22 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (23, 22, 1, 9, N'Kg', CAST(4.50 AS Decimal(10, 2)), CAST(0.54 AS Decimal(10, 2)), CAST(5.04 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (26, 25, 1, 9, N'Kg', CAST(4.50 AS Decimal(10, 2)), CAST(0.54 AS Decimal(10, 2)), CAST(5.04 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (26, 25, 2, 6, N'Kg', CAST(1.98 AS Decimal(10, 2)), CAST(0.24 AS Decimal(10, 2)), CAST(2.22 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (27, 26, 1, 13, N'Kg', CAST(6.50 AS Decimal(10, 2)), CAST(0.78 AS Decimal(10, 2)), CAST(7.28 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (27, 26, 2, 7, N'Kg', CAST(2.31 AS Decimal(10, 2)), CAST(0.28 AS Decimal(10, 2)), CAST(2.59 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (27, 26, 2, 9, N'Kg', CAST(2.97 AS Decimal(10, 2)), CAST(0.36 AS Decimal(10, 2)), CAST(3.33 AS Decimal(10, 2)))
INSERT [dbo].[DetalleFactura] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [UnidadMedida], [Precio], [IVA], [Subtotal]) VALUES (28, 27, 2, 16, N'Kg', CAST(5.28 AS Decimal(10, 2)), CAST(0.63 AS Decimal(10, 2)), CAST(5.91 AS Decimal(10, 2)))
GO
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (20, 1, N'002', N'004', N'0000000020', CAST(N'2023-09-23T01:40:26.007' AS DateTime), CAST(1.49 AS Decimal(10, 2)), CAST(0.18 AS Decimal(10, 2)), CAST(1.67 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (21, 1, N'002', N'004', N'0000000021', CAST(N'2023-09-23T01:51:59.930' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (22, 1, N'003', N'004', N'0000000022', CAST(N'2023-09-23T01:57:03.120' AS DateTime), CAST(7.26 AS Decimal(10, 2)), CAST(0.87 AS Decimal(10, 2)), CAST(8.13 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (23, 1, N'002', N'004', N'0000000023', CAST(N'2023-09-23T01:59:01.493' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (24, 1, N'003', N'004', N'0000000024', CAST(N'2023-09-23T01:59:18.610' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (25, 1, N'003', N'004', N'0000000025', CAST(N'2023-09-23T02:01:05.810' AS DateTime), CAST(7.26 AS Decimal(10, 2)), CAST(0.87 AS Decimal(10, 2)), CAST(8.13 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (26, 1, N'003', N'004', N'0000000026', CAST(N'2023-09-23T03:14:40.337' AS DateTime), CAST(13.19 AS Decimal(10, 2)), CAST(1.58 AS Decimal(10, 2)), CAST(14.78 AS Decimal(10, 2)))
INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Establecimiento], [PuntoEmision], [NumeroFactura], [Fecha], [Subtotal], [TotalIVA], [Total]) VALUES (27, 1, N'002', N'004', N'0000000027', CAST(N'2023-09-23T03:19:44.677' AS DateTime), CAST(5.91 AS Decimal(10, 2)), CAST(0.71 AS Decimal(10, 2)), CAST(6.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Descripcion], [Categoria], [Precio]) VALUES (1, N'0001', N'Galletas Oreo', N'Galletas', CAST(0.50 AS Decimal(10, 2)))
INSERT [dbo].[Producto] ([IdProducto], [Codigo], [Descripcion], [Categoria], [Precio]) VALUES (2, N'0002', N'Manzana', N'Frutas', CAST(0.33 AS Decimal(10, 2)))
GO
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [ClaveUsuario], [TipoUsuario]) VALUES (1, N'FallenAngel', N'prueba12', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [ClaveUsuario], [TipoUsuario]) VALUES (2, N'supervisor1', N'sup1', 2)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [ClaveUsuario], [TipoUsuario]) VALUES (3, N'administrador1', N'admin', 1)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [ClaveUsuario], [TipoUsuario]) VALUES (4, N'Cajero1', N'caj1', 3)
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_cliente_agregar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_cliente_agregar](
		@identificacionCliente VARCHAR(100),
		@nombreCliente VARCHAR(100),
		@direccionCliente VARCHAR(100),
		@telefonoCliente VARCHAR(100),
		@correoCliente VARCHAR(100)
)
AS
BEGIN
	/*
		SET NOCOUNT ON prevents SQL Server from sending DONE_IN_PROC message
		for each statement in a stored procedure or batch of SQL statements.
		For example, if we have some 4 operations in the Stored Procedure,
		four messages are returned to the caller.
	*/
	SET NOCOUNT ON
	
	IF @identificacionCliente IS NULL OR @nombreCliente IS NULL
	BEGIN 
		SELECT 0 AS IdCliente, '' AS NombreCliente, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Si ya existe un usuario registrado con el nuevo que se quiere registrar
	IF (SELECT 1 FROM Cliente WHERE Identificacion = @identificacionCliente) IS NOT NULL
	BEGIN
		SELECT 0 AS IdCliente, '' AS NombreCliente,
			'El cliente '+Nombre+' con número de identificación ' +@identificacionCliente+ ' ya existe en el sistema.' AS MensajeError
			FROM Cliente
				WHERE Identificacion = @identificacionCliente
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END


	DECLARE @UltClienteID BIGINT

	SET @UltClienteID = (SELECT TOP 1 IdCliente FROM Cliente
							ORDER BY IdCliente DESC)

	-- Si no existe un usuario previamente ingresado
	IF @UltClienteID IS NULL
	BEGIN
		-- Agrega cliente
		INSERT INTO Cliente(IdCliente, Identificacion, Nombre, Direccion, Telefono, Correo)
			 VALUES (1, @identificacionCliente, @nombreCliente, @direccionCliente, @telefonoCliente, @correoCliente)
	END

	-- Si ya existe un usuario
	IF @UltClienteID IS NOT NULL
	BEGIN
		
		SET @UltClienteID = @UltClienteID + 1

		-- Agrega cliente
		INSERT INTO Cliente(IdCliente, Identificacion, Nombre, Direccion, Telefono, Correo)
			 VALUES (@UltClienteID, @identificacionCliente, @nombreCliente, @direccionCliente, @telefonoCliente, @correoCliente)

	END

	--Devuelve sus datos si es que fue creado con éxito
	SELECT TOP 1 IdCliente, Identificacion, 'Cliente creado con éxito' AS MensajeError FROM Cliente
		WHERE Identificacion = @identificacionCliente

END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_detallefactura_agregar_detalles]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,St. Lazo>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[pr_sp_detallefactura_agregar_detalles](
	-- Add the parameters for the stored procedure here
	@idFactura BIGINT,
	@idProducto BIGINT,
	@unidadMedida VARCHAR(50), -- Kg, Lbs
	@cantidad INT,
	@precio DECIMAL(10, 2),
	@iva DECIMAL(10, 2),
	@subTotal DECIMAL(10, 2)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @idFactura IS NULL OR @idProducto IS NULL
	BEGIN 
		SELECT 0 AS IdDetalle, 0 AS IdFactura, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END


	DECLARE @UltDetalleFacturaID BIGINT

	SET @UltDetalleFacturaID = (SELECT TOP 1 IdFactura FROM Factura
							ORDER BY IdFactura DESC)

	-- Si no existe un detalle factura previamente ingresado
	IF @UltDetalleFacturaID IS NULL
	BEGIN
		-- Agrega detalle factura
		INSERT INTO DetalleFactura(IdDetalle, IdFactura, IdProducto, Cantidad, UnidadMedida, Precio, IVA, Subtotal)
			 VALUES (1, @idFactura, @idProducto, @cantidad, @unidadMedida, @precio, @iva, @subTotal)

		SELECT 1 AS IdDetalle, @idFactura AS IdFactura, 'Detalle generado con éxito.' AS MensajeError
		
		RETURN

	END

	-- Si ya existe un detalle factura
	IF @UltDetalleFacturaID IS NOT NULL
	BEGIN
		SET @UltDetalleFacturaID = @UltDetalleFacturaID + 1

		-- Agrega detalle factura
		INSERT INTO DetalleFactura(IdDetalle, IdFactura, IdProducto, Cantidad, UnidadMedida, Precio, IVA, Subtotal)
			 VALUES (@UltDetalleFacturaID, @idFactura, @idProducto, @cantidad, @unidadMedida, @precio, @iva, @subTotal)

		SELECT IdDetalle, IdFactura, 'Detalle generado con éxito.' AS MensajeError
			FROM DetalleFactura
				WHERE IdDetalle = @UltDetalleFacturaID
		
		RETURN

	END


END

GO
/****** Object:  StoredProcedure [dbo].[pr_sp_factura_finalizar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_factura_finalizar](
		@idFactura BIGINT,
		@subTotal DECIMAL(10,2),
		@totalIVA DECIMAL(10,2),
		@total DECIMAL(10,2)
)
AS
BEGIN
	/*
		SET NOCOUNT ON prevents SQL Server from sending DONE_IN_PROC message
		for each statement in a stored procedure or batch of SQL statements.
		For example, if we have some 4 operations in the Stored Procedure,
		four messages are returned to the caller.
	*/
	SET NOCOUNT ON
	
	IF @idFactura IS NULL OR @subTotal IS NULL OR @totalIVA IS NULL OR @total IS NULL
	BEGIN 
		SELECT 0 AS IdFactura, 0.00 AS Total
			, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Si se ingresa un IdFactura de una que no existe
	IF (SELECT TOP 1 '1' FROM Factura WHERE IdFactura = @idFactura) IS NULL
	BEGIN
		SELECT 0 AS IdFactura, 0.00 AS Total
		, 'Factura no existe en el sistema.' AS MensajeError
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	UPDATE Factura
		SET Subtotal = @subTotal,
			TotalIVA = @totalIVA,
			Total = @total
		WHERE IdFactura = @idFactura

	SELECT TOP 1 IdFactura, Total, 'Factura finalizada con éxito.' AS MensajeError FROM Factura WHERE IdFactura = @idFactura

END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_factura_generar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,St. Lazo>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[pr_sp_factura_generar](
	-- Add the parameters for the stored procedure here
	@identificacionCliente VARCHAR(100), -- IdCliente o Identificacion (cédula o RUC)
	@establecimiento VARCHAR(50), -- 001 - Codigo Establecimiento
	@puntoEmision VARCHAR(50) -- 001 - Numero de Caja
	--@numeroFactura VARCHAR(100) -- 0000000001
	--@fecha DATETIME NOT NULL
	--Subtotal DECIMAL(10,2) NOT NULL, -- Subtotal de la Factura
	--TotalIVA DECIMAL(10,2) NOT NULL, -- Total IVA de la Factura??? Subtotal + (Subtotal * 0.12)
	--Total DECIMAL(10,2) NOT NULL -- Total de la Factura
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @identificacionCliente IS NULL
	BEGIN 
		SELECT 0 AS IdFactura, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END


	DECLARE @UltFacturaID BIGINT
	DECLARE @clienteID BIGINT

	SET @UltFacturaID = (SELECT TOP 1 IdFactura FROM Factura
							ORDER BY IdFactura DESC)

	SET @clienteID = (SELECT IdCliente FROM Cliente
						WHERE Identificacion = @identificacionCliente)

	-- Si no existe una factura previamente ingresada
	IF @UltFacturaID IS NULL
	BEGIN
		-- Agrega factura
		INSERT INTO Factura(IdFactura, IdCliente, Establecimiento, PuntoEmision, NumeroFactura, Fecha)
			 VALUES (1, @clienteID, @establecimiento, @puntoEmision, '000000001', GetDate())

		SELECT 1 AS IdFactura, 'Factura generada con éxito.' AS MensajeError
		RETURN

	END

	-- Si ya existe una factura
	IF @UltFacturaID IS NOT NULL
	BEGIN
		SET @UltFacturaID = @UltFacturaID + 1

		-- Agrega factura
		INSERT INTO Factura(IdFactura, IdCliente, Establecimiento, PuntoEmision, NumeroFactura, Fecha)
			 VALUES (@UltFacturaID, @clienteID, @establecimiento, @puntoEmision, '00000000' + CONVERT(VARCHAR, @UltFacturaID), GetDate())

		SELECT @UltFacturaID AS IdFactura, 'Factura generada con éxito.' AS MensajeError
		RETURN

	END



END

GO
/****** Object:  StoredProcedure [dbo].[pr_sp_factura_listar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_factura_listar](
	@idFactura BIGINT = NULL
)
AS
BEGIN

	SET NOCOUNT ON

	IF @idFactura IS NULL
	BEGIN

		SELECT f.IdFactura, f.IdCliente, f.Establecimiento, f.PuntoEmision,
			f.NumeroFactura, f.Fecha, d.IdProducto, d.Cantidad, d.UnidadMedida,
				d.Subtotal AS 'DetalleSubTotal', f.Subtotal AS 'FacturaSubTotal', f.TotalIVA, f.Total AS 'FacturaTotal'
			FROM Factura f INNER JOIN DetalleFactura d ON f.IdFactura = d.IdFactura

	END

	IF @idFactura IS NOT NULL
	BEGIN

		SELECT f.IdFactura, f.IdCliente, f.Establecimiento, f.PuntoEmision,
			f.NumeroFactura, f.Fecha, d.IdProducto, d.Cantidad, d.UnidadMedida,
				d.Subtotal AS 'DetalleSubTotal', f.Subtotal AS 'FacturaSubTotal', f.TotalIVA, f.Total AS 'FacturaTotal'
			FROM Factura f INNER JOIN DetalleFactura d ON f.IdFactura = d.IdFactura
				WHERE f.IdFactura = @idFactura
	END


END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_producto_listar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_producto_listar](
	@idProducto BIGINT = NULL
)
AS
BEGIN

	SET NOCOUNT ON

	IF @idProducto IS NULL
	BEGIN

		SELECT * FROM Producto

	END

	IF @idProducto IS NOT NULL
	BEGIN

		SELECT * FROM Producto WHERE IdProducto = @idProducto

	END


END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_productos_agregar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_productos_agregar](
		@CodigoProducto VARCHAR(100),
		@CategoriaProducto VARCHAR(100),
		@PrecioProducto DECIMAL(10, 2),
		@DescripcionProducto VarChAr(100)
)
AS
/*
	Tipos de Usuario
	1 - Administrador: Tendra acceso a toda la aplicación y crear nuevos usuarios
	2 - Supervisor: Tiene acceso a todo menos al administrador de usuarios
	3 - Vendedor: Solo podra crear nuevas ordenes
*/
BEGIN
	/*
		SET NOCOUNT ON prevents SQL Server from sending DONE_IN_PROC message
		for each statement in a stored procedure or batch of SQL statements.
		For example, if we have some 4 operations in the Stored Procedure,
		four messages are returned to the caller.
	*/
	SET NOCOUNT ON
	
	IF @CodigoProducto IS NULL OR @PrecioProducto IS NULL OR @CategoriaProducto IS NULL OR @DescripcionProducto IS NULL
	BEGIN 
		SELECT 0 AS IdProducto, '' AS Descripcion
			, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Si ya existe un usuario registrado con el nuevo que se quiere registrar
	IF (SELECT 1 FROM Producto WHERE Codigo = @CodigoProducto) IS NOT NULL
	BEGIN
		SELECT 0 AS IdProducto, '' AS Descripcion
		, 'Producto '+@CodigoProducto+' ya existe en el sistema.' AS MensajeError
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END



	DECLARE @UltProductoID BIGINT
	DECLARE @clienteID BIGINT

	SET @UltProductoID = (SELECT TOP 1 IdProducto FROM Producto
							ORDER BY IdProducto DESC)

	-- Si no existe un producto previamente agregado
	IF @UltProductoID IS NULL
	BEGIN
		
		-- Agrega producto
		INSERT INTO Producto(IdProducto, Codigo, Descripcion, Categoria, Precio)
			VALUES (1, @CodigoProducto, @DescripcionProducto, @CategoriaProducto, @PrecioProducto)

		SELECT 1 AS IdProducto, @DescripcionProducto AS Descripcion, 'Producto creado con éxito.' AS MensajeError
		RETURN

	END

	-- Si ya existe un producto
	IF @UltProductoID IS NOT NULL
	BEGIN
		SET @UltProductoID = @UltProductoID + 1

		-- Agrega producto
		INSERT INTO Producto(IdProducto, Codigo, Descripcion, Categoria, Precio)
			VALUES (@UltProductoID, @CodigoProducto, @DescripcionProducto, @CategoriaProducto, @PrecioProducto)

		SELECT @UltProductoID AS IdProducto, @DescripcionProducto AS Descripcion, 'Producto creado con éxito.' AS MensajeError
		RETURN

	END

END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_usuario_listar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_usuario_listar](
	@idUsuario BIGINT = NULL
)
AS
BEGIN

	SET NOCOUNT ON

	IF @idUsuario IS NULL
	BEGIN

		SELECT * FROM Usuario

	END

	IF @idUsuario IS NOT NULL
	BEGIN

		SELECT * FROM Usuario WHERE IdUsuario = @idUsuario

	END


END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_usuarios_agregar]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[pr_sp_usuarios_agregar](
		@nombreUsuario VARCHAR(100),
		@claveUsuario VARCHAR(100),
		@tipoUsuario INT
)
AS
/*
	Tipos de Usuario
	1 - Administrador: Tendra acceso a toda la aplicación y crear nuevos usuarios
	2 - Supervisor: Tiene acceso a todo menos al administrador de usuarios
	3 - Vendedor: Solo podra crear nuevas ordenes
*/
BEGIN
	/*
		SET NOCOUNT ON prevents SQL Server from sending DONE_IN_PROC message
		for each statement in a stored procedure or batch of SQL statements.
		For example, if we have some 4 operations in the Stored Procedure,
		four messages are returned to the caller.
	*/
	SET NOCOUNT ON
	
	IF @nombreUsuario IS NULL OR @claveUsuario IS NULL OR @tipoUsuario IS NULL OR @tipoUsuario = 0
	BEGIN 
		SELECT 0 AS IdUsuario, '' AS NombreUsuario, 0 AS TipoUsuario, 'Error, se han enviado parámetros nulos o vacíos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Si ya existe un usuario registrado con el nuevo que se quiere registrar
	IF (SELECT 1 FROM Usuario WHERE NombreUsuario = @nombreUsuario) IS NOT NULL
	BEGIN
		SELECT 0 AS IdUsuario, @nombreUsuario AS NombreUsuario, 0 AS TipoUsuario,
			'Usuario '+@nombreUsuario+' ya existe en el sistema.' AS MensajeError
		RETURN -- Termina ejecución del Stored Procedure (SP)
	END


	DECLARE @UltUsuarioID BIGINT

	SET @UltUsuarioID = (SELECT TOP 1 IdUsuario FROM Usuario
							ORDER BY IdUsuario DESC)

	-- Si no existe un usuario previamente ingresado
	IF @UltUsuarioID IS NULL
	BEGIN
		-- Agrega usuario
		INSERT INTO Usuario(IdUsuario, NombreUsuario, ClaveUsuario, TipoUsuario)
			 VALUES (1, @nombreUsuario, @claveUsuario, @tipoUsuario)

	END

	-- Si ya existe un usuario
	IF @UltUsuarioID IS NOT NULL
	BEGIN
		-- Agrega usuario
		INSERT INTO Usuario(IdUsuario, NombreUsuario, ClaveUsuario, TipoUsuario)
			 VALUES (@UltUsuarioID + 1, @nombreUsuario, @claveUsuario, @tipoUsuario)

	END

	--Devuelve sus datos si es que fue creado con éxito
	SELECT IdUsuario, NombreUsuario, TipoUsuario, 'Usuario creado con éxito' AS MensajeError FROM Usuario
		WHERE NombreUsuario = @nombreUsuario
			AND ClaveUsuario = @claveUsuario
				AND TipoUsuario = @tipoUsuario


END
GO
/****** Object:  StoredProcedure [dbo].[pr_sp_validar_login]    Script Date: 9/23/2023 3:23:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[pr_sp_validar_login](
	@nombreUsuario VARCHAR(100),
	@claveUsuario VARCHAR(100)
)
AS
BEGIN

	/*
		SET NOCOUNT ON prevents SQL Server from sending DONE_IN_PROC message
		for each statement in a stored procedure or batch of SQL statements.
		For example, if we have some 4 operations in the Stored Procedure,
		four messages are returned to the caller.
	*/
	SET NOCOUNT ON

	IF @nombreUsuario IS NULL OR @claveUsuario IS NULL
	BEGIN
		SELECT 0 AS IdUsuario, '' AS NombreUsuario, 0 AS TipoUsuario, 'Error, se han enviado parámetros nulos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Login exitoso
	IF (SELECT 1 FROM Usuario
		WHERE NombreUsuario = @nombreUsuario
			AND ClaveUsuario = @claveUsuario) IS NOT NULL
	BEGIN
		--Devuelve sus datos si es que fue creado con éxito
		SELECT IdUsuario, NombreUsuario, TipoUsuario, 'Login exitoso' AS MensajeError FROM Usuario
			WHERE NombreUsuario = @nombreUsuario
				AND ClaveUsuario = @claveUsuario

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	-- Login fallido (por clave o usuario incorrecto)
	IF (SELECT 1 FROM Usuario
		WHERE NombreUsuario = @nombreUsuario
			AND ClaveUsuario = @claveUsuario) IS NULL
	BEGIN
		SELECT 0 AS IdUsuario, '' AS NombreUsuario, 0 AS TipoUsuario, 'Usuario o contraseña incorrectos.' AS MensajeError

		RETURN -- Termina ejecución del Stored Procedure (SP)
	END

	

END
GO
USE [master]
GO
ALTER DATABASE [DbPrueba] SET  READ_WRITE 
GO
