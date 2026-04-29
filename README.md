PROJETO EM PROGRESSO

🔵 Introdução

Um cliente abriu um restaurante japonês em 2025 chamado Danny's Dinner e, ao longo desse período, coletou alguns dados básicos sobre sua operação. No entanto, ele ainda não sabe como utilizá-los de forma estratégica para impulsionar o crescimento ou garantir a sustentabilidade do negócio.

🔵 Problema

O cliente deseja utilizar dados operacionais para entender melhor o comportamento dos clientes, incluindo padrões de visita, valor gasto e preferências de consumo. Com esses insights, ele busca melhorar a experiência dos clientes e avaliar a expansão do programa de fidelidade.

Devido a restrições de privacidade, foi disponibilizada apenas uma amostra dos dados, composta por quatro conjuntos principais:

🔹vendas  
🔹cardápio   
🔹clientes  
🔹clientes membros   

Além disso, há a necessidade de gerar datasets simplificados para que a equipe possa analisar as informações sem depender de consultas SQL.

🔵 Modelo de Dados

O projeto é baseado em quatro tabelas principais:

🔹 vendas: registros de compras realizadas pelos clientes  
🔹 menu: informações dos produtos disponíveis  
🔹 membros: clientes que aderiram ao programa de fidelidade  
🔹 clientes: clientes gerais do estabelecimento   

A tabela 'vendas' se relaciona com 'menu' através do 'produto_id' e com 'clientes' através do 'cliente_id', a tabela 'membros' se relaciona com 'clientes' através do 'cliente_id'

![Diagrama ER](docs/er_diagram.png)

🔵 Dataset

Os dados utilizados são compostos por três tabelas:

🔹 vendas
  - cliente_id
  - data_pedido
  - produto_id

🔹 menu
  - produto_id
  - nome_produto
  - preco

🔹 membros
  - cliente_id
  - data_afiliacao
  
🔹 vendas
  - cliente_id

    

🔵 Perguntas de Negócio

As análises foram conduzidas para responder às seguintes questões:

1. Qual foi o valor total gasto por cada cliente no restaurante?

2. Em quantos dias diferentes cada cliente visitou o restaurante?

3. Qual foi o primeiro item do cardápio comprado por cada cliente?

4. Qual é o item mais vendido do cardápio e quantas vezes ele foi comprado no total?

5. Qual foi o item mais consumido por cada cliente?

6. Qual item foi comprado primeiro por cada cliente após se tornar membro do programa de fidelidade?

7. Qual item foi comprado imediatamente antes de o cliente se tornar membro?

8. Qual a quantidade total de itens e o valor gasto por cada cliente antes de se tornar membro?

9. Considerando que cada $1 gasto equivale a 10 pontos e que sushi possui multiplicador de 2x, quantos pontos cada cliente acumulou?

10. Durante a primeira semana após a adesão ao programa (incluindo a data de adesão), os clientes ganham 2x pontos em todos os itens. Quantos pontos os clientes A e B acumularam até o final de janeiro?
