-- Active: 1788267991251@@127.0.0.1@3306@smartcoffee_dml_bruno
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Manuella Rossatt', 'manuella@email.com', '19999812131', 'Limeira', TRUE);

-- CONSULTAS COM SELECT
-- ESTRUTURA DE CONSTRUCAO DO SELECT
-- SELECT coluna
-- FROM tabela;

-- EX 1: SELECT PARA TODAS AS COLUNAS

SELECT * FROM cliente;

-- EX 2: SELECT POR CULNAS

SELECT nome, email,ativo FROM cliente;

-- EX 3: ALIAS E UM APELIDO PARA O RESULTADO

SELECT nome AS cliente,
    telefone AS contato
FROM cliente;

SELECT ativo AS Status,
    ativo AS Status
FROM cliente;

SELECT nome, preco, preco *0.80 AS preco_promocao
FROM produto;

-- EX 4: ELIMINANDO REPETICOES 

SELECT DISTINCT cidade
FROM cliente;

-- SEM DISTINCT - APARECE VARIAS VEZES. COM DISTINCT APARECE APENAS UMA VEZ

SELECT cidade FROM cliente

-- EX 5: FILTROS EM REGISTROS
SELECT nome, preco
FROM produto
WHERE preco > 10;

SELECT nome, preco
FROM produto
WHERE peco <> 10;

SELECT nome, preco
FROM produto
WHERE ativo = TRUE;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- OUTROS OPERADORES DE COMPARACAO
-- = IGUAL
-- <> != DIFERENTE
-- > MAIOR
-- >= MAIOR OU IGUAL
-- < MENOR
-- <= MENOR OU IGUAL

-- EX 6: AND, OR E NOT
SELECT nome, preco
FROM produto
WHERE preco >= 8 AND preco <= 20;

-- EXEMPLO COM OR
SELECT nome, cidade
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba';

SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXEMPLO COM AND E OR JUNTOS UTILIZAR ()
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE
AND (cidade = 'Limeira' OR cidade = 'Americana');

-- Cuidado com AND e OR juntos. Use parênteses quando necessário para deixar a regra explícita.

-- EX 7: BETWEEN — pesquisando por intervalos
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-01 23:59:59';

-- EX 8: IN - VARIAS POSSIBILIDADES
-- USAR PARA ELIMINAR A QUANTIDADE DE OR
SELECT nome, cidade
FROM cliente
WHERE cidade IN ('Limeira', 'Americana', 'Piracicaba');

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Americana');

-- EX 9: LIKE - pesquisando por textos
SELECT nome
FROM produto
WHERE nome LIKE 'Cafe%';
-- COMECA COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';
-- POSSUI A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%Silva';
-- Utilizando % como coringa

SELECT nome
FROM produto
WHERE nome LIKE '_ilva';

SELECT nome
FROM cliente
WHERE nome LIKE 'br_';
-- Utilizando _ como coringa

-- EX 10: NULL - ausencia de valor 
SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- EX 11: ORDER BY - ordenar resultados
-- ASC é crescente e DESC é decrescente
SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
ORDER BY preco DESC;

SELECT cidade, nome
FROM cliente
ORDER BY cidade ASC, nome DESC;

-- EX 12: LIMIT - limitando a quantidade

SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 8;

SELECT nome, preco
FROM produto
ORDER BY nome
LIMIT 8 OFFSET 8;

-- EX 13: COLUNAS COM CALCULOS
SELECT nome, preco, preco * 1.10 AS preco_com_reajuste
FROM produto;

-- CALCULO COM SUBTOTAL DE UM ITEM
SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS subtotal
FROM item_pedido:

-- EX 14: FUNCOES UTEIS EM CONSULTAS
SELECT UPPER(nome) AS Nome_Maiusculo,
    LOWER(email) AS Email_Minusculo
FROM cliente;
-- DEIXAR EM MAIUSCULO OU MINUSCULO

SELECT CONCAT(nome, '-', cidade) AS Cliente_CIdade
FROM cliente;
-- JUNTAR INFORMACOES ENTRE CAMPOS

SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;
-- arredondar casas decimais

SELECT id_pedido, data_pedido, DATE(data_pedido) AS Data_Pedido, YEAR(data_pedido) AS Ano_Pedido, MONTH(data_pedido) AS Mes_Pedido
FROM pedido;
-- FORMATACAO DE RESULTADO POR DATA MES E ANO

-- SUBSTITUINDO NULL PARA TEXTO DESEJADO
SELECT nome,
COALESCE(telefone, 'Nao informado') AS telefone
FROM cliente;

-- FUNCOES DE AGREGACOES
-- EX 15: FUNCOES DE CALCULO AGREGADAS

-- COUNT() - CONTAR
-- SUM() - SOMAR
-- AVG() - MEDIA
-- MIN() - MINIMO
-- MAX() - MAXIMO

SELECT COUNT(*) AS TOTAL_CLIENTES
FROM cliente;
-- QUANTOS CLIENTES TEMOS EM NOSSA TABELA CLIENTE?
SELECT AVG(preco) AS PRECO_MEDIO
FROM produto;
-- CALCULE O PRECO MEDIO DOS PRODUTOS
SELECT MIN(preco) AS MENORES_PRECOS,
    MAX(preco) AS MAIORES_PRECOS,
    AVG(preco) AS MEDIA_PRECOS
FROM produto;
-- RESUMO DOS PRECOS
 
SELECT SUM(valor_total) AS FATURAMENTO
FROM pedido
WHERE status = 'FINALIZADO';
-- TOTAL PEDIDOS FINALIZADOS

-- EX 16: GROUP BY - AGRUPAR DADOS
SELECT cidade,
        COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade;
-- QUANTIDADE DE CLIENTE EM CADA CIDADE

SELECT id_categoria
    COUNT(*) AS Quantidade_Produtos
FROM produto
GROUP BY id_categoria;
-- QUANTIDADE DE PRODUTOS POR CATEGORIA

-- EX 17: HAVING - FILTRAR GRUPOS
-- WHERE filtra linhas antes do agrupamento. 
-- HAVING filtra os grupos depois do GROUP BY.

SELECT cidade,
        COUNT(*) AS quantidade_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;
-- CIDADES COM PELO MENOS DOIS CLIENTES

-- EX 18: RESUMO DE ORDEM DE UMA CONSULTA COMPLETA
SELECT colunas 
FROM tabelas
WHERE condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;

SELECT nome, cidade COUNT(*) AS Quantidade_Clientes
FROM cliente
WHERE cidade = 'Limeira'
GROUP BY cidade
HAVING COUNT(*) >= 3
LIMIT 5;
