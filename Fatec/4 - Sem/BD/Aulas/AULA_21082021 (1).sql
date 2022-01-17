CREATE DATABASE "ADS_21_08_21"
TEMPLATE = template0
ENCODING 'UTF-8'
CONNECTION LIMIT 100;

--COMENTARIO INLINE
/*COMENTARIOS 
EM 
BLOCOS*/

CREATE TABLE tb_curso(
	cod_curso		INTEGER,
	nm_curso		VARCHAR(40),
	CONSTRAINT pk_tb_curso_cod_curso PRIMARY KEY(cod_curso)
);

SELECT *
FROM tb_curso;

INSERT INTO tb_curso(cod_curso, nm_curso)
VALUES
(100, 'Análise e Desenvolvimento de Sistemas'),
(110, 'Gestão de Negócios e Inovação'),
(120, 'Sistemas Biomédicos');


CREATE TABLE tb_departamento(
	cod_departamento		INTEGER,
	nm_departamento			VARCHAR(60),
	CONSTRAINT pk_tb_depto_cod_depto PRIMARY KEY(cod_departamento)
);

--DROP TABLE tb_departamentos;

SELECT *
FROM tb_departamento;

INSERT INTO tb_departamento(cod_departamento, nm_departamento)
VALUES
(1, 'Computação'),
(2, 'Administração'),
(3, 'Medicina');

CREATE TABLE tb_aluno(
	cod_aluno		INTEGER,
	cod_curso		INTEGER,
	nm_aluno		VARCHAR(60),
	CONSTRAINT pk_tb_aluno_cod_aluno PRIMARY KEY(cod_aluno),
	CONSTRAINT fk_tb_aluno_cod_curso FOREIGN KEY(cod_curso) REFERENCES tb_curso(cod_curso)
);

SELECT *
FROM tb_aluno;

INSERT INTO tb_aluno(cod_aluno, cod_curso, nm_aluno)
VALUES
(10, 100, 'Hugo B. Reis'),
(11, 100, 'Erika C. D. Nogueira'),
(12, 100, 'Fabio M. G. Davilla'),
(13, 110, 'Pedro T. Bugalho');

CREATE TABLE tb_disciplina(
	cod_disciplina		INTEGER,
	cod_departamento	INTEGER,
	nm_disciplina		VARCHAR(40),
	creditos			INTEGER,
	CONSTRAINT pk_tb_disc_cod_disc PRIMARY KEY (cod_disciplina),
	CONSTRAINT fk_tb_disc_cod_depto FOREIGN KEY (cod_departamento) REFERENCES tb_departamento(cod_departamento)
);

SELECT *
FROM tb_disciplina;

INSERT INTO tb_disciplina (cod_disciplina, cod_departamento, nm_disciplina, creditos)
VALUES
(1, 1, 'Banco de Dados', 80),
(2, 1, 'Laboratório de Banco de Dados', 80),
(3, 2, 'Gestão de Equipes', 40),
(4, 3, 'Processamento de Imagens', 80);


CREATE TABLE tb_disciplina_curso(
	cod_curso		INTEGER,
	cod_disciplina	INTEGER,
	CONSTRAINT pk_tb_dc_cod_curso_cod_disc PRIMARY KEY (cod_curso, cod_disciplina),
	CONSTRAINT fk_tb_dc_cod_curso FOREIGN KEY(cod_curso) REFERENCES tb_curso (cod_curso),
	CONSTRAINT fk_tb_dc_cod_disc FOREIGN KEY(cod_disciplina) REFERENCES tb_disciplina(cod_disciplina)
);

SELECT *
FROM tb_disciplina_curso;

INSERT INTO tb_disciplina_curso(cod_curso, cod_disciplina)
VALUES
(100, 1),
(100, 2);

CREATE TABLE tb_pre_requisito(
	cod_disciplina_liberada			INTEGER,
	cod_disciplina_liberadora		INTEGER,
	CONSTRAINT pk_tb_pr_liberada_liberadora PRIMARY KEY(cod_disciplina_liberada, cod_disciplina_liberadora),
	CONSTRAINT fk_tb_pr_liberada FOREIGN KEY(cod_disciplina_liberada)
						REFERENCES tb_disciplina(cod_disciplina),
	CONSTRAINT fk_tb_pr_liberadora FOREIGN KEY(cod_disciplina_liberadora)
						REFERENCES tb_disciplina(cod_disciplina)
);

SELECT *
FROM tb_pre_requisito;

--DROP TABLE tb_pre_requisitos;

INSERT INTO tb_pre_requisito(cod_disciplina_liberada, cod_disciplina_liberadora)
VALUES
(2, 1);



