CREATE FUNCTION dbo.MediaPrecoItensCompra(@quantidade FLOAT, @preco FLOAT)
RETURNS FLOAT
AS BEGIN
	DECLARE @mediaDeValor FLOAT
	SET @mediaDeValor = (@preco * @quantidade) / 2
	RETURN @mediaDeValor
END

SELECT *, dbo.MediaPrecoItensCompra(quantidade, preco) AS media FROM Itens_compra;