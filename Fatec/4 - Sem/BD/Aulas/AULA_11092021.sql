-- Aula (11/09/2021)
CREATE DATABASE "ADS_NOTURNO"  -- Identificador do BD
TEMPLATE = template0           -- Aplicação de herança de modelo pré-existente
ENCODING 'UTF-8'               -- Codificação suportada pelo BD (acentuações/moeda)
CONNECTION LIMIT 100;          -- Número de conexões simultâneas suportadas

-- Criando a tb_empregados
CREATE TABLE tb_empregados(
	rg                 VARCHAR(11),
	nome            VARCHAR(60),
	idade            INTEGER,
	CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)    
); 

CREATE TABLE tb_pedidos(
	numero            INTEGER,
	ds_pedido        VARCHAR(40),
	dt_pedido        TIMESTAMP,
	CONSTRAINT pk_tb_pedidos_nr PRIMARY KEY(numero)    
);

CREATE TABLE tb_itens(
	NroPedido        INTEGER,
	NroItem            INTEGER,
	produto            VARCHAR(60),
	quantidade        INTEGER,
	CONSTRAINT pk_tb_itens_NroPedido_NrItem PRIMARY KEY(NroPedido, NroItem),
	CONSTRAINT fk_tb_itens_NroPedido FOREIGN KEY(NroPedido)
			 REFERENCES tb_pedidos(numero)
);

-- Instrução DDL para eliminar o objeto (table)
DROP TABLE tb_empregados; 

CREATE TABLE tb_empregados(
	rg				VARCHAR(11),
	nm_empregado	VARCHAR(60),
	idade			INTEGER,
	plano_saude		VARCHAR(20),
	rua				VARCHAR(60),
	numero			VARCHAR(5),
	cidade			VARCHAR(60),
	CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)    
);

CREATE TABLE tb_telefones(
	rg                VARCHAR(11),
	numero            VARCHAR(11),
	CONSTRAINT pk_tb_telefones_rg_nr PRIMARY KEY(rg, numero),
	CONSTRAINT fk_tb_telefones_rg FOREIGN KEY(rg)
		   REFERENCES tb_empregados(rg)
);

SELECT *
FROM tb_empregados;

INSERT INTO tb_empregados
VALUES
('123', 'Luis Felipe', 20, 'Unimed', 'Rua X', 'Nr Y', 'Ribeirão Preto'),
('456', 'Caio Henrique', 21, 'São Francisco', 'Rua W', 'Nr Z', 'São Carlos'),
('789', 'Erika Carvalho', 22, 'Unimed', 'Rua A', 'Nr B', 'Franca'),
('012', 'Jessica Caroline', 23, 'Não têm', 'Rua C', 'Nr D', 'Ribeirão Preto'),
('345', 'Camila Batista', 24, 'Não têm', 'Rua D', 'Nr E', 'Sertãozinho');

SELECT *
FROM tb_telefones;

INSERT INTO tb_telefones
VALUES
('123', '3512 1111'),
('123', '9133 5566'),
('789', '9813 8877'),
('345', '3635 1010'),
('345', '3578 9887'),
('345', '9185 0022');

-- Gerando um relatório simples
SELECT e.nm_empregado, t.numero
FROM tb_empregados e
INNER JOIN tb_telefones t ON(t.rg = e.rg)
ORDER BY e.nm_empregado;

CREATE TABLE tb_servidores(
	cpf                VARCHAR(11),
	nm_servidor        VARCHAR(60),
	CONSTRAINT pk_tb_servidores_cpf PRIMARY KEY(cpf)    
);

CREATE TABLE tb_funcionarios(
	cpf              VARCHAR(11),
	ds_funcao        VARCHAR(25),
	CONSTRAINT pk_tb_funcionarios_cpf PRIMARY KEY(cpf),
	CONSTRAINT fk_tb_funcionarios_cpf FOREIGN KEY(cpf)
			REFERENCES tb_servidores(cpf)
);

CREATE TABLE tb_professores(
cpf              VARCHAR(11),
titulacao        VARCHAR(20),
categoria        VARCHAR(10),
CONSTRAINT pk_tb_professores_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_professores_cpf FOREIGN KEY(cpf)
       REFERENCES tb_servidores(cpf)
);

CREATE TABLE tb_pessoas(
codigo		INTEGER,
nm_pessoa	VARCHAR(60),
CONSTRAINT pk_tb_pessoas_codigo PRIMARY KEY(codigo)
);

