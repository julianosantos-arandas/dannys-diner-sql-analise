-- Criação da tabela de produtos
CREATE TABLE menu (
    produto_id INTEGER PRIMARY KEY,
    nome_produto VARCHAR(50),
    preco INTEGER
);

-- Criação da tabela de clientes
CREATE TABLE clientes (
    cliente_id VARCHAR PRIMARY KEY
);

-- Criação da tabela de membros
CREATE TABLE membros (
    cliente_id VARCHAR PRIMARY KEY,
    data_afiliacao DATE,

    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Criação da tabela de vendas
CREATE TABLE vendas (
    cliente_id VARCHAR,
    data_pedido DATE,
    produto_id INTEGER,

    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES menu(produto_id)
    );