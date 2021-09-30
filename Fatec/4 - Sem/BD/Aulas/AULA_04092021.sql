/* Database creation
CREATE DATABASE "ADS_04_09_21"
TEMPLATE = template0
ENCODING 'UTF-8'
CONNECTION LIMIT 100; */

CREATE TABLE tb_departamento (
	siglaDep		VARCHAR(5),
	nm_dep			VARCHAR(40),
	ramalDep		INTEGER,
	CONSTRAINT pk_tb_dpto_siglaDep PRIMARY KEY (siglaDep)
);

CREATE TABLE tb_projeto (
	cod_projeto		INTEGER,
	nm_projeto		VARCHAR(40),
	CONSTRAINT pk_tb_projeto_cod_projeto PRIMARY KEY (cod_projeto)
);

CREATE TABLE tb_funcionario (
	mat_func	INTEGER,
	nm_func		VARCHAR(45),
	dt_adm		DATE,
	dt_nas		DATE,
	dt_locacao	DATE,
	siglaDep	VARCHAR(5),
	CONSTRAINT pk_tb_funcionario_mat_func PRIMARY KEY (mat_func),
	CONSTRAINT fk_tb_funcionario_siglaDep FOREIGN KEY (siglaDep) REFERENCES tb_departamento (siglaDep)
);

CREATE TABLE tb_locacao (
	mat_func		INTEGER,
	cod_projeto		INTEGER,
	dt_locacao		DATE,
	CONSTRAINT pk_tb_locacao_matr_cod PRIMARY KEY (mat_func, cod_projeto),
	CONSTRAINT fk_tb_locacao_mat_func FOREIGN KEY (mat_func) REFERENCES tb_funcionario (mat_func),
	CONSTRAINT fk_tb_locacao_cod_projeto FOREIGN KEY (cod_projeto) REFERENCES tb_projeto (cod_projeto)
);

SELECT *
FROM tb_departamento;

SELECT *
FROM tb_projeto;

SELECT * 
FROM tb_funcionario;

SELECT *
FROM tb_locacao;