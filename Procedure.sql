CREATE PROCEDURE InsertClientes(
@id INT,
@nome VARCHAR(255),
@endereco VARCHAR(255),
@telefone VARCHAR(20),
@email VARCHAR(255))
AS
BEGIN
	INSERT INTO clientes (id, nome, endereco, telefone, email)
	VALUES (@id, @nome, @endereco, @telefone, @email)
END

EXEC InsertClientes 31, 'Giovana Tamanini', 'Av. Tokyo Souls', '11 11111-1111', 'emailgiotamanini@gmail.com';

SELECT * FROM clientes WHERE id = 31;

DROP PROCEDURE InsertClientes;


CREATE PROCEDURE GerenciarFuncionarios (
@acao VARCHAR(10),
@id INT = NULL,
@nome VARCHAR(50) = NULL,
@cargo VARCHAR(50) = NULL)
AS BEGIN
	IF @acao = 'INSERT'
	BEGIN
		INSERT INTO funcionarios (id, nome, cargo)
		VALUES (@id, @nome, @cargo)
	END
	ELSE IF @acao = 'UPDATE'
	BEGIN
		UPDATE funcionarios
		SET nome = @nome,
			cargo = @cargo
		WHERE id = @id
	END
	ELSE IF @acao = 'DELETE'
	BEGIN
		DELETE FROM funcionarios WHERE id = @id
	END
END

EXEC GerenciarFuncionarios 'INSERT', 31, 'Giovani Tamanini', 'CEO';

EXECUTE GerenciarFuncionarios 'DELETE', 31, NULL, NULL;

SELECT * FROM funcionarios;