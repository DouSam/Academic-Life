--Exercício 01
SELECT nome, sobrenome
FROM tb_clientes
WHERE UPPER(nome) LIKE '%LI%';

--Exercício 02
SELECT nome, sobrenome,
    CASE
        WHEN LENGTH(nome || ' ' || sobrenome) <= 10 THEN nome || ' ' || sobrenome
        ELSE SUBSTR(nome, 0, 1) || ' ' || SUBSTR(sobrenome, 0, 10)
    END as "Destinatário"
FROM tb_funcionarios
WHERE LENGTH(nome || ' ' || sobrenome) > 10;

-- Exercicio 3
SELECT EXTRACT(YEAR FROM data_termino) ano, id_funcao, COUNT(ROWID) n_funcionarios
FROM tb_historico_funcao
GROUP BY EXTRACT(YEAR FROM data_termino), id_funcao
ORDER BY n_funcionarios;

SElECT * FROM tb_historico_funcao;

-- Exercicio 4
SELECT EXTRACT(DAY FROM data_admissao) "Dia", COUNT(ROWID) "Número de Funcionários"
FROM tb_empregado
GROUP BY EXTRACT(DAY FROM data_admissao);

-- Exercicio 5
CREATE TABLE tb_departamento_2 
AS SELECT * FROM tb_departamento;

SELECT *
FROM tb_departamento_2;

CREATE OR REPLACE PROCEDURE sp_questao_05(p_id_dep IN INTEGER)
AS
    v_controle          INTEGER;
    v_nm_departamento   tb_departamento_2.nm_departamento%TYPE;
    v_primeira_letra    CHAR;
BEGIN
    SELECT COUNT(ROWID)
        INTO v_controle
    FROM tb_departamento_2
    WHERE id_departamento = p_id_dep;
    
    IF v_controle = 1 THEN
        
        SELECT nm_departamento
            INTO v_nm_departamento
        FROM tb_departamento_2
        WHERE id_departamento = p_id_dep;
    
         v_primeira_letra := SUBSTR(v_nm_departamento,1,1);
         IF UPPER(v_primeira_letra) IN ('A', 'E', 'I', 'O', 'U') THEN
            
            UPDATE tb_departamento_2
                SET nm_departamento = UPPER(nm_departamento)
            WHERE id_departamento = p_id_dep;
            COMMIT;
            
            dbms_output.put_line('O nome do Depto ' || v_nm_departamento || ' foi convertido para maiúsculo.');
            
         ELSE
            
            UPDATE tb_departamento_2
                SET nm_departamento = LOWER(nm_departamento)
            WHERE id_departamento = p_id_dep;
            COMMIT;
            
            dbms_output.put_line('O nome do Depto ' || v_nm_departamento || ' foi convertido para minúsculo.');
                     
         END IF;
    ELSE
        dbms_output.put_line('Departamento '|| p_id_dep ||' não localizado');
    END IF;
    
END sp_questao_05;

SET serveroutput ON
BEGIN 
    sp_questao_05(10);
    SELECT *
    FROm tb_departamento_2
    WHERE id_departamento = 10;
END;

BEGIN 
    sp_questao_05(20);
END;

SELECT *
FROM tb_departamento_2
WHERE id_departamento = 20;
    
BEGIN 
    sp_questao_05(99);
END;