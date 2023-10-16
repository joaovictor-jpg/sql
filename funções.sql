SELECT SUM(dbo.Alunos_Turmas.VALOR) Soma_Valores FROM dbo.Alunos_Turmas;

SELECT c.NOME_CURSO, SUM(at.VALOR_DESCONTO) DESCONTOS FROM dbo.tb_alunos a
INNER JOIN dbo.Alunos_Turmas at ON at.ID_ALUNO = a.ID_ALUNO
INNER JOIN dbo.tb_turmas t ON t.ID_TURMA = at.ID_TURMA
INNER JOIN dbo.tb_curso c ON c.ID_CURSO = t.ID_CURSO
GROUP BY c.NOME_CURSO;

SELECT COUNT(tb_curso.NOME_CURSO) Qtd_Cursos FROM tb_curso;

SELECT tb_curso.NOME_CURSO, COUNT(tb_curso.NOME_CURSO) Qtd_Curso FROM tb_curso GROUP BY NOME_CURSO;

SELECT at.ID_TURMA, COUNT(*) MATRICULAS FROM tb_alunos a
INNER JOIN Alunos_Turmas at ON at.ID_ALUNO = a.ID_ALUNO
GROUP BY at.ID_TURMA;