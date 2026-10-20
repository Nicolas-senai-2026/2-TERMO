-- Active: 1788267991251@@127.0.0.1@3306@smartcoffee_dml_bruno
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Nicolas Yuhei Nomi
-- Turma: Dev-Castello Data: 06/10/2026
-- Base: smartcoffee_dql
-- ============================================================
CREATE DATABASE smartcoffee_dql

USE smartcoffee_dql;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * 
FROM cliente;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT *
FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 5;


-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT *
FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT *
FROM produto
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.
SELECT *
FROM cliente
WHERE telefone IS NULL OR telefone = '';

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00, do maior para o menor valor.
SELECT *
FROM pedido
WHERE status = 'FINALIZADO' AND valor > 20.00
ORDER BY valor DESC;


-- PARTE C - CÁLCULOS E AGRUPAMENTO

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT(*) AS total_produtos
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT 
    MIN(preco) AS menor_preco,
    MAX(preco) AS maior_preco,
    AVG(preco) AS preco_medio
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT cidade, COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(valor) AS faturamento_total
FROM pedido
WHERE status = 'FINALIZADO';

-- ============================================================
-- PARTE D - RELACIONAMENTOS
-- ============================================================

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.
SELECT 
    p.id_pedido, 
    p.data_pedido, 
    c.nome AS nome_cliente, 
    p.status, 
    p.valor_total
FROM pedido p
INNER JOIN cliente c ON p.id_cliente = c.id_cliente;


-- 17. Liste cada produto acompanhado do nome de sua categoria.
SELECT 
    p.nome AS produto, 
    cat.nome AS categoria
FROM produto p
INNER JOIN categoria cat ON p.id_categoria = cat.id_categoria;


-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.
SELECT 
    ip.id_pedido,
    p.nome AS produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM item_pedido ip
INNER JOIN produto p ON ip.id_produto = p.id_produto;


-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.
SELECT 
    c.id_cliente,
    c.nome AS cliente,
    p.id_pedido,
    p.data_pedido,
    p.status
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente;


-- 20. Liste apenas os clientes que nunca fizeram pedidos.
SELECT 
    c.id_cliente,
    c.nome AS cliente,
    c.email
FROM cliente c
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;


-- ============================================================
-- PARTE E - DESAFIO GERENCIAL
-- ============================================================

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.
SELECT 
    c.nome AS cliente,
    COUNT(p.id_pedido) AS quantidade_pedidos,
    SUM(p.valor_total) AS total_gasto
FROM cliente c
INNER JOIN pedido p ON c.id_cliente = p.id_cliente
WHERE p.status = 'FINALIZADO'
GROUP BY c.id_cliente, c.nome
ORDER BY total_gasto DESC;


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.
SELECT 
    cat.nome AS categoria,
    COUNT(p.id_produto) AS total_produtos,
    AVG(p.preco) AS preco_medio
FROM categoria cat
LEFT JOIN produto p ON cat.id_categoria = p.id_categoria
GROUP BY cat.id_categoria, cat.nome;


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.
SELECT 
    nome, 
    preco
FROM produto
WHERE preco > (SELECT AVG(preco) FROM produto);


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.
-- Faixas definidas: 
--  - Até R$ 10,00: Econômico
--  - De R$ 10,01 até R$ 25,00: Intermediário
--  - Acima de R$ 25,00: Premium
SELECT 
    nome,
    preco,
    CASE 
        WHEN preco <= 10.00 THEN 'Econômico'
        WHEN preco BETWEEN 10.01 AND 25.00 THEN 'Intermediário'
        ELSE 'Premium'
    END AS classificacao
FROM produto
ORDER BY preco ASC;


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
-- Quais são os 3 produtos mais vendidos (em quantidade total de itens) considerando apenas pedidos FINALIZADOS?
--
-- Por que essa informação é útil?
-- Permite identificar os "carros-chefe" da cafeteria, ajudando no controle de estoque de insumos e no planejamento de ações promocionais ou combos de vendas.