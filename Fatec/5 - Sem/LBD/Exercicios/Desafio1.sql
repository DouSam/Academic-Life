-- Primeiro ex
SELECT em.nome || ' trabalha para ' || dp.nm_departamento 
        || ' localizado na cidade ' || loc.cidade || ' estado ' 
        || loc.estado || ' pais ' || pais.nm_pais AS "Informação dos Empregados"
FROM tb_empregado em
INNER JOIN tb_departamento dp ON (em.id_departamento = dp.id_departamento)
INNER JOIN tb_localizacao loc ON (dp.id_localizacao = loc.id_localizacao)
INNER JOIN tb_pais pais ON (loc.id_pais = pais.id_pais)
ORDER BY 1 ASC;

-- Segundo ex

SELECT em.nome || ' ' || em.sobrenome "Nome Completo"
FROM tb_empregado em
WHERE INSTR(LOWER(em.nome), 'e') = 1 
    AND INSTR(LOWER(em.nome), 'e', 2, 1) = 7 
    AND ( em.id_departamento = 80
    OR em.id_gerente = 148);

SELECT nome || ' ' || sobrenome
FROM tb_empregado
WHERE LOWER(nome) LIKE 'e_____e%'
    AND (id_departamento = 80
    OR id_gerente = 148);
    
-- Terceiro ex

SELECT NVL(ge.nome , 'Os acionistas') || ' gerencia ' || em.nome
FROM tb_empregado em
LEFT OUTER JOIN tb_empregado ge ON (em.id_gerente = ge.id_empregado)
ORDER BY ge.nome DESC;

-- Quarto ex

SELECT em.nome, ( SYSDATE - em.data_admissao) "Dias Trabalhados"
FROM tb_empregado em
INNER JOIN tb_historico_funcao hf ON (hf.id_empregado = em.id_empregado)
WHERE em.id_departamento = 80 
        AND (SYSDATE - em.data_admissao) >= 5000;
        
SELECT sobrenome, ROUND((SYSDATE - data_admissao),0) AS "DIas Trabalhados"
FROM tb_empregado
WHERE id_departamento = 80
AND ROUND((SYSDATE - data_admissao),0) > 5000;
