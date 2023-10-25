CREATE TABLE vendas(
produto_id INT,
data date,
quantidade INT,
CONSTRAINT fk_vendaProduto FOREIGN KEY (produto_id) REFERENCES produtos(id));

ALTER TABLE produtos ADD total_vendas int;

BEGIN TRANSACTION

DECLARE @estoque_atual INT;
DECLARE @total_vendas INT;

SELECT @estoque_atual = quantidade FROM produtos WHERE id = 5;
IF(@estoque_atual < 10)
BEGIN
	ROLLBACK;
	PRINT 'ESTOQUE INSUFICIENTE';
END
ELSE
BEGIN
	UPDATE produtos SET quantidade = quantidade - 10 WHERE id = 5;
	INSERT INTO vendas(produto_id, data, quantidade) VALUES (5, '2022-01-10', 10);
	SELECT @total_vendas = SUM(quantidade) FROM vendas WHERE produto_id = 1;
	UPDATE produtos SET total_vendas = @total_vendas WHERE id = 1;
	COMMIT;
	PRINT 'COMPRA REALIZADA COM SUCESSO';
END