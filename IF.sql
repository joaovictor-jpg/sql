DECLARE @nota INT;
SET @nota = 7;
IF (@nota = 7)
BEGIN
	UPDATE avaliacoes
	SET comentario = 'BOM'
	WHERE nota = 7;
END

DECLARE @comentario VARCHAR;
SET @comentario = 'Ruim';
IF @comentario != 'Bom'
BEGIN
	PRINT 'O atendimento foi ruim!'
END