CREATE TABLE pedidos (
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ID_cliente INT NOT NULL,
data_pedido DATE NOT NULL,
valor FLOAT NOT NULL);

CREATE TABLE itens_pedidos (
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ID_pedido INT NOT NULL,
quantidade INT NOT NULL,
preco FLOAT NOT NULL);

INSERT INTO pedidos (ID_cliente, data_pedido, valor) VALUES (1, '2023-10-12', 100.0);

INSERT INTO itens_pedidos (ID_pedido, quantidade, preco) VALUES (1, 200, 50.0);

SELECT * FROM itens_pedidos;