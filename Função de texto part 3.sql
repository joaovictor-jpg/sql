SELECT nome, PATINDEX('%D%', nome) as Patindex FROM fornecedores;
-- RETORNA A POSI��O ONDE O CARACTER SE ENCONTRA NAS STRING (COME�O, MEIO, FIM)

SELECT nome, PATINDEX('C%', nome) as Patindex FROM clientes;
-- RETORNA A POSI��O ONDE O CARACTER SE ENCONTRA NA STRING (SOMENTE COME�O)

SELECT id_funcionario, id_cliente, REPLACE(data, '-', '/') as data FROM atendimentos;

SELECT id, REPLACE(nome, 'Consum�vel', 'COMIDAAAA') as nome FROM categorias;

SELECT REPLICATE('a', 5);

SELECT REVERSE(nome) as nome FROM clientes;

SELECT REVERSE(endereco) as endere�o FROM fornecedores;