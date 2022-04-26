SELECT CHR(97), CHR(65), CHR(122), CHR(90), CHR(48), CHR(57)
FROM dual;

SELECT CONCAT(nome, sobrenome)
FROM tb_funcionarios;

SELECT id_produto, INITCAP(ds_produto)
FROM tb_produtos;

SELECT nm_produto, INSTR(nm_produto, 'Science')
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, INSTR(nm_produto, 'e', 1, 2)
FROM tb_produtos
WHERE id_produto = 1;

SELECT nm_produto, LENGTH(nm_produto)
FROM tb_produtos;

SELECT UPPER(nome), LOWER(sobrenome)
FROM tb_funcionarios;

SELECT RPAD(nm_produto, 30, '.'), LPAD(preco, 8, '*+')
FROM tb_produtos
WHERE id_produto < 10;

SELECT LTRIM('   Olá pessoal tudo joia?'),
        RTRIM('Oi tudo bem!abcabc', 'abc'),
        TRIM('0' FROM '000Treinamento em Oracle!00000')
FROM dual

SELECT id_cliente, NVL(telefone, 'Telefone inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;


SELECT id_cliente, NVL2(telefone, 'Telefone existente', 'Telefone inexistente')
FROM tb_clientes
ORDER BY id_cliente DESC;

SELECT REPLACE(nm_produto, 'Science', 'Physics')
FROM tb_produtos
WHERE id_produto =1;

SELECT sobrenome
FROM tb_clientes
WHERE SOUNDEX(sobrenome) = SOUNDEX('whyte');

SELECT nm_produto, SUBSTR(nm_produto, 4, 7)
FROM tb_produtos;

SELECT SUBSTR('Administrador de Banco de Dados - DBA', 34, 4)
FROM dual;

SELECT nm_produto, UPPER(SUBSTR(nm_produto, 2, 8))
FROM tb_produtos
WHERE id_produto < 4;

SELECT id_produto, preco, preco - 30, ABS(preco -30)
FROM tb_produtos
WHERE id_produto <4;

SELECT CEIL(5.8), CEIL(-5.2)
FROM dual;

SELECT FLOOR(5.8), FLOOR(-5.2)
FROM dual;

SELECT MOD(8, 3), MOD(8, 4)
FROM dual;

SELECT POWER(2,1), POWER(2,3)
FROM dual;

SELECT ROUND(5.75), ROUND(5.75, 1), ROUND(5.75, -1)
FROM dual;

SELECT SIGN(-5), SIGN(5), SIGN(0)
FROM dual;

SELECT SQRT(25), SQRT(5)
FROM dual;

SELECT TRUNC(5.75), TRUNC(5.75, 1), TRUNC(5.75, -1)
FROM dual;

SELECT TO_CHAR(123456.78)
FROM dual;

SELECT TO_CHAR(12345.67, '99,999.99')
FROM dual;

SELECT TO_CHAR(00.67, 'B9.99')
FROM dual;

SELECT TO_CHAR(12345.67, 'C99,999.99')
FROM dual;

SELECT TO_CHAR(12345.67, '99999.99EEEE')
FROM dual;

SELECT TO_CHAR(12345.67, 'L99,999.99')
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99MI')
FROM dual;

SELECT TO_CHAR(-12345.67, '99,999.99PR')
FROM dual;

SELECT TO_cHAR(3999, 'RN')
FROM dual;

SELECT TO_CHAR(-12345.67, 'S99,999.99')
FROM dual;