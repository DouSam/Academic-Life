-- Exercicio 1
SELECT e.nome "Empregado", e.data_admissao "Empregado Data Admissão", g.nome "Gerente", g.data_admissao "Gerente Data Admissão"
FROM tb_empregado e
INNER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
WHERE e.data_admissao < g.data_admissao;

-- Exercicio 2
SELECT g.id_empregado "Numero do Gerente", MIN(e.salario) "Menor Salario"
FROM tb_empregado e
INNER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
GROUP BY g.id_empregado
HAVING MIN(e.salario) > 1000
ORDER BY 2 DESC;

-- Exercicio 3
SELECT nome, LPAD('*', salario/1000, '*') "Funcionários e seus Salários"
FROM tb_empregado
ORDER BY salario DESC;

-- Exercicio 4
SELECT 
    CASE 
        WHEN UPPER(id_funcao) LIKE 'SH_CLERK' THEN 'A'
        WHEN UPPER(id_funcao) LIKE 'ST_MAN' THEN 'B'
        WHEN UPPER(id_funcao) LIKE 'AC_ACCOUNT' THEN 'C'
        WHEN UPPER(id_funcao) LIKE 'AC_MGR' THEN 'D'
        WHEN UPPER(id_funcao) LIKE 'IT_PROG' THEN 'E'
        ELSE '0' END "Classe"
FROM tb_empregado;

-- Exercicio 5
SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
WHERE e.percentual_comissao IS NOT NULL;

-- Exercicio 6
CREATE TABLE tb_departamento_2 (
    ID          NUMBER(7),
    NM_DEPTO    VARCHAR2(25)
);

DESCRIBE tb_departamento_2;

--Name     Null? Type         
-------- ----- ------------ 
--ID             NUMBER(7)    
--NM_DEPTO       VARCHAR2(25)

-- Exercicio 6 (a)

INSERT INTO tb_departamento_2
SELECT id_departamento, nm_departamento
FROM tb_departamento;

-- Exercicio 6 (b)
COMMENT ON TABLE TB_DEPARTAMENTO_2 IS 'Exercicio 6 b';

SELECT *
FROM user_tab_comments
WHERE table_name = 'TB_DEPARTAMENTO_2';

-- Exercicio 7
CREATE TABLE tb_empregado_3 (ID, FIRST_NAME, LAST_NAME, SALARY, DEPT_ID)
AS SELECT id_empregado, nome, sobrenome, salario, id_departamento FROM tb_empregado;

DESCRIBE tb_empregado_3;

-- Exercicio 7 (a)
ALTER TABLE tb_empregado_3
DROP COLUMN FIRST_NAME;

DESCRIBE tb_empregado_3;

--Name      Null?    Type         
--------- -------- ------------ 
--ID                 NUMBER(6)    
--LAST_NAME NOT NULL VARCHAR2(25) 
--SALARY             NUMBER(8,2)  
--DEPT_ID            NUMBER(4)

-- Exercicio 8
SELECT nome, data_admissao,  NEXT_DAY(ADD_MONTHS(data_admissao,6),'MON') "Revisão"
FROM tb_empregado;

-- Exercicio 9
SELECT REPLACE(UPPER(id_funcao), 'SH', 'SHIPPING')
FROM tb_empregado
WHERE id_funcao LIKE 'SH%';

-- Exercicio 10
CREATE INDEX ix_tb_empregado ON tb_empregado (id_empregado, id_gerente);

DROP INDEX ix_tb_empregado;