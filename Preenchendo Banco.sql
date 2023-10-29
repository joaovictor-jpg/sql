CREATE FUNCTION ObterDataAtual()
RETURNS DATE
AS
BEGIN
	RETURN CONVERT(DATE, GETDATE())
END;

CREATE FUNCTION ObterPrecoMedioProdutos()
RETURNS FLOAT AS BEGIN
DECLARE @PrecoMedia FLOAT;
SELECT @PrecoMedia = AVG(Preco) FROM Produtos;
RETURN @PrecoMedia;
END;

CREATE FUNCTION ObterEstoqueTotalProduto(@ProdutoID INT)
RETURNS INT AS BEGIN
DECLARE @EstoqueTotal INT;
SELECT @EstoqueTotal = SUM(Estoque) FROM Produtos
WHERE ProdutoID = @ProdutoID;
RETURN @EstoqueTotal;
END;

EXEC AdicionarCategoria 'Blusa';
EXEC AdicionarCategoria 'Camiseta';
EXEC AdicionarCategoria 'Camisa';
EXEC AdicionarCategoria 'Regata';
EXEC AdicionarCategoria 'Calca';
EXEC AdicionarCategoria 'Short';
EXEC AdicionarCategoria 'Bermuda';
EXEC AdicionarCategoria 'Boné';
EXEC AdicionarCategoria 'Chapéu';
EXEC AdicionarCategoria 'Meia';
EXEC AdicionarCategoria 'Cueca';
EXEC AdicionarCategoria 'Calcinha';
EXEC AdicionarCategoria 'Sutiã';
EXEC AdicionarCategoria 'Vestido';
EXEC AdicionarCategoria 'Macacão';
EXEC AdicionarCategoria 'Macaquinho';

EXEC AdicionarCliente 'Givani', 'giovana@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'João', 'joao@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Maria', 'maria@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Robert', 'robert@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Flávia', 'flavia@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Adriano', 'adriano@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Rita', 'rita@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'José', 'jose@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Magda', 'magda@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Jorel', 'jorel@hotmail.com', '99 99999-9999';

EXEC AdicionarProduto 'Boné Aba Reta', 25.00, 30, 8;
EXEC AdicionarProduto 'Camisa Lisa', 79.90, 30, 2;
EXEC AdicionarProduto 'Camiseta Estampada', 79.90, 30, 2;
EXEC AdicionarProduto 'Calça Jeans', 109.90, 30, 5;
EXEC AdicionarProduto 'Calça Social', 199.90, 30, 5;
EXEC AdicionarProduto 'Short Moletom', 45, 30, 6;
EXEC AdicionarProduto 'Vestido Estampado', 84.90, 30, 14;
EXEC AdicionarProduto 'Macacão Estapado', 150, 30, 15;
EXEC AdicionarProduto 'Meia cano baixo', 10, 30, 10;
EXEC AdicionarProduto 'Meia cano Alto', 15.00, 30, 10;
EXEC AdicionarProduto 'Chapéu Cowboy', 99.90, 30, 9;
EXEC AdicionarProduto 'Cueca Box', 25.00, 30, 11;

ALTER TABLE dbo.Venda ADD ValorVenda FLOAT NOT NULL;