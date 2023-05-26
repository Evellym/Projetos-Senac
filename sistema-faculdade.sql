/* 1) Crie as tabelas deste cenario e popule-as:
10 registros - tabela entidade.
20 registros - tabela relação.  */

CREATE TABLE alunos (
	idAluno VARCHAR PRIMARY KEY,
	nome VARCHAR NOT NULL,
	dataNasc DATE NOT NULL
);

CREATE TABLE cursos (
	idCurso VARCHAR PRIMARY KEY,
	descricao VARCHAR NOT NULL
);

CREATE TABLE matriculas (
	idMatricula VARCHAR PRIMARY KEY,
	fkAluno VARCHAR REFERENCES alunos (idAluno),
	fkCurso VARCHAR REFERENCES cursos (idCurso),
	nota DECIMAL DEFAULT 0,
	situacao VARCHAR DEFAULT 'Cursando'
);


INSERT INTO alunos (idAluno, nome, dataNasc)
VALUES ('2023051470', 'Augusto Samuel Mário Fernandes', '08/04/1944'),
		('2023052949', 'Tiago Ryan Tomás das Neves', '04/01/1945'),
		('2023054044', 'Sebastião Daniel Farias', '07/04/1956'),
		('2023053354', 'Vera Fernanda Sales', '05/04/1990'),
		('2023051788', 'Edson Vitor Lucca Porto', '07/04/1994'),
		('2023050841', 'Sabrina Aline Araújo', '16/01/1992'),
		('2023050565', 'Marcelo Murilo Augusto Novaes', '09/04/1979'),
		('2023051388', 'Calebe Tomás Assunção', '08/03/1969'),
		('2023055781', 'Joana Lúcia da Mota', '02/03/1968'),
		('2023051133', 'Marli Maya Isabelle Caldeira', '03/05/1967');
		
INSERT INTO cursos (idCurso, descricao)
VALUES ('YOYW', 'Administração'),
		('ZMPN', 'Arquitetura & Urbanismo'),
		('XANH', 'Contabilidade'),
		('QUPG', 'Direito'),
		('OREY', 'Medicina'),
		('NPCX', 'Educação Física'),
		('EIEA', 'Fisioterapia'),
		('LRUW', 'Analise e Desenvolvimento de Sistemas'),
		('ESAB', 'Engenharia Cívil'),
		('WTGT', 'Odontologia');
		
INSERT INTO matriculas (idMatricula, fkAluno, fkCurso,nota)
VALUES ('001','2023051470', 'ZMPN', 8.0),
		('002','2023052949', 'LRUW', 4.5),
		('003','2023054044', 'ESAB', 5.0),
		('005','2023051788', 'XANH', 9.0),
		('006','2023050841', 'NPCX', 7.5),
		('007','2023051388', 'EIEA', 6.5),
		('008','2023055781', 'OREY', 9.9),
		('0009','2023051133', 'WTGT', 6.4),
		('0010','2023054044', 'EIEA', 8.0),
		('0011','2023051388', 'ESAB', 1.0);
		
INSERT INTO matriculas (idMatricula, fkAluno, fkCurso)
VALUES ('0012','2023050565', 'QUPG'),
		('0013','2023051470', 'WTGT'),
		('0014','2023052949', 'OREY'),
		('0015','2023053354', 'QUPG'),
		('0016','2023051788', 'NPCX'),
		('0017','2023050841', 'XANH'),
		('0018','2023050565', 'YOYW'),
		('0019','2023055781', 'LRUW'),
		('0020','2023051133', 'ZMPN');
		
		
/* 15% Reprovados.
35% Aprovados.
50% Cursando. */

UPDATE matriculas SET situacao = 'Reprovado' WHERE nota > 0 AND nota < 6.0;

UPDATE matriculas SET situacao = 'Aprovados' WHERE nota >= 6.0;

/*
2) Gere consultas que respondam as seguintes questoes: */

	-- a. Quantos alunos estao matriculados em cada curso? Ordene pelo total
	
	SELECT fkCurso, COUNT(fkAluno) AS total_alunos FROM matriculas
	GROUP BY fkCurso
	ORDER BY total_alunos DESC;

	-- b. Qual o curso com maior quantidade de aprovação?
	
	SELECT descricao, COUNT(*) FROM matriculas FULL JOIN cursos ON
	cursos.idCurso = matriculas.fkCurso WHERE situacao = 'Aprovados'
	GROUP BY descricao
	ORDER BY count DESC;
	
	-- c. Qual o curso com maior quantidade de reprovações?
	
	SELECT descricao, MAX(fkCurso) FROM matriculas FULL JOIN cursos ON
	matriculas.fkCurso = cursos.idCurso
	WHERE situacao = 'Reprovado'
	GROUP BY descricao
	ORDER BY max;
	
	-- d. Liste quantos cursos cada aluno matriculado esta fazendo.
	
	SELECT idAluno, nome, COUNT(fkCurso) FROM matriculas FULL JOIN alunos ON
	matriculas.fkAluno = alunos.idAluno
	GROUP BY idAluno
	ORDER BY count DESC;
	
	-- e. Qual a nota media de cada curso?
	
	SELECT descricao, ROUND(AVG(nota),2) AS media_nota FROM matriculas FULL JOIN cursos ON
	matriculas.fkCurso = cursos.idCurso
	GROUP BY descricao
	ORDER BY media_nota DESC;
	
	-- f. Quem e qual a idade do aluno mais novo de cada curso? 
	
	SELECT nome, fkCurso, AGE(dataNasc) AS idade_aluno FROM alunos FULL JOIN matriculas ON
	alunos.idAluno = matriculas.fkAluno
	ORDER BY idade_aluno ASC;