USE Primeiro_Banco;

CREATE TABLE People (
id INT,
nome VARCHAR(255),
sobrenome VARCHAR(255));

INSERT INTO People(id, nome, sobrenome) VALUES (1, 'Son', 'Goky');

SELECT * FROM People;

CREATE TABLE Produto(
id INT,
nome Varchar(255),
descricao varchar(2000));

INSERT INTO Produto (id, nome, descricao) VALUES (1, 'Computador', 'Computador Game');

SELECT * FROM Produto;

CREATE TABLE Endereco (
id INT,
endereco VARCHAR(255),
cidade VARCHAR(255),
estado CHAR(2),
cep VARCHAR(255));

INSERT INTO Endereco (id, endereco, cidade, estado, cep) VALUES (1, '665 Av. Paulo Scandar', 'Taquaritinga', 'SP', '15900-000');

SELECT * FROM Endereco;