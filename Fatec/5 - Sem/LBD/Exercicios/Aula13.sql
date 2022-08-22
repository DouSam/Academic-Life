-- UNION e utilizado quando eu quero pegar dados de tabela ou bancos diferentes.
--      Tem que ter a mesma quantidade de colunas e tipos em ambas as querys.

-- UNION ALL (inclui linhas duplicadas)

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION ALL
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- UNION (remove duplicidade)

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- INTERSECT

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
INTERSECT
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- MINUS

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
MINUS
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos;

-- Quebra de precedencia (de cima para baixo)

(SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION 
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos)
INTERSECT
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_alteracoes_produtos;

SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_produtos
UNION 
(SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_mais_produtos
INTERSECT
SELECT id_produto, id_tipo_produto, nm_produto
FROM tb_alteracoes_produtos);

-- TRANSLATE

SELECT id_produto,
        TRANSLATE (nm_produto,
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'EFGHIJKLMNOPQRSTUVWXYZABCDefghijklmnopqrstuvwxyzabcd') e
FROM tb_produtos;

SELECT TRANSLATE(12345,
                 54321,
                 67890)
FROM dual;

-- DECODE

SELECT DECODE(1, 1, 2, 3)
FROM dual;

SELECT DECODE(1, 2, 1, 3)
FROM dual;

SELECT id_produto, disponivel, DECODE(disponivel,
                                      'Y', 'Produto está disponível',
                                      'Produto não está disponível') disponibilidade
FROM tb_mais_produtos;

SELECT id_produto, id_tipo_produto, DECODE(id_tipo_produto,
                                           1, 'Book',
                                           2, 'Video',
                                           3, 'DVD',
                                           4, 'CD',
                                              'Magazine')
FROM tb_produtos;

-- CASE

SELECT id_produto, id_tipo_produto, CASE id_tipo_produto
                                        WHEN 1 THEN 'Book'
                                        WHEN 2 THEN 'Video'
                                        WHEN 3 THEN 'DVD'
                                        WHEN 4 THEN 'CD'
                                        ELSE 'Magazine'
                                    END
FROM tb_produtos;

SELECT id_produto, id_tipo_produto, 
    CASE
        WHEN id_tipo_produto = 1 THEN 'Book'
        WHEN id_tipo_produto = 2 THEN 'Video'
        WHEN id_tipo_produto = 3 THEN 'DVD'
        WHEN id_tipo_produto = 4 THEN 'CD'
        ELSE 'Magazine'
    END
FROM tb_produtos;

SELECT id_produto, preco,
    CASE
        WHEN preco > 15.00 THEN 'Caro'
        ELSE 'Barato'
    END preco
FROM tb_produtos;

-- CONSULTA HIERARQUICA

SELECT id_funcionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY 1;

SELECT LEVEL, id_funcionario, id_gerente, nome, sobrenome
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente
ORDER BY LEVEL;

SELECT LEVEL, LPAD('|', 2 * LEVEL - 1) || nome || ' ' || sobrenome AS funcionario
FROM tb_mais_funcionarios
START WITH id_funcionario = 1
CONNECT BY PRIOR id_funcionario = id_gerente;

-- ROLLUP

-- sem uso
SELECT id_divisao, SUM(salario)
FROM tb_funcionarios_2
GROUP BY id_divisao
ORDER BY id_divisao;

SELECT id_divisao, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao)
ORDER BY id_divisao;

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;

-- CUBE

SELECT id_divisao, id_cargo, SUM(salario)
FROM tb_funcionarios_2
GROUP BY CUBE(id_divisao, id_cargo)
ORDER BY id_divisao, id_cargo;

-- GROUPING

SELECT GROUPING(id_divisao), id_divisao, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao)
ORDEr BY id_divisao;

SELECT 
    CASE GROUPING(id_divisao)
        WHEN 1 THEN 'Todas as divisões'
        ELSE id_divisao
    END DIV, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao)
ORDER BY id_divisao;

SELECT DECODE(GROUPING(id_divisao), 1, 'Todas as divisões', id_divisao) DIV, SUM(salario)
FROM tb_funcionarios_2
GROUP BY ROLLUP (id_divisao)
ORDER BY id_divisao;

-- INSERT
INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (7, 'Joaquim', 'Silva', '26-FEB-1977', '800-666-2522', 1);

INSERT INTO tb_clientes
VALUES (8, 'Jane', 'Green', '01-JAN-1970', '800-555-9999', 1);

INSERT INTO tb_clientes
VALUES(9, 'Sophie', 'White', NULL, NULL, 1);

INSERT INTO tb_clientes
VALUES(10, 'Kyle', 'O''Malley', NULL, NULL, 1);

INSERT INTO tb_produtos (id_produto, id_tipo_produto, nm_produto, ds_produto, preco, fg_ativo)
VALUES (14, 1, 'The "Great" Gatsby', NULL, 12.99, 1);

INSERT INTO tb_clientes (id_cliente, nome, sobrenome)
SELECT 11, nome, sobrenome
FROM tb_clientes
WHERE id_cliente = 1;

-- UPDATE

UPDATE tb_clientes
    SET sobrenome = 'Orange'
WHERE id_cliente = 2;

