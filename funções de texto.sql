SELECT id, CONCAT('nome: ', nome, ', email: ', email) AS Nome_Endereco FROM clientes;

SELECT av.id, CONCAT('Funcionario: ', f.nome, ', Nota: ', av.nota, ', Comentario: ', av.comentario) AS avaliacao, at.data
FROM avaliacoes av
INNER JOIN atendimentos at ON at.id = av.id_atendimento
INNER JOIN funcionarios f ON at.id_funcionario = f.id;

SELECT CONCAT_WS(', ', f.nome, av.nota, av.comentario) AS avalicao, at.data FROM avaliacoes av
INNER JOIN atendimentos at ON av.id_atendimento = at.id
INNER JOIN funcionarios f ON at.id_funcionario = f.id;