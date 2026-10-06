-- Active: 1788267991251@@127.0.0.1@3306@smartcoffee_dml_bruno
-- revisao de dml aula - 08

-- revisao de insert(inserir dados)
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) VALUES
('Kauan R', 'kauan@email.com', '19999999900', 'Limeira-Sp', TRUE, NULL),
('Laura C', 'laurac@email.com', '19999999901', 'Limeira-Sp', TRUE, NULL),
('Laura N', 'lauran@email.com', '19999999902', 'Limeira-Sp', TRUE, NULL),
('Laura R', 'laurar@email.com', '19999999903', 'Limeira-Sp', TRUE, NULL),
('Leonardo B', 'leonardob@email.com', '19999999904', 'Limeira-Sp', TRUE, NULL),
('Leonardo Bt', 'leonardobt@email.com', '19999999905', 'Americana-Sp', TRUE, NULL),
('Lidia M', 'lidia@email.com', '19999999906', 'Belen', TRUE, NULL),
('Livia V', 'livia@email.com', NULL, 'Belen', TRUE, NULL),
('Marcos V', 'marcos@email.com', '19999999907', 'Campo Mourao', TRUE, NULL),
('Nicolas N', 'nicolasn@email.com', '19999999908', '', FALSE, NULL),
('Nicolas F', 'nicolasf@email.com', '19999999909', 'Campinas', TRUE, NULL),
('Pablo H', 'pablo@email.com', '19999999910', 'Indaiatuba', TRUE, NULL),
('Sophie A', 'sophie@email.com', '19999999911', 'Campinas', TRUE, NULL),
('Vinicius H', 'vinicius@email.com', '19999999912', 'Limeira-Sp', TRUE, NULL),
('Vitoria S', 'vitoria@email.com', '19999999913', 'Limeira-SP', TRUE, NULL),
('Virginia S', 'virginia@email.com', '19999999914', 'Limeira-SP', TRUE, NULL);


-- CONSULTAS PARA OS DADOS DO BD

INSERT INTO categoria (nome_categoria) VALUES
('Combos Especiais'), ('Nutella');

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'Aberto', 0.00, 1);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'Aberto', 0.00, 2);

SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, '');

SELECT * FROM cliente;

-- ATUALIZANDO DADOS NO BD
UPDATE cliente
SET telefone = '19983324455'
WHERE id_cliente = 5;

-----------------
-- nunca esquecer do where na hora de ataulizar senao tudo da tabela conforme o set
-----------------

--------------------------------
-- dicas de ouro
-- executar o select antes de atualizar
-- select * from tabela_que_desejo;
--------------------------------

-- condicionais
UPDATE produto
SET preco = 
CASE 
    WHEN preco < 30 THEN preco * 1.50
    ELSE preco * 1.25
END
WHERE ativo = TRUE;

UPDATE cliente
SET telefone = NULL
WHERE id_cliente = 1;

-- apagando dados do bd

DELETE FROM cliente
WHERE id_cliente = 9;

-- excluindo dados de forma logica
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 23;

-- cadastrando um procedimento de compra 
-- passo1: adicionando novo cliente
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Bruno M', 'brunom@email.com', '19993345589', 'Piracicaba', TRUE, NULL);

-- passo2: adicionando novo pedido
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente);
SET @pedido = LAST_INSERT_ID();

-- passo3: adicionando itens ao pedido
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido, 4, 2, 13.00, 'Mel'),
(@pedido, 5, 1, 15.00, '');

-- passo4: atualizando o valor total do pedido
UPDATE pedido
SET valor_total = 41.00,
    status_pedido = 'Preparando'
WHERE id_pedido = @pedido;

-- passo5: registrando pagamento
INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, DATA_PAGAMENTO) VALUES
(@pedido, 2, 22.00, NOW());

-- consulta de forma completa
SELECT p.id_pedido,
    c.nome AS cliente,
    p.status_pedido,
    p.valor_total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido;

