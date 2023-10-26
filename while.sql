DECLARE @contador INT = 1
DECLARE @soma INT = 0
WHILE (@contador <= 100)
BEGIN
	IF(@contador % 2 <> 0)
	BEGIN 
		SET @soma = @soma + @contador
	END
	SET @contador = @contador + 1
END

PRINT'A soma dos números impares entre 1 e 100 é: ' + CAST(@soma AS VARCHAR)