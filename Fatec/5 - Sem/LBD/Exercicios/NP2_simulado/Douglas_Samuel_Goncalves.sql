-- Exercicio 01
SELECT nome, NVL(TO_CHAR(percentual_comissao * salario), 'Nenhuma comissão') "Comissão"
FROM tb_empregado;

-- Exercicio 02
SELECT ROUND(MAX(salario)) "Máximo", ROUND(AVG(salario)) "Média", ROUND(MIN(salario)) "Mínimo", ROUND(SUM(salario)) "Somatório"
FROM tb_empregado;

-- Exercicio 03
SELECT e.id_gerente gerente, MIN(e.salario) menor_salario
FROM tb_empregado e
RIGHT OUTER JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)
GROUP BY e.id_gerente
HAVING MIN(e.salario) > 1000.00
ORDER BY menor_salario DESC;

SELECT id_gerente,
               MIN(salario)
FROM tb_empregado
WHERE id_gerente IS NOT NULL
GROUP BY id_gerente
                   HAVING MIN(salario) > 1000
ORDER BY MIN(salario) DESC;

-- Exercicio 4
SELECT COUNT(1) qtd_total
FROM tb_empregado e
UNION ALL
SELECT COUNT(1)
FROM tb_empregado
WHERE EXTRACT (YEAR FROM data_admissao) IN (1990, 1991, 1992, 1993);

SELECT  (SELECT COUNT(1)
         FROM tb_empregado) total,
        (SELECT COUNT(1)
         FROM tb_empregado
         WHERE EXTRACT (YEAR FROM data_admissao) IN (1990, 1991, 1992, 1993)) total_filtrado
FROM dual;
        
SELECT COUNT(*) total,
               SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1990,1,0)) "1990",
               SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1991,1,0)) "1991",
               SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1992,1,0)) "1992",
               SUM(DECODE(TO_CHAR(data_admissao, 'YYYY'),1993,1,0)) "1993"
FROM tb_empregado;

-- Exercicio 5
SELECT id_empregado || ', ' || id_gerente || ', ' || id_departamento || ', ' ||
    id_funcao || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || 
    telefone || ', ' || data_admissao || ', ' || percentual_comissao || ', ' || salario "Saída" 
FROM tb_empregado;

-- Exercicio 6
SELECT
    CASE WHEN UPPER(id_funcao) LIKE 'SH_CLERK' THEN 'A'
         WHEN UPPER(id_funcao) LIKE 'ST_MAN' THEN 'B'
         WHEN UPPER(id_funcao) LIKE 'AC_ACCOUNT' THEN 'C'
         WHEN UPPER(id_funcao) LIKE 'AC_MGR' THEN 'D'
         WHEN UPPER(id_funcao) LIKE 'IT_PROG' THEN 'E'
       ELSE '0' END classe
FROM tb_empregado;

-- Exercicio 7
SELECT nome || ' ' || sobrenome "Nome Completo", ROUND(MONTHS_BETWEEN(SYSDATE, data_admissao)) "Meses Trabalhados"
FROM tb_empregado
ORDER BY 2;

-- Exercicio 8
SELECT e.nome, d.nm_departamento, l.cidade, l.estado
FROM tb_empregado e
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (d.id_localizacao = l.id_localizacao)
WHERE e.percentual_comissao IS NOT NULL;

-- Exercicio 9
GRANT UPDATE ON tb_departamento TO Joao WITH GRANT OPTION;

-- Exercicio 10
SELECT DECODE(SUBSTR(id_funcao, 1, 2), 'SH', 'SHIPPING', id_funcao) "id_funcao"
FROM tb_empregado;

SELECT id_empregado,
               REPLACE(id_funcao, 'SH', 'SHIPPING')
FROM tb_empregado
WHERE SUBSTR(id_funcao, 1, 2) = 'SH';