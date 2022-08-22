-- Exercicio 1
SELECT sobrenome, id_departamento, salario
FROM tb_empregado
WHERE id_departamento = ANY (SELECT id_departamento
                             FROM tb_empregado
                             WHERE percentual_comissao IS NOT NULL)
    AND salario = ANY (SELECT salario
                       FROM tb_empregado
                       WHERE percentual_comissao IS NOT NULL);
-- Exercicio 2
SELECT e.sobrenome, d.nm_departamento, e.salario
FROM tb_empregado e
INNER JOIN tb_departamento d 
    ON(e.id_departamento = d.id_departamento)
WHERE e.salario = ANY (SELECT e.salario
                       FROM tb_empregado e
                       INNER JOIN tb_departamento d
                            ON(e.id_departamento = d.id_departamento)
                       WHERE d.id_localizacao = 1700)
    AND NVL(e.percentual_comissao,0) = ANY (SELECT NVL(e.percentual_comissao, 0)
                       FROM tb_empregado e
                       INNER JOIN tb_departamento d
                            ON(e.id_departamento = d.id_departamento)
                       WHERE d.id_localizacao = 1700);
                       
SELECT e.sobrenome, d.nm_departamento, e.salario
FROM tb_empregado e
INNER JOIN tb_departamento d 
    ON(e.id_departamento = d.id_departamento)
WHERE (e.salario, NVL(e.percentual_comissao,0)) = ANY (SELECT e.salario, NVL(e.percentual_comissao,0)
                       FROM tb_empregado e
                       INNER JOIN tb_departamento d
                            ON(e.id_departamento = d.id_departamento)
                       WHERE d.id_localizacao = 1700);                        
-- Exercicio 3
SELECT sobrenome, salario
FROM tb_empregado
WHERE (salario, NVL(percentual_comissao, 0)) = (SELECT salario, NVL(percentual_comissao, 0)
                                        FROM tb_empregado
                                        WHERE sobrenome LIKE 'Kochhar')
    AND sobrenome NOT LIKE 'Kochhar';
    
-- Exercicio 4
SELECT id_empregado, sobrenome, id_departamento
FROM tb_empregado
WHERE id_empregado IN (SELECT e.id_empregado
                       FROM tb_empregado e
                       INNER JOIN tb_departamento d
                            ON(e.id_departamento = d.id_departamento)
                       INNER JOIN tb_localizacao l
                            ON(d.id_localizacao = l.id_localizacao)
                       WHERE UPPER(l.cidade) LIKE 'T%');

-- Exercicio 5
SELECT *
FROM tb_empregado
WHERE salario > ALL(SELECT salario
                    FROM tb_empregado
                    WHERE id_funcao = 'SA_MAN');