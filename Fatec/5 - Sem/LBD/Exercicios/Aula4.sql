SELECT DISTINCT (id_cliente) -- Seleção eliminando valores duplicados da coluna
FROM tb_compras;

SELECT *
FROM tb_clientes
WHERE id_cliente <> 2;

SELECT id_produto, nm_produto
FROM tb_produtos
WHERE id_produto > 2;

SELECT ROWNUM, id_produto, nm_produto
FROM tb_produtos
WHERE ROWNUM <= 3;

SELECT * 
from tb_clientes
WHERE id_cliente > ANY(2, 3, 4);

SELECT *
FROM tb_clientes
WHERE id_cliente > ALL (2, 3, 4);

SELECT *
FROM tb_clientes
WHERE nome LIKE '_o%';

SELECT *
FROM tb_clientes
WHERE nome LIKE '%a';

SELECT *
FROM tb_clientes
WHERE nome LIKE '____';

SELECT *
FROM tb_clientes
WHERE nome LIKE 'J%';

SELECT nome
FROM tb_promocao
WHERE nome LIKE '%\%%' ESCAPE '\';

SELECT *
FROM tb_clientes
WHERE id_cliente IN (2, 3, 5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5);

SELECT *
FROM tb_clientes
WHERE id_cliente NOT IN (2, 3, 5, NULL); -- Nao retorna nenhuma linha pois dentro do not in tem um valor null

SELECT *
FROM tb_clientes
WHERE id_cliente BETWEEN 1 AND 3;

SELECT *
FROM tb_clientes
WHERE id_cliente NOT BETWEEN 1 AND 3;

SELECT *
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/1970' AND
        id_cliente > 3;
        
SELECT *
FROM tb_clientes 
WHERE dt_nascimento > '01/JAN/1970' OR
        id_cliente > 3;
        
SELECT *
FROM tb_clientes
WHERE dt_nascimento > '01/JAN/1970' OR
        id_cliente < 2 AND
        telefone LIKE '%1211';
        
SELECT * 
FROM tb_clientes
ORDER BY sobrenome;

SELECT *
FROM tb_clientes
ORDER BY nome ASC, sobrenome DESC;

SELECT id_cliente, nome, sobrenome
FROM tb_clientes
ORDER By 1;

SELECT nm_produto, id_tipo_produto
FROM tb_produtos
WHERE id_produto = 3;

SELECT nm_tipo_produto
FROM tb_tipos_produtos
WHERE id_tipo_produto =2;

SELECT nm_produto, nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto
    AND p.id_produto = 3;
    
SELECT nm_produto, nm_tipo_produto
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

SELECT c.nome, c.sobrenome, p.nm_produto AS produto, tp.nm_tipo_produto AS tipo
FROM tb_clientes c, tb_compras co, tb_produtos p, tb_tipos_produtos tp
WHERE c.id_cliente = co.id_cliente AND
        p.id_produto = co.id_produto AND
        p.id_tipo_produto = tp.id_tipo_produto
ORDER BY p.nm_produto;

SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f, tb_grades_salarios gs
WHERE f.salario BETWEEN gs.base_salario AND gs.teto_salario
ORDER BY gs.id_salario;

SELECT p.nm_produto produto, tp.nm_tipo_produto tipo
FROM tb_produtos p, tb_tipos_produtos tp
WHERE p.id_tipo_produto = tp.id_tipo_produto (+) 
ORDER BY 1;

SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || NVL(g.nome,'acionistas') gerencia
FROM tb_funcionarios f, tb_funcionarios g
WHERE f.id_gerente = g.id_funcionario (+)
ORDER BY f.id_funcionario;

SELECT p.nm_produto produto, tp.nm_tipo_produto tipo
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp ON(p.id_tipo_produto = tp.id_tipo_produto)
ORDER BY p.nm_produto;

SELECT f.nome, f.sobrenome, f.cargo, f.salario, gs.id_salario
FROM tb_funcionarios f
INNER JOIN tb_grades_salarios gs ON (f.salario BETWEEN gs.base_salario AND gs.teto_salario);

SELECT p.nm_produto produto, tp.nm_tipo_produto tipo
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

SELECT p.nm_produto produto, tp.nm_tipo_produto tipo, id_tipo_produto
FROM tb_produtos p
INNER JOIN tb_tipos_produtos tp
USING (id_tipo_produto);

SELECT c.nome, c.sobrenome, p.nm_produto produto, tp.nm_tipo_produto tipo
FROM tb_clientes c
INNER JOIN tb_compras co USING (id_cliente)
INNER JOIN tb_produtos p USING (id_produto)
INNER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT p.nm_produto produto, tp.nm_tipo_produto tipo
FROM tb_produtos p
FULL OUTER JOIN tb_tipos_produtos tp USING (id_tipo_produto)
ORDER BY p.nm_produto;

SELECT f.nome || ' ' || f.sobrenome || ' trabalha para ' || g.nome gerentes
FROM tb_Funcionarios f
INNER JOIN tb_funcionarios g ON(f.id_gerente = g.id_funcionario)
ORDER BY f.id_funcionario;