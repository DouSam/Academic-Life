-- Sequences
CREATE SEQUENCE seq_teste;

CREATE SEQUENCE seq_teste_2
START WITH 10 INCREMENT BY 5
MINVALUE 10 MAXVALUE 20
CYCLE CACHE 2 ORDER;

CREATE SEQUENCE seq_teste_3
START WITH 10 INCREMENT BY -1
MINVALUE 1 MAXVALUE 10
CYCLE CACHE 5;

SELECT *
FROM user_sequences
ORDER BY sequence_name;

SELECT seq_teste.nextval
FROM dual;

SELECT seq_teste.currval
FROM dual;

SELECT seq_teste_2.nextval
FROM dual;

SELECT seq_teste_3.nextval
FROM dual;

CREATE TABLE tb_status_encomenda_2 (
id_status           INTEGER CONSTRAINT pk_status_enc_2 PRIMARY KEY,
status              VARCHAR2(10),
ultima_modificacao  DATE DEFAULT SYSDATE
);

CREATE SEQUENCE seq_status_enc_2 NOCACHE;

INSERT INTO tb_status_encomenda_2 (id_status, status, ultima_modificacao)
VALUES (seq_status_enc_2.nextval, 'Enviado', '01-JAN-2013');

INSERT INTO tb_status_encomenda_2 (id_status, status, ultima_modificacao)
VALUES (seq_status_enc_2.nextval, 'Pendente', '01-MAR-2013');

ALTER SEQUENCE seq_teste
INCREMENT BY 2;

DROP SEQUENCE seq_teste_3;

-- Indices
CREATE INDEX idx_clientes_sobrenome
ON tb_clientes(sobrenome);

CREATE INDEX idx_clientes_telefone
ON tb_clientes(telefone);

CREATE INDEX idx_func_nome_sobre
ON tb_funcionarios(nome, sobrenome);

--Indice baseado em funcao, permite utilizar UPPER nas consultas 
CREATE INDEX idx_funcao_clientes_sobrenome
ON tb_clientes (UPPER(sobrenome));

ALTER SYSTEM SET QUERY_REWRITE_ENABLED = TRUE;

SELECT index_name, table_name, uniqueness, status
FROM user_indexes
WHERE table_name IN ('TB_CLIENTES', 'TB_FUNCIONARIOS')
ORDER BY index_name;

SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('TB_CLIENTES', 'TB_FUNCIONARIOS')
ORDER BY index_name;

ALTER INDEX idx_clientes_telefone
RENAME TO idx_clientes_telefone_nr;

CREATE BITMAP INDEX idx_status_enc
ON tb_status_encomenda_2(status);

-- View
GRANT CREATE VIEW TO loja;

CREATE VIEW view_produtos_baratos AS
    SELECT *
    FROM tb_produtos
    WHERE preco < 15.00;
    
SELECT *
FROM view_produtos_baratos;

CREATE VIEW view_funcionarios AS
    SELECT id_funcionario, id_gerente, nome, sobrenome, cargo, fg_ativo
    FROM tb_funcionarios;

SELECT *
FROM view_funcionarios;

-- e possivel inserir valores em views simples
INSERT INTO view_produtos_baratos(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES(43, 1, 'Mouse Optico', 16.15, 1);

SELECT id_produto, nm_produto, preco
FROM view_produtos_baratos
WHERE id_produto = 43;

INSERT INTO view_funcionarios(id_funcionario, id_gerente, nome, sobrenome, cargo)
VALUES (100, 1, 'Jefferson', 'Mendes', 'DBA');

SELECT *
FROM view_funcionarios;

SELECT * 
FROM tb_funcionarios;

CREATE VIEW view_produtos_baratos_2 AS
    SELECT *
    FROM tb_produtos
    WHERE preco < 15.00
WITH CHECK OPTION CONSTRAINT view_produtos_baratos_2_preco;

INSERT INTO view_produtos_baratos_2(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES(43, 1, 'Mouse Optico', 16.15, 1);

CREATE VIEW view_produtos_baratos_3 AS
    SELECT *
    FROM tb_produtos
    WHERE preco < 15.00
WITH READ ONLY CONSTRAINT view_prod_baratos_3_read_only;

INSERT INTO view_produtos_baratos_3(id_produto, id_tipo_produto, nm_produto, preco, fg_ativo)
VALUES(43, 1, 'Mouse Optico', 16.15, 1);

SELECT view_name, text_length, text
FROM user_views
ORDER BY view_name;

SELECT constraint_name, constraint_type, status, deferrable, deferred
FROM user_constraints
WHERE table_name IN ('VIEW_PRODUTOS_BARATOS_2', 'VIEW_PRODUTOS_BARATOS_3')
ORDER BY constraint_name;

CREATE VIEW view_tipos_e_produtos AS
    SELECT p.id_produto, p.nm_produto nome_produto, tp.nm_tipo_produto nome_tipo_produto, p.preco
    FROM tb_produtos p
    FULL OUTER JOIN tb_tipos_produtos tp
    USING (id_tipo_produto)
    ORDER BY p.id_produto;

SELECT *
FROM view_tipos_e_produtos;

CREATE VIEW view_salarios_funcionarios AS
    SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
    FROM tb_funcionarios f
    INNER JOIN tb_grades_salarios gs ON f.salario BETWEEN gs.base_salario AND gs.teto_salario
    ORDER BY gs.id_salario;

SELECT *
FROM view_salarios_funcionarios;

CREATE VIEW view_media_produtos AS
    SELECT id_tipo_produto, AVG(preco) media_preco
    FROM tb_produtos
    WHERE preco < 15.00
    GROUP BY id_tipo_produto
    HAVING AVG(preco) > 13.00
    ORDER BY id_tipo_produto;

SELECT *
FROM view_media_produtos;

CREATE OR REPLACE VIEW view_media_produtos AS
    SELECT id_tipo_produto, AVG(preco) media_preco
    FROM tb_produtos
    WHERE preco < 12.00
    GROUP BY id_tipo_produto
    HAVING AVG(preco) > 11.00
    ORDER BY id_tipo_produto;

ALTER VIEW view_produtos_baratos_2
DROP CONSTRAINT view_produtos_baratos_2_preco;

DROP VIEW view_produtos_baratos_2;