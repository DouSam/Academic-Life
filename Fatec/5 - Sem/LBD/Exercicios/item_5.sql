DESCRIBE tb_empregado;

SELECT te.id_empregado, te.nome || ' ' || te.sobrenome "Nome Completo", tf.ds_funcao, te.data_admissao
FROM tb_empregado te
JOIN tb_funcao tf ON (te.id_funcao = tf.id_funcao);

@ \home\oracle\item_5.sql -- Executar em outro arquivo script.