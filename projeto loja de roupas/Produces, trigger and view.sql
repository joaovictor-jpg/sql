CREATE PROCEDURE AdicionarCliente (@NomeCliente VARCHAR(100), @Email VARCHAR(100), @Telefone VARCHAR(15))
AS
BEGIN
	INSERT INTO Cliente(NomeCliente, Email, Telefone)
	VALUES (@NomeCliente, @Email, @Telefone)
END;

CREATE PROCEDURE AdicionarProduto(@NomeProduto VARCHAR(100), @Preco FLOAT, @Estoque INT, @CategoriaID INT)
AS
BEGIN
	INSERT INTO Produtos (NomeProduto, Preco, Estoque, CategoriaID)
	VALUES (@NomeProduto, @Preco, @Estoque, @CategoriaID)
END;

CREATE PROCEDURE AdicionarCategoria(@NomeCategoria VARCHAR(50))
AS
BEGIN
	INSERT INTO Categoria(NomeCategoria)
	VALUES (@NomeCategoria)
END;

CREATE PROCEDURE AdicionarVenda (@DataVenda DATETIME, @ClienteID INT)
AS
BEGIN
	DECLARE @VendaID INT

	INSERT INTO Venda(DataVenda, ClienteID)
	VALUES (@DataVenda, @ClienteID)

	SET @VendaID = SCOPE_IDENTITY()

	RETURN @VendaId
END;

CREATE PROCEDURE AdicionarItemVenda(@VendaID INT, @ProdutoID INT, @Quantidade INT)
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

CREATE TRIGGER AtualizarEstoqueProduto ON Produtos
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @Quantidade INT, @ProdutoID INT

	SELECT @Quantidade = Estoque, @ProdutoID = ProdutoID
	FROM inserted
	UPDATE Produtos SET Estoque = Estoque + @Quantidade
	WHERE ProdutoID = @ProdutoID
END;

CREATE VIEW VendasDoDia AS
SELECT VendaID, ClienteID, DataVenda
FROM Venda
WHERE DataVenda >= CONVERT(DATE, GETDATE());

CREATE VIEW ItensVendaPorVendaID AS
SELECT ItensVenda.VendaID, Produtos.NomeProduto, ItensVenda.Quantidade
FROM ItensVenda
INNER JOIN Produtos ON ItensVenda.ProdutoID = Produtos.ProdutoID
INNER JOIN Venda ON Venda.VendaID = ItensVenda.VendaID;

CREATE VIEW ProdutosEmEstoque AS
SELECT ProdutoID, NomeProduto, Preco, Estoque
FROM Produtos
WHERE Estoque > 0;