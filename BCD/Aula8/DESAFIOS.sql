-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Nicolas Yuhei Nomi
-- Turma: Dev-Castello (B) Data: 29/09/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml;

-- ============================================================================
-- PARTE A - INSERT
-- ============================================================================

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Bruna M', 'bruna@email.com', '19993345589', 'Piracicaba', TRUE, NOW());

INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Igor L', 'igor@email.com', '11994562319', 'Guarulhos-Sp', TRUE, NOW());

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome, ativo) 
VALUES ('Especiais da Casa', TRUE);

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SET @id_categoria_especiais = LAST_INSERT_ID();

INSERT INTO produto (nome, preco, id_categoria, ativo) VALUES
('Café Especial Gourmet', 18.50, @id_categoria_especiais, TRUE),
('Capuccino com Avelã', 15.00, @id_categoria_especiais, TRUE),
('Espresso Torta de Limão', 16.50, @id_categoria_especiais, TRUE);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Vitor', 'vitor@email.com', NULL, 'Piracicaba', TRUE, NOW());

-- 5. Crie um novo pedido para um dos clientes cadastrados.
SET @cliente = (SELECT id_cliente FROM cliente WHERE email = 'bruna@email.com');

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 0.00, @cliente);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(@pedido_atividade, 1, 2, 18.50, 'Extra quente'),
(@pedido_atividade, 2, 1, 15.00, 'Sem açúcar');


-- ============================================================================
-- PARTE B - UPDATE
-- ============================================================================

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
SELECT * FROM cliente WHERE id_cliente = @cliente;

-- UPDATE:
UPDATE cliente
SET telefone = '19984457788'
WHERE id_cliente = @cliente;

-- SELECT final:
SELECT * FROM cliente WHERE id_cliente = @cliente;


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
SET @cliente_igor = (SELECT id_cliente FROM cliente WHERE email = 'igor@email.com');

-- SELECT de validação:
SELECT * FROM cliente WHERE id_cliente = @cliente_igor;

-- UPDATE:
UPDATE cliente
SET telefone = '11988776655',
    cidade = 'Valinhos-Sp'
WHERE id_cliente = @cliente_igor;

-- SELECT final:
SELECT * FROM cliente WHERE id_cliente = @cliente_igor;


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
-- SELECT de validação:
SELECT p.* 
FROM produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Especiais da Casa';

-- UPDATE:
UPDATE produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
SET p.preco = p.preco * 1.08
WHERE c.nome = 'Especiais da Casa';

-- SELECT final:
SELECT p.* 
FROM produto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE c.nome = 'Especiais da Casa';


-- 10. Altere o status do pedido criado para 'PREPARANDO'.
-- SELECT de validação:
SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;

-- UPDATE:
UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade;

-- SELECT final:
SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
-- SELECT de validação com cálculo prévio:
SELECT id_pedido, SUM(quantidade * preco_unitario) AS total_calculado
FROM item_pedido
WHERE id_pedido = @pedido_atividade
GROUP BY id_pedido;

-- UPDATE:
UPDATE pedido
SET valor_total = (
    SELECT SUM(quantidade * preco_unitario)
    FROM item_pedido
    WHERE id_pedido = @pedido_atividade
)
WHERE id_pedido = @pedido_atividade;

-- SELECT final:
SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SET @id_produto_inativar = (SELECT MIN(id_produto) FROM produto WHERE id_categoria = @id_categoria_especiais);

-- SELECT de validação:
SELECT * FROM produto WHERE id_produto = @id_produto_inativar;

-- UPDATE:
UPDATE produto
SET ativo = FALSE
WHERE id_produto = @id_produto_inativar;

-- SELECT final:
SELECT * FROM produto WHERE id_produto = @id_produto_inativar;


-- ============================================================================
-- PARTE C - DELETE
-- ============================================================================

-- 13. Crie um cliente de teste sem pedidos. Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro)
VALUES ('Cliente Temp Delete', 'temp.delete@email.com', '19900000000', 'Piracicaba', TRUE, NOW());

SET @id_cliente_temp = LAST_INSERT_ID();

-- SELECT de validação:
SELECT * FROM cliente WHERE id_cliente = @id_cliente_temp;

-- DELETE:
DELETE FROM cliente WHERE id_cliente = @id_cliente_temp;

-- SELECT final:
SELECT * FROM cliente WHERE id_cliente = @id_cliente_temp;


-- 14. Tente excluir um cliente da base original que possua pedidos.
-- SELECT de validação:
SELECT DISTINCT c.* 
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE c.id_cliente = @cliente;

-- DELETE comentado após o teste:
-- DELETE FROM cliente WHERE id_cliente = @cliente;

