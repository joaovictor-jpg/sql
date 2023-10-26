SELECT nota, comentario,
	CASE
	WHEN nota BETWEEN 6 AND 10 THEN 'Bom atendimento'
	WHEN nota BETWEEN 1 AND 5 THEN 'Mal atendimento'
END AS Classificacao FROM avaliacoes;