CREATE TRIGGER tr_ins_fornecedores
ON fornecedores
AFTER INSERT
AS
BEGIN
	DECLARE	@nome VARCHAR(50), @cnpj VARCHAR(20), @telefone VARCHAR(15), @endereco VARCHAR(100)

	SELECT @nome = nome, @cnpj = cnpj, @telefone = telefone, @endereco = endereco
	FROM inserted
	IF @nome IS NOT NULL OR @cnpj IS NOT NULL OR @telefone IS NOT NULL OR @endereco IS NOT NULL
	BEGIN
		RAISERROR('Todos os campos são obrigatórios', 16, 1)
		ROLLBACK TRANSACTION
	END
END;


DISABLE TRIGGER tr_ins_fornecedores ON pagamentos;
GO
ALTER TRIGGER tr_ins_fornecedores
ON pagamentos
AFTER INSERT
AS
BEGIN
	DECLARE @id_pedido INT, @valor money, @data date

	SELECT @id_pedido = id_pedido, @valor = valor, @data = data
	FROM inserted
	IF @valor < 0
	BEGIN
		RAISERROR('o valor não pode ser negativo', 16, 1)
		ROLLBACK TRANSACTION
	END
END
GO
ENABLE TRIGGER tr_ins_fornecedores ON pagamentos;