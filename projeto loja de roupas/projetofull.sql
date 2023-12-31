USE [master]
GO
/****** Object:  Database [LojaDeRoupas]    Script Date: 29/10/2023 12:52:20 pm ******/
CREATE DATABASE [LojaDeRoupas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LojaDeRoupas', FILENAME = N'D:\sql server\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LojaDeRoupas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LojaDeRoupas_log', FILENAME = N'D:\sql server\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\LojaDeRoupas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LojaDeRoupas] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LojaDeRoupas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LojaDeRoupas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET ARITHABORT OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LojaDeRoupas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LojaDeRoupas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LojaDeRoupas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LojaDeRoupas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LojaDeRoupas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LojaDeRoupas] SET  MULTI_USER 
GO
ALTER DATABASE [LojaDeRoupas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LojaDeRoupas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LojaDeRoupas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LojaDeRoupas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LojaDeRoupas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LojaDeRoupas] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LojaDeRoupas] SET QUERY_STORE = ON
GO
ALTER DATABASE [LojaDeRoupas] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LojaDeRoupas]
GO
/****** Object:  UserDefinedFunction [dbo].[ObterDataAtual]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ObterDataAtual]()
RETURNS DATE
AS
BEGIN
	RETURN CONVERT(DATE, GETDATE())
END;
GO
/****** Object:  UserDefinedFunction [dbo].[ObterEstoqueTotalProduto]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ObterEstoqueTotalProduto](@ProdutoID INT)
RETURNS INT AS BEGIN
DECLARE @EstoqueTotal INT;
SELECT @EstoqueTotal = SUM(Estoque) FROM Produtos
WHERE ProdutoID = @ProdutoID;
RETURN @EstoqueTotal;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[ObterPrecoMedioProdutos]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ObterPrecoMedioProdutos]()
RETURNS FLOAT AS BEGIN
DECLARE @PrecoMedia FLOAT;
SELECT @PrecoMedia = AVG(Preco) FROM Produtos;
RETURN @PrecoMedia;
END;
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda](
	[VendaID] [int] IDENTITY(1,1) NOT NULL,
	[DataVenda] [datetime] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[ValorVenda] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VendasDoDia]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VendasDoDia] AS
SELECT VendaID, ClienteID, DataVenda
FROM Venda
WHERE DataVenda >= CONVERT(DATE, GETDATE());
GO
/****** Object:  Table [dbo].[Produtos]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
	[ProdutoID] [int] IDENTITY(1,1) NOT NULL,
	[NomeProduto] [varchar](100) NOT NULL,
	[Preco] [float] NOT NULL,
	[Estoque] [int] NOT NULL,
	[CategoriaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdutoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItensVenda]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItensVenda](
	[ItensVendaID] [int] IDENTITY(1,1) NOT NULL,
	[VendaID] [int] NOT NULL,
	[ProdutoID] [int] NOT NULL,
	[Quantidade] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItensVendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ItensVendaPorVendaID]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ItensVendaPorVendaID] AS
SELECT ItensVenda.VendaID, Produtos.NomeProduto, ItensVenda.Quantidade
FROM ItensVenda
INNER JOIN Produtos ON ItensVenda.ProdutoID = Produtos.ProdutoID
INNER JOIN Venda ON Venda.VendaID = ItensVenda.VendaID;
GO
/****** Object:  View [dbo].[ProdutosEmEstoque]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProdutosEmEstoque] AS
SELECT ProdutoID, NomeProduto, Preco, Estoque
FROM Produtos
WHERE Estoque > 0;
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NomeCategoria] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[NomeCliente] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Telefone] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItensVenda]  WITH CHECK ADD  CONSTRAINT [FK_ItensVenda_Produto] FOREIGN KEY([ProdutoID])
REFERENCES [dbo].[Produtos] ([ProdutoID])
GO
ALTER TABLE [dbo].[ItensVenda] CHECK CONSTRAINT [FK_ItensVenda_Produto]
GO
ALTER TABLE [dbo].[ItensVenda]  WITH CHECK ADD  CONSTRAINT [FK_ItensVenda_Venda] FOREIGN KEY([VendaID])
REFERENCES [dbo].[Venda] ([VendaID])
GO
ALTER TABLE [dbo].[ItensVenda] CHECK CONSTRAINT [FK_ItensVenda_Venda]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [FK_Produto_Categoria] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [FK_Produto_Categoria]
GO
ALTER TABLE [dbo].[Venda]  WITH CHECK ADD  CONSTRAINT [FK_Venda_Cliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ClienteID])
GO
ALTER TABLE [dbo].[Venda] CHECK CONSTRAINT [FK_Venda_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[AdicionarCategoria]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarCategoria](@NomeCategoria VARCHAR(50))
AS
BEGIN
	INSERT INTO Categoria(NomeCategoria)
	VALUES (@NomeCategoria)
END;
GO
/****** Object:  StoredProcedure [dbo].[AdicionarCliente]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarCliente] (@NomeCliente VARCHAR(100), @Email VARCHAR(100), @Telefone VARCHAR(15))
AS
BEGIN
	INSERT INTO Cliente(NomeCliente, Email, Telefone)
	VALUES (@NomeCliente, @Email, @Telefone)
END;
GO
/****** Object:  StoredProcedure [dbo].[AdicionarItemVenda]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarItemVenda](@VendaID INT, @ProdutoID INT, @Quantidade INT)
AS
BEGIN
	DECLARE @EstoqueAtual INT 

	SELECT @EstoqueAtual = Estoque FROM Produtos
	WHERE ProdutoID = @ProdutoID
	IF(@EstoqueAtual >= @Quantidade)
	BEGIN
		INSERT INTO ItensVenda(VendaID, ProdutoID, Quantidade)
		VALUES (@VendaID, @ProdutoID, @Quantidade)

		UPDATE Produtos
		SET Estoque = Estoque - @Quantidade
		WHERE ProdutoID = @ProdutoID
	END
	ELSE
	BEGIN
		RAISERROR('Estoque insuficiente', 16,1)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarProduto]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarProduto](@NomeProduto VARCHAR(100), @Preco FLOAT, @Estoque INT, @CategoriaID INT)
AS
BEGIN
	INSERT INTO Produtos (NomeProduto, Preco, Estoque, CategoriaID)
	VALUES (@NomeProduto, @Preco, @Estoque, @CategoriaID)
END;
GO
/****** Object:  StoredProcedure [dbo].[AdicionarVenda]    Script Date: 29/10/2023 12:52:21 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdicionarVenda] (@DataVenda DATETIME, @ClienteID INT, @ValorVenda FLOAT)
AS
BEGIN
	DECLARE @VendaID INT

	INSERT INTO Venda(DataVenda, ClienteID, ValorVenda)
	VALUES (@DataVenda, @ClienteID, @ValorVenda)

	SET @VendaID = SCOPE_IDENTITY()

	RETURN @VendaId
END;
GO
USE [master]
GO
ALTER DATABASE [LojaDeRoupas] SET  READ_WRITE 
GO
