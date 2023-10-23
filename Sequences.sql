CREATE SEQUENCE codigoDeBarraSequence
START WITH 100000
INCREMENT BY 1;

CREATE TABLE inventario (
ItemID INT PRIMARY KEY IDENTITY,
ItemNome VARCHAR(50),
CodigoDeBarra INT DEFAULT(NEXT VALUE FOR codigoDeBarraSequence));

INSERT INTO inventario (ItemNome) VALUES ('Notebook'), ('Mouse'), ('Teclado');

SELECT * FROM inventario;

CREATE SEQUENCE IDProjetoSequence2022 START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IDProjetoSequence2023 START WITH 1000 INCREMENT BY 1;

CREATE TABLE projetos (
ProjetosID INT,
ProjetosAno INT,
ProjetosNome VARCHAR(50),
Data DATETIME);

INSERT INTO projetos (ProjetosID, ProjetosAno, ProjetosNome, Data) 
VALUES (NEXT VALUE FOR IDProjetoSequence2022, 2022, 'Projeto A', '2022-01-01');
INSERT INTO projetos (ProjetosID, ProjetosAno, ProjetosNome, Data) 
VALUES (NEXT VALUE FOR IDProjetoSequence2023, 2023, 'Projeto B', '2023-01-01');

CREATE SEQUENCE NorteIDSequence START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SulIDSequence START WITH 1 INCREMENT BY 1;

CREATE TABLE orders (
PedidoId INT,
Regiao VARCHAR(50),
PedidoData DATETIME,
Total DECIMAL(18,2));

INSERT INTO orders (PedidoId, Regiao, PedidoData, Total) VALUES (NEXT VALUE FOR NorteIDSequence, 'Norte', GETDATE(), 100.00);
INSERT INTO orders (PedidoId, Regiao, PedidoData, Total) VALUES (NEXT VALUE FOR SulIDSequence, 'Sul', GETDATE(), 200.00);

SELECT * FROM projetos;
SELECT * FROM orders;