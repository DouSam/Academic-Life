CREATE TABLE tb_autoria(
	idAutor         INTEGER,
    idLivro         INTEGER,
	CONSTRAINT pk_tb_autoria_idAutor PRIMARY KEY (idAutor),
	CONSTRAINT pk_tb_autoria_idLivro PRIMARY KEY (idLivro),
	CONSTRAINT fk_tb_autoria_idAutor FOREIGN KEY (idAutor) REFERENCES tb_autor(idAutor),
	CONSTRAINT fk_tb_autoria_idLivro FOREIGN KEY (idLivro) REFERENCES tb_livro(idLivro)
);