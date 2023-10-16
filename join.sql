-- Total de Turmas por Curso --
SELECT c.ID_CURSO, c.NOME_CURSO, count(t.ID_TURMA) Total_Turmas FROM dbo.tb_turmas t INNER JOIN dbo.tb_curso c on c.ID_CURSO = t.ID_CURSO
GROUP BY c.ID_CURSO, c.NOME_CURSO;

-- Todos os cursos, independente se há ou não tumar --
SELECT c.NOME_CURSO, count(t.ID_TURMA) Total_Turmas FROM dbo.tb_turmas t RIGHT JOIN dbo.tb_curso c on c.ID_CURSO = t.ID_CURSO GROUP BY c.NOME_CURSO;

-- Lista completa de alunos --
SELECT A.NOME, A.SEXO, c.NOME_CURSO, at.Valor, at.VALOR_DESCONTO, t.DATA_INICIO, T.DATA_TERMINO FROM dbo.Alunos_Turmas at 
INNER JOIN dbo.tb_turmas t ON t.ID_TURMA = at.ID_TURMA
INNER JOIN dbo.tb_curso c ON c.ID_CURSO = t.ID_CURSO
INNER JOIN dbo.tb_alunos a ON a.ID_ALUNO = at.ID_ALUNO;