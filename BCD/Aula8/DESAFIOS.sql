-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Nicolas Yuhei Nomi
-- Turma: Dev-Castello (B) Data: 29/09/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Bruna M', 'bruna@email.com', '19993345589', 'Piracicaba', TRUE, NULL);

INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Igor L', 'igor@email.com', '11994562319', 'Guarulhos-Sp', TRUE, NULL);

-- 2. Cadastre a categoria 'Especiais da Casa'.


-- 3. Localize o id da categoria criada e cadastre três produtos nela.


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo, data_cadastro) 
VALUES ('Vitor', 'vitor@email.com',NULL, 'Piracicaba', TRUE, NULL);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente);
SET @pedido = LAST_INSERT_ID();

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade LAST_INSERT_ID()
(@pedido, 4, 2, 78.00, 'Porcao camarao'),
(@pedido, 5, 1, 16.00, 'Batida limao suico');

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:
UPDATE cliente
select TELEFONE = '19984457788'
WHERE ID_CLIENTE = 3;


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

UPDATE cliente
select TELEFONE = '19984457788'
    cidade = 'Valinhos-Sp'
WHERE ID_CLIENTE = 3;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

UPDATE produto
SET preco = 
CASE 
    WHEN preco < 30 THEN preco * 1.50
    ELSE preco * 
END
WHERE ativo = TRUE;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.

UPDATE pedido
SET valor_total = 41.00,
    status_pedido = 'Preparando'
WHERE id_pedido = @pedido;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).



-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

UPDATE produto
SET ativo = FALSE
WHERE id_cliente = 23;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.