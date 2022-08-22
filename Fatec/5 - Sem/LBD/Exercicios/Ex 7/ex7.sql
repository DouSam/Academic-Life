--Exercício 01
SELECT e.nome, f.ds_funcao, e.data_admissao
FROM tb_empregado e 
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
WHERE data_admissao BETWEEN TO_DATE('20-feb-1987') AND TO_DATE('01-may-1989')
ORDER BY 3;


--Exercício 02
SELECT UPPER(e.nome) "Nome", LENGTH(e.sobrenome) "Tamanho do sobrenome", d.nm_departamento "Departamento", p.nm_pais "País"
FROM tb_empregado e 
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
INNER JOIN tb_pais p ON (l.id_pais = p.id_pais)
WHERE e.nome LIKE 'B%' 
    OR e.nome LIKE 'L%' 
    OR e.nome LIKE 'A%';


--Exercício 03
SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e 
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
WHERE percentual_comissao IS NOT NULL;


--Exercício 04
SELECT e.nome || ' trabalha para ' || NVL(g.nome, 'os acionistas') || '.'
FROM tb_empregado e 
INNER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
ORDER BY g.nome DESC;

--Exercicio 05
CREATE OR REPLACE PROCEDURE sp_get_emp(p_id IN INTEGER)
AS
    v_controle          INTEGER;
    v_nome              tb_empregado.nome%TYPE;
    v_sobrenome         tb_empregado.sobrenome%TYPE;
    v_descricao         tb_funcao.ds_funcao%TYPE;
BEGIN
    SELECT COUNT(ROWID) 
        INTO v_controle
    FROM tb_empregado
    WHERE id_empregado = p_id;
    
    IF v_controle = 1 THEN
        SELECT e.nome, e.sobrenome, ds_funcao
            INTO v_nome, v_sobrenome, v_descricao
        FROM tb_empregado e
        INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
        WHERE e.id_empregado = p_id;
        
        DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' ' || v_sobrenome || ' Função: ' || v_descricao || '.');
        
    ELSE
        dbms_output.put_line('Empregado ' || p_id || ' não encontrado!!!'); 
    END IF;
    
END sp_get_emp;

SET serveroutput ON 
BEGIN
    sp_get_emp(200);--invocando ostored procedure
END;

BEGIN
    sp_get_emp(999);--invocando ostored procedure
END;