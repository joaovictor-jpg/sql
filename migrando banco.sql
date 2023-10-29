CREATE TABLE Clientes (
	id INT PRIMARY KEY,
	nome VARCHAR(255),
	endereco VARCHAR(255),
	telefone VARCHAR(255),
	email VARCHAR(255));

CREATE TABLE Fornecedores (
	id INT PRIMARY KEY,
	nome VARCHAR(255),
	cnpj VARCHAR(20),
	telefone VARCHAR(20),
	endereco VARCHAR(255));

CREATE TABLE Funcionarios (
	id INT PRIMARY KEY,
	nome VARCHAR(255),
	cargo VARCHAR(255));

INSERT INTO Clientes (id, nome, endereco, telefone, email)
SELECT id, nome, endereco, telefone, email
FROM SQL_DB_SQLExemplos.dbo.clientes;

INSERT INTO Fornecedores (id, nome, cnpj, telefone, endereco)
SELECT id, nome, cnpj, telefone, endereco
FROM SQL_DB_SQLExemplos.dbo.fornecedores;

INSERT INTO Funcionarios (id, nome, cargo)
SELECT id, nome, cargo
FROM SQL_DB_SQLExemplos.dbo.funcionarios;

SELECT * FROM Clientes;

CREATE TABLE Atendimentos (
	id INT PRIMARY KEY,
	id_funcionario INT,
	id_cliente INT,
	data date,
	FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id),
	FOREIGN KEY (id_funcionario) REFERENCES Clientes(id)
);

CREATE TABLE Avaliacoes (
	id INT PRIMARY KEY,
	id_atendimento INT,
	nota INT,
	Comentario VARCHAR(255),
	FOREIGN KEY (id_atendimento) REFERENCES Atendimentos(id)
);

INSERT INTO Atendimentos(id, id_funcionario, id_cliente, data)
SELECT id, id_funcionario, id_cliente, data
FROM SQL_DB_SQLExemplos.dbo.atendimentos;

INSERT INTO Avaliacoes(id, id_atendimento, nota, Comentario)
SELECT id, id_atendimento, nota, Comentario
FROM SQL_DB_SQLExemplos.dbo.avaliacoes;