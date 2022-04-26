-- Desafio 6
SELECT id_empregado || ', ' || nome || ', ' || sobrenome || ', ' || email || ', ' || telefone ||
    ', ' || data_admissao || ', ' || id_funcao || ', ' || salario || ', ' || percentual_comissao ||
    ', ' || id_gerente || ', ' || id_departamento SAÍDA
FROM tb_empregado;

-- Desafio 7
SELECT nome || ' ' || sobrenome || ' ' || LPAD('*',salario/1000,'*') "Empregados e seus salários", salario
FROM tb_empregado
ORDER BY salario DESC;

-- Desafio 8
SELECT 'O departamento ' || d.nm_departamento || ' possui ' || COUNT(e.id_departamento) || ' empregado(s) alocado(s).' "Informação dos Deptos"
FROM tb_empregado e
JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
GROUP BY e.id_departamento, d.nm_departamento;

--Correcao
SELECT 'O departamento ' || nm_departamento || ' possui ' || COUNT(1) || ' empregado(s) alocado(s).' "Informação dos Deptos"
FROM tb_empregado e
JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
GROUP BY nm_departamento;

