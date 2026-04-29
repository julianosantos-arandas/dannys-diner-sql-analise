=====================================================================
--1 - Qual foi o valor total gasto por cada cliente no restaurante?--
=====================================================================

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

SELECT 
    cliente_id,
	COUNT(DISTINCT data_pedido) AS dias_visitados
FROM vendas
GROUP BY cliente_id
ORDER BY dias_visitados DESC;

======================================================================
--3. Qual foi o primeiro item do cardápio comprado por cada cliente?--
======================================================================

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

select
    m.nome_produto, 
    COUNT(*) AS total_itens
FROM vendas v
JOIN menu m ON m.produto_id = v.produto_id
GROUP BY m.nome_produto
ORDER BY total_itens DESC;


=======================================================
--5. Qual foi o item mais consumido por cada cliente?--
======================================================= 

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


--7. Qual item foi comprado imediatamente antes de o cliente se tornar membro?--

--8. Qual a quantidade total de itens e o valor gasto por cada cliente antes de se tornar membro?--

/*9. Considerando que cada $1 gasto equivale a 10 pontos e que sushi possui multiplicador de 2x, 
quantos pontos cada cliente acumulou?*/

/*10. Durante a primeira semana após a adesão ao programa (incluindo a data de adesão), os clientes 
ganham 2x pontos em todos os itens. Quantos pontos os clientes A e B acumularam até o final de janeiro?*/