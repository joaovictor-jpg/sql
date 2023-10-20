SELECT FORMAT(DATA, 'ddd') FROM pagamentos;

SELECT FORMAT(valor, 'C') FROM pagamentos;

SELECT FORMAT(data, 'MMMM') FROM pagamentos;

SELECT id, id_pedido, FORMAT(valor, 'C') as valor, FORMAT(data, 'dd/MMMM/yy') as mes FROM pagamentos ORDER BY mes;

SELECT id, LOWER(nome) as nome, LOWER(endereco) as endereço FROM clientes;