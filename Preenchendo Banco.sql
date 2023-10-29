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
EXEC AdicionarCategoria 'Bon�';
EXEC AdicionarCategoria 'Chap�u';
EXEC AdicionarCategoria 'Meia';
EXEC AdicionarCategoria 'Cueca';
EXEC AdicionarCategoria 'Calcinha';
EXEC AdicionarCategoria 'Suti�';
EXEC AdicionarCategoria 'Vestido';
EXEC AdicionarCategoria 'Macac�o';
EXEC AdicionarCategoria 'Macaquinho';

EXEC AdicionarCliente 'Givani', 'giovana@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Jo�o', 'joao@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Maria', 'maria@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Robert', 'robert@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Fl�via', 'flavia@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Adriano', 'adriano@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Rita', 'rita@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Jos�', 'jose@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Magda', 'magda@hotmail.com', '99 99999-9999';
EXEC AdicionarCliente 'Jorel', 'jorel@hotmail.com', '99 99999-9999';

EXEC AdicionarProduto 'Bon� Aba Reta', 25.00, 30, 8;
EXEC AdicionarProduto 'Camisa Lisa', 79.90, 30, 2;
EXEC AdicionarProduto 'Camiseta Estampada', 79.90, 30, 2;
EXEC AdicionarProduto 'Cal�a Jeans', 109.90, 30, 5;
EXEC AdicionarProduto 'Cal�a Social', 199.90, 30, 5;
EXEC AdicionarProduto 'Short Moletom', 45, 30, 6;
EXEC AdicionarProduto 'Vestido Estampado', 84.90, 30, 14;
EXEC AdicionarProduto 'Macac�o Estapado', 150, 30, 15;
EXEC AdicionarProduto 'Meia cano baixo', 10, 30, 10;
EXEC AdicionarProduto 'Meia cano Alto', 15.00, 30, 10;
EXEC AdicionarProduto 'Chap�u Cowboy', 99.90, 30, 9;
EXEC AdicionarProduto 'Cueca Box', 25.00, 30, 11;

ALTER TABLE dbo.Venda ADD ValorVenda FLOAT NOT NULL;