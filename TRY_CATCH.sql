DECLARE @posicao_atual INT = 5
DECLARE @movimentacao INT = -2

BEGIN
	IF(@posicao_atual + @movimentacao >= 0 AND @posicao_atual + @movimentacao <= 9)
	BEGIN
		SET @posicao_atual = @posicao_atual + @movimentacao
		PRINT 'Peça movimentada com sucesso'
	END
	ELSE
	BEGIN
		PRINT 'Movimento invalido!'
	END
END

BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM clientes WHERE id = 30;
		UPDATE clientes SET nome = 'João da Silva' WHERE id = 1;
		INSERT INTO clientes (id, nome, endereco, telefone, email)
		VALUES (30, 'Maria da Silva', 'Rua das Rosas, 456', '88888-8888', 'mariasilva12345@gmail.com');
		COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0 
		ROLLBACK TRANSACTION;
	PRINT 'Erro ao executar transação: ' + ERROR_MESSAGE();
END CATCH