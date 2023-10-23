SELECT nome, PATINDEX('%D%', nome) as Patindex FROM fornecedores;
-- RETORNA A POSIÇÃO ONDE O CARACTER SE ENCONTRA NAS STRING (COMEÇO, MEIO, FIM)

SELECT nome, PATINDEX('C%', nome) as Patindex FROM clientes;
-- RETORNA A POSIÇÃO ONDE O CARACTER SE ENCONTRA NA STRING (SOMENTE COMEÇO)

SELECT id_funcionario, id_cliente, REPLACE(data, '-', '/') as data FROM atendimentos;

SELECT id, REPLACE(nome, 'Consumível', 'COMIDAAAA') as nome FROM categorias;

SELECT REPLICATE('a', 5);

SELECT REVERSE(nome) as nome FROM clientes;

SELECT REVERSE(endereco) as endereço FROM fornecedores;