CREATE TABLE tb_cnh(
nr_cnh			INTEGER,
dt_expedicao	DATE,
validade		DATE,
categoria		VARCHAR(3),
codigo			INTEGER CONSTRAINT uq_tb_cnh_codigo UNIQUE,
dt_retirada		DATE,
CONSTRAINT pk_tb_cnh_nr PRIMARY KEY(nr_cnh),
CONSTRAINT fk_tb_cnh_codigo FOREIGN KEY(codigo) REFERENCES tb_pessoas(codigo)
);

SELECT *
FROM tb_pessoas;

INSERT INTO tb_pessoas
VALUES
(10, 'Paulo Antonio'),
(11, 'Alexandre Marques'),
(12, 'Caio Andrade'),
(13, 'Soninho Gameplay'),
(14, 'Cleber Genrique'),
(15, 'Tokio drift'),
(16, 'Douglas Samuel'),
(17, 'Jefford Paulo');

SELECT *
FROM tb_cnh;

INSERT INTO tb_cnh
VALUES
(100, '11/09/2021', '11/09/2026', 'AB',10,'13/09/2021');

INSERT INTO tb_cnh
VALUES
(101, '11/09/2021', '11/09/2026', 'C',16,'13/09/2021');

CREATE TABLE tb_homens(
	rg			VARCHAR(11),
	nm_homem	VARCHAR(60),
	CONSTRAINT pk_tb_homens_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_mulheres(
	rg			VARCHAR(11),
	nm_mulher	VARCHAR(60),
	CONSTRAINT pk_tb_mulheres_rg PRIMARY KEY (rg)
);

CREATE TABLE tb_casamentos(
	rg_homem		VARCHAR(11),
	rg_mulher		VARCHAR(11) CONSTRAINT uq_tb_casamentos_rg_mulher UNIQUE,
	dt_casamento	DATE,
	CONSTRAINT pk_tb_casamentos_rg_homem PRIMARY KEY(rg_homem),
	CONSTRAINT fk_tb_casamentos_rg_homem FOREIGN KEY(rg_homem) REFERENCES tb_homens(rg),
	CONSTRAINT fk_tb_casamentos_rg_mulher FOREIGN KEY(rg_mulher) REFERENCES tb_mulheres(rg)
);

DROP TABLE tb_empregados CASCADE;

CREATE TABLE tb_departamentos(
	cod_dpto			INTEGER,
	nm_dpto				VARCHAR(40),
	CONSTRAINT pk_tb_empregados_cod_dpto PRIMARY KEY (cod_dpto)
);

CREATE TABLE tb_empregados(
	cpf				VARCHAR(11),
	nm_emp			VARCHAR(60),
	cod_dpto		INTEGER CONSTRAINT nn_tb_empregados_cod_dpto NOT NULL,
	dt_lotacao		DATE,
	CONSTRAINT pk_tb_empregados_cpf PRIMARY KEY(cpf),
	CONSTRAINT fk_tb_empregados_cod_dpto FOREIGN KEY (cod_dpto) REFERENCES tb_departamentos(cod_dpto)
);

DROP TABLE tb_pessoas CASCADE;

CREATE TABLE tb_pessoas(
	rg			VARCHAR(11),
	nm_pessoa	VARCHAR(60),
	CONSTRAINT pk_tb_pessoas_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_automoveis(
	chassi			VARCHAR(17),
	modelo			VARCHAR(25),
	ano				INTEGER,
	CONSTRAINT pk_tb_automoveis_chassi PRIMARY KEY(chassi)
);

CREATE TABLE tb_posses(
	rg			VARCHAR(11),
	chassi		VARCHAR(17),
	dt_compra	DATE,
	CONSTRAINT pk_tb_posses_chassi PRIMARY KEY(chassi),
	CONSTRAINT fk_tb_posses_rg FOREIGN KEY (rg) REFERENCES tb_pessoas(rg),
	CONSTRAINT fk_tb_posses_chassi FOREIGN KEY (chassi) REFERENCES tb_automoveis(chassi)
);

CREATE TABLE tb_empregados(
	rg				VARCHAR(11),
	nm_empregado	VARCHAR(60),
	CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_projetos(
	cod_projeto		INTEGER,
	nm_projeto		VARCHAR(60),
	CONSTRAINT pk_tb_projetos_cod_proj PRIMARY KEY(cod_projeto)
);

CREATE TABLE tb_participacoes(
	rg			VARCHAR(11),
	cod_projeto	INTEGER,
	dt_inicio	DATE,
	CONSTRAINT pk_tb_participacoes_rg_cod PRIMARY KEY(rg, cod_projeto),
	CONSTRAINT fk_tb_participacoes_rg FOREIGN KEY(rg) REFERENCES tb_empregados,
	CONSTRAINT fk_tb_participacoes_cod_proj FOREIGN KEY (cod_projeto) REFERENCES tb_projetos(cod_projeto)
);