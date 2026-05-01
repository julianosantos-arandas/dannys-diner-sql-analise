=====================================================================
--1 - Qual foi o valor total gasto por cada cliente no restaurante?--
=====================================================================

/*Para obter o resultado:
1) obter o cliente_id na tabela de vendas
2) associar cada venda ao preço do produto na tabela menu
3) somar os valores dos produtos
4) agrupar o resultado por cliente
*/
SELECT 
    v.cliente_id,
    SUM(m.preco) AS total_gasto
FROM vendas v
INNER JOIN menu m ON v.produto_id = m.produto_id
GROUP BY v.cliente_id
ORDER BY total_gasto DESC;

=====================================================================
--2. Em quantos dias diferentes cada cliente visitou o restaurante?--
=====================================================================

/*Para obter o resultado:
1) obter o cliente_id da tabela vendas
2) somar quantos dias diferentes ele comprou, excluindo os duplicados
3) agrupar pelo id do cliente
4) ordenar por ordem decrescente*/

SELECT 
    cliente_id,
	COUNT(DISTINCT data_pedido) AS dias_visitados
FROM vendas
GROUP BY cliente_id
ORDER BY dias_visitados DESC;

======================================================================
--3. Qual foi o primeiro item do cardápio comprado por cada cliente?--
======================================================================

/*Para obter o resultado:
1) obter o cliente_id e as datas de compra na tabela vendas
2) identificar e filtrar a menor data de compra para cada cliente
3) recuperar o produto associado a essa data
4) associar o produto à tabela menu para obter o nome*/

SELECT
    v.cliente_id,
    m.nome_produto,
    v.data_pedido
FROM vendas v
JOIN menu m ON v.produto_id = m.produto_id
WHERE v.data_pedido = (
    SELECT MIN(data_pedido)
    FROM vendas
    WHERE cliente_id = v.cliente_id
)
ORDER BY v.cliente_id;

/*O join aqui foi nescessário para trazer o nome do produto, que não consta na tabela vendas.--
No WHERE v.data_pedido, pega a menor data do cliente.*/

=========================================================================================
--4. Qual é o item mais vendido do cardápio e quantas vezes ele foi comprado no total?--
=========================================================================================

/*Para obter o resultado:
1) contar os itens vendidos da tabela 'vendas'
2) pegar o nome dos produtos na tabela 'menu', pelo id do produto
3) agrupar pelo nome do produto
4) ordernar por ordem decrescente*/

SELECT
    m.nome_produto, 
    COUNT(*) AS total_itens
FROM vendas v
JOIN menu m ON m.produto_id = v.produto_id
GROUP BY m.nome_produto
ORDER BY total_itens DESC;

=======================================================
--5. Qual foi o item mais consumido por cada cliente?--
======================================================= 

/*Para obter o resultado:
1) obter os registros de compras na tabela vendas
2) associar cada venda ao nome do produto na tabela menu
3) contar quantas vezes cada cliente comprou cada item
4) agrupar os resultados por cliente e produto
5) identificar o item com maior quantidade de consumo por cliente*/

SELECT 
    v.cliente_id, 
    m.nome_produto, 
    COUNT(*) AS total_itens
FROM vendas v
JOIN menu m ON m.produto_id = v.produto_id
GROUP BY v.cliente_id, m.nome_produto
HAVING COUNT(*) = (
    SELECT MAX(contagem)
    FROM (
        SELECT 
            v2.cliente_id, 
            m2.nome_produto, 
            COUNT(*) AS contagem
        FROM vendas v2
        JOIN menu m2 ON m2.produto_id = v2.produto_id
        GROUP BY v2.cliente_id, m2.nome_produto
    ) sub
    WHERE sub.cliente_id = v.cliente_id
);

========================================================================================================
--6. Qual item foi comprado primeiro por cada cliente após se tornar membro do programa de fidelidade?--
========================================================================================================

/*Para obter o resultado:
1) obter os registros de compras na tabela vendas
2) associar os clientes da tabela vendas com a tabela membros
3) obter a data de afiliação de cada cliente
4) filtrar as compras realizadas após a data de afiliação (data_pedido >= data_afiliacao)
5) identificar a menor data de compra após a afiliação para cada cliente
6) recuperar o produto associado a essa data
7) associar com a tabela menu para obter o nome do produto*/

SELECT
    v.cliente_id,
    m.nome_produto,
    v.data_pedido
FROM vendas v
JOIN (
    SELECT
    v.cliente_id,
    MIN(v.data_pedido) AS primeira_data
    FROM vendas v
    JOIN membros mb ON mb.cliente_id = v.cliente_id
    WHERE v.data_pedido >= mb.data_afiliacao
    GROUP BY v.cliente_id
) x
    ON v.cliente_id = x.cliente_id
    AND v.data_pedido = x.primeira_data
JOIN menu m ON m.produto_id = v.produto_id;

================================================================================
--7. Qual item foi comprado imediatamente antes de o cliente se tornar membro?--
================================================================================

/*Para obter o resultado:
1) obter os registros de compras da tabela 'vendas'
2) associar a data de afiliação do cliente com a tabela 'vendas'
3) obter a data de afiliação de cada cliente
3) filtrar a última compra anterior a data de afiliação 
4) associar o com a tabela 'menu' para obter o nome do item
*/

WITH ultima_compra AS (
    SELECT
        v.cliente_id,
        MAX(v.data_pedido) AS ultima_data
    FROM vendas v
    JOIN membros mb 
        ON mb.cliente_id = v.cliente_id
    WHERE v.data_pedido < mb.data_afiliacao
    GROUP BY v.cliente_id
)

SELECT
    v.cliente_id,
    m.nome_produto,
    v.data_pedido
FROM vendas v
JOIN ultima_compra u 
    ON v.cliente_id = u.cliente_id
    AND v.data_pedido = u.ultima_data
JOIN menu m 
    ON m.produto_id = v.produto_id;




--8. Qual a quantidade total de itens e o valor gasto por cada cliente antes de se tornar membro?--

/*9. Considerando que cada $1 gasto equivale a 10 pontos e que sushi possui multiplicador de 2x, 
quantos pontos cada cliente acumulou?*/

/*10. Durante a primeira semana após a adesão ao programa (incluindo a data de adesão), os clientes 
ganham 2x pontos em todos os itens. Quantos pontos os clientes A e B acumularam até o final de janeiro?*/