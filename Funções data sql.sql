SELECT * FROM pagamentos WHERE pagamentos.data < GETDATE() - 400;

SELECT DATEDIFF(DAY, '2020-01-01', '2022-01-01');

SELECT DATEDIFF(DAY, data, GETDATE()) AS Diferenca_Dias FROM pagamentos ORDER BY data;

SELECT DATEDIFF(DAY, data, GETDATE()) AS Diferenca_Dias FROM pagamentos WHERE id = 22;

SELECT DATEADD(DAY, 5, GETDATE());

SELECT DATEADD(YEAR, -1, GETDATE());

SELECT *, DATEADD(DAY, 5, data) Data_Prev_Entrega FROM compras;

SELECT DATEPART(YEAR, '2022-01-01');

SELECT ic.id, ic.preco, ic.quantidade, f.nome, DATEPART(YEAR, c.data) AS ano_compra FROM itens_compra ic
INNER JOIN compras c ON c.id = ic.id_compra
INNER JOIN fornecedores f ON f.id = c.id_fornecedor ORDER BY ano_compra DESC;