CREATE TABLE mulher (
    id_mulher       NUMBER(6),
    nome_mulher     VARCHAR(20),
    CONSTRAINT pk_mulher_id_mulher PRIMARY KEY (id_mulher)
);

CREATE TABLE homem (
    id_homem        NUMBER(6),
    nome_homem      VARCHAR(20),
    id_mulher       NUMBER(6),
    CONSTRAINT pk_homem_id_homem PRIMARY KEY (id_homem),
    CONSTRAINT fk_homem_id_mulher FOREIGN KEY (id_mulher) REFERENCES mulher (id_mulher)
);

INSERT INTO mulher(id_mulher, nome_mulher) 
VALUES (1, 'Edna');

INSERT INTO mulher(id_mulher, nome_mulher) 
VALUES (2, 'Stefanny');

INSERT INTO mulher(id_mulher, nome_mulher) 
VALUES (3, 'Cássia');

INSERT INTO homem(id_homem, nome_homem, id_mulher)
VALUES (10, 'Anderson', NULL);

INSERT INTO homem(id_homem, nome_homem, id_mulher)
VALUES (20, 'Jander', 1);

INSERT INTO homem(id_homem, nome_homem, id_mulher)
VALUES (30, 'Rogério', 2);

COMMIT;

-- 3.a
SELECT h.nome_homem, m.nome_mulher
FROM homem h, mulher m
WHERE h.id_mulher = m.id_mulher;

-- 3.b
SELECT * FROM homem 
NATURAL INNER JOIN mulher;

-- 3.c 
SELECT h.nome_homem, m.nome_mulher
FROM homem h
INNER JOIN mulher m USING(id_mulher);

-- 3.d
SELECT h.nome_homem, m.nome_mulher
FROM homem h
INNER JOIN mulher m ON (h.id_mulher = m.id_mulher);

-- 3.e
SELECT h.nome_homem, m.nome_mulher
FROM homem h
CROSS JOIN mulher m;

SELECT h.nome_homem, m.nome_mulher
FROM homem h, mulher m;

-- 4.a
SELECT h.nome_homem, m.nome_mulher
FROM homem h, mulher m
WHERE h.id_mulher = m.id_mulher (+);

-- 4.B
SELECT h.nome_homem, m.nome_mulher
FROM homem h, mulher m
WHERE h.id_mulher (+) = m.id_mulher;

-- 4.c
SELECT h.nome_homem, m.nome_mulher
FROM homem h
LEFT OUTER JOIN mulher m 
    ON (h.id_mulher = m.id_mulher);

-- 4.d
SELECT h.nome_homem, m.nome_mulher
FROM homem h
RIGHT OUTER JOIN mulher m
    USING(id_mulher);

-- 4.e

SELECT h.nome_homem, m.nome_mulher
FROM homem h
LEFT OUTER JOIN mulher m USING (id_mulher);

SELECT h.nome_homem, m.nome_mulher
FROM homem h
RIGHT OUTER JOIN mulher m USING (id_mulher);

SELECT h.nome_homem, m.nome_mulher
FROM homem h
LEFT OUTER JOIN mulher m ON(h.id_mulher = m.id_mulher);

SELECT h.nome_homem, m.nome_mulher
FROM homem h
RIGHT OUTER JOIN mulher m ON(h.id_mulher = m.id_mulher);

-- 4.f
SELECT h.nome_homem, m.nome_mulher
FROM homem h
FULL OUTER JOIN mulher m;

-- 4.g
SELECT h.nome_homem, m.nome_mulher
FROM homem h
FULL OUTER JOIN mulher m USING (id_mulher);

SELECT h.nome_homem, m.nome_mulher
FROM homem h
FULL OUTER JOIN mulher m ON(h.id_mulher = m.id_mulher);