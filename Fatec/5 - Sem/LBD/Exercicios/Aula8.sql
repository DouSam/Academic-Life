-- slide 92
SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
GROUP BY id_tipo_produto
HAVING AVG(preco) > 20.00;

CREATE TABLE tb_pessoas(
    nm_pessoa   VARCHAR2(40)
);

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Maria');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Pedro');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Pedro');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Marta');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Maria');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Rubens');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Igor');

INSERT INTO tb_pessoas(nm_pessoa) 
VALUES('Murilo');

commit;

SELECT nm_pessoa
FROM tb_pessoas
GROUP BY nm_pessoa
HAVING COUNT(1) <> 1;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.0
GROUP BY id_tipo_produto
ORDER BY id_tipo_produto;

SELECT id_tipo_produto, AVG(preco)
FROM tb_produtos
WHERE preco < 15.0
GROUP BY id_tipo_produto
HAVING AVG(preco) > 13.00
ORDER BY id_tipo_produto;

-- Data e hora

INSERT INTO tb_clientes (id_cliente, nome, sobrenome, dt_nascimento, telefone, fg_ativo)
VALUES (7, 'Steve', 'Purple', DATE'1972-10-25', '800-555-1215', 1);

COMMIT;

SELECT *
FROM tb_clientes
ORDER BY id_cliente;

SELECT id_cliente, TO_CHAR(dt_nascimento, 'MONTH DD, YYYY')
FROM tb_clientes;

SELECT TO_CHAR(SYSDATE, 'MONTH DD, YYYY, HH24:MI:SS')
FROM dual;

SELECT TO_CHAR(TO_DATE('05-FEB-1968'), 'MONTH DD, YYYY')
FROM dual;

SELECT TO_DATE('04-JUL-2013'), TO_DATE('04-JUL-13')
FROM dual;
 
--
 
SELECT TO_DATE('Jul 04, 2013', 'MONTH DD, YYYY')
FROM Dual;

SELECT *
FROM nls_session_parameters;

ALTER SESSION SET NLS_DATE_FORMAT='Mon/dd/yyyy';

--

SELECT TO_DATE('7.4.13', 'MM.DD.YY')
FROM dual;

INSERT INTO tb_clientes (
    id_cliente,
    nome,
    sobrenome,
    dt_nascimento,
    telefone,
    fg_ativo
) VALUES (
    10,
    'Nome',
    'Sobrenome',
    TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'),
    '800-555-1215',
    1
);

SELECT id_cliente,
        TO_CHAR(dt_nascimento, 'DD-MON-YYYY HH24:MI:SS')
FROM tb_clientes
ORDER BY id_cliente;

ROLLBACK;

SELECT TO_CHAR(TO_DATE('Jul 04, 2013 19:32:36', 'MONTH DD, YYYY HH24:MI:SS'), 'HH24:MI:SS')
FROM dual;

SELECT
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, YY'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, YY'), 'MONTH DD, YYYY')
FROM dual;

SELECT
    TO_CHAR(TO_DATE('Jul 04, 15', 'MONTH DD, RR'), 'MONTH DD, YYYY'),
    TO_CHAR(TO_DATE('Jul 04, 75', 'MONTH DD, RR'), 'MONTH DD, YYYY')
FROM dual;

SELECT ADD_MONTHS('Jul 01, 2013', 13)
FROM dual;

SELECT ADD_MONTHS(sysdate, 13)
FROM dual;

SELECT ADD_MONTHS('Jul 01, 2013', 13)
FROM dual;

SELECT ADD_MONTHS(sysdate, -13)
FROM dual;

SELECT LAST_DAY(sysdate)
FROM dual;

SELECT MONTHS_BETWEEN('Jul 03, 2013', 'Apr 03, 2011')
FROM dual;

SELECT NEXT_DAY(sysdate, 1)
FROM dual;

SELECT ROUND(TO_DATE('Jul 03, 2013'), 'YYYY')
FROM dual;

SELECT ROUND(SYSDATE, 'YYYY')
FROM dual;

SELECT ROUND(TO_DATE('May 25, 2013'), 'MM')
FROM dual;

SELECT TO_CHAR(ROUND(TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS'), 'HH24'), 'MONTH DD, YYYY HH24:MI:SS')
FROM dual;

SELECT EXTRACT(YEAR FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS YEAR,
        EXTRACT(MONTH FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MONTH,
        EXTRACT(DAY FROM TO_DATE('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS DAY,
        EXTRACT(HOUR FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS HORA,
        EXTRACT(MINUTE FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS MINUTO,
        EXTRACT(SECOND FROM TO_TIMESTAMP('Jul 03, 2013 19:45:26', 'MONTH DD, YYYY HH24:MI:SS')) AS SEGUNDO
FROM dual;

