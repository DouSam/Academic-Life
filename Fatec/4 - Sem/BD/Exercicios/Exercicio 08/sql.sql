CREATE DATABASE "ADS_24_10_21"
TEMPLATE = template0
ENCODING 'UTF-8'
CONNECTION LIMIT 100;

CREATE TABLE tb_departamentos(
	cod_depto		CHAR(2),
	nm_depto		VARCHAR(60),
	CONSTRAINT pk_tb_depto_cod_dpto PRIMARY KEY (cod_depto)
);

CREATE TABLE tb_funcionarios (
	cod_funcionario		CHAR(2),
	nome				VARCHAR(60),
	cod_depto			CHAR(2),
	salario				NUMERIC(7,2),
	CONSTRAINT pk_tb_func_cod_func PRIMARY KEY (cod_funcionario),
	CONSTRAINT fk_tb_func_cod_dpto FOREIGN KEY (cod_depto) REFERENCES 
	tb_departamentos(cod_depto)
);

INSERT INTO tb_departamentos
VALUES
('D1','Contabilidade'),
('D2','Administracao'),
('D3','Informatica'),
('D4','RH');

SELECT *
FROM tb_departamentos;

INSERT INTO tb_funcionarios
VALUES
('E1','Jose','D1',2500),
('E2','Maria','D1',2800),
('E3','Jose','D2',3200),
('E4','Silvia','D3',4650),
('E5','Joao','D1',2800);

SELECT *
FROM tb_funcionarios;

--Questao 1
SELECT nome
FROM tb_funcionarios WHERE salario < 2600.00

--Questao 2
SELECT *
FROM tb_departamentos 
INNER JOIN tb_funcionarios ON (tb_departamentos.cod_depto = tb_funcionarios.cod_depto AND 
							  tb_funcionarios.salario <= 3500);
--Questao 3
SELECT nome
FROM tb_funcionarios 
WHERE cod_depto = 'D3';

--Questao 4
SELECT nome
FROM tb_funcionarios
INNER JOIN tb_departamentos ON (tb_departamentos.nm_depto = 'Contabilidade' AND
								tb_departamentos.cod_depto = tb_funcionarios.cod_depto);

--Questao 5
SELECT salario
FROM tb_funcionarios
INNER JOIN tb_departamentos ON (tb_departamentos.nm_depto = 'Contabilidade' AND
								tb_departamentos.cod_depto = tb_funcionarios.cod_depto);