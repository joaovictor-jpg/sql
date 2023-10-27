CREATE NONCLUSTERED INDEX idx_valor ON pagamentos (valor);

CREATE NONCLUSTERED INDEX idx_id_data ON vendas (produto_id, data);

CREATE UNIQUE INDEX idx_email ON clientes (email);

CREATE NONCLUSTERED INDEX idx_compras_data ON compras (data);

CREATE NONCLUSTERED INDEX idx_compras_fornecedor_id ON compras (id_fornecedor, data);

CREATE NONCLUSTERED INDEX idx_produtos_nome ON produtos (nome);

CREATE NONCLUSTERED INDEX idx_pedidoid_valor ON pagamentos (id_pedido, valor);

CREATE NONCLUSTERED INDEX idx_produtos_preco ON produtos(preco);