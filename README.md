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
