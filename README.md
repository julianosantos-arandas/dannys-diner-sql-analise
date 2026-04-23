## Modelo de Dados

O projeto é baseado em três tabelas principais:

- vendas: registros de compras realizadas pelos clientes
- menu: informações dos produtos disponíveis
- membros: clientes que aderiram ao programa de fidelidade

A tabela 'vendas' se relaciona com 'menu' através do 'produto_id' e com 'membros' através do 'cliente_id'.

![Diagrama ER](docs/er_diagram.png)