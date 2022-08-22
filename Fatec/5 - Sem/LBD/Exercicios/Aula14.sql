-- MERGE
select * from tb_produtos_alterados; -- 6

SELECT * FROM tb_produtos;

MERGE INTO tb_produtos p
USING tb_produtos_alterados pa ON(p.id_produto = pa.id_produto)
WHEN MATCHED THEN
    UPDATE
    SET
        p.id_tipo_produto = pa.id_tipo_produto,
        p.nm_produto = pa.nm_produto,
        p.ds_produto = pa.ds_produto,
        p.preco = pa.preco,
        p.fg_ativo = pa.fg_ativo
WHEN NOT MATCHED THEN
    INSERT 
        (p.id_produto, p.id_tipo_produto, p.nm_produto, p.ds_produto, p.preco, p.fg_ativo)
    VALUES
        (pa.id_produto, pa.id_tipo_produto, pa.nm_produto, pa.ds_produto, pa.preco, pa.fg_ativo);


SELECT * FROM tb_produtos WHERE id_produto IN (1, 2, 3, 13, 14, 15);

-- TRANSACTIONS

INSERT INTO tb_clientes
VALUES (12, 'Geraldo', 'Henrique', '31-JUL-1977', '800-112233', 1);

COMMIT;

UPDATE tb_clientes
    SET nome = 'José'
WHERE id_cliente =1;

SELECT *
FROM tb_clientes
ORDER BY 1;

ROLLBACK;

SELECT id_produto, preco
FROM tb_produtos
WHERE id_produto IN (4, 6);

UPDATE tb_produtos
    SET preco = preco * 1.20
WHERE id_produto = 4;

COMMIT;

SAVEPOINT save1;

UPDATE tb_produtos
    SET preco = preco * 1.30
WHERE id_produto = 6;

ROLLBACK TO SAVEPOINT save1;

-- FLASHBACK
SELECT id_produto, nm_produto, preco
FROM tb_produtos
WHERE id_produto <= 5;

UPDATE tb_produtos
    SET preco = preco * 0.75
WHERE id_produto <= 5;

COMMIT;

EXECUTE DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 10/1440);

EXECUTE dbms_flashback.disable;

VARIABLE scn_atual NUMBER;

EXECUTE :scn_atual := DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER();

PRINT scn_atual;

