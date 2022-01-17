/*CREATE DATABASE "AV_2"
TEMPLATE = template0
ENCODING 'UTF-8'
CONNECTION LIMIT 100;*/

CREATE TABLE tb_vendedores (
	id_vendedor		INTEGER,
	cpf				VARCHAR,
	nome			VARCHAR,
	carteiraTrabalho	VARCHAR,
	telefone		VARCHAR,
	dataAdmissao	DATE,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_vendedores_id_vendedor PRIMARY KEY (id_vendedor)
);

CREATE TABLE tb_fornecedores (
	id_fornecedor	INTEGER,
	cnpj			VARCHAR,
	razaoSocial		VARCHAR,
	telefone		VARCHAR,
	endereco		VARCHAR,
	contato			VARCHAR,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_fornecedores_id_fornecedor PRIMARY KEY (id_fornecedor)
);

CREATE TABLE tb_categorias (
	id_categoria	INTEGER,
	tituloCategoria	VARCHAR,
	descricaoCategoria	VARCHAR,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_categorias_id_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_produtos (
	id_produto		INTEGER,
	id_fornecedor	INTEGER,
	id_categoria	INTEGER,
	nomeProduto		VARCHAR,
	descricaoProduto	VARCHAR,
	valorUnitario	NUMERIC,
	quantidade		INTEGER,
	quantidadeMinima	INTEGER,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_produtos_id_produto PRIMARY KEY (id_produto),
	CONSTRAINT fk_tb_produtos_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedores (id_fornecedor),
	CONSTRAINT fk_tb_produtos_id_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria)
);

CREATE TABLE tb_vendas (
	id_venda		INTEGER,
	id_vendedor		INTEGER,
	id_categoria	INTEGER,
	id_produto		INTEGER,
	dataVenda		DATE,
	valorTotal		NUMERIC,
	quatidade		INTEGER,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_vendas_id_venda PRIMARY KEY (id_venda),
	CONSTRAINT fk_tb_vendas_id_vendedor FOREIGN KEY (id_vendedor) REFERENCES tb_vendedores (id_vendedor),
	CONSTRAINT fk_tb_vendas_id_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria),
	CONSTRAINT fk_tb_vendas_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produtos (id_produto)
);

CREATE TABLE tb_compras (
	id_compra		INTEGER,
	id_fornecedor	INTEGER,
	id_categoria	INTEGER,
	id_produto		INTEGER,
	dataCompra		DATE,
	valorTotal		NUMERIC,
	quatidade		INTEGER,
	fg_ativo		INTEGER,
	CONSTRAINT pk_tb_compras_id_compra PRIMARY KEY (id_compra),
	CONSTRAINT fk_tb_compras_id_categoria FOREIGN KEY (id_categoria) REFERENCES tb_categorias (id_categoria),
	CONSTRAINT fk_tb_compras_id_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedores(id_fornecedor),
	CONSTRAINT fk_tb_compras_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produtos (id_produto)
);

select * from tb_compras;