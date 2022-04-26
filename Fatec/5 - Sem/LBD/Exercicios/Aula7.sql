SELECT TO_NUMBER('970.13')
FROM dual;

SELECT TO_NUMBER('970.13') + 25.50
FROM dual;

SELECT TO_NUMBER('-$12,345.67', '$99,999.99')
FROM dual;

SELECT
    CAST(12345.67 AS VARCHAR2(10)),
    CAST('9A4F' AS RAW(2)),
    CAST('01-DEC-2007' AS DATE),
    CAST(12345.678 AS NUMBER(10,2))
FROM dual;

SELECT
    CAST(preco AS VARCHAR2(10)),
    CAST(preco + 2 AS NUMBER(7,2)),
    CAST(preco AS BINARY_DOUBLE)
FROM tb_produtos
WHERE id_produto = 1;

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(TO_CHAR(dt_nascimento, 'YYYY'), '196[5-8]$');

SELECT id_cliente, nome, sobrenome, dt_nascimento
FROM tb_clientes
WHERE REGEXP_LIKE(nome, 'j', 'i');

SELECT
    REGEXP_INSTR('Teste de expressão regular', 'e', 6, 2) AS resultado
FROM dual;

SELECT
    REGEXP_REPLACE('Teste de expressão regular', 'd[[:alpha:]]{1}', 'Oracle') resultado
FROM dual;

SELECT
    REGEXP_SUBSTR('Teste de expressão regular', 'e[[:alpha:]]{8}') resultado
FROM dual;

SELECT
    REGEXP_COUNT('teste teste teste expressão regular', 't[[:alpha:]]{4}') resultado
FROM dual;

SELECT AVG(preco)
FROM tb_produtos;

SELECT AVG(preco + 2)
FROM tb_produtos;

SELECT AVG(DISTINCT preco)
FROM tb_produtos;

SELECT COUNT(id_produto)
FROM tb_produtos;

SELECT COUNT(ROWID)
FROM tb_produtos;

SELECT MAX(preco), MIN(preco)
FROM tb_produtos;

SELECT nm_produto, preco
FROM tb_produtos
WHERE preco = (SELECT MAX(preco) FROM tb_produtos);

SELECT MAX(nm_produto), MIN(nm_produto)
FROM tb_produtos;

SELECT MAX(dt_nascimento), MIN(dt_nascimento)
FROM tb_clientes;

SELECT STDDEV(preco)
FROM tb_produtos;

SELECT SUM(preco)
FROM tb_produtos;

SELECT VARIANCE(preco)
FROM tb_produtos;

SELECT id_tipo_produto
FROM tb_produtos
GROUP BY id_tipo_produto;

SELECT id_produto, id_cliente
FROM tb_compras
GROUP BY id_produto, id_cliente;

SELECT id_tipo_produto, COUNT(1)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT td.id_tipo_produto, tp.nm_tipo_produto, CAST(AVG(td.preco) AS NUMBER(5,2))
FROM tb_produtos td
JOIN tb_tipos_produtos tp ON tp.id_tipo_produto = td.id_tipo_produto
GROUP BY td.id_tipo_produto, tp.nm_tipo_produto
ORDER BY td.id_tipo_produto;