CREATE VIEW nome_cargo_funcionario AS
SELECT nome, cargo FROM funcionarios;

SELECT * FROM nome_cargo_funcionario;

CREATE VIEW pagamentos_altos AS
SELECT * FROM pagamentos WHERE valor > 5000;

SELECT * FROM pagamentos_altos;

CREATE VIEW Pagamento_pedido_cliente AS
SELECT pag.id, cli.nome, pag.valor, pag.data
FROM pagamentos pag
INNER JOIN pedidos ped ON pag.id_pedido = ped.id
INNER JOIN clientes cli ON ped.id_cliente = cli.id;

SELECT * FROM Pagamento_pedido_cliente;

ALTER VIEW Pagamento_pedido_cliente AS
SELECT pag.id, cli.nome, cli.endereco, pag.valor, pag.data
FROM pagamentos pag
INNER JOIN pedidos ped ON pag.id_pedido = ped.id
INNER JOIN clientes cli ON ped.id_cliente = cli.id;

SELECT * FROM Pagamento_pedido_cliente;

DROP VIEW Pagamento_pedido_cliente;

SELECT * FROM Pagamento_pedido_cliente;