-- Resultado observado:
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails 
-- (`smartcoffee_dml`.`pedido`, CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`))


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
/*
Resposta:
A restrição de Chave Estrangeira (Foreign Key - FK) impede a remoção do registro pai (cliente) 
enquanto existirem registros filhos associados (pedidos). Isso garante a Integridade Referencial 
do banco de dados, evitando a existência de pedidos sem um cliente vinculado ("órfãos").
*/


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome, ativo) VALUES ('Excluir Depois', TRUE);
SET @id_cat_temp = LAST_INSERT_ID();

-- SELECT de validação:
SELECT * FROM categoria WHERE id_categoria = @id_cat_temp;

-- DELETE:
DELETE FROM categoria WHERE id_categoria = @id_cat_temp;

-- SELECT final:
SELECT * FROM categoria WHERE id_categoria = @id_cat_temp;


-- ============================================================================
-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- ============================================================================

-- 17. Tente inserir um produto com id_categoria = 9999.
-- INSERT INTO produto (nome, preco, id_categoria, ativo) VALUES ('Produto Teste FK', 10.00, 9999, TRUE);
-- Qual restrição impediu a operação?
-- Restrição de Chave Estrangeira (FOREIGN KEY Constraint). O código de categoria 9999 não existe na tabela pai (`categoria`).


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Ana Silva', 'ana@email.com', '19999999999', 'Limeira', TRUE);
-- Qual restrição impediu a operação?
-- Restrição de Unicidade (UNIQUE Key/Constraint na coluna `email`). O e-mail já está cadastrado para outro cliente.


-- 19. Tente criar um pedido com id_cliente = 9999.
-- INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES (NOW(), 'ABERTO', 0.00, 9999);
-- Qual restrição impediu a operação?
-- Restrição de Chave Estrangeira (FOREIGN KEY Constraint). O cliente 9999 não existe na tabela pai (`cliente`).


-- 20. Escreva em comentários a diferença entre os três erros anteriores.
/*
Diferença entre as restrições:

- Exercícios 17 e 19 (FOREIGN KEY):
  Servem para manter a Integridade Referencial ENTRE tabelas. Elas impedem que registros filhos
  (produtos ou pedidos) referenciem um registro pai inexistente nas tabelas de origem (categoria ou cliente).

- Exercício 18 (UNIQUE CONSTRAINT):
  Serve para manter a Unicidade DENTRO da própria tabela. Ela impede que existam dois registros com 
  o mesmo valor em uma coluna configurada como única (como a coluna 'email' na tabela cliente).
*/


-- ============================================================================
-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO
-- ============================================================================

-- 21. Inicie uma transação.
START TRANSACTION;

-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Marcos Teste Rollback', 'marcos.roll@email.com', '19988112233', 'Piracicaba', TRUE, NOW());
SET @id_cli_tx1 = LAST_INSERT_ID();

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 35.00, @id_cli_tx1);
SET @id_ped_tx1 = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
(@id_ped_tx1, 2, 1, 15.00),
(@id_ped_tx1, 3, 1, 20.00);

-- 23. Faça uma consulta com JOIN comprovando que os registros existem enquanto a transação está aberta.
SELECT 
    c.id_cliente,
    c.nome AS cliente,
    p.id_pedido,
    p.status_pedido,
    ip.id_produto,
    ip.quantidade,
    ip.preco_unitario
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
WHERE c.id_cliente = @id_cli_tx1;

-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.
ROLLBACK;

-- Consultas de comprovação (devem retornar vazio):
SELECT * FROM cliente WHERE id_cliente = @id_cli_tx1;
SELECT * FROM pedido WHERE id_pedido = @id_ped_tx1;


-- 25. Repita o processo com novos dados e finalize usando COMMIT. Depois consulte os registros persistidos.
START TRANSACTION;

INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Renata Teste Commit', 'renata.commit@email.com', '19977223344', 'Limeira', TRUE, NOW());
SET @id_cli_tx2 = LAST_INSERT_ID();

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES (NOW(), 'ABERTO', 45.00, @id_cli_tx2);
SET @id_ped_tx2 = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
VALUES 
(@id_ped_tx2, 2, 1, 15.00),
(@id_ped_tx2, 3, 1, 30.00);

COMMIT;

-- Consulta de comprovação após COMMIT (dados persistidos com sucesso):
SELECT 
    c.id_cliente,
    c.nome AS cliente,
    p.id_pedido,
    p.status_pedido,
    p.valor_total,
    ip.id_produto,
    ip.quantidade,
    ip.preco_unitario
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente
JOIN item_pedido ip ON p.id_pedido = ip.id_pedido
WHERE c.id_cliente = @id_cli_tx2;


