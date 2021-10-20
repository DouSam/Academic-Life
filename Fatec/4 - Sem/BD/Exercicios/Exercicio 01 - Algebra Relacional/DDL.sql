/* Criacao do banco de dados
CREATE DATABASE "ATV_1_algebra"
TEMPLATE = template0
ENCODING 'UTF-8'
CONNECTION LIMIT 100;*/

--Criacao da tb_funcao
CREATE TABLE tb_funcao(
	id_funcao		VARCHAR(10),
	ds_funcao		VARCHAR(35),
	base_salario	NUMERIC,
	teto_salario	NUMERIC,
	CONSTRAINT pk_tb_funcao_id_funcao PRIMARY KEY (id_funcao)
);

--Cricao da tb_pais
CREATE TABLE tb_pais(
	id_pais			CHAR(2),
	nm_pais			VARCHAR(40),
	CONSTRAINT pk_tb_pais_id_pais PRIMARY KEY (id_pais)
);

--Cricao da tb_localizacao
CREATE TABLE tb_localizacao(
	id_localizacao		INTEGER,
	id_pais				CHAR(2),
	endereco			VARCHAR(40),
	cep					VARCHAR(12),
	cidade				VARCHAR(30),
	estado				VARCHAR(25),
	CONSTRAINT pk_tb_localizacao_id_localizacao PRIMARY KEY (id_localizacao),
	CONSTRAINT fk_tb_localizacao_id_pais FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais)
);

--Criacao da tb_departamento
CREATE TABLE tb_departamento(
	id_departamento		INTEGER,
	id_localizacao		INTEGER,
	nm_departamento		VARCHAR(30),
	CONSTRAINT pk_tb_departamento_id_departamento PRIMARY KEY (id_departamento),
	CONSTRAINT fk_tb_departamento_id_localizacao FOREIGN KEY (id_localizacao) REFERENCES tb_localizacao(id_localizacao)
);

--Criacao da tb_empregado
CREATE TABLE tb_empregado(
	id_empregado		INTEGER,
	id_gerente			INTEGER,
	id_departamento		INTEGER,
	id_funcao			VARCHAR(10),
	nome				VARCHAR(20),
	sobrenome			VARCHAR(25),
	email				VARCHAR(25),
	telefone			VARCHAR(20),
	data_admissao		DATE,
	percentual_comissao	NUMERIC,
	salario				NUMERIC,
	CONSTRAINT pk_tb_empregado_id_empregado PRIMARY KEY (id_empregado),
	CONSTRAINT fk_tb_empregado_id_gerente FOREIGN KEY (id_gerente) REFERENCES tb_empregado(id_empregado),
	CONSTRAINT fk_tb_empregado_id_departamento FOREIGN KEY (id_departamento) REFERENCES tb_departamento(id_departamento),
	CONSTRAINT fk_tb_empregado_id_funcao FOREIGN KEY (id_funcao) REFERENCES tb_funcao(id_funcao)
);