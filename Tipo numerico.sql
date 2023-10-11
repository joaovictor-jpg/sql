USE Primeiro_Banco;

CREATE TABLE Tipos_dados (
Codigo BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Estoque INT NOT NULL,
Vendas BIGINT NOT NULL,
Num_Residencia SMALLINT NOT NULL,
Idade TINYINT NOT NULL,
Faturamento DECIMAL NOT NULL,
Valor_Produto FLOAT NOT NULL);

INSERT INTO dbo.Tipos_dados ( Estoque, Vendas, Num_Residencia, Idade, Faturamento, Valor_Produto) VALUES
( 1024000, 42010440052, 1540, 40, 2050125042141.501, 1504.50);

SELECT * FROM dbo.Tipos_dados;