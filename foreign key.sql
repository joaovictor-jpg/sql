CREATE TABLE produtos (
ID_produto INT PRIMARY KEY,
nome VARCHAR(50),
preco DECIMAL(10,2));

CREATE TABLE categorias (
ID_categoria INT PRIMARY KEY,
nome VARCHAR(50),
descricao VARCHAR(255));

CREATE TABLE produtos_categorias (
ID_produto INT,
ID_categoria INT,
PRIMARY KEY(ID_produto, ID_categoria),
FOREIGN KEY(ID_produto) REFERENCES produtos(ID_produto),
FOREIGN KEY(ID_categoria) REFERENCES categorias(ID_categoria));