INSERT INTO tb_produtos(id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (16, 1, 'Física', 'Livro sobre Física', 39.95, 1);

COMMIT;

EXECUTE dbms_flashback.enable_at_system_change_number(:scn_atual);

SELECT *
FROM tb_produtos
WHERE id_produto = 16;

EXECUTE DBMS_FLASHBACK.DISABLE();

CREATE TABLE tb_teste (
ID      INTEGER,
valor   VARCHAR2(100)
);

BEGIN
    FOR v_loop IN 1..100 LOOP
        INSERT INTO tb_teste(id,valor)
        VALUES (v_loop, 'DBA_' || v_loop);
    END LOOP;
END;

SELECT *
FROM tb_teste;

DROP TABLE tb_Teste;

FLASHBACK TABLE tb_Teste TO BEFORE DROP;

-- DCL usuario SYSTEM
CREATE USER jean IDENTIFIED BY master;

CREATE USER henrique IDENTIFIED BY 0800
    DEFAULT TABLESPACE users
    TEMPORARY TABLESPACE temp;
    
GRANT CREATE SESSION TO jean; -- Privilegio para criar sessoes, se conectar

CREATE USER fernando IDENTIFIED BY fernando1234;
CREATE USER sonia IDENTIFIED BY sonia1234;
GRANT CREATE SESSION TO fernando, sonia;

ALTER USER jean IDENTIFIED BY senha123alterada;
DROP user jean; -- CASCADE para excluir objetos

GRANT CREATE SESSION
    CREATE USER,
    CREATE TABLE TO fernando;

GRANT EXECUTE ANY PROCEDURE TO fernando WITH ADMIN OPTION;

GRANT EXECUTE ANY PROCEDURE TO sonia; -- Usando o usuario fernando

SHOW user;

-- System
GRANT EXECUTE ANY PROCEDURE TO PUBLIC; -- inclusiv novos usuarios

SELECT *
FROM user_sys_privs
ORDER BY privilege;

CREATE USER roberto IDENTIFIED BY roberto1234;

REVOKE CREATE TABLE FROM fernando; -- Slide 25 

-- Falta coisa

GRANT SELECT ON tb_clientes TO fernando WITH GRANT OPTION;

GRANT SELECT ON loja.tb_clientes TO sonia;

-- Coisa

-- 23/05/2022
REVOKE INSERT ON produtos FROM fernando;

REVOKE SELECT ON loja.tb_cliente FROM fernando; -- Revoke em objetos, exclui em cascata

-- Agrupando privilegios (atibuições ou rules) normalmente para cada dp
GRANT CREATE ROLE TO loja;
GRANT CREATE USER TO loja WITH ADMIN OPTION;

CREATE ROLE gerenciamento_produtos;
CREATE ROLE gerenciamento_funcionarios;
CREATE ROLE gerenciamento_global IDENTIFIED BY senha_gerenciamento;

GRANT SELECT, INSERT, UPDATE, DELETE
    ON tb_tipos_produtos TO gerenciamento_produtos;

GRANT SELECT, INSERT, UPDATE, DELETE
    ON tb_produtos TO gerenciamento_produtos; -- Adicionando atribuicoes para a role

GRANT SELECT, INSERT, UPDATE, DELETE
    ON tb_grades_salarios TO gerenciamento_funcionarios;
    
GRANT SELECT, INSERT, UPDATE, DELETE
    ON tb_funcionarios TO gerenciamento_funcionarios;

GRANT CREATE USER TO gerenciamento_funcionarios;

GRANT gerenciamento_produtos, gerenciamento_funcionarios TO gerenciamento_global;

GRANT gerenciamento_global TO fernando; -- Atribuindo a role

SET ROLE gerenciamento_global IDENTIFIED BY senha_gerenciamento; -- Ativando uma atibuicao para que ela seja efetivada

REVOKE gerenciamento_global FROM fernando; -- Revogando as atribuicoes de fernando

REVOKE ALL ON tb_produtos FROM gerenciamento_produtos;
REVOKE ALL ON tb_tipos_produtos FROM gerenciamento_produtos;

-- Auditoria
GRANT AUDIT SYSTEM TO loja; -- Operacao em qualquer objeto
GRANT AUDIT ANY TO loja; -- Monitrar apenas um objeto
AUDIT CREATE TABLE;

CREATE TABLE tb_teste_1 (
id_teste    INTEGER
);

SELECT username, extended_timestamp, audit_option
FROM user_audit_trail
WHERE audit_option = 'CREATE TABLE'; -- Verificar a auditoria 

SELECT *
FROM user_audit_trail
WHERE action_name = 'CREATE TABLE';

AUDIT SELECT TABLE BY loja; -- Busca todos os select realizados pelo usuario

AUDIT INSERT TABLE,
    UPDATE TABLE,
    DELETE TABLE BY loja, fernando; -- Apura todos os I, U, D realizados pelos usuarios loja e fernando
    
AUDIT SELECT ON loja.tb_produtos; -- MOnitora todos os S no objeto descrito

AUDIT ALL ON loja.tb_funcionarios; -- MOnitora todos os processos no objeto selecionado

-- Monitorando apenas quando o usuario errar o comando
AUDIT UPDATE TABLE BY fernando WHENEVER NOT SUCCESSFUL;
AUDIT INSERT TABLE WHENEVER NOT SUCCESSFUL;

AUDIT CREATE USER, DROP USER WHENEVER SUCCESSFUL; -- Padrão, quando a instrução for executada corretamente

AUDIT CREATE USER, DROP USER BY loja WHENEVER SUCCESSFUL; -- Auditando por um usuário apenas quando for executada ocrretamente

-- BY SESSION, gera apenas uma trilha enquanto BY ACCESS gera uma trilha para cada comando executado
AUDIT SELECT ON loja.tb_produtos BY SESSION;
AUDIT DELETE ON loja.tb_funcionarios BY ACCESS;
AUDIT INSERT, UPDATE ON loja.tb_funcionarios BY ACCESS;

-- Tabelas
SELECT *
FROM user_tables;

SELECT DISTINCT(object_type)
FROM user_objects;

SELECT *
FROM user_catalog;

-- Evitar deixar a tabela e o indice n omesmo tablespace, sempre deixando a tabela base no HD mais lento e a tabela indexadora no dispositivo mais agil

CREATE TABLE tb_status_encomenda_2 (
    id_status_encomenda     INTEGER
        CONSTRAINT pk_status_enc_2 PRIMARY KEY,
    status                  VARCHAR2(10),
    ultima_modificacao      DATE DEFAULT SYSDATE
);

CREATE GLOBAL TEMPORARY TABLE  tb_status_encomenda_temp (
id_status_encomenda     INTEGER,
status                  VARCHAR2(10),
ultima_modificacao      DATE DEFAULT SYSDATE
)
ON COMMIT PRESERVE ROWS;

INSERT INTO tb_status_encomenda_temp(id_status_encomenda, status)
VALUES(1, 'Novo');

SELECT *
FROM tb_status_encomenda_temp;

-- Criando tabela a partir de uma subconsulta
CREATE TABLE tb_funcionarios_teste
AS
    SELECT id_funcionario, nome, salario
    FROM tb_funcionarios
    WHERE id_funcionario = 3;
    
SELECT *
FROM tb_funcionarios_teste;

SELECT table_name, tablespace_name, temporary
FROM user_tables
WHERE table_name IN ('TB_STATUS_ENCOMENDA_2', 'TB_STATUS_ENCOMENDA_TEMP');

SELECT column_name, data_type, data_length, data_precision, data_scale
FROM user_tab_columns
WHERE table_name = 'TB_PRODUTOS';

ALTER TABLE tb_status_encomenda_2
ADD modificado_por INTEGER;

DESCRIBE tb_status_encomenda_2;

ALTER TABLE tb_status_encomenda_2
ADD criado_inicialmente DATE DEFAULT SYSDATE NOT NULL;

-- COluna virtual
ALTER TABLE tb_grades_salarios
ADD (media_salarial AS ((base_salario + teto_salario)/2));

SELECT *
FROM tb_grades_salarios;

ALTER TABLE tb_status_encomenda_2
MODIFY status VARCHAR2(15);

DESCRIBE tb_status_encomenda_2;

ALTER TABLE tb_status_encomenda_2
MODIFY id_status_encomenda NUMBER(5);

ALTER TABLE tb_status_encomenda_2
MODIFY ultima_modificacao DEFAULT SYSDATE -1;

ALTER TABLE tb_status_encomenda_2
MODIFY status CHAR(15);

ALTER TABLE tb_status_encomenda_2
DROP COLUMN criado_inicialmente;

ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT ck_status_encomenda_2
    CHECK (status IN ('COLOCADO', 'PENDENTE', 'ENVIADO'))
    
INSERT INTO tb_status_encomenda_2 (id_status_encomenda, status, ultima_modificacao, modificado_por)
VALUES (2, 'PENDENTE', '01-MAY-2013', 1);

INSERT INTO tb_status_encomenda_2 (id_status_encomenda, status, ultima_modificacao, modificado_por)
VALUES (2, 'PENTE', '01-MAY-2013', 1);

SELECT *
FROM tb_status_encomenda_2;

-- Coisa

ALTER TABLE tb_status_encomenda_2
MODIFY modificado_por
    CONSTRAINT nn_status_encomenda_2_mod NOT NULL;

ALTER TABLE tb_status_encomenda_2
MODIFY ultima_modificacao NOT NULL;

ALTER TABLE tb_status_encomenda_2
DROP COLUMN modificado_por;

ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT fk_status_enc_2_modif_por modificado_por REFERENCES tb_funcionarios(id_funcionario);

ALTER TABLE tb_status_encomenda_2
DROP COLUMN modificado_por;

-- prova
ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT fk_status_enc_2_modif_por modificado_por
    REFERENCES tb_funcionarios(id_funcionario) 
    ON DELETE CASCADE;

ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT fk_status_encomenda_modif_por modificado_por
    REFERENCES tb_funcionarios(id_funcionario) 
    ON DELETE SET NULL;
    
ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT uq_status_encomenda_2_status UNIQUE (status);

ALTER TABLE tb_status_encomenda_2
DROP CONSTRAINT uq_status_encomenda_2_status;

ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT uq_status_encomenda_2_status
UNIQUE(status) DISABLE;

ALTER TABLE tb_status_encomenda_2
DISABLE CONSTRAINT nn_status_encomenda_2;

ALTER TABLE tb_status_encomenda_2
ENABLE CONSTRAINT uq_status_encomenda_2_status;

ALTER TABLE tb_status_encomenda_2
ENABLE NOVALIDATE CONSTRAINT uq_status_encomenda_2_status; -- Sem realizar a validacao, apenas os valores novos;

ALTER TABLE tb_status_encomenda_2
DROP CONSTRAINT uq_status_encomenda_2_status;

ALTER TABLE tb_status_encomenda_2
ADD CONSTRAINT uq_status_encomenda_2_status UNIQUE(status)
DEFERRABLE INITIALLY DEFERRED;

SELECT constraint_name, constraint_type, status, deferrable, deferred
FROM user_constraints
WHERE table_name = 'TB_STATUS_ENCOMENDA